import { html, raw } from "hono/html";
import type { HtmlEscapedString } from "hono/utils/html";
import { intVar, type Env } from "./env";
import type { LibraryFilter, Resource } from "./db";
import { NO_AD_TOOLS, adScript, adSlot, classroomPicks, sponsorStrip, type Money } from "./monetize";
import { renderMarkdown } from "./markdown";
import { BANDS, COMBINED_GRADES, GRADES, MAX_REFERENCE, OTHER_LANGUAGES, sideBySide, REGIONS, SUBJECTS, TOOLS, VERSIONS, allowsReference, allowsVersions, gradeLabel, typeLabel, TOOL_BY_ID, type Field, type Tool } from "./tools";

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

// Who runs the site and how to reach them. Both come from wrangler.jsonc (OWNER_NAME,
// CONTACT_EMAIL) and appear on every page; reviewers would not approve a site with neither.
const ownerName = (env: Env) => (env.OWNER_NAME ?? "").trim();
const emailLink = (env: Env, subject = "") =>
  env.CONTACT_EMAIL
    ? html`<a href="mailto:${env.CONTACT_EMAIL}${subject ? `?subject=${encodeURIComponent(subject)}` : ""}">${env.CONTACT_EMAIL}</a>`
    : "";
// The date the privacy and terms wording last changed. Update it when you edit either page.
const POLICY_DATE = "18 November 2026";
// One account of how the site is paid for, used wherever the subject comes up.
const FUNDING = "a small number of ads, links to classroom supplies that may earn a commission, an occasional named sponsor, and optional supporters";

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
      <label for="nl-email"><strong>One email a week.</strong> The best new free resources.</label>
      <div class="row">
        <input id="nl-email" name="email" type="email" required placeholder="you@school.org" autocomplete="email">
        <button class="btn" type="submit">Subscribe</button>
      </div>
      <p class="fine" data-newsletter-msg>Unsubscribe any time. We never sell your address.</p>
    </form>
    <nav class="footer-links" aria-label="Footer">
      <a href="/about">About</a>
      <a href="/schools">For schools</a>
      <a href="/privacy">Privacy</a>
      <a href="/terms">Terms</a>
      <a href="/support">Support us</a>
    </nav>
  </div>
  <p class="wrap fine">Made for educators (18+). Please don't enter student names or personal details. Always review materials before using them with your class.</p>
  ${ownerName(env) || env.CONTACT_EMAIL
    ? html`<p class="wrap fine">${ownerName(env) ? `${env.SITE_NAME} is run by ${ownerName(env)}. ` : ""}${env.CONTACT_EMAIL ? html`Contact: ${emailLink(env)}` : ""}</p>`
    : ""}
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
            <optgroup label="Combined classes">
              ${COMBINED_GRADES.map((g) => html`<option value="${g}">${gradeLabel(g)}</option>`)}
            </optgroup>
          </select>
          <p class="fine" data-k-note hidden>Kindergarten pages are words, numbers and simple shapes for now: no pictures, tracing lines or ten frames. Where a picture is needed you will see a note such as [Picture: 4 balls] to draw or paste in.</p></div>`
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
              <option>English</option>
              ${Object.keys(OTHER_LANGUAGES).map((l) => html`<option>${l}</option>`)}
              <optgroup label="Two languages, in two columns">
                ${Object.keys(OTHER_LANGUAGES).map((l) => html`<option>${sideBySide(l)}</option>`)}
              </optgroup>
            </select></div>`}
      ${allowsReference(tool)
        ? html`<div class="field wide"><label for="${idp}-reference">Your own text or template <span class="opt">(optional)</span></label>
            <textarea id="${idp}-reference" name="reference" rows="4" maxlength="${MAX_REFERENCE}" placeholder="Paste a passage or notes to base this on, or the headings your school's template requires."></textarea>
            <p class="fine">Only paste text you have the right to use, and leave out student names.</p></div>`
        : ""}
    </div>
  </details>`;
}

type Chip = [string, string];
const SHORTER: Chip = ["Shorter", "Make it shorter, to fit on one page if possible."];
const SPANISH: Chip = ["In Spanish", "Rewrite the whole document in natural classroom Spanish."];
const LEARNERS: Chip = ["For English learners", "Adapt it for English learners: simpler sentences, key vocabulary defined, sentence frames."];
const EASIER: Chip = ["Easier", "Make it easier: simpler wording, smaller numbers, more scaffolding."];
const HARDER: Chip = ["Harder", "Make it more challenging, with deeper reasoning rather than just more questions."];
const WARMER: Chip = ["Warmer", "Make the tone warmer and more personal, without making it longer."];
const FORMAL: Chip = ["More formal", "Make the tone more formal and professional."];

// One-tap revisions that make sense for this kind of document. A family email is
// never offered "Harder" or "More questions".
export function chipsFor(tool: Tool): Chip[] {
  switch (tool.id) {
    case "parent-email":
      return [SHORTER, WARMER, FORMAL, ["Firmer", "Make the request and the deadline clearer and firmer, while staying respectful."], SPANISH, ["Add Spanish below", "Keep the English message and add the full message in Spanish below it."]];
    case "report-comments":
      return [SHORTER, WARMER, FORMAL, ["More specific next steps", "Make the next steps more specific and say how the family can help."], SPANISH];
    case "iep-goals":
      return [["More measurable", "Make every goal more measurable: a clear condition, behavior, criterion and how it is measured."], ["Simpler wording", "Rewrite in plainer language a family can follow, keeping the goals measurable."], ["Smaller steps", "Break each goal into smaller short-term objectives."], ["Progress monitoring", "Add specific ways to collect data and how often."]];
    case "accommodations":
      return [["More ideas", "Add more ideas in each group, all specific to this lesson."], ["Most practical only", "Cut it down to the three most practical ideas in each group."], LEARNERS, ["Low prep", "Keep only ideas that need no extra materials or preparation."]];
  }
  if (tool.audience === "teacher") {
    return [SHORTER, ["More detail", "Add more detail to each step: what the teacher says and does, and what students do."], EASIER, HARDER, LEARNERS, SPANISH];
  }
  const chips: Chip[] = [SHORTER, EASIER, HARDER];
  if (allowsVersions(tool)) chips.push(["Version B", "Make a Version B: same skills and difficulty, different numbers, examples and question order."]);
  chips.push(["Sentence starters", "Add sentence starters and a word bank to support students who need them."], LEARNERS, SPANISH);
  if (!["rubric", "choice-board", "project", "lab-activity"].includes(tool.id)) chips.push(["More questions", "Add five more questions of the same kind, and add them to the answer key."]);
  return chips;
}

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
        <span class="fine" data-status role="status" aria-live="polite">Free. No sign-up. Takes about 20 seconds.</span>
      </div>
    </form>

    <div class="result" data-result hidden>
      <div class="toolbar no-print" role="toolbar" aria-label="Document actions">
        <button class="btn" type="button" data-act="print">🖨 Print / save PDF</button>
        <button class="btn" type="button" data-act="word">⬇ Word</button>
        <button class="btn" type="button" data-act="copy">📋 Copy for Google Docs</button>
        <button class="btn" type="button" data-act="edit">✏ Edit</button>
        <button class="btn" type="button" data-act="large" aria-pressed="false">🔎 Large print</button>
        <button class="btn" type="button" data-act="compact" aria-pressed="false" title="Smaller type and tighter spacing when printed, to use fewer sheets">🌿 Save paper</button>
        <button class="btn" type="button" data-act="ailabel" aria-pressed="false" title="Adds the line 'Drafted with AI assistance.' at the foot of the student pages">🏷 AI label</button>
        ${tool.libraryType ? html`<button class="btn" type="button" data-act="share">🔗 Share</button>` : ""}
      </div>
      <p class="notice no-print" data-notice hidden></p>
      <textarea class="editor no-print" data-editor hidden aria-label="Edit the document text" spellcheck="true"></textarea>
      <article class="doc paper" data-doc aria-live="off"></article>
      <form class="refine no-print" data-refine>
        <label for="${idp}-refine">Want it different?</label>
        <div class="chips wrap-chips" data-chips>
          ${chipsFor(tool).map(([label, text]) => html`<button class="chip" type="button" data-chip="${text}">${label}</button>`)}
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
      <div><h3>Free means free</h3><p>No trial that runs out, no "upgrade to download". The site is paid for by ${FUNDING}. <a href="/about">How it stays free</a></p></div>
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
            <p>Make exactly what you need instead. It takes about 20 seconds.</p>
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
        <p class="fine no-print">${r.source === "user" ? "Shared by a teacher and read by a person before listing." : "Written with AI, with every answer worked a second time in a separate check."} Please still read it before use.${m.env.CONTACT_EMAIL ? html` Found a mistake? <a href="mailto:${m.env.CONTACT_EMAIL}?subject=${encodeURIComponent(`Problem with: ${r.title}`)}">Report a problem</a>.` : ""}</p>
        <p class="notice no-print" data-notice hidden></p>
        <article class="doc paper" data-doc><h1>${r.title}</h1>${raw(renderMarkdown(r.body))}</article>
      </div>
      <aside class="resource-side no-print">
        ${adSlot(m, "resource")}
        ${classroomPicks(m, r.subject, r.grade)}
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
      <p>${env.SITE_NAME} has no paywall and never will. Each document costs a fraction of a cent to make. That is paid for by ${FUNDING}. Teachers already spend hundreds of dollars a year of their own money on their classrooms, so the tools shouldn't cost more.</p>
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
        <li>Tell us what's missing${env.CONTACT_EMAIL ? html`: ${emailLink(env)}` : ""}.</li>
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
      <p>${env.SITE_NAME} is a free site for teachers. Describe what you need, and it writes a print-ready lesson plan, worksheet, quiz, rubric or message home in a few seconds. There's also a library of ready-made resources.</p>
      ${ownerName(env) ? html`<h2>Who runs it</h2><p>${env.SITE_NAME} is run by ${ownerName(env)}. It is independent: no school district, publisher or AI company owns it.${env.CONTACT_EMAIL ? html` You can reach us at ${emailLink(env)}.` : ""}</p>` : ""}
      <h2>How it works</h2>
      <p>Documents are written by an AI model following instructions written for classroom use: correct answer keys, grade-appropriate language, and a layout that prints cleanly. AI can still make mistakes, so <strong>please read anything before you hand it to students</strong>, the same way you would a resource from any other site.</p>
      ${LIBRARY_REVIEW}
      <h2>How it stays free</h2>
      <p>The site is paid for by ${FUNDING}. None of these ever stand between you and your document, and none appear on anything you print. The only thing supporters get is a site with no ads.</p>
      <h2>What we don't do</h2>
      <ul>
        <li>No accounts, and no record of who made what.</li>
        <li>No student data. The site is for adults who teach; please keep student names and details out of your requests.</li>
        <li>No selling email addresses.</li>
      </ul>
      <p>Deciding for a school or district? See <a href="/schools">For schools and districts</a>.</p>
      ${env.CONTACT_EMAIL ? html`<p>Questions or ideas: ${emailLink(env)}</p>` : ""}
    </section>`,
  );
}

