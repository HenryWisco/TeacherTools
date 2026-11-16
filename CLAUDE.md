# Supply Closet (repo: teachertools)

A free website where teachers describe what they need and get a print-ready classroom document, plus a library of ready-made resources. Built for the owner by Claude in an earlier cloud session; this file carries that context forward.

## The owner

- Solo founder, not a programmer. Explain in plain language, do the steps yourself where you can (run commands, read errors), and don't hand back technical choices they can't judge. Make the call and say what you chose.
- Goal: a site with "anything a teacher could need" that makes money **without getting in teachers' way**. No paywalls. Ads were their first idea.
- They work in VS Code on a local clone of this repo (folder `TeacherTools`). GitHub `HenryWisco/teachertools` is the master copy; commit and push to `main` when a piece of work is done and tested.
- "Supply Closet" is a placeholder name (`SITE_NAME` in `wrangler.jsonc`).

## Run it

```bash
npm install
npm run db:local   # creates the local database and loads the 27 starter resources
npm run dev        # http://localhost:8787
npm test           # 50 checks
npx tsc --noEmit
```

VS Code tasks exist for these (Run Task → "1. First-time setup", "2. Start the site").

Without `ANTHROPIC_API_KEY` in `.dev.vars` the generator returns a labelled sample document ("Preview mode"). **The site has never been run against the real AI model.** The request path is only tested against a stand-in server (`test/generate.test.ts`). First job once the owner has a key: generate real documents with several tools and options (Spanish, bilingual, A/B versions, UK) and check quality, answer-key accuracy and that 8000 output tokens is enough.

It is not deployed. Deploy steps are in `README.md` (Cloudflare Workers + D1; the owner needs a Cloudflare account and an Anthropic API key).

## How it's built

Cloudflare Worker, Hono, server-rendered HTML, D1 (SQLite), no front-end framework.

| File | What |
|---|---|
| `src/tools.ts` | The 24 tools (one entry each) and the shared options: country, language, versions |
| `src/prompt.ts` | `SYSTEM_PROMPT`, input validation, builds the request text |
| `src/generate.ts` | Calls Claude via `@anthropic-ai/sdk`, streams JSON lines; demo mode. If the finished draft fails the checks, asks once more for a clean copy and swaps it in |
| `src/check.ts` | Checks on a finished document: `tidy` (fixes code can make) and `findProblems` (self-corrections, wrong question count, totals that don't add up) |
| `src/limits.ts` | Daily caps: per browser (cookie), per network, site-wide |
| `src/monetize.ts` | Ads, affiliate links, sponsor, supporter cookie. All off until configured |
| `src/db.ts` | Library queries, sharing, admin |
| `src/markdown.ts` | Safe Markdown rendering (shared documents are untrusted) |
| `src/views.ts` | All pages |
| `public/app.js` | Generator UI; `public/site.js` print/Word/copy + browser-saved documents; `public/my.js` |
| `seed/*.json` | Starter library (format in `seed/FORMAT.md`); `npm run db:local` reloads it |

`public/app.js` repeats the Markdown safety rules from `src/markdown.ts`; change both together.

## Decisions already made (don't reopen without a reason)

- **Model: `claude-haiku-5-5`**, thinking disabled, output capped. Chosen on cost: about a tenth of a cent per document, which ad income can cover. Bigger models cost 20–100× more. If quality is a problem, spend extra on checking answer keys rather than switching the whole site.
- **No accounts, no student-facing features, no student data, no AI images, no paywall.** Being teacher-only with no student data is the site's defence with schools.
- **Ads are non-personalized by default** and never shown on printouts or beside the IEP, report comment, family email or differentiation tools. The only thing supporters buy is no ads.
- **Shared documents are reviewed before they are public** (`/admin`). Search engines penalise unreviewed AI pages.
- **Limits are per browser**, not per network, because a school shares one address.

## Background reading in this repo

- `docs/perspectives/round-2/RESULTS.md`: thirty AI reviewers used the live site with a real key (November 2026) and the to-do list that came out of it. Batch 1 (writing rules, clean-copy second pass, length limits) is done; Batches 2 to 4 are not. The site has now been run against the real model: about 100 documents.
- `docs/research-report.md`: market and monetization research. Caveat: most sources were read only as search summaries; ad-rate figures are weak.
- `docs/perspectives/SYNTHESIS.md`: five AI reviews of 20 user personas, combined and ranked, with what's done.

## What's next, in order

1. Test with a real API key (see above).
2. **Checked answer keys**: math worked out by code, a second-pass check for other quizzes, an honest "please check Q4" mark. All five reviewers ranked this highest of what's left.
3. One-page "For schools and IT" sheet; accessibility pass tested with a real screen reader.
4. Print options (fit to one page, half-sheets, A4 for non-US); kindergarten–grade 2 layouts drawn by code (tracing lines, ten frames).
5. Keep growing the hand-checked library, aimed at gaps (sub packs, K–2, PE, bilingual).
6. Before launch: legal review of `/privacy` and `/terms`, including state student-privacy laws (e.g. California's SOPIPA) and advertising; newsletter unsubscribe handling (export the list to an email service); a bot challenge (Turnstile) if abuse appears.

## Known rough edges

- Starter library content was written and self-checked by AI, not by a teacher; several standards codes were written from memory.
- Supporter ad-removal is an honour-system link (`/support/thanks?code=…`), no payment verification.
- The newsletter only collects addresses; nothing sends email.
