import { Hono } from "hono";
import { getCookie, setCookie } from "hono/cookie";
import type { Env } from "./env";
import * as db from "./db";
import { findProblems, tidy } from "./check";
import { generate, generateDemo, lineStream, type Checks } from "./generate";
import { hashIp, pruneUsage, takeGeneration, takeShare, today } from "./limits";
import { SUPPORTER_COOKIE, adsTxt, isSupporter, supporterToken, type Money } from "./monetize";
import { InputError, MAX_PREVIOUS, buildUserPrompt, getTool, normalizeInputs, outputBudget } from "./prompt";
import { TOOLS, TOOL_BY_ID } from "./tools";
import * as views from "./views";

type Ctx = { Bindings: Env; Variables: { money: Money } };
const app = new Hono<Ctx>();
const DEVICE_COOKIE = "sc_device";

app.use("*", async (c, next) => {
  const supporter = await isSupporter(c.env, getCookie(c, SUPPORTER_COOKIE));
  c.set("money", { env: c.env, supporter });
  await next();
  c.header("X-Content-Type-Options", "nosniff");
  c.header("Referrer-Policy", "strict-origin-when-cross-origin");
  c.header("X-Frame-Options", "SAMEORIGIN");
});

const clientIp = (c: { req: { header: (n: string) => string | undefined } }) =>
  c.req.header("CF-Connecting-IP") || c.req.header("X-Forwarded-For")?.split(",")[0].trim() || "local";

// Browsers send Origin on cross-site POSTs; refuse those so other sites can't spend our budget.
const sameOrigin = (c: { req: { header: (n: string) => string | undefined; url: string } }) => {
  const origin = c.req.header("Origin");
  return !origin || origin === new URL(c.req.url).origin;
};

const cacheable = (c: { header: (n: string, v: string) => void }, m: Money, seconds: number) => {
  // Supporter pages differ (no ads), so only cache the public version.
  c.header("Cache-Control", m.supporter ? "private, no-store" : `public, max-age=60, s-maxage=${seconds}`);
  c.header("Vary", "Cookie");
};

// ---------- pages ----------

app.get("/", async (c) => {
  const m = c.get("money");
  cacheable(c, m, 300);
  return c.html(views.homePage(m, await db.latest(c.env, 6)));
});

app.get("/tools", (c) => {
  const m = c.get("money");
  cacheable(c, m, 3600);
  return c.html(views.toolsPage(m));
});

app.get("/tools/:id", async (c) => {
  const tool = TOOL_BY_ID[c.req.param("id")];
  const m = c.get("money");
  if (!tool) return c.html(views.notFoundPage(m), 404);
  // Prefill from links such as "Make my own version" on a library page.
  const q = c.req.query();
  const pre: Record<string, string> = {};
  for (const k of ["topic", "grade", "subject", "standards"]) if (q[k]) pre[k] = q[k].slice(0, 300);
  if (!Object.keys(pre).length) cacheable(c, m, 3600);
  return c.html(views.toolPage(m, tool, pre, tool.libraryType ? await db.byType(c.env, tool.id, 3) : []));
});

app.get("/library", async (c) => {
  const m = c.get("money");
  const f = db.parseFilter(c.req.query());
  const { items, hasMore } = await db.listLibrary(c.env, f);
  cacheable(c, m, 300);
  return c.html(views.libraryPage(m, f, items, hasMore));
});

app.get("/library/:slug", async (c) => {
  const m = c.get("money");
  const r = await db.getBySlug(c.env, c.req.param("slug"));
  if (!r) return c.html(views.notFoundPage(m), 404);
  c.executionCtx.waitUntil(db.countView(c.env, r.id));
  if (r.status === "published") cacheable(c, m, 600);
  return c.html(views.resourcePage(m, r, await db.related(c.env, r)));
});

app.get("/support", (c) => c.html(views.supportPage(c.get("money"))));

app.get("/support/thanks", async (c) => {
  const code = c.req.query("code") ?? "";
  if (!c.env.SUPPORTER_CODE || code !== c.env.SUPPORTER_CODE) return c.redirect("/support");
  setCookie(c, SUPPORTER_COOKIE, await supporterToken(code), {
    path: "/",
    maxAge: 60 * 60 * 24 * 365,
    httpOnly: true,
    secure: new URL(c.req.url).protocol === "https:",
    sameSite: "Lax",
  });
  return c.html(views.supportPage({ env: c.env, supporter: true }, true));
});