// What the AI provider does with a request. Checked against Anthropic's published
// pages in November 2026 (linked below); re-check them if you change provider or plan.
const AI_PROVIDER = html`<p>To write a document, the text you typed is sent to Anthropic, the company whose AI model (Claude) the site uses. No name, email address or account goes with it, because the site has none to send. Anthropic's published policy for business use of its service says:</p>
      <ul>
        <li>it does not use what is sent, or the documents it writes back, to train its AI models unless the customer chooses to allow that. We have not allowed it.</li>
        <li>it deletes requests and replies from its systems within 30 days.</li>
        <li>if its automated checks flag a request as breaking its usage rules, it may keep that request for up to 2 years, or longer if the law requires.</li>
      </ul>
      <p class="fine">Anthropic's own wording: <a href="https://privacy.claude.com/en/articles/7996868-is-my-data-used-for-model-training" rel="noopener">training</a> and <a href="https://privacy.claude.com/en/articles/7996866-how-long-do-you-store-my-organization-s-data" rel="noopener">how long data is kept</a>.</p>`;

const LIBRARY_REVIEW = html`<h2>Who checks the library</h2>
      <p>The starter resources in the library were written with AI. Every answer in them was then worked out again in a separate AI check, and mistakes found were corrected. Documents that teachers share are read by a person before they are listed. None of this is the same as review by a teacher of that subject, so mistakes can remain. Each library page has a link to report one.</p>`;

