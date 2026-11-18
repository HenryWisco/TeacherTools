import { Marked } from "marked";

const esc = (s: string) =>
  s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;");

// Generated and shared documents are untrusted text. Raw HTML is shown as text,
// images are dropped and links are kept only for http(s)/mailto, so a shared
// library page can never run script in another teacher's browser.
// public/app.js applies the same three rules in the browser.
const marked = new Marked({
  gfm: true,
  breaks: false,
  renderer: {
    html(token) {
      return esc(token.text);
    },
    image(token) {
      return esc(token.text || "");
    },
    link(token) {
      const text = this.parser.parseInline(token.tokens);
      const href = (token.href || "").trim();
      if (!/^(https?:|mailto:)/i.test(href)) return text;
      return `<a href="${esc(href)}" rel="nofollow noopener ugc" target="_blank">${text}</a>`;
    },
  },
});

// Blanks such as "3/4 = ____/____" would otherwise be read as bold/italic markers and vanish.
// A line made only of underscores is left alone: it becomes a full-width writing line.
export function protectBlanks(md: string): string {
  return md
    .split("\n")
    .map((line) => (/^\s*_{3,}\s*$/.test(line) ? line : line.replace(/_{2,}/g, (run) => run.replace(/_/g, "\\_"))))
    .join("\n");
}

// Plain-text math made easier to read: x^2 becomes a real exponent, sqrt(16) a root
// sign, <= and >= proper symbols. Display only; the stored text is unchanged.
// public/app.js has the same function.
export function prettyMath(html: string): string {
  let inCode = 0;
  return html
    .split(/(<[^>]+>)/)
    .map((piece) => {
      if (piece.startsWith("<")) {
        if (/^<(?:code|pre)\b/i.test(piece)) inCode++;
        else if (/^<\/(?:code|pre)>/i.test(piece)) inCode = Math.max(0, inCode - 1);
        return piece;
      }
      if (inCode) return piece;
      return piece
        .replace(/sqrt\(((?:[^()]|\([^()]*\))*)\)/g, (_, inner: string) => (/^[\w.]+$/.test(inner) ? `√${inner}` : `√(${inner})`))
        .replace(/([\w)\]])\^\(([^()]{1,30})\)/g, "$1<sup>$2</sup>")
        .replace(/([\w)\]])\^(-?(?:\d+(?:\.\d+)?|[a-zA-Z]))(?![\w^])/g, "$1<sup>$2</sup>")
        .replace(/(?<=[\w)>]) \* (?=[\w(])/g, " · ")
        .replace(/&lt;=/g, "≤")
        .replace(/&gt;=/g, "≥")
        .replace(/!=/g, "≠");
    })
    .join("");
}

const NATIVE_NAMES: Record<string, string> = {
  Spanish: "Español", French: "Français", Portuguese: "Português", "Chinese (Simplified)": "中文",
  Vietnamese: "Tiếng Việt", Arabic: "العربية", Tagalog: "Tagalog", "Haitian Creole": "Kreyòl ayisyen",
};

// A two-language document arrives as "## English" then "## Spanish" (see prompt.ts).
// This lays the two out as columns, matching them piece by piece: paragraph beside
// paragraph, question 3 beside question 3. If the two sides do not match up, each
// section (or the whole page) becomes one row instead, so nothing is ever lost.
// public/app.js has the same function.
type Tok = { type: string; raw: string; depth?: number; ordered?: boolean; start?: number | ""; items?: Tok[] };

export function pairLanguages(md: string, render: (md: string) => string): string | null {
  const names = Object.keys(NATIVE_NAMES).map((n) => n.replace(/[()]/g, "\\$&")).join("|");
  const m = md.match(new RegExp(`(^|\\n)## English[ \\t]*\\n([\\s\\S]*?)\\n## (${names})[ \\t]*\\n([\\s\\S]*?)(?=\\n## |$)`));
  if (!m || m.index === undefined) return null;
  const before = md.slice(0, m.index);
  const after = md.slice(m.index + m[0].length);
  const lang = m[3];

  // Pieces of one side: every block on its own, and every numbered question on its own.
  const pieces = (src: string): { html: string; heading: boolean }[] => {
    const tokens = marked.lexer(protectBlanks(src)) as unknown as Tok[] & { links: unknown };
    const one = (t: Tok) => marked.parser(Object.assign([t], { links: tokens.links }) as never) as string;
    const out: { html: string; heading: boolean }[] = [];
    for (const t of tokens) {
      if (t.type === "space") continue;
      if (t.type === "list" && t.items && t.items.length > 1) {
        const first = typeof t.start === "number" ? t.start : 1;
        t.items.forEach((item, i) => out.push({ html: one({ ...t, start: first + i, items: [item], raw: item.raw }), heading: false }));
      } else out.push({ html: one(t), heading: t.type === "heading" });
    }
    return out;
  };
  const left = pieces(m[2]);
  const right = pieces(m[4]);
  // A table is too wide for half a page, so a pair of tables is stacked instead.
  const row = (a: string, b: string) =>
    /^\s*<table/.test(a) && /^\s*<table/.test(b)
      ? `<tr><td colspan="2">${a}</td></tr><tr><td colspan="2" dir="auto">${b}</td></tr>`
      : `<tr><td>${a}</td><td dir="auto">${b}</td></tr>`;
  const join = (list: { html: string }[]) => list.map((p) => p.html).join("");

  let rows = "";
  if (left.length === right.length) {
    rows = left.map((p, i) => row(p.html, right[i].html)).join("");
  } else {
    // Cut each side at its headings and match section to section.
    const sections = (list: { html: string; heading: boolean }[]) => {
      const out: { html: string; heading: boolean }[][] = [[]];
      for (const p of list) {
        if (p.heading && out[out.length - 1].length) out.push([]);
        out[out.length - 1].push(p);
      }
      return out;
    };
    const ls = sections(left);
    const rs = sections(right);
    if (ls.length === rs.length) {
      rows = ls
        .map((sec, i) => (sec.length === rs[i].length ? sec.map((p, k) => row(p.html, rs[i][k].html)).join("") : row(join(sec), join(rs[i]))))
        .join("");
    } else rows = row(join(left), join(right));
  }
  const table = `<table class="bilingual"><thead><tr><th>English</th><th>${NATIVE_NAMES[lang]}</th></tr></thead><tbody>${rows}</tbody></table>`;
  return render(before) + table + (after.trim() ? render(after) : "");
}

function renderPlain(md: string): string {
  if (!md.trim()) return "";
  const html = marked.parse(protectBlanks(md), { async: false }) as string;
  // Mark the answer key so print CSS can start it on a new page.
  return html
    .replace(/<h2>(\s*Answer Key[^<]*)<\/h2>/i, '<h2 class="answer-key">$1</h2>')
    // Each version or level starts its own printed page.
    .replace(/<h2>(\s*(?:Version [A-C]|Level [1-3])\b[^<]*)<\/h2>/g, '<h2 class="page-start">$1</h2>');
}

export function renderMarkdown(md: string): string {
  return prettyMath(pairLanguages(md, renderPlain) ?? renderPlain(md));
}

export function plainSummary(md: string, max = 160): string {
  const text = md
    .replace(/\*\*Name:\*\*.*$/m, "")
    .replace(/^#+\s.*$/gm, "")
    .replace(/[*_`>#|]/g, "")
    .replace(/_{3,}/g, "")
    .replace(/\s+/g, " ")
    .trim();
  return text.length > max ? text.slice(0, max - 1).replace(/\s+\S*$/, "") + "…" : text;
}

export { esc };