app.get("/my", (c) => c.html(views.myDocsPage(c.get("money"))));
app.get("/about", (c) => c.html(views.aboutPage(c.get("money"))));
app.get("/privacy", (c) => c.html(views.privacyPage(c.get("money"))));
app.get("/terms", (c) => c.html(views.termsPage(c.get("money"))));

// ---------- API ----------

app.post("/api/generate", async (c) => {
  if (!sameOrigin(c)) return c.json({ error: "Requests must come from this site." }, 403);
  let body: Record<string, unknown>;
  try {
    body = await c.req.json();
  } catch {
    return c.json({ error: "Bad request." }, 400);
  }

  let userPrompt: string;
  let tool;
  let topic = "";
  let budget = 4096;
  let checks: Checks = {};
  try {
    tool = getTool(body.tool);
    const inputs = normalizeInputs(tool, (body.inputs ?? {}) as Record<string, unknown>);
    topic = inputs.topic ?? inputs.source ?? "";
    budget = outputBudget(inputs, tool);
    const chosen = tool;
    checks = {
      tidy: (doc) => tidy(doc, chosen),
      findProblems: (doc) => findProblems(doc, chosen, inputs),
      // Every document with an answer key gets its answers worked a second time.
      verify: !chosen.noKey && c.env.CHECK_ANSWERS !== "0",
    };
    const previous = typeof body.previous === "string" ? body.previous.slice(0, MAX_PREVIOUS) : "";
    const request = typeof body.refine === "string" ? body.refine.trim() : "";
    userPrompt = buildUserPrompt(tool, inputs, previous && request ? { previous, request } : undefined);
  } catch (err) {
    if (err instanceof InputError) return c.json({ error: err.message }, 400);
    throw err;
  }

  // A random id per browser so a school sharing one network address isn't treated as one person.
  let device = getCookie(c, DEVICE_COOKIE) ?? "";
  if (!/^[0-9a-f-]{36}$/.test(device)) {
    device = crypto.randomUUID();
    setCookie(c, DEVICE_COOKIE, device, {
      path: "/", maxAge: 60 * 60 * 24 * 365, httpOnly: true, sameSite: "Lax",
      secure: new URL(c.req.url).protocol === "https:",
    });
  }
  const limit = await takeGeneration(c.env, clientIp(c), device);
  if (!limit.ok) {
    const error =
      limit.reason === "personal"
        ? "You've reached today's limit. It resets at midnight UTC, and the library is still open."
        : "The site has hit its daily capacity. Please try again tomorrow; the library is still open.";
    return c.json({ error }, 429);
  }
  if (Math.random() < 0.01) c.executionCtx.waitUntil(pruneUsage(c.env));

  const env = c.env;
  const stream = lineStream((send) =>
    env.ANTHROPIC_API_KEY ? generate(env, userPrompt, send, budget, checks) : generateDemo(tool, topic, send),
  );
  // c.body (not a bare Response) so the device cookie set above is sent with the stream.
  return c.body(stream, 200, {
    "Content-Type": "application/x-ndjson; charset=utf-8",
    "Cache-Control": "no-store",
    "X-Accel-Buffering": "no",
  });
});

app.post("/api/share", async (c) => {
  if (!sameOrigin(c)) return c.json({ error: "Requests must come from this site." }, 403);
  let body: Record<string, unknown>;
  try {
    body = await c.req.json();
  } catch {
    return c.json({ error: "Bad request." }, 400);
  }
  if (body.confirm !== true) return c.json({ error: "Please confirm there is no personal information in the document." }, 400);
  const tool = TOOL_BY_ID[String(body.tool)];
  if (!tool?.libraryType) return c.json({ error: "This kind of document can't be shared." }, 400);
  if (!(await takeShare(c.env, clientIp(c)))) return c.json({ error: "You've shared a lot today. Please try again tomorrow." }, 429);
  try {
    const r = await db.shareResource(c.env, {
      markdown: String(body.markdown ?? ""),
      type: tool.id,
      grade: String(body.grade ?? ""),
      subject: String(body.subject ?? ""),
      standards: String(body.standards ?? ""),
    });
    return c.json({ url: `/library/${r.slug}` });
  } catch (err) {
    if (err instanceof db.ShareError) return c.json({ error: err.message }, 400);
    throw err;
  }
});