// A one-page summary for the people who decide whether staff may use the site.
export function schoolsPage(m: Money) {
  const { env } = m;
  const perDevice = intVar(env.DAILY_LIMIT_PER_DEVICE, 40);
  return layout(
    { m, path: "/schools", title: "For schools and districts", description: `What ${env.SITE_NAME} collects, who it sends it to and how it is paid for: a one-page summary for school and district staff.` },
    html`<section class="wrap section narrow prose">
      <h1>For schools and districts</h1>
      <p class="lede">A one-page summary for principals, IT staff and privacy officers. Print it if that helps.</p>
      <h2>What it is</h2>
      <p>${env.SITE_NAME} is a free website where a teacher describes a classroom document and gets a print-ready draft. ${ownerName(env) ? `It is run by ${ownerName(env)}.` : ""} It is used by staff only. Students never use it and there is nothing for them to log in to.</p>
      <h2>What it collects</h2>
      <ul>
        <li><strong>No accounts.</strong> No names, passwords, rosters or school email addresses. Nothing connects to your student information system or to Google or Microsoft sign-in.</li>
        <li><strong>No student data.</strong> Every form asks teachers not to enter student names. On the four tools where a teacher writes about one child or family, the site also removes what looks like a student's name, ID number or date of birth before the request is sent on. This catches common names and is not a guarantee.</li>
        <li><strong>Requests are not kept by us.</strong> What a teacher types is used to write the document and is not stored on our servers afterwards. Finished documents are saved in the teacher's own browser.</li>
        <li><strong>Two cookies.</strong> A random number used to count daily use (${perDevice} documents a day per browser), and one that switches ads off for supporters. We do not store IP addresses.</li>
        <li><strong>Optional:</strong> an email address if a teacher subscribes to the weekly email, and any document a teacher chooses to share to the public library.</li>
      </ul>
      <h2>Where requests go</h2>
      ${AI_PROVIDER}
      <p>The site itself runs on Cloudflare's network.</p>
      <h2>Accuracy</h2>
      <p>Documents are drafts written by AI. Each answer key is worked a second time before the teacher sees it, and doubtful answers are marked, but mistakes still get through. Every answer key page says so, and the site tells teachers to read a document before using it.</p>
      <h2>Advertising and money</h2>
      <p>The site is paid for by ${FUNDING}. Ads are not personalized: they are not chosen from a profile of the reader. No ads appear on printed or downloaded pages, or beside the tools for family messages, report comments, IEP goal ideas and differentiation. There is no paid tier and nothing is sold to schools.</p>
      <h2>What we cannot offer yet</h2>
      <p>We do not currently sign district data privacy agreements, and the site has not had an independent security or accessibility audit. If your district needs either before staff may use it, please tell us.</p>
      <h2>Contact</h2>
      <p>${env.CONTACT_EMAIL ? html`Questions, concerns or removal requests: ${emailLink(env)}.` : "Contact details will be added here before the site opens to the public."} Full details are on the <a href="/privacy">privacy</a> and <a href="/terms">terms</a> pages.</p>
      <p class="fine">Last updated ${POLICY_DATE}.</p>
    </section>`,
  );
}

