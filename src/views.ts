import { html, raw } from "hono/html";
import type { HtmlEscapedString } from "hono/utils/html";
import type { Env } from "./env";
import type { LibraryFilter, Resource } from "./db";
import { NO_AD_TOOLS, adScript, adSlot, classroomPicks, sponsorStrip, type Money } from "./monetize";
import { renderMarkdown } from "./markdown";
import { BANDS, GRADES, LANGUAGES, MAX_REFERENCE, REGIONS, SUBJECTS, TOOLS, VERSIONS, allowsReference, allowsVersions, gradeLabel, typeLabel, TOOL_BY_ID, type Field, type Tool } from "./tools";

type H = HtmlEscapedString | Promise<HtmlEscapedString> | string;

export type Page = {
  m: Money;
  path: string;
  title: string;
  description: string;
  noindex?: boolean;
  jsonLd?: unknown;
  scripts?: boolean; // load the generator script
  extraScript?: string;
};

const abs = (env: Env, path: string) => (env.SITE_URL ? env.SITE_URL.replace(/\/$/, "") + path : path);

export function layout(p: Page, body: H) {
  const { env } = p.m;
  const full = p.path === "/" ? `${env.SITE_NAME}: ${p.title}` : `${p.title} | ${env.SITE_NAME}`;
  return html`<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${full}</title>
<meta name="description" content="${p.description}">
${p.noindex ? html`<meta name="robots" content="noindex">` : html`<link rel="canonical" href="${abs(env, p.path)}">`}
<meta property="og:title" content="${p.title}">
<meta property="og:description" content="${p.description}">
<meta property="og:type" content="website">
<meta property="og:site_name" content="${env.SITE_NAME}">
<link rel="icon" href="/favicon.svg" type="image/svg+xml">
<link rel="stylesheet" href="/style.css">
${p.jsonLd ? html`<script type="application/ld+json">${raw(JSON.stringify(p.jsonLd).replace(/</g, "\\u003c"))}</script>` : ""}
${adScript(p.m)}
</head>
<body>
<a class="skip" href="#main">Skip to content</a>
<header class="site-header no-print">
  <div class="wrap bar">
    <a class="brand" href="/"><span class="brand-mark" aria-hidden="true">✎</span>${env.SITE_NAME}</a>
    <nav aria-label="Main">
      <a href="/tools" ${p.path.startsWith("/tools") ? raw('aria-current="page"') : ""}>Tools</a>
      <a href="/library" ${p.path.startsWith("/library") ? raw('aria-current="page"') : ""}>Library</a>
      <a href="/my" ${p.path === "/my" ? raw('aria-current="page"') : ""}>My documents</a>
      <a href="/support" ${p.path.startsWith("/support") ? raw('aria-current="page"') : ""}>Support us</a>
    </nav>
  </div>
</header>
<main id="main">
${body}
</main>
<footer class="site-footer no-print">
  <div class="wrap footer-grid">
    <div>
      <p class="brand small"><span class="brand-mark" aria-hidden="true">✎</span>${env.SITE_NAME}</p>
      <p class="muted">${env.SITE_TAGLINE} Free for teachers. No sign-up, no paywall.</p>
      ${sponsorStrip(p.m)}
    </div>
    <form class="newsletter" data-newsletter>
      <label for="nl-email"><strong>One email a week.</strong> The best new free resources, nothing else.</label>
      <div class="row">
        <input id="nl-email" name="email" type="email" required placeholder="you@school.org" autocomplete="email">
        <button class="btn" type="submit">Subscribe</button>
      </div>
      <p class="fine" data-newsletter-msg>Unsubscribe any time. We never sell your address.</p>
    </form>
    <nav class="footer-links" aria-label="Footer">
      <a href="/about">About</a>
      <a href="/privacy">Privacy</a>
      <a href="/terms">Terms</a>
      <a href="/support">Support us</a>
    </nav>
  </div>
  <p class="wrap fine">Made for educators (18+). Please don't enter student names or personal details. Always review materials before using them with your class.</p>
</footer>
<script src="/site.js" defer></script>
${p.scripts ? html`<script src="/marked.js" defer></script><script src="/app.js" defer></script>` : ""}
${p.extraScript ? html`<script src="${p.extraScript}" defer></script>` : ""}
</body>
</html>`;
}

