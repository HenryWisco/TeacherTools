import type { Env } from "./env";
import { BANDS, GRADES, SUBJECTS, TYPE_LABELS } from "./tools";
import { plainSummary } from "./markdown";
import { slugify, splitTitle } from "./prompt";

export type Resource = {
  id: string;
  slug: string;
  title: string;
  type: string;
  grade: string;
  subject: string;
  summary: string;
  standards: string;
  body: string;
  status: "pending" | "published";
  source: string;
  views: number;
  created_at: string;
};

export type LibraryFilter = { band?: string; subject?: string; type?: string; q?: string; page?: number };

export const PAGE_SIZE = 24;

const CARD_COLS = "id, slug, title, type, grade, subject, summary, standards, status, source, views, created_at";

export function parseFilter(query: Record<string, string | undefined>): LibraryFilter {
  const f: LibraryFilter = {};
  if (query.band && query.band in BANDS) f.band = query.band;
  if (query.subject && query.subject in SUBJECTS) f.subject = query.subject;
  if (query.type && query.type in TYPE_LABELS) f.type = query.type;
  const q = (query.q ?? "").trim().slice(0, 80);
  if (q) f.q = q;
  const page = parseInt(query.page ?? "1", 10);
  f.page = Number.isFinite(page) && page > 0 && page < 500 ? page : 1;
  return f;
}

export async function listLibrary(env: Env, f: LibraryFilter): Promise<{ items: Resource[]; hasMore: boolean }> {
  const where = ["status = 'published'"];
  const args: unknown[] = [];
  if (f.band) {
    const grades = BANDS[f.band].grades;
    where.push(`grade IN (${grades.map(() => "?").join(",")})`);
    args.push(...grades);
  }
  if (f.subject) {
    where.push("subject = ?");
    args.push(f.subject);
  }
  if (f.type) {
    where.push("type = ?");
    args.push(f.type);
  }
  if (f.q) {
    const like = `%${f.q.replace(/[\\%_]/g, (c) => "\\" + c)}%`;
    where.push("(title LIKE ? ESCAPE '\\' OR summary LIKE ? ESCAPE '\\' OR standards LIKE ? ESCAPE '\\')");
    args.push(like, like, like);
  }
  const page = f.page ?? 1;
  const rows = await env.DB.prepare(
    `SELECT ${CARD_COLS} FROM resources WHERE ${where.join(" AND ")}
     ORDER BY created_at DESC, id LIMIT ? OFFSET ?`,
  )
    .bind(...args, PAGE_SIZE + 1, (page - 1) * PAGE_SIZE)
    .all<Resource>();
  return { items: rows.results.slice(0, PAGE_SIZE), hasMore: rows.results.length > PAGE_SIZE };
}

export async function latest(env: Env, limit: number): Promise<Resource[]> {
  const rows = await env.DB.prepare(
    `SELECT ${CARD_COLS} FROM resources WHERE status = 'published' ORDER BY created_at DESC, id LIMIT ?`,
  )
    .bind(limit)
    .all<Resource>();
  return rows.results;
}

export async function related(env: Env, r: Resource, limit = 4): Promise<Resource[]> {
  const rows = await env.DB.prepare(
    `SELECT ${CARD_COLS} FROM resources
     WHERE status = 'published' AND id != ?1 AND (subject = ?2 OR type = ?3)
     ORDER BY (subject = ?2) + (grade = ?4) DESC, created_at DESC LIMIT ?5`,
  )
    .bind(r.id, r.subject, r.type, r.grade, limit)
    .all<Resource>();
  return rows.results;
}

export async function byType(env: Env, type: string, limit = 4): Promise<Resource[]> {
  const rows = await env.DB.prepare(
    `SELECT ${CARD_COLS} FROM resources WHERE status = 'published' AND type = ? ORDER BY created_at DESC LIMIT ?`,
  )
    .bind(type, limit)
    .all<Resource>();
  return rows.results;
}

