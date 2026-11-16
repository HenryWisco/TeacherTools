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

export function renderMarkdown(md: string): string {
  const html = marked.parse(protectBlanks(md), { async: false }) as string;
  // Mark the answer key so print CSS can start it on a new page.
  return html.replace(/<h2>(\s*Answer Key\s*)<\/h2>/i, '<h2 class="answer-key">$1</h2>');
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