// ---------- shared pieces ----------

function fieldHtml(f: Field, value: string, idPrefix: string) {
  const id = `${idPrefix}-${f.name}`;
  const req = f.required ? raw("required") : "";
  let control: H;
  if (f.kind === "select") {
    control = html`<select id="${id}" name="${f.name}">
      ${(f.options ?? []).map((o) => html`<option ${o === value ? raw("selected") : ""}>${o}</option>`)}
    </select>`;
  } else if (f.kind === "textarea") {
    control = html`<textarea id="${id}" name="${f.name}" rows="${f.name === "source" ? 8 : 3}" maxlength="${f.max ?? 1500}" placeholder="${f.placeholder ?? ""}" ${req}>${value}</textarea>`;
  } else {
    control = html`<input id="${id}" name="${f.name}" type="text" maxlength="${f.max ?? 200}" placeholder="${f.placeholder ?? ""}" value="${value}" ${req}>`;
  }
  const wide = f.kind === "textarea" || f.name === "topic";
  return html`<div class="field ${wide ? "wide" : ""}">
    <label for="${id}">${f.label}</label>
    ${control}
    ${f.help ? html`<p class="fine">${f.help}</p>` : ""}
  </div>`;
}

function commonFields(tool: Tool, pre: Record<string, string>, idPrefix: string) {
  const c = tool.common ?? {};
  return html`
    ${c.grade
      ? html`<div class="field"><label for="${idPrefix}-grade">Grade</label>
          <select id="${idPrefix}-grade" name="grade">
            <option value="">Any / not sure</option>
            ${GRADES.map((g) => html`<option value="${g}" ${pre.grade === g ? raw("selected") : ""}>${gradeLabel(g)}</option>`)}
          </select></div>`
      : ""}
    ${c.subject
      ? html`<div class="field"><label for="${idPrefix}-subject">Subject</label>
          <select id="${idPrefix}-subject" name="subject">
            <option value="">Any</option>
            ${Object.entries(SUBJECTS).map(([k, v]) => html`<option value="${k}" ${pre.subject === k ? raw("selected") : ""}>${v}</option>`)}
          </select></div>`
      : ""}
    ${c.standards
      ? html`<div class="field"><label for="${idPrefix}-standards">Standard <span class="opt">(optional)</span></label>
          <input id="${idPrefix}-standards" name="standards" type="text" maxlength="200" placeholder="e.g. CCSS.MATH.CONTENT.4.NF.A.1 or TEKS 4.3C" value="${pre.standards ?? ""}"></div>`
      : ""}`;
}

// Options shared by every tool, tucked away so the simple path stays simple.
// Country and language are remembered in the browser (see public/app.js).
function moreOptions(tool: Tool, idp: string) {
  const ownLanguage = tool.fields.some((f) => f.name === "language");
  return html`<details class="more">
    <summary>More options <span class="opt" data-more-summary>versions, country, language, your own text</span></summary>
    <div class="fields">
      ${allowsVersions(tool)
        ? html`<div class="field"><label for="${idp}-versions">Versions</label>
            <select id="${idp}-versions" name="versions">
              <option value="">One version</option>
              ${Object.entries(VERSIONS).map(([k, v]) => html`<option value="${k}">${v.label}</option>`)}
            </select></div>`
        : ""}
      <div class="field"><label for="${idp}-region">Country</label>
        <select id="${idp}-region" name="region" data-remember>
          ${Object.entries(REGIONS).map(([k, v]) => html`<option value="${k}">${v.label}</option>`)}
        </select></div>
      ${ownLanguage
        ? ""
        : html`<div class="field"><label for="${idp}-language">Language</label>
            <select id="${idp}-language" name="language" data-remember>
              ${LANGUAGES.map((l) => html`<option>${l}</option>`)}
            </select></div>`}
      ${allowsReference(tool)
        ? html`<div class="field wide"><label for="${idp}-reference">Your own text or template <span class="opt">(optional)</span></label>
            <textarea id="${idp}-reference" name="reference" rows="4" maxlength="${MAX_REFERENCE}" placeholder="Paste a passage or notes to base this on, or the headings your school's template requires."></textarea>
            <p class="fine">Only paste text you have the right to use, and leave out student names.</p></div>`
        : ""}
    </div>
  </details>`;
}

