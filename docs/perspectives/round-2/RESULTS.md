# Round 2: thirty reviewers used the live site

Run on 16 November 2026 against the local site with a real AI key. Each reviewer was an AI playing one person (14 teachers, 6 administrators, 5 school board members, 5 student teachers). Each browsed the site as a visitor, generated two or three real documents in their own subject, checked them, and wrote a report.

- The 30 full reports are in this folder (`01-okafor.md` … `30-chloe.md`).
- The 84 documents they generated are in `samples/`, named `reviewer-number-tool.md`, so every finding below can be looked up.
- Numbers in brackets are reviewer numbers.

**Caveats.** These are AIs playing roles, not real educators, and all are Claude models (10 each on Fable, Opus and Sonnet). The reviewers could read page text and generated documents but could not see layout, colours, phones, or what the Print and Word buttons produce. Findings are the reviewers' claims; a few were re-checked against the samples (noted below), most were not.

## The headline

| Verdict | Count | Who |
|---|---|---|
| Would use or approve outright | 0 | |
| Would use or approve **with conditions** | 26 | |
| Undecided | 1 | Kindergarten teacher [05] |
| Would not use | 3 | Chemistry [02], middle school math [03], AP English [04] |

263 problems were reported: 104 factual errors in documents, 34 cases of the site not doing what was asked, 53 broken or confusing things, 39 policy or legal gaps, 23 missing features, 10 opinions.

Two things decide almost every verdict:

1. **Documents contain mistakes a tired teacher would miss**, and in many cases the AI's own second thoughts are printed on the page ("Hmm, correction…", "Wait, recounting…"). All three "would not use" verdicts come from this.
2. **The privacy and terms pages are visibly unfinished**, with no named owner and no way to contact anyone. Every administrator and most board members made this a condition.

What reviewers liked, consistently: speed (5 to 20 seconds), no sign-up, the pasted-template feature, the honest "AI can make mistakes" wording, ads kept off sensitive tools, natural Spanish, and the hand-checked library. Every library answer key a reviewer worked through was correct.

## To-do list, in suggested order

Effort: S = under an hour, M = a few hours, L = a day or more.

### Batch 1. Quick fixes to how documents are written (mostly `src/prompt.ts` and `src/tools.ts`)

**Status: done on 16 November 2026.** New writing rules in `src/prompt.ts` and `src/tools.ts`; a checker in `src/check.ts` that removes stray name lines and empty answer keys, and asks for one clean rewrite when a draft corrects itself, has the wrong number of questions or totals that don't add up; higher length limits. Thirteen of the reviewers' problem cases were re-run: ten came out without visible self-corrections first time, one was caught and rewritten automatically, and two chemistry quizzes still showed one (an answer-key line naming two letters, and a question written twice); both patterns were then added to the checker. Answers were hand-checked on only two of the thirteen. Not solved by this batch: wrong answers that don't announce themselves (Batch 2), and short phrases quoted from memory in literature questions, which are fewer but still appear.

| # | Change | Raised by | Effort |
|---|---|---|---|
| 1 | **Never print the AI's second thoughts.** Tell the model to give each answer once, and have the code scan the finished document for phrases like "Correction", "Wait,", "Hmm", "Recheck" or two answers on one key line; if found, write it again. A rough scan found this in about 11 of the 84 samples. | 13 of 30 [01 02 03 04 05 09 10 11 13 14 16 20 27] | S–M |
| 2 | **No "Answer Key: not applicable" section and no student Name/Date line on teacher-only documents** (family email, IEP ideas, differentiation, report comments, lesson, unit and sub plans). Re-checked: the name line is on 22 of 28 such samples. | 8 [01 05 07 15 16 19 26 28] | S |
| 3 | **Point totals must add up.** Header said 30 where the questions summed to 21, 25 where they summed to 19, 100 where they summed to 29. Either add the points up in code or stop printing a total. | 6 [03 10 12 13 17 20] | S |
| 4 | **Honour the numbers asked for.** 5 questions asked, 12 given; "exactly 10" gave 15; "about 300 words" gave 192; the "three questions" option gives five. Treat counts and lengths in the form and in the "Anything else" box as firm. | 12 [01 02 04 06 07 08 11 12 14 27 29 + first test] | S–M |
| 5 | **Never invent quotations.** A Macbeth line was given to Hamlet; "direct quotations" from Of Mice and Men and from secession declarations were made up. Quote published books and historical sources only from text the teacher pastes; otherwise leave a marked blank. | 5 [04 06 21 24 28] | S |
| 6 | **Don't describe a standards code the site can't check.** A non-existent science code was given an invented description; another code got the wrong grade's wording. Print the code as typed, without official-sounding wording, and print it on every tool. | 4 [01 17 28 30] | S |
| 7 | **Stop documents being cut off.** Four samples hit the length limit (lesson plans with a pasted template, three-level and bilingual documents). Raise the limit for those and tell the model to finish every section briefly rather than stop. | 3 [06 08 26] | S |
| 8 | **Fill-in blanks in one place.** Sub plans and emails scatter "[office extension]"-style blanks through the text. Collect them in a "fill in before printing" box at the top. | 3 [09 15 16] | S |
| 9 | **Translation fixes.** Add a "have a fluent speaker check this" note to translated documents; use "a más tardar" for deadlines (Spanish said "before" where English said "by"); use "Clave de respuestas" in Spanish documents. | 5 [01 08 12 15 23] | S |
| 10 | **Safety wording.** Remove "safe" from the lab tool's description; add a "check against your safety plan and the manufacturer's manual" note on labs and shop documents; never say kindergartners need no supervision. | 3 [02 05 10] | S |
| 11 | **Leveled and A/B versions.** Don't print the same passage three times; give each level a complete page; make version B's answers differ from version A's. | 4 [03 08 11 23] | M |

