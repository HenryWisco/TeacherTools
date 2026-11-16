# Supply Closet

A free website where teachers describe what they need and get a print-ready lesson plan, worksheet, quiz, rubric, family email and more in seconds, plus a library of ready-made resources. No sign-up, no paywall.

"Supply Closet" is a placeholder name. Change `SITE_NAME` in `wrangler.jsonc` to rename the whole site.

## What's in it

| Part | What it does |
|---|---|
| **Generator** | 24 tools (lesson plan, worksheet, quiz, rubric, reading passage, text leveler, sub plan, family email, report card comments, IEP goal ideas…) plus a free-form "ask for anything" box on the home page. Output appears as it is written. |
| **Use it anywhere** | Print / save as PDF (answer key on its own page), download for Word, copy into Google Docs with formatting, edit in place, or ask for a revision ("make it shorter"). |
| **Library** | 27 hand-checked starter resources for grades K–12, browsable by grade, subject and type, each on its own search-friendly page with a "make my own version" button. |
| **Sharing** | Teachers can share what they make. It gets a private link at once and only appears in the public library (and to search engines) after you approve it at `/admin`. |
| **Money** | Ad slots, affiliate "classroom picks", a newsletter list, a sponsor line and an ad-free supporter option. All off until you fill in a setting. None of them ever blocks a teacher or prints on a document. |
| **Protection** | Daily per-network and site-wide caps so nobody can run up your AI bill, a hard length limit per document, and no storage of IP addresses or of what teachers type. |

## How it makes money (and why this way)

The research behind these choices is in `docs/research-report.md`. In short:

- One document costs roughly **a tenth of a cent** on the model this site uses (`claude-haiku-5-5`). A quiet ad per page can cover that; a bigger model would cost 20–100× more and ads could not.
- The **library** is what brings visitors from Google and carries most ad views. The generator feeds the library.
- Individual teachers resent paywalls, so the only thing supporters buy is **no ads**.

| Setting in `wrangler.jsonc` | Turns on | When to do it |
|---|---|---|
| `ADSENSE_CLIENT` (e.g. `ca-pub-1234…`), optional `ADSENSE_SLOT` | Ads on home, tool, library and resource pages, and `/ads.txt` | As soon as Google AdSense approves the site |
| `AMAZON_TAG` (e.g. `yourtag-20`) | "Handy for this lesson" supply links on library pages, with the required disclosure | After joining Amazon Associates |
| `SUPPORT_URL` + secret `SUPPORTER_CODE` | "Become a supporter" button; supporters see no ads | When you have a payment link (see below) |
| `SPONSOR_TEXT`, `SPONSOR_URL` | One sponsor line in the footer | When a sponsor pays for it |
| Newsletter | Always on. Addresses are in `/admin` → "Download list" | Sell one sponsor slot per issue once the list is a few thousand |

**Supporter set-up:** create a payment link (Stripe Payment Links, Ko-fi, etc.) for, say, $30 a year. Set its "after payment" redirect to `https://YOUR-SITE/support/thanks?code=YOUR-CODE`, put the link in `SUPPORT_URL`, and save the same code with `npx wrangler secret put SUPPORTER_CODE`. Visiting that link switches ads off on that device for a year. It is an honour system, which is fine at this price.

When traffic passes about 1,000 visits a month, apply to a premium ad network (Journey by Mediavine, later Raptive); they pay several times what AdSense does. They replace the AdSense snippet in `src/monetize.ts`.

## Put it online (about 20 minutes, around $0–5 a month)

You need a free [Cloudflare](https://dash.cloudflare.com/sign-up) account, an [Anthropic API key](https://console.anthropic.com/) and [Node.js](https://nodejs.org) on your computer.

```bash
npm install
```

```bash
npx wrangler login
```

```bash
npx wrangler d1 create supply-closet
```

Copy the `database_id` it prints into `wrangler.jsonc` (replacing `REPLACE_WITH_YOUR_D1_DATABASE_ID`). Then create the tables and load the starter library:

```bash
npm run db:remote
```

Save your secrets (each command asks you to paste the value):

```bash
npx wrangler secret put ANTHROPIC_API_KEY
```

```bash
npx wrangler secret put ADMIN_TOKEN
```

```bash
npx wrangler secret put IP_SALT
```

`ADMIN_TOKEN` is your password for the review page; make it long (12+ characters). `IP_SALT` is any random string.

```bash
npm run deploy
```

The site is now live at the `workers.dev` address it prints. Add your own domain in the Cloudflare dashboard (Workers → your worker → Settings → Domains), then set `SITE_URL` in `wrangler.jsonc` to it and deploy again.

**Before you tell anyone:**

1. In the Anthropic console, set a **monthly spend limit**. The site caps itself at `GLOBAL_DAILY_LIMIT` documents a day (5,000 ≈ $5), but a hard limit at the provider is the real safety net.
2. Fill in `CONTACT_EMAIL`, and have someone qualified read `/privacy` and `/terms`. In particular ask about state student-privacy laws (such as California's SOPIPA) and advertising; the research could not settle that.
3. Open `/admin?token=YOUR_ADMIN_TOKEN` and bookmark it.

## Day to day

- **Review shared documents** at `/admin`. Read each before approving: approved pages are public and carry your name. Search engines penalise sites that publish piles of unreviewed AI pages, so quality here is what protects your traffic.
- **Grow the library.** Add a JSON file to `seed/` (format in `seed/FORMAT.md`) and run `npm run db:remote`, or make documents on the site, share them and approve them.
- **Watch usage** on the admin page (documents per day) and in the Anthropic console (cost).

## Change things

| To change | Edit |
|---|---|
| Name, tagline, limits, model, money settings | `wrangler.jsonc` |
| Add or adjust a tool | `src/tools.ts` (one entry per tool) |
| The writing rules every document follows | `SYSTEM_PROMPT` in `src/prompt.ts` |
| Ads, affiliate picks, sponsor, supporter logic | `src/monetize.ts` |
| Page text and layout | `src/views.ts`, `public/style.css` |

The model is set by `MODEL`. `claude-haiku-5-5` is the one the ad-funded sums work for. `claude-sonnet-5-5` writes better documents at about 20× the cost; if you try it, lower `GLOBAL_DAILY_LIMIT` first.

## Run it on your own computer

```bash
npm run db:local
```

```bash
npm run dev
```

Open http://localhost:8787. Without an API key the generator returns a labelled sample so you can try every button. To use the real model locally, create a file named `.dev.vars` containing `ANTHROPIC_API_KEY=...` and `ADMIN_TOKEN=...`. Add `SHOW_AD_PLACEHOLDERS=1` there to see where ads will sit.

```bash
npm test
```

runs the 28 automated checks (safety of shared documents, request building, limits, money switches, and the AI request path against a stand-in server).

## Not built yet

- Bot challenge (Cloudflare Turnstile) on the generator. The daily caps limit the damage; add this if you see abuse.
- Unsubscribe link handling and sending for the newsletter. Export the list into an email service (Buttondown, Beehiiv, MailerLite), which handles both.
- Automatic supporter verification (currently the honour-system link above).
- Standards lookup. Teachers type a standard code; the site does not validate it.