const CHIPS: [string, string][] = [
  ["Shorter", "Make it shorter, to fit on one page if possible."],
  ["Easier", "Make it easier: simpler wording, smaller numbers, more scaffolding."],
  ["Harder", "Make it more challenging, with deeper reasoning rather than just more questions."],
  ["Version B", "Make a Version B: same skills and difficulty, different numbers, examples and question order."],
  ["Sentence starters", "Add sentence starters and a word bank to support students who need them."],
  ["For English learners", "Adapt it for English learners: simpler sentences, key vocabulary defined, sentence frames."],
  ["In Spanish", "Rewrite the whole document in natural classroom Spanish."],
  ["More questions", "Add five more questions of the same kind, and add them to the answer key."],
];

// The generator: a form, a live-updating page of output, and the actions for using it.
export function generator(tool: Tool, pre: Record<string, string>, opts: { compact?: boolean } = {}) {
  const idp = `g-${tool.id}`;
  return html`<section class="generator" data-generator data-tool="${tool.id}" data-shareable="${tool.libraryType ? "1" : ""}">
    <form class="gen-form no-print" novalidate>
      <div class="fields">
        ${tool.fields.map((f) => fieldHtml(f, pre[f.name] ?? "", idp))}
        ${commonFields(tool, pre, idp)}
      </div>
      ${moreOptions(tool, idp)}
      <div class="actions">
        <button class="btn primary" type="submit" data-go>${opts.compact ? "Make it" : `Make my ${tool.name.toLowerCase()}`}</button>
        <span class="fine" data-status role="status" aria-live="polite">Free. No sign-up. Takes about 15 seconds.</span>
      </div>
    </form>

    <div class="result" data-result hidden>
      <div class="toolbar no-print" role="toolbar" aria-label="Document actions">
        <button class="btn" type="button" data-act="print">🖨 Print / save PDF</button>
        <button class="btn" type="button" data-act="word">⬇ Word</button>
        <button class="btn" type="button" data-act="copy">📋 Copy for Google Docs</button>
        <button class="btn" type="button" data-act="edit">✏ Edit</button>
        <button class="btn" type="button" data-act="large" aria-pressed="false">🔎 Large print</button>
        ${tool.libraryType ? html`<button class="btn" type="button" data-act="share">🔗 Share</button>` : ""}
      </div>
      <p class="notice no-print" data-notice hidden></p>
      <textarea class="editor no-print" data-editor hidden aria-label="Edit the document text" spellcheck="true"></textarea>
      <article class="doc paper" data-doc aria-live="off"></article>
      <form class="refine no-print" data-refine>
        <label for="${idp}-refine">Want it different?</label>
        <div class="chips wrap-chips" data-chips>
          ${CHIPS.map(([label, text]) => html`<button class="chip" type="button" data-chip="${text}">${label}</button>`)}
        </div>
        <div class="row">
          <input id="${idp}-refine" name="request" type="text" maxlength="500" placeholder="e.g. make it shorter · add 5 harder questions · write it for English learners">
          <button class="btn" type="submit">Revise</button>
        </div>
      </form>
    </div>
  </section>`;
}

export function resourceCard(r: Resource) {
  return html`<a class="card" href="/library/${r.slug}">
    <span class="tags">
      <span class="tag type">${typeLabel(r.type)}</span>
      ${r.grade ? html`<span class="tag">${gradeLabel(r.grade)}</span>` : ""}
      ${r.subject && SUBJECTS[r.subject] ? html`<span class="tag">${SUBJECTS[r.subject]}</span>` : ""}
    </span>
    <strong>${r.title}</strong>
    <span class="muted">${r.summary}</span>
  </a>`;
}

function toolCard(t: Tool) {
  return html`<a class="tool" href="/tools/${t.id}">
    <span class="tool-icon" aria-hidden="true">${t.icon}</span>
    <span><strong>${t.name}</strong><span class="muted">${t.blurb}</span></span>
  </a>`;
}

// ---------- pages ----------