### Batch 2. Checked answer keys (`src/generate.ts`) — the big one

**Status: done on 17 November 2026.** Every document with an answer key now gets (1) a second request that works each answer again and reports mismatches (`src/verify.ts`), (2) a calculator check of the arithmetic written in the key (`src/arith.ts`), and (3) its point totals added up by code (`fixTotals` in `src/check.ts`). Problems trigger one rewrite, which is checked again; anything still in doubt is named in a "Please check before use" note on the answer key page, and the page tells the teacher what the check did.

How well it works, measured on the same eleven hard document types (chemistry, math, music, Spanish, shop safety, reading), with every answer worked independently by a stronger AI model:

| | Questions | Definite mistakes |
|---|---|---|
| Second opinion only | 147 | 7 (three wrong point totals, one wrong calculation, a Spanish grammar rule counted twice, one impossible problem) |
| Second opinion + calculator + totals by code | 149 | 3 (a multiple-choice question with two true options, in both versions of one quiz; one key line giving two answers) |

On the reviewers' old documents the second opinion found real errors in 9 of 13 known-bad documents, including two the reviewers had missed, with no false alarms on 8 known-good ones. These are small samples from one run each, so treat the numbers as a direction, not a rate. Mistakes still get through, most often where the model's own subject knowledge is wrong (for example Spanish *ser* with events), because the second opinion shares that blind spot. Cost: roughly half again per document by token count (an estimate, not a measured bill), and about 30 seconds instead of 15 when a rewrite is needed.

| # | Change | Raised by | Effort |
|---|---|---|---|
| 12 | **A second pass that re-works every answer key before the teacher sees it**: solve each question again, confirm exactly one multiple-choice option is right, confirm the key agrees with the passage it sits under, fix or flag what fails. This roughly doubles the cost of a document (still a fraction of a cent). Wrong or self-contradicting key entries appeared in more than half the reports, in chemistry, math, music, Spanish, shop safety, civics and reading. Already item 2 in CLAUDE.md. | 17+ of 30 | L |
| 13 | **A "check before use" line on the answer-key page**, since nothing on the document itself tells a trusting new teacher to check. | 4 [21 24 27 28] | S |

### Batch 3. Things only you can supply (`src/views.ts`, then a legal review)

| # | Change | Raised by | Effort |
|---|---|---|---|
| 14 | **Name who runs the site and give a contact email**, on Privacy, Terms, About, Support and the footer. Remove the visible "Site owner: review this page…" notes. | 17 of 30, incl. all 6 administrators | S once you choose a name and email |
| 15 | **Say what the AI provider keeps** and whether it trains on what teachers type; add a short "For schools and districts" page. Needs the facts from your Anthropic account terms. | 8 [07 15 18 19 20 22 23 25] | M |
| 16 | **Tell one story about money.** Home says ads and supporters; About adds commission links and email sponsors; the newsletter box says "nothing else". | 3 [13 22 25] | S |
| 17 | **Terms gaps for a lawyer**: liability limit, governing law, a licence letting the site publish shared documents, a copyright complaints process, effective date, the daily limit as a number, cookie consent for UK and Ireland. | 3 [22 25 18] | Lawyer |
| 18 | **Say who reviews library resources** and add a "report a problem" link. | 6 [15 17 18 20 21 28] | S |
| 19 | **`/ads.txt` is empty.** Leave it out until ads are live. | 1 [18] | S |

