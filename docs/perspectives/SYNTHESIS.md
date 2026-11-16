# What five AI reviewers said, combined

Twenty people who would use the site (`personas.md`) were given to five reviewers with the same brief (`PROMPT.md`). The full reviews are alongside this file.

**Who the reviewers were.** Four different Claude models (Haiku, Sonnet, Opus, Fable) and a fifth run on Opus briefed to be a deliberate skeptic. They are all from one AI family, so treat agreement between them as weaker evidence than agreement between unrelated AIs or real teachers would be. To get outside opinions, paste `PROMPT.md` (with `personas.md` in place of `{{PERSONAS}}`) into ChatGPT, Gemini or any other assistant.

## Where all five agree

| # | Change | Reviewers | Effort | Status |
|---|---|---|---|---|
| 1 | **Daily limit per browser, not per network.** A school shares one network address, so 40 a day was 40 for the whole building. | 5 of 5, ranked 1st or 2nd by all | Small | **Done** |
| 2 | **Answer keys teachers can trust.** Math answers worked out by code, a second-pass check for other quizzes, and an honest "checked / please check Q4" mark. One wrong key loses a teacher for good. | 5 of 5 | Medium | Not built |
| 3 | **Pass a school privacy review.** Non-personalized ads, no ads beside the IEP / report comment / family email tools, a one-page sheet for school IT staff, no third-party trackers. This decides whether about 15 of the 20 can reach the site at school at all. | 5 of 5 | Small–medium | **Partly done** (ads non-personalized by default; no ads on those tools). IT sheet not written. |
| 4 | **Versions in one click.** Version B of a quiz, the same task at three levels, simpler / harder, for English learners, in Spanish or side by side. | 5 of 5 | Small–medium | Not built |
| 5 | **Country and language settings that are remembered.** UK/Australia/Canada Year groups, spelling, metric and A4; Spanish or bilingual output. | 5 of 5 | Small | Not built |
| 6 | **Accessibility pass.** Real headings and table headers on the page and in Word, blanks a screen reader can announce, one announcement when a document is ready, large-print option; tested with a real screen reader. | 5 of 5 | Medium | Not built |

## Where four agree

| # | Change | Reviewers | Effort |
|---|---|---|---|
| 7 | **Paste your own text or template.** The passage to write questions on; the lesson-plan headings your school or university requires. | Haiku, Sonnet, Opus, Fable | Small |
| 8 | **"My documents" kept in the browser.** Recent documents and default settings come back on the next visit, still with no account. The skeptic calls this the missing reason to return. | Haiku, Sonnet, Fable, Skeptic | Small–medium |
| 9 | **Print-first options.** Ink saver, fit to one page, half-sheets, large print, page count shown. | Haiku, Opus, Fable, Skeptic | Small–medium |
| 10 | **Grow the hand-checked library on purpose.** 27 items is a demo. Aim at gaps: sub packs, K–2, multi-grade, PE, bilingual. Limited by your review time. | Sonnet, Opus, Fable, Skeptic | Large, ongoing |
| 11 | **Kindergarten–grade 2 layouts drawn by code.** Tracing lines, ten frames, number lines, cut-apart cards, big type. Not AI images. Without these, "K–12" overpromises. | Opus, Fable, Skeptic (Sonnet: near miss) | Medium–large |

Raised by one or two only: a week planner across subjects and mixed grades (Haiku, Sonnet), a checked list of standards to pick from (Sonnet), a weekly "next week, ready to print" email with proper unsubscribe handling (Skeptic), a phone / no-printer teaching view (Opus, Fable).

## What all five say not to do

- **No accounts, no student-facing features, no student work or data as input.** Being teacher-only with no student data is the site's best defence with schools.
- **No AI-generated images.** Too costly and too unreliable on a cheap model.
- **No paywall or premium tier.**
- **Don't move the whole site to a bigger AI model.** Spend any extra on checking answer keys instead.
- **Don't court Teachers Pay Teachers sellers** or promise they own what they make (AI output generally can't be copyrighted, and TPT plans to ban it).
- **Don't claim "verified" or "standards-aligned"** for things the site hasn't checked.

**People to accept losing:** Brooke (TPT seller) entirely; Tanya (kindergarten) for student-facing sheets unless item 11 is built; Priya's need for diagrams; Marcus's feedback on student writing; Angela's team workspace; Dr. Chen as an *approver* (aim for "not blocked"). Fable argues strongly not to lose Devon (screen reader user): accessibility is achievable and is where a text-only site can beat rivals.

## What they think you are most likely wrong about

1. **"Free, fast, no sign-up" is not what sets the site apart.** In 2026 the big AI companies give teachers better models free. What can set it apart is output a teacher can hand out without checking, in a format that fits their country, grade and template. (All five.)
2. **Your users are on school networks, not home wifi.** That one fact made the old limit, third-party ads and a thin privacy page all worse than they looked. (All five.)
3. **Cost per document is not the real constraint; trust is.** A tenth of a cent per document leaves room to spend two or three times that on checking keys. (Fable, Sonnet, Opus.)
4. **The library is a trust asset before it is a search-traffic asset.** A new site with 27 pages will get little from Google for six to twelve months; word of mouth built on reliable documents is the more realistic start. (Fable, Sonnet, Skeptic.)
5. **Without accounts, nothing brings a teacher back.** The skeptic's verdict: only about 5 of the 20 would return unprompted (the homeschooler, the tutor, the UK teacher, the substitute, the screen-reader user), all people the big free US teacher programmes don't cover.

## Suggested order to build

1. Items 4, 5 and 7 together: one shared "options" block on every tool (versions, country, language, paste-in text). Small, and helps the most people.
2. Item 8, "My documents" in the browser: the reason to come back.
3. Item 2, checked answer keys, starting with math worked out by code.
4. Item 3's school IT sheet and item 6's accessibility pass, before asking any school to use it.
5. Items 9 and 11 (print options, K–2 layouts), then keep growing the library (item 10).