export function homePage(m: Money, latest: Resource[]) {
  const featured = ["lesson-plan", "worksheet", "quiz", "rubric", "reading-passage", "text-leveler", "exit-ticket", "sub-plan", "parent-email", "report-comments", "word-problems", "choice-board"];
  return layout(
    {
      m,
      path: "/",
      title: "Free AI lesson plans, worksheets and quizzes for teachers",
      description:
        "Describe what you need and get a print-ready lesson plan, worksheet, quiz or rubric in seconds. Free for teachers, no sign-up, no paywall. Plus a library of ready-made resources.",
      scripts: true,
    },
    html`<section class="hero">
      <div class="wrap narrow">
        <h1>Whatever your class needs tomorrow, <em>made tonight in seconds.</em></h1>
        <p class="lede">Lesson plans, worksheets, quizzes, rubrics, emails home and more. Free, no sign-up, and ready to print.</p>
        ${generator(TOOL_BY_ID["anything"], {}, { compact: true })}
      </div>
    </section>

    <section class="wrap section">
      <div class="section-head"><h2>Or start with a tool</h2><a href="/tools">All ${TOOLS.length} tools →</a></div>
      <div class="tool-grid">${featured.map((id) => toolCard(TOOL_BY_ID[id]))}</div>
    </section>

    <div class="wrap">${adSlot(m, "home")}</div>

    ${latest.length
      ? html`<section class="wrap section">
          <div class="section-head"><h2>Ready-made in the library</h2><a href="/library">Browse the library →</a></div>
          <div class="card-grid">${latest.map(resourceCard)}</div>
        </section>`
      : ""}

    <section class="wrap section promise">
      <div><h3>Free means free</h3><p>No trial that runs out, no "upgrade to download". The site is paid for by a few quiet ads and optional supporters.</p></div>
      <div><h3>Made to print</h3><p>Clean pages with a name line and an answer key on its own sheet. Print, save as PDF, download for Word or paste into Google Docs.</p></div>
      <div><h3>Private by design</h3><p>No account. What you make is saved in your own browser, not on our servers, and nothing is collected about students. Just don't type their names in.</p></div>
    </section>`,
  );
}

export function toolsPage(m: Money) {
  const groups = ["Plan", "Practice", "Assess", "Read & write", "Communicate", "Support"] as const;
  return layout(
    {
      m,
      path: "/tools",
      title: "Free AI tools for teachers",
      description: `${TOOLS.length} free AI tools for teachers: lesson plans, worksheets, quizzes, rubrics, reading passages, sub plans, family emails and more. No sign-up.`,
    },
    html`<section class="wrap section">
      <h1>Free tools for teachers</h1>
      <p class="lede">Pick one, fill in a line or two, print. Every tool is free with no sign-up.</p>
      ${groups.map(
        (g) => html`<h2 class="group">${g}</h2>
          <div class="tool-grid">${TOOLS.filter((t) => t.group === g).map(toolCard)}</div>`,
      )}
    </section>`,
  );
}

export function toolPage(m: Money, tool: Tool, pre: Record<string, string>, examples: Resource[]) {
  const others = TOOLS.filter((t) => t.group === tool.group && t.id !== tool.id).slice(0, 4);
  const h1 = tool.id === "anything" ? "Ask for anything" : `Free ${tool.name} Generator`;
  return layout(
    {
      m,
      path: `/tools/${tool.id}`,
      title: tool.id === "anything" ? "Ask for any classroom material" : `Free ${tool.name} Generator for Teachers`,
      description: tool.intro,
      scripts: true,
      jsonLd: {
        "@context": "https://schema.org",
        "@type": "WebApplication",
        name: `${tool.name} Generator`,
        applicationCategory: "EducationalApplication",
        operatingSystem: "Any",
        offers: { "@type": "Offer", price: "0", priceCurrency: "USD" },
        description: tool.intro,
      },
    },
    html`<section class="wrap section narrow">
      <p class="crumbs no-print"><a href="/tools">Tools</a> › ${tool.name}</p>
      <h1 class="no-print"><span aria-hidden="true">${tool.icon}</span> ${h1}</h1>
      <p class="lede no-print">${tool.intro}</p>
      ${generator(tool, pre)}
      ${NO_AD_TOOLS.has(tool.id) ? "" : adSlot(m, "tool")}
    </section>
    ${examples.length
      ? html`<section class="wrap section no-print">
          <div class="section-head"><h2>Ready-made ${tool.name.toLowerCase()} examples</h2><a href="/library?type=${tool.id}">See all →</a></div>
          <div class="card-grid">${examples.map(resourceCard)}</div>
        </section>`
      : ""}
    ${others.length
      ? html`<section class="wrap section no-print">
          <h2>Related tools</h2>
          <div class="tool-grid">${others.map(toolCard)}</div>
        </section>`
      : ""}`,
  );
}