export function privacyPage(m: Money) {
  const { env } = m;
  const contact = env.CONTACT_EMAIL ? emailLink(env) : ownerName(env) || "us";
  return layout(
    { m, path: "/privacy", title: "Privacy", description: `How ${env.SITE_NAME} handles your information.` },
    html`<section class="wrap section narrow prose">
      <h1>Privacy</h1>
      <p><strong>Short version:</strong> there are no accounts, we don't keep what you type, and the site is not for children.</p>
      ${ownerName(env) ? html`<h2>Who we are</h2><p>${env.SITE_NAME} is run by ${ownerName(env)}, who is responsible for the information described on this page.${env.CONTACT_EMAIL ? html` Contact: ${emailLink(env)}.` : ""}</p>` : ""}
      <h2>Who the site is for</h2>
      <p>${env.SITE_NAME} is for teachers and other adults (18 and over) who work in education. It is not directed to children, and students should not use it. Do not enter any student's name or other personal information.</p>
      <h2>What we collect</h2>
      <ul>
        <li><strong>What you type into a tool</strong> is sent to our AI provider (Anthropic) to write your document and is not stored by us after the document is returned. See "What the AI provider keeps" below.</li>
        <li><strong>Student details you type by mistake.</strong> On the tools for family messages, report comments, IEP goal ideas and differentiation, the site removes what looks like a student's name, ID number or date of birth before your request is sent to the AI provider. It catches common names only, so please still leave them out.</li>
        <li><strong>Documents you make</strong> are kept in your own browser's storage so you can find them again under "My documents". They stay on your device; we have no copy. Clearing your browser data removes them.</li>
        <li><strong>Documents you choose to share</strong> are stored and, after review, published in the library. Don't share anything containing personal information. Ask ${contact} to remove a shared document at any time.</li>
        <li><strong>Your email address</strong>, only if you subscribe to the weekly email. Unsubscribe any time; we never sell or rent the list.</li>
        <li><strong>A daily usage counter</strong> tied to a random number kept in a cookie on your device and to a scrambled, one-day version of your network address. It is used only to stop automated abuse and is not linked to who you are or what you typed. We do not store your actual IP address.</li>
      </ul>
      <h2>What the AI provider keeps</h2>
      ${AI_PROVIDER}
      <h2>Cookies and advertising</h2>
      <p>The site itself sets two cookies: the random usage-counter number above, and one that switches ads off if you become a supporter. Ads are shown without personalization: they are not chosen using a profile of you. Our advertising partners, including Google, may still use cookies to deliver and measure ads. Ads never appear on printed or downloaded documents, and never beside the tools for family messages, report card comments, IEP goals or differentiation.</p>
      <p>Some links to products are affiliate links: if you buy something, the site may earn a small commission at no cost to you.</p>
      <h2>Contact</h2>
      <p>Questions or removal requests: ${env.CONTACT_EMAIL ? contact : "contact details will be added here before the site opens to the public"}.</p>
      <p class="fine">Last updated ${POLICY_DATE}.</p>
    </section>`,
  );
}

