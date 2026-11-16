import { html, raw } from "hono/html";
import type { Env } from "./env";

// Everything that earns money lives here, and every piece is optional: leave a
// setting blank in wrangler.jsonc and that piece simply doesn't render.
// House rules, enforced in code and CSS:
//   - nothing ever blocks or delays a teacher getting their document
//   - nothing commercial appears on a printed or downloaded page (.no-print)
//   - supporters see no ads at all

export type Money = { env: Env; supporter: boolean };

export type Placement = "home" | "tool" | "library" | "resource";

// Tools where a teacher is writing about a particular child or family: never show ads beside these.
export const NO_AD_TOOLS = new Set(["iep-goals", "report-comments", "parent-email", "accommodations"]);

export const adsEnabled = (m: Money): boolean => !m.supporter && !!m.env.ADSENSE_CLIENT;

export function adScript(m: Money) {
  if (!adsEnabled(m)) return "";
  // Non-personalized unless the owner opts in: no ad profiling of teachers, and easier for schools to allow.
  const npa = m.env.ADS_PERSONALIZED ? "" : html`<script>(adsbygoogle = window.adsbygoogle || []).requestNonPersonalizedAds = 1;</script>`;
  return html`${npa}<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=${m.env.ADSENSE_CLIENT}" crossorigin="anonymous"></script>`;
}

export function adSlot(m: Money, placement: Placement) {
  if (m.supporter) return "";
  if (m.env.ADSENSE_CLIENT) {
    return html`<aside class="ad no-print" aria-label="Advertisement" data-placement="${placement}">
      <span class="ad-label">Advertisement</span>
      <ins class="adsbygoogle" style="display:block" data-ad-client="${m.env.ADSENSE_CLIENT}"
        ${m.env.ADSENSE_SLOT ? raw(`data-ad-slot="${m.env.ADSENSE_SLOT.replace(/[^0-9]/g, "")}"`) : ""}
        data-ad-format="auto" data-full-width-responsive="true"></ins>
      <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
    </aside>`;
  }
  if (m.env.SHOW_AD_PLACEHOLDERS) {
    return html`<aside class="ad ad-placeholder no-print" data-placement="${placement}">
      <span class="ad-label">Advertisement</span>
      <div class="ad-box">Ad space (${placement})</div>
    </aside>`;
  }
  return "";
}

// Affiliate "classroom picks": search links, so they never go stale or out of stock.
const PICKS: Record<string, [string, string][]> = {
  math: [
    ["Fraction tiles & circles", "magnetic fraction tiles classroom"],
    ["Dry-erase boards, class set", "student dry erase boards class set"],
    ["Base ten blocks", "base ten blocks classroom set"],
  ],
  ela: [
    ["Classroom library book bins", "classroom library book bins"],
    ["Sticky notes for annotating", "sticky notes bulk classroom"],
    ["Reading guide strips", "reading guide strips highlight"],
  ],
  science: [
    ["Safety goggles, class set", "student safety goggles class set"],
    ["Graduated cylinders & beakers", "plastic graduated cylinder beaker set classroom"],
    ["Magnifying glasses", "magnifying glass class set kids"],
  ],
  "social-studies": [
    ["Laminated world & US maps", "laminated world map us map classroom"],
    ["Timeline bulletin board set", "history timeline bulletin board set"],
    ["Chart paper", "chart paper pad classroom"],
  ],
  default: [
    ["Flair pens (teacher favorite)", "papermate flair pens"],
    ["Personal laminator", "thermal laminator for teachers"],
    ["Clipboards, class set", "clipboards class set"],
  ],
};

export function classroomPicks(m: Money, subject: string) {
  const tag = m.env.AMAZON_TAG;
  if (!tag && !m.env.SHOW_AD_PLACEHOLDERS) return "";
  const picks = PICKS[subject] ?? PICKS.default;
  const link = (q: string) =>
    `https://www.amazon.com/s?k=${encodeURIComponent(q)}${tag ? `&tag=${encodeURIComponent(tag)}` : ""}`;
  return html`<aside class="picks no-print">
    <h3>Handy for this lesson</h3>
    <ul>
      ${picks.map(([label, q]) => html`<li><a href="${link(q)}" rel="sponsored nofollow noopener" target="_blank">${label}</a></li>`)}
    </ul>
    <p class="fine">As an Amazon Associate this site earns from qualifying purchases, at no cost to you.</p>
  </aside>`;
}

export function sponsorStrip(m: Money) {
  if (!m.env.SPONSOR_TEXT) return "";
  const text = m.env.SPONSOR_TEXT;
  return html`<p class="sponsor no-print">
    <span class="ad-label">Sponsor</span>
    ${m.env.SPONSOR_URL
      ? html`<a href="${m.env.SPONSOR_URL}" rel="sponsored noopener" target="_blank">${text}</a>`
      : text}
  </p>`;
}

export function adsTxt(env: Env): string {
  const pub = env.ADSENSE_CLIENT.replace(/^ca-/, "");
  return pub ? `google.com, ${pub}, DIRECT, f08c47fec0942fa0\n` : "";
}

// Supporters: the Stripe (or other) payment link redirects to /support/thanks?code=...
// which sets a year-long cookie that switches ads off. No accounts, no passwords.
export const SUPPORTER_COOKIE = "sc_supporter";

export async function supporterToken(code: string): Promise<string> {
  const digest = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(`supporter|${code}`));
  return [...new Uint8Array(digest)].map((b) => b.toString(16).padStart(2, "0")).join("").slice(0, 32);
}

export async function isSupporter(env: Env, cookieValue: string | undefined): Promise<boolean> {
  if (!env.SUPPORTER_CODE || !cookieValue) return false;
  return cookieValue === (await supporterToken(env.SUPPORTER_CODE));
}