const qs = (f: LibraryFilter, patch: Partial<LibraryFilter>) => {
  const merged: Record<string, unknown> = { ...f, page: undefined, ...patch };
  const p = new URLSearchParams();
  for (const [k, v] of Object.entries(merged)) if (v !== undefined && v !== "" && !(k === "page" && v === 1)) p.set(k, String(v));
  const s = p.toString();
  return "/library" + (s ? "?" + s : "");
};

export function libraryPage(m: Money, f: LibraryFilter, items: Resource[], hasMore: boolean) {
  const types = TOOLS.filter((t) => t.libraryType && t.id !== "anything");
  const filtered = !!(f.band || f.subject || f.type || f.q);
  const chip = (label: string, href: string, on: boolean) =>
    html`<a class="chip ${on ? "on" : ""}" href="${href}" ${on ? raw('aria-current="true"') : ""}>${label}</a>`;
  const page = f.page ?? 1;
  const headline = [
    f.band ? `Grades ${BANDS[f.band].label}` : "",
    f.subject ? SUBJECTS[f.subject] : "",
    f.type ? typeLabel(f.type) : "",
  ]
    .filter(Boolean)
    .join(" · ");
  return layout(
    {
      m,
      path: "/library",
      title: headline ? `Free ${headline} resources` : "Free teaching resources library",
      description:
        "Browse free, print-ready lesson plans, worksheets, quizzes and rubrics by grade and subject. Every resource is reviewed before it is listed.",
      noindex: !!f.q || page > 1,
    },
    html`<section class="wrap section">
      <h1>${headline ? `Free ${headline} resources` : "The library"}</h1>
      <p class="lede">Ready-made and reviewed. Print as is, or open one and make your own version.</p>
      <form class="search" action="/library" method="get" role="search">
        ${f.band ? html`<input type="hidden" name="band" value="${f.band}">` : ""}
        ${f.subject ? html`<input type="hidden" name="subject" value="${f.subject}">` : ""}
        ${f.type ? html`<input type="hidden" name="type" value="${f.type}">` : ""}
        <input type="search" name="q" value="${f.q ?? ""}" placeholder="Search the library, e.g. fractions, water cycle, 4.NF" aria-label="Search the library">
        <button class="btn" type="submit">Search</button>
      </form>
      <div class="filters">
        <div class="chips" aria-label="Grade band">
          ${chip("All grades", qs(f, { band: undefined }), !f.band)}
          ${Object.entries(BANDS).map(([k, b]) => chip(b.label, qs(f, { band: k }), f.band === k))}
        </div>
        <div class="chips" aria-label="Subject">
          ${chip("All subjects", qs(f, { subject: undefined }), !f.subject)}
          ${Object.entries(SUBJECTS).map(([k, v]) => chip(v, qs(f, { subject: k }), f.subject === k))}
        </div>
        <div class="chips" aria-label="Type">
          ${chip("All types", qs(f, { type: undefined }), !f.type)}
          ${types.map((t) => chip(t.name, qs(f, { type: t.id }), f.type === t.id))}
        </div>
      </div>
      ${items.length
        ? html`<div class="card-grid">${items.slice(0, 6).map(resourceCard)}</div>
            ${adSlot(m, "library")}
            <div class="card-grid">${items.slice(6).map(resourceCard)}</div>`
        : html`<div class="empty">
            <p><strong>Nothing here yet${filtered ? " for that combination" : ""}.</strong></p>
            <p>Make exactly what you need instead. It takes about 15 seconds.</p>
            <a class="btn primary" href="/tools/${f.type ?? "anything"}${f.q ? `?topic=${encodeURIComponent(f.q)}` : ""}">Make one now</a>
          </div>`}
      <nav class="pager" aria-label="Pages">
        ${page > 1 ? html`<a class="btn" href="${qs(f, { page: page - 1 })}">← Newer</a>` : ""}
        ${hasMore ? html`<a class="btn" href="${qs(f, { page: page + 1 })}">Older →</a>` : ""}
      </nav>
    </section>`,
  );
}