### Batch 4. Bigger features

**Status: mostly done on 18 November 2026.** Tried on the running site with eleven real documents (four two-language pages, two with student details typed in, two sub plans, kindergarten, a combined class, calculus).

- 20: done (`src/names.ts`). On the IEP, report comment, family email and differentiation tools, what looks like a student's name, ID number or date of birth is replaced with a placeholder before the request goes to the AI, and the teacher is told. It knows about 450 common first names plus phrases such as "a student named …"; an unusual name with no such phrase still gets through, so the "don't type names" wording stays.
- 21: done. "English + Spanish (side by side)" now prints as two columns matched paragraph by paragraph and question by question, and the same choice exists for all eight other languages on every tool with the language menu, including the text leveler. Tables are stacked rather than squeezed. Not done: columns together with A/B or three-level versions (those still print one language after the other), and the family email, which keeps its own language box.
- 22: 16 new library pages (43 in total) covering ESL, world languages, kindergarten, art and music, PE and health, SEL, computer science, career and technical, calculus and precalculus, and a high school sub plan. Each was written by one AI and every answer re-worked by a second; that check found no wrong answers and corrected two sentences. Still AI-written and AI-checked, not teacher-checked. Supply links now differ for grades 6 and up in math and English.
- 23: the warning is done, and kindergarten requests now ask for pages built from typed shapes, numerals and read-aloud directions instead of missing pictures (the test page had no picture notes). Layouts drawn by code (tracing lines, ten frames) are not done.
- 24: done. Each tool has its own revise buttons.
- 25: done: Career & Technical subject; combined classes (K–1 up to 11–12); a period-length choice on sub plans, where a full day now means one period plan plus a period-by-period table, or about five hours for a class that stays together; a "Save paper" print button; an optional "Drafted with AI assistance" line, and a fixed "check every answer" line on the answer key page; exponents, roots and ≤ ≥ shown as real notation. Not done: fraction bars, integral and sigma signs.
- Not checked: how the new pages look on a real phone, and the Word download of a two-column page.

| # | Change | Raised by | Effort |
|---|---|---|---|
| 20 | **Catch student names before they are sent.** The IEP tool warns against names but accepted one and printed it in the title. Check the text first and always write "the student". | 4 [07 18 19 25] | M |
| 21 | **Make "English + Spanish (side by side)" really side by side** (paired columns), or rename it "English, then Spanish". Offer it on the text leveler and for other languages. | 4 [08 12 23 29] | M |
| 22 | **Fill the empty library shelves**: ESL, Art and Music, World Languages, kindergarten, high school sub plans, calculus all show "Nothing here yet". Also match the Amazon supply links to the resource's grade (fraction tiles are suggested on a calculus page). | 9 [05 08 09 10 12 13 14 16 22 23 29] | L, ongoing |
| 23 | **Kindergarten pages print "[Picture: 4 balls]" instead of pictures.** Until code-drawn layouts exist, warn on the form when Kindergarten is chosen. | 2 [05 29] | S for the warning, L for layouts |
| 24 | **Revise buttons that fit the tool.** The family email shows "Harder", "Version B", "More questions". | 3 [07 22 23] | S |
| 25 | **Smaller additions**: a Career and Technical subject [10]; a combined-grade choice such as 5–6 [11]; a period-length field on sub plans and a real "full day" [09 16]; a save-paper print mode [11]; proper math notation for calculus [14]; an optional "AI-assisted draft" footer [21 28]. | 1–2 each | S–L |

## Where reviewers disagree

- **AI label on printouts.** The parent-rights board member [21] wants every handout labelled as AI-drafted by default; the student teacher [28] wants it optional. Suggested: always on the teacher's answer-key page, optional on the student page.
- **Sensitive history.** The civics teacher [06] wants both sides sourced equally on every question; the English student teacher [28] wants the site to state plainly that a character is excluded because of racism. Suggested: state settled facts plainly, present real policy disagreements evenly, and say which is which.
- **Why use it at all.** The ChatGPT user [01] sees no reason to switch; the superintendent [20] and attorney [25] think the no-accounts, no-student-data design is better than most free tools. The advantage reviewers actually valued is privacy and print-readiness, so those belong on the home page.

## Single mistakes worth fixing by hand

- Library: the Cell Organelles study guide is tagged with a standards code that covers a different topic [17]; the Grade 4 equivalent fractions teacher notes refer to problem numbers the page doesn't show [15].
- The titration lab sample is off by a factor of ten and could not be run as written [02] (a generated document, shown here as an example of why Batch 2 matters).