app.post("/api/subscribe", async (c) => {
  if (!sameOrigin(c)) return c.json({ error: "Requests must come from this site." }, 403);
  const body = await c.req.json().catch(() => ({}));
  const ok = await db.subscribe(c.env, String((body as { email?: unknown }).email ?? ""));
  return ok ? c.json({ ok: true }) : c.json({ error: "That doesn't look like an email address." }, 400);
});

// ---------- admin ----------

const isAdmin = (env: Env, token: string | undefined) =>
  !!env.ADMIN_TOKEN && env.ADMIN_TOKEN.length >= 12 && token === env.ADMIN_TOKEN;

app.get("/admin", async (c) => {
  const token = c.req.query("token");
  if (!isAdmin(c.env, token)) return c.html(views.notFoundPage(c.get("money")), 404);
  c.header("Cache-Control", "no-store");
  return c.html(views.adminPage({ env: c.env, supporter: true }, token!, await db.adminLists(c.env)));
});

app.post("/admin/action", async (c) => {
  const form = await c.req.parseBody();
  const token = String(form.token ?? "");
  if (!isAdmin(c.env, token)) return c.html(views.notFoundPage(c.get("money")), 404);
  const id = String(form.id ?? "");
  const action = String(form.action ?? "");
  if (action === "publish") await db.setStatus(c.env, id, "published");
  else if (action === "unpublish") await db.setStatus(c.env, id, "pending");
  else if (action === "delete") await db.deleteResource(c.env, id);
  return c.redirect(`/admin?token=${encodeURIComponent(token)}`);
});

app.get("/admin/subscribers.csv", async (c) => {
  if (!isAdmin(c.env, c.req.query("token"))) return c.html(views.notFoundPage(c.get("money")), 404);
  const rows = await c.env.DB.prepare("SELECT email, created_at FROM subscribers ORDER BY created_at").all<{ email: string; created_at: string }>();
  const csv = "email,subscribed_at\n" + rows.results.map((r) => `${r.email},${r.created_at}`).join("\n") + "\n";
  return new Response(csv, {
    headers: { "Content-Type": "text/csv; charset=utf-8", "Content-Disposition": "attachment; filename=subscribers.csv", "Cache-Control": "no-store" },
  });
});

// ---------- for search engines and ad networks ----------

app.get("/robots.txt", (c) => {
  const base = c.env.SITE_URL || new URL(c.req.url).origin;
  return c.text(`User-agent: *\nAllow: /\nDisallow: /admin\nDisallow: /api/\n\nSitemap: ${base.replace(/\/$/, "")}/sitemap.xml\n`);
});

app.get("/sitemap.xml", async (c) => {
  const base = (c.env.SITE_URL || new URL(c.req.url).origin).replace(/\/$/, "");
  const urls: string[] = [
    `<url><loc>${base}/</loc></url>`,
    `<url><loc>${base}/tools</loc></url>`,
    `<url><loc>${base}/library</loc></url>`,
    ...TOOLS.map((t) => `<url><loc>${base}/tools/${t.id}</loc></url>`),
    ...(await db.sitemapSlugs(c.env)).map(
      (r) => `<url><loc>${base}/library/${r.slug}</loc><lastmod>${r.created_at.slice(0, 10)}</lastmod></url>`,
    ),
  ];
  c.header("Cache-Control", "public, max-age=3600");
  return c.body(`<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${urls.join("\n")}\n</urlset>\n`, 200, {
    "Content-Type": "application/xml; charset=utf-8",
  });
});

app.get("/ads.txt", (c) => c.text(adsTxt(c.env)));

app.get("/healthz", async (c) => {
  const day = today();
  return c.json({ ok: true, ai: !!c.env.ANTHROPIC_API_KEY, day, probe: (await hashIp("x", day, "x")).length === 24 });
});

app.notFound((c) => c.html(views.notFoundPage(c.get("money") ?? { env: c.env, supporter: false }), 404));

app.onError((err, c) => {
  console.error(err);
  return c.text("Something went wrong. Please try again.", 500);
});

export default app;