export function resourcePage(m: Money, r: Resource, more: Resource[]) {
  const tool = TOOL_BY_ID[r.type] ?? TOOL_BY_ID["anything"];
  const remix = `/tools/${tool.id}?topic=${encodeURIComponent(r.title)}${r.grade ? `&grade=${r.grade}` : ""}${r.subject ? `&subject=${r.subject}` : ""}`;
  const meta = [typeLabel(r.type), r.grade ? gradeLabel(r.grade) : "", SUBJECTS[r.subject] ?? ""].filter(Boolean).join(" · ");
  return layout(
    {
      m,
      path: `/library/${r.slug}`,
      title: `${r.title}${r.grade ? ` (${gradeLabel(r.grade)})` : ""}: free printable`,
      description: r.summary,
      noindex: r.status !== "published",
      jsonLd: {
        "@context": "https://schema.org",
        "@type": "LearningResource",
        name: r.title,
        description: r.summary,
        learningResourceType: typeLabel(r.type),
        educationalLevel: r.grade ? gradeLabel(r.grade) : undefined,
        about: SUBJECTS[r.subject],
        isAccessibleForFree: true,
        datePublished: r.created_at.slice(0, 10),
        audience: { "@type": "EducationalAudience", educationalRole: "teacher" },
      },
    },
    html`<section class="wrap section resource">
      <div class="resource-main">
        <p class="crumbs no-print"><a href="/library">Library</a> › <a href="/library?type=${r.type}">${typeLabel(r.type)}</a></p>
        <h1 class="no-print">${r.title}</h1>
        <p class="muted no-print">${meta}${r.standards ? html` · <span class="standards">${r.standards}</span>` : ""}</p>
        ${r.status !== "published"
          ? html`<p class="notice no-print">This page is shared by link. It will appear in the public library once it has been reviewed.</p>`
          : ""}
        <div class="toolbar no-print" role="toolbar" aria-label="Document actions" data-static-doc>
          <button class="btn primary" type="button" data-act="print">🖨 Print / save PDF</button>
          <button class="btn" type="button" data-act="word">⬇ Word</button>
          <button class="btn" type="button" data-act="copy">📋 Copy for Google Docs</button>
          <a class="btn" href="${remix}">✨ Make my own version</a>
        </div>
        <p class="notice no-print" data-notice hidden></p>
        <article class="doc paper" data-doc><h1>${r.title}</h1>${raw(renderMarkdown(r.body))}</article>
      </div>
      <aside class="resource-side no-print">
        ${adSlot(m, "resource")}
        ${classroomPicks(m, r.subject)}
        ${more.length ? html`<h3>More like this</h3><div class="side-cards">${more.map(resourceCard)}</div>` : ""}
      </aside>
    </section>`,
  );
}

// The list itself is drawn by public/my.js from this browser's storage; nothing is on the server.
export function myDocsPage(m: Money) {
  return layout(
    { m, path: "/my", title: "My documents", description: "Documents you've made on this device.", noindex: true, extraScript: "/my.js" },
    html`<section class="wrap section narrow">
      <h1>My documents</h1>
      <p class="lede">The last 20 documents made in this browser. They are saved on this device only: we don't have a copy, and they won't appear on another computer.</p>
      <div data-my-docs><p class="muted">Loading…</p></div>
      <noscript><p class="notice">This page needs JavaScript switched on.</p></noscript>
    </section>`,
  );
}