export async function getBySlug(env: Env, slug: string): Promise<Resource | null> {
  return env.DB.prepare("SELECT * FROM resources WHERE slug = ?").bind(slug).first<Resource>();
}

export async function countView(env: Env, id: string): Promise<void> {
  await env.DB.prepare("UPDATE resources SET views = views + 1 WHERE id = ?").bind(id).run();
}

export const MAX_SHARED_BODY = 30000;

export class ShareError extends Error {}

// Saves a teacher's generated document. It is reachable by its link straight away but
// stays out of the library, the sitemap and search engines until the owner approves it.
export async function shareResource(
  env: Env,
  input: { markdown: string; type: string; grade: string; subject: string; standards: string },
): Promise<Resource> {
  const md = String(input.markdown ?? "").trim();
  if (md.length < 200) throw new ShareError("That document is too short to share.");
  if (md.length > MAX_SHARED_BODY) throw new ShareError("That document is too long to share.");
  const { title, body } = splitTitle(md);
  if (!title) throw new ShareError("Add a title line (starting with #) before sharing.");
  if (!(input.type in TYPE_LABELS)) throw new ShareError("Unknown document type.");

  const id = crypto.randomUUID();
  const grade = GRADES.includes(input.grade) ? input.grade : "";
  const subject = input.subject in SUBJECTS ? input.subject : "";
  const base = slugify(title) || "resource";
  const slug = `${base}${grade ? `-grade-${grade.toLowerCase()}` : ""}-${id.slice(0, 6)}`;
  const row: Resource = {
    id,
    slug,
    title,
    type: input.type,
    grade,
    subject,
    summary: plainSummary(body, 180),
    standards: String(input.standards ?? "").trim().slice(0, 200),
    body,
    status: "pending",
    source: "user",
    views: 0,
    created_at: new Date().toISOString(),
  };
  await env.DB.prepare(
    `INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at)
     VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)`,
  )
    .bind(row.id, row.slug, row.title, row.type, row.grade, row.subject, row.summary, row.standards, row.body, row.status, row.source, 0, row.created_at)
    .run();
  return row;
}

export async function adminLists(env: Env) {
  const [pending, published, subs, usage] = await env.DB.batch([
    env.DB.prepare(`SELECT ${CARD_COLS} FROM resources WHERE status = 'pending' ORDER BY created_at DESC LIMIT 100`),
    env.DB.prepare(`SELECT ${CARD_COLS} FROM resources WHERE status = 'published' ORDER BY views DESC LIMIT 100`),
    env.DB.prepare("SELECT COUNT(*) AS n FROM subscribers"),
    env.DB.prepare("SELECT day, count FROM usage WHERE ip_hash = '*' ORDER BY day DESC LIMIT 7"),
  ]);
  return {
    pending: pending.results as Resource[],
    published: published.results as Resource[],
    subscribers: ((subs.results[0] as { n: number } | undefined)?.n ?? 0) as number,
    usage: usage.results as { day: string; count: number }[],
  };
}

export async function setStatus(env: Env, id: string, status: "pending" | "published"): Promise<void> {
  await env.DB.prepare("UPDATE resources SET status = ? WHERE id = ?").bind(status, id).run();
}

export async function deleteResource(env: Env, id: string): Promise<void> {
  await env.DB.prepare("DELETE FROM resources WHERE id = ?").bind(id).run();
}

export async function subscribe(env: Env, email: string): Promise<boolean> {
  const e = email.trim().toLowerCase();
  if (e.length > 200 || !/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(e)) return false;
  await env.DB.prepare("INSERT OR IGNORE INTO subscribers (email, created_at) VALUES (?, ?)")
    .bind(e, new Date().toISOString())
    .run();
  return true;
}

export async function sitemapSlugs(env: Env): Promise<{ slug: string; created_at: string }[]> {
  const rows = await env.DB.prepare(
    "SELECT slug, created_at FROM resources WHERE status = 'published' ORDER BY created_at DESC LIMIT 20000",
  ).all<{ slug: string; created_at: string }>();
  return rows.results;
}