export function termsPage(m: Money) {
  const { env } = m;
  return layout(
    { m, path: "/terms", title: "Terms of use", description: `Terms for using ${env.SITE_NAME}.` },
    html`<section class="wrap section narrow prose">
      <h1>Terms of use</h1>
      <p>These terms are between you and ${ownerName(env) || `the operator of ${env.SITE_NAME}`}. By using the site you agree to them.</p>
      <ul>
        <li><strong>For educators.</strong> You must be 18 or over to use this site.</li>
        <li><strong>Your documents are yours to use.</strong> Print, edit, copy and share anything you make here with your students and colleagues, free of charge.</li>
        <li><strong>Check before you teach.</strong> Documents are written by AI and may contain errors. You are responsible for reviewing materials before classroom use. They are provided as is, without warranty.</li>
        <li><strong>No personal information.</strong> Don't enter student names, records or other personal details.</li>
        <li><strong>Sharing.</strong> When you share a document to the library you confirm it contains no personal information and nothing you don't have the right to share, and you allow other teachers to use and adapt it freely. We may decline or remove any shared document.</li>
        <li><strong>Fair use.</strong> Don't use automated tools to make requests in bulk. To keep the site free for everyone, each browser can make ${intVar(env.DAILY_LIMIT_PER_DEVICE, 40)} documents a day; the count resets at midnight UTC.</li>
        <li><strong>Not professional advice.</strong> Drafts such as IEP goal ideas are starting points for qualified staff, not legal or clinical advice.</li>
        <li><strong>Problems and removals.</strong> ${env.CONTACT_EMAIL ? html`To report a mistake, ask for a shared document to be removed, or raise a copyright concern, write to ${emailLink(env)}.` : "Contact details for reporting a mistake or asking for a shared document to be removed will be added here before the site opens to the public."}</li>
      </ul>
      <p class="fine">Effective ${POLICY_DATE}.</p>
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
      ${ownerName(m.env) && m.env.CONTACT_EMAIL
        ? ""
        : html`<p class="notice bad"><strong>Before launch:</strong> set ${[ownerName(m.env) ? "" : "OWNER_NAME", m.env.CONTACT_EMAIL ? "" : "CONTACT_EMAIL"].filter(Boolean).join(" and ")} in wrangler.jsonc. Until then the site does not say who runs it or how to reach them.</p>`}
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