export function supportPage(m: Money, thanks = false) {
  const { env } = m;
  return layout(
    { m, path: "/support", title: "Support us", description: `Help keep ${env.SITE_NAME} free for every teacher.` },
    html`<section class="wrap section narrow prose">
      ${thanks
        ? html`<p class="notice good"><strong>Thank you!</strong> Ads are now switched off on this device for a year. If you use another computer, open your receipt link there too.</p>`
        : ""}
      <h1>Keep it free for every teacher</h1>
      <p>${env.SITE_NAME} has no paywall and never will. Each document costs a fraction of a cent to make, and a few quiet ads cover that. Teachers already spend hundreds of dollars a year of their own money on their classrooms, so the tools shouldn't cost more.</p>
      <p>If the site saves you time and you'd like to chip in, supporters get one thing: <strong>no ads, anywhere on the site</strong>. Everything else is the same for everyone.</p>
      ${m.supporter
        ? html`<p class="notice good">You're a supporter. Ads are off on this device. Thank you.</p>`
        : env.SUPPORT_URL
          ? html`<p><a class="btn primary" href="${env.SUPPORT_URL}" rel="noopener">Become a supporter</a></p>`
          : html`<p class="notice">Supporter sign-up is coming soon. For now, the best support is telling a colleague.</p>`}
      <h2>Other ways to help</h2>
      <ul>
        <li>Share a document you made to the library so another teacher can use it.</li>
        <li>Send the site to your grade team or post it in your staff chat.</li>
        <li>Tell us what's missing${env.CONTACT_EMAIL ? html`: <a href="mailto:${env.CONTACT_EMAIL}">${env.CONTACT_EMAIL}</a>` : ""}.</li>
      </ul>
    </section>`,
  );
}

export function aboutPage(m: Money) {
  const { env } = m;
  return layout(
    { m, path: "/about", title: "About", description: `What ${env.SITE_NAME} is, how it works and how it stays free.` },
    html`<section class="wrap section narrow prose">
      <h1>About ${env.SITE_NAME}</h1>
      <p>${env.SITE_NAME} is a free site for teachers. Describe what you need, and it writes a print-ready lesson plan, worksheet, quiz, rubric or message home in a few seconds. There's also a library of ready-made resources that have been reviewed before being listed.</p>
      <h2>How it works</h2>
      <p>Documents are written by an AI model following instructions written for classroom use: correct answer keys, grade-appropriate language, and a layout that prints cleanly. AI can still make mistakes, so <strong>please read anything before you hand it to students</strong>, the same way you would a resource from any other site.</p>
      <h2>How it stays free</h2>
      <p>A small number of ads, links to classroom supplies that may earn a commission, an occasional sponsor in the weekly email, and optional supporters. None of these ever stand between you and your document, and none appear on anything you print.</p>
      <h2>What we don't do</h2>
      <ul>
        <li>No accounts, and no record of who made what.</li>
        <li>No student data. The site is for adults who teach; please keep student names and details out of your requests.</li>
        <li>No selling email addresses.</li>
      </ul>
      ${env.CONTACT_EMAIL ? html`<p>Questions or ideas: <a href="mailto:${env.CONTACT_EMAIL}">${env.CONTACT_EMAIL}</a></p>` : ""}
    </section>`,
  );
}

export function privacyPage(m: Money) {
  const { env } = m;
  const contact = env.CONTACT_EMAIL ? html`<a href="mailto:${env.CONTACT_EMAIL}">${env.CONTACT_EMAIL}</a>` : "the site owner";
  return layout(
    { m, path: "/privacy", title: "Privacy", description: `How ${env.SITE_NAME} handles your information.` },
    html`<section class="wrap section narrow prose">
      <h1>Privacy</h1>
      <p><strong>Short version:</strong> there are no accounts, we don't keep what you type, and the site is not for children.</p>
      <h2>Who the site is for</h2>
      <p>${env.SITE_NAME} is for teachers and other adults (18 and over) who work in education. It is not directed to children, and students should not use it. Do not enter any student's name or other personal information.</p>
      <h2>What we collect</h2>
      <ul>
        <li><strong>What you type into a tool</strong> is sent to our AI provider (Anthropic) to write your document and is not stored by us after the document is returned.</li>
        <li><strong>Documents you make</strong> are kept in your own browser's storage so you can find them again under "My documents". They stay on your device; we have no copy. Clearing your browser data removes them.</li>
        <li><strong>Documents you choose to share</strong> are stored and, after review, published in the library. Don't share anything containing personal information. Ask ${contact} to remove a shared document at any time.</li>
        <li><strong>Your email address</strong>, only if you subscribe to the weekly email. Unsubscribe any time; we never sell or rent the list.</li>
        <li><strong>A daily usage counter</strong> tied to a random number kept in a cookie on your device and to a scrambled, one-day version of your network address. It is used only to stop automated abuse and is not linked to who you are or what you typed. We do not store your actual IP address.</li>
      </ul>
      <h2>Cookies and advertising</h2>
      <p>The site itself sets two cookies: the random usage-counter number above, and one that switches ads off if you become a supporter. Ads are shown without personalization: they are not chosen using a profile of you. Our advertising partners, including Google, may still use cookies to deliver and measure ads. Ads never appear on printed or downloaded documents, and never beside the tools for family messages, report card comments, IEP goals or differentiation.</p>
      <p>Some links to products are affiliate links: if you buy something, the site may earn a small commission at no cost to you.</p>
      <h2>Contact</h2>
      <p>Questions or removal requests: ${contact}.</p>
      <p class="fine">Site owner: review this page with a qualified adviser before launch, and add your business name and address.</p>
    </section>`,
  );
}

export function termsPage(m: Money) {
  const { env } = m;
  return layout(
    { m, path: "/terms", title: "Terms of use", description: `Terms for using ${env.SITE_NAME}.` },
    html`<section class="wrap section narrow prose">
      <h1>Terms of use</h1>
      <ul>
        <li><strong>For educators.</strong> You must be 18 or over to use this site.</li>
        <li><strong>Your documents are yours to use.</strong> Print, edit, copy and share anything you make here with your students and colleagues, free of charge.</li>
        <li><strong>Check before you teach.</strong> Documents are written by AI and may contain errors. You are responsible for reviewing materials before classroom use. They are provided as is, without warranty.</li>
        <li><strong>No personal information.</strong> Don't enter student names, records or other personal details.</li>
        <li><strong>Sharing.</strong> When you share a document to the library you confirm it contains no personal information and nothing you don't have the right to share, and you allow other teachers to use and adapt it freely. We may decline or remove any shared document.</li>
        <li><strong>Fair use.</strong> Don't use automated tools to make requests in bulk. Daily limits apply to keep the site free for everyone.</li>
        <li><strong>Not professional advice.</strong> Drafts such as IEP goal ideas are starting points for qualified staff, not legal or clinical advice.</li>
      </ul>
      <p class="fine">Site owner: review this page with a qualified adviser before launch.</p>
    </section>`,
  );
}

export function notFoundPage(m: Money) {
  return layout(
    { m, path: "/404", title: "Page not found", description: "Page not found.", noindex: true },
    html`<section class="wrap section narrow empty">
      <h1>That page isn't in the closet</h1>
      <p>It may have been removed, or the link is mistyped.</p>
      <p><a class="btn primary" href="/">Make something new</a> <a class="btn" href="/library">Browse the library</a></p>
    </section>`,
  );
}

export function adminPage(
  m: Money,
  token: string,
  data: { pending: Resource[]; published: Resource[]; subscribers: number; usage: { day: string; count: number }[] },
) {
  const row = (r: Resource, actions: [string, string][]) => html`<tr>
    <td><a href="/library/${r.slug}" target="_blank">${r.title}</a><br><span class="fine">${typeLabel(r.type)} · ${r.grade ? gradeLabel(r.grade) : "any grade"} · ${r.subject || "no subject"} · ${r.source} · ${r.views} views · ${r.created_at.slice(0, 10)}</span></td>
    <td class="nowrap">${actions.map(
      ([action, label]) => html`<form method="post" action="/admin/action" class="inline">
        <input type="hidden" name="token" value="${token}"><input type="hidden" name="id" value="${r.id}">
        <button class="btn ${action === "delete" ? "danger" : ""}" name="action" value="${action}">${label}</button>
      </form>`,
    )}</td>
  </tr>`;
  return layout(
    { m, path: "/admin", title: "Admin", description: "Admin", noindex: true },
    html`<section class="wrap section">
      <h1>Admin</h1>
      <p class="muted">Email subscribers: <strong>${data.subscribers}</strong> · <a href="/admin/subscribers.csv?token=${token}">Download list</a>
      · Documents generated: ${data.usage.length ? data.usage.map((u) => `${u.day.slice(5)}: ${u.count}`).join(" · ") : "none yet"}</p>
      <h2>Waiting for review (${data.pending.length})</h2>
      <p class="fine">Read each one before approving. Approved pages are listed in the library and shown to search engines.</p>
      <table class="admin"><tbody>
        ${data.pending.length ? data.pending.map((r) => row(r, [["publish", "Approve"], ["delete", "Delete"]])) : html`<tr><td>Nothing waiting.</td></tr>`}
      </tbody></table>
      <h2>Published (top ${data.published.length} by views)</h2>
      <table class="admin"><tbody>
        ${data.published.map((r) => row(r, [["unpublish", "Unpublish"], ["delete", "Delete"]]))}
      </tbody></table>
    </section>`,
  );
}
