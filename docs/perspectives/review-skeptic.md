# Review: Skeptic (Claude Opus, adversarial brief)

My brief was to look for the reasons this fails. So this review doesn't ask "would they like it?" It asks: **would they come back a second time, and what stops them?** Free teacher sites rarely die because the first visit was bad. They die because nobody had a reason to make a second visit, while ChatGPT, Gemini, MagicSchool and Canva sat open in the next tab for free.

Three facts sit behind most of what follows. I took them from the README, `src/tools.ts` and the research report.

1. **Nothing gives a teacher a reason to return.** There are no accounts, saving happens only in the browser, and the library has 27 items. A teacher who gets one good worksheet has no saved collection, no streak, no folder and no scheduled reason to come back. Next time, they will type the same request into whatever tab is already open.
2. **The generator is the weakest part, and it is the part teachers see first.** Verified US teachers get ChatGPT for Teachers (unlimited, free until June 2027), Claude for Teachers, Gemini in Classroom and Copilot, all on larger models than Haiku. Tool pages full of form fields are a thinner version of MagicSchool's 80+ tools. Being free and having no sign-up is not a reason to choose this site, because the competitors are free too and the teacher is already signed in to them.
3. **The 40-documents-per-network daily limit will hit schools first.** A school usually sends all its traffic out through one public IP address. Thirty teachers each making two documents in a prep period would use up the whole building's allowance by mid-morning. Each of them would then see the site "not working" on the first day a colleague recommended it. That is the worst possible moment to fail.

---

## 1. The 20 people

**1. Maya (first-year, 2nd grade).** She would love getting a whole worksheet with an answer key in 30 seconds at 9pm on a Sunday, without making an account. She leaves when a 2nd-grade worksheet turns out to be a wall of plain text with underscore blanks: no boxes, no pictures, nothing that looks like what her mentor teacher hands out. **Will she come back?** Maybe twice. But she is exactly the teacher who will be shown MagicSchool or ChatGPT at her first PD day, and nothing here keeps hold of her. What would matter most to her is a saved "my closet" of what she made, plus a weekly email with next week's ready-to-print pack for her grade. That gives her a reason to open the site again without having to remember it exists.

**2. Frank (veteran HS math).** He would love A/B versions of a quiz with answer keys he can trust. He leaves the first time a key is wrong, and on a small model doing multi-step algebra in plain text, that will happen within his first three documents. The prompt saying "double-check every calculation" does not check anything. **Will he come back?** No, and he will tell the math department why. What would matter most to him is math answers computed and checked by code rather than by the model, along with a one-click "make version B" button that changes the numbers and keeps the structure. That is the one thing a general chatbot does badly and a small dedicated site can actually promise.

**3. Denise (K-5 SPED resource).** She would love one task rewritten at four levels in one go, and a de-identified IEP goal bank. She leaves when the IEP tool produces generic SMART goals that she could get from any goal bank, or when she wonders whether typing a present level counts as entering student data. **Will she come back?** Only for differentiation, and only if versions are generated together rather than one at a time. What would matter most to her is a "same task, three to four levels" output on a single printout. The privacy wording should also be plain, saying in one line that the site stores nothing she types (the README says this is true, so say it on the form).

**4. Luis (MS ESL).** He would love the text leveler with an "English learners (beginner)" option. He leaves because he needs visuals, sentence frames and home-language support, and gets English text with an optional glossary. Five proficiency levels means five separate runs, five sets of copying, and five chances to hit the cap. **Will he come back?** Unlikely. Diffit does this exact job better, and Diffit is the tool his colleagues already use. What would matter most to him is one request that produces all levels side by side, with sentence frames and an optional home-language glossary. Without visuals he is still only partly served, and the site should admit that.

**5. Priya (7th grade science).** She would love lab write-ups that use cheap materials and include a data table. She leaves because the labs have no diagrams, NGSS is a free-text box the site doesn't check, and "safety she can defend" comes from a small model with no review. A lab safety error is the one mistake that can get a teacher into real trouble. **Will she come back?** For lab handouts maybe; for anything she has to defend, no. What would matter most to her is reviewed, NGSS-tagged labs in the library that she can trust because a human checked them. Generated labs should carry a visible "unreviewed, check safety" label. Choose one or the other; don't let the two blur together.

**6. Sam (day-to-day sub).** He would love a sub plan with no login, on a phone, in five minutes. He leaves because the output is designed to be printed and he has no printer. A long streamed text document on a phone, with ads loading around it, is miserable to use five minutes before the bell. **Will he come back?** Possibly, since subs have the problem every week. But only if it is faster than asking ChatGPT on the same phone. What would matter most to him is a phone-first "I'm subbing now" mode: grade and length go in, and out comes a projector-friendly, read-aloud version with no printing needed.

**7. Rachel (homeschooling parent of three).** She would love that it is free with no verification. She is one of the few people big US teacher offers don't cover. She leaves when she realises she has to run separate requests for each child and each subject, and that nothing is kept for next week. **Will she come back?** She is one of the most likely people to return, because she plans every week and pays for everything herself. But she will drift to a homeschool curriculum or ChatGPT unless the site remembers her setup. What would matter most to her is a saved weekly planner covering her three children's grades and subjects, so she can say "make next week" in one click.

**8. Earl (rural combined 5th/6th).** He would love that it is text only, light and fast on slow internet. Ironically, the plain output is a strength for his black-and-white printer. He leaves when the school web filter blocks the site, which is likely for a new domain that carries ads, AI and user-shared public content. If he does get in, a five-page lesson plan uses up his page quota. **Will he come back?** Only if he can reach it at school, and that is decided by someone like Dr. Chen, not by Earl. What would matter most to him is ink-saving, compact print layouts (half-sheets, two-up, fit to one page), and one assignment covering two grades on one page.

**9. Angela (instructional coach).** She would love that it is free and has no logins to manage for her team. She leaves because she can't make her team's documents consistent: there is no shared template, no team standards set, and no way to give weaker teachers good defaults. Each teacher gets whatever the model happened to write that day. **Will she come back?** No. Her job is consistency, and the site has no way to provide it. She will push MagicSchool if her district has bought it. What would matter most to her is a shareable "team preset" link that fills in grade, standards, format and house rules. It can be done without accounts by storing the settings in the URL.

**10. Dr. Chen (district tech/privacy).** He would love a short, honest privacy page saying there is no student data, no logins and no stored prompts. He leaves (and blocks the site) when he sees display ads with third-party ad trackers, Amazon affiliate links, a public library of user-submitted content, a mailing list run off a CSV export with no unsubscribe handling, and no data privacy agreement to sign. **Will he come back?** He doesn't "come back"; he decides once, and the default answer for an ad-funded AI site from a single person is to block it. What would matter most to him is a "for schools and IT" page with a signed privacy commitment (the SDPC national data privacy agreement or the Student Privacy Pledge), only contextual and non-personalised ads, no trackers on tool pages, a WCAG statement, and a named contact. Losing him silently cuts off every teacher who would use the site at school.

**11. Marcus (10th grade English).** He would love text-specific discussion questions. He leaves on the first paragraph of generic model prose ("delve", "tapestry", tidy three-part conclusions). He also won't get feedback on student writing, which is the thing he really wants. Haiku writes more blandly than the free tools he already has access to. **Will he come back?** No. He is the clearest case of a teacher who is better served by ChatGPT for Teachers, which he can give real texts and real student work to. What would matter most to him is letting him paste his own rubric and standard text and get questions tied to quoted lines. Even so, I would accept losing him.

**12. Tanya (kindergarten).** She would love nothing about the current output. Plain-text worksheets for children who can't read are useless to her, as her persona says outright. She leaves within a minute, at the first worksheet. **Will she come back?** No. What would matter most to her is K-1 layout templates: big type, tracing lines, cut-and-paste boxes, picture placeholders using an openly licensed icon set, and song or chant text. Without them the site should stop presenting itself as K-12. "K-12" sets a promise the site breaks for the youngest grades.

**13. Coach Rivera (PE/health plus art).** He would love station cards and skill rubrics made on a phone in the gym. He leaves because the forms assume a classroom and desk time, and output is a long document rather than cards he can tape to cones. **Will he come back?** Occasionally, for a rubric. PE is badly served by every AI tool, so he is winnable if station-card output exists. What would matter most to him is a "station cards" format (one large card per station, printable four to a page) and a phone layout that works with one thumb.

**14. Amara (UK Year 5).** She would love that there is no US verification wall. Every big free offer is US-only, so she is genuinely in the gap. She leaves when she sees "Grade", US spelling, US letter-size paper, dollars and "CCSS". The grade dropdown in `tools.ts` is hard-coded to K-12. **Will she come back?** Yes, if it speaks her curriculum, because she has fewer free alternatives than US teachers. What would matter most to her is a region setting (UK, Ireland, Australia, Canada) that controls spelling, Year groups, units, A4 printing and curriculum references. It is cheap, and it opens markets where the research says the big free offers don't reach.

**15. Jordan (tutor / after-school).** He would love quick, single-skill practice and the family email tool for after-session notes. He leaves because he wants diagnostics he can reuse with the same student over weeks, and the site forgets everything. **Will he come back?** Plausibly, since his need repeats and he isn't covered by teacher-verified offers. That depends on history being saved. What would matter most to him is a saved list of past documents, plus "make another like this, harder", so he can progress one student session by session.

**16. Emily (student teacher).** She would love a free lesson plan with objectives and standards. She leaves because she needs it in her university's template, and the lesson plan tool has a fixed structure. Rebuilding the output into the required template takes as long as writing it herself. **Will she come back?** Only until she graduates, which is a few months at most, and she has no money for the supporter option. What would matter most to her is a "paste your template headings" option on the lesson plan tool. It is small to build, but she is a short-lived user whichever way it goes.

**17. Brooke (TPT seller).** She would love speed. She leaves when she asks whether she owns the output, whether it looks designed, and whether she can sell it. The answers are no (AI output isn't copyrightable), no (plain text), and "risky", since TPT announced in October 2026 that it plans to ban AI-generated resources. **Will she come back?** No, and the site shouldn't want her to, because she would fill the share queue with sales-bait. Accept losing her.

**18. Sofía (dual-language 1st grade).** She would love that family emails can be written in both languages. She leaves because every other tool needs "in Spanish too" typed into the details box. A small model's Spanish for 1st-graders will read as translated rather than natural, and a native-speaking teacher spots that in one line. **Will she come back?** Only for family emails. What would matter most to her is a site-wide "both languages, side by side" output option, plus honesty that the Spanish should be reviewed. Even with both, Haiku's Spanish quality is the risk the site can't easily fix.

**19. Devon (blind HS history teacher).** He would love a simple, text-first site, which should in principle work well with a screen reader. He leaves if the streamed output is announced line by line in a jumble, if the ads include unlabelled iframes or steal focus, or if the Word export is styled text rather than real headings and tables. Nothing in the README suggests anyone has tested with a screen reader. **Will he come back?** If it works, yes. Accessible, structured, text-first output is a real advantage over Canva-style tools. What would matter most to him is a screen-reader pass on the generator, on the stream (one live-region announcement when it finishes, not every token), and on the Word export's heading and table structure. Publishing a WCAG statement afterwards also helps with Dr. Chen.

**20. Pat (paraprofessional).** Pat would love one box: type what you need, get a printout, no account. Pat leaves when faced with 24 tool cards, a choice between "differentiation ideas" and "worksheet", and a revision box that needs confidence to word. **Will Pat come back?** Only if a teacher bookmarks the specific resource for Pat. Pat doesn't choose tools, so Pat is reached through the teacher. What would matter most to Pat is a share link a teacher can send ("print this for the reading group"), with that resource saved and reachable again. That is the library and saved items again, not the generator.

**Tally of the honest "would come back unprompted" answers:** plausibly Rachel, Jordan, Amara, Devon (if accessible) and Sam (if phone-first). That is 5 of 20, and all five are people who sit outside the US-teacher programmes the big companies target. Everyone at a US school either loses to the tool already open in their browser, or never gets past the web filter.

---

## 2. Top 10 changes, ranked

I favoured changes that give a reason to return, or that a big free competitor won't bother to copy. Counts are out of the 20 people above.

| # | Change | Helps (count) | Effort |
|---|---|---|---|
| 1 | Replace the per-network cap with a per-device one | 16 | Small |
| 2 | "My Closet": saved documents and settings, with an optional email link to get them back | 19 | Medium |
| 3 | "Versions in one go": A/B forms, three levels, two grades, bilingual side by side, on one printout | 10 | Medium |
| 4 | Math answer keys computed and checked by code | 8 | Medium |
| 5 | Make the reviewed library the product: hundreds of items, grouped by month and unit | 17 | Large, ongoing |
| 6 | School-readiness pack: privacy commitment, no trackers on tool pages, WCAG pass | 1 directly (plus Devon); decides access for 16 | Small to medium |
| 7 | Print-first layouts: ink-saver, half-sheets, fit to page, A4, big print | 9 | Small to medium |
| 8 | A weekly "next week, ready to print" email by grade, with real unsubscribe | 9 | Small to medium |
| 9 | K-1 layout templates: big type, tracing lines, cut-out boxes, open-licence icons | 7 | Medium to large |
| 10 | Region setting (UK, IE, AU, CA) | 1 directly; opens non-US traffic | Small |

**1. Replace the per-network cap with a per-device cap, with a much higher per-network ceiling.**
- *What to build:* key the daily limit on a random ID stored in the browser, falling back to the network address. Allow something like 25 per device, and raise the per-network ceiling to the hundreds. The global daily budget stays as the real cost guard.
- *Who it helps:* everyone who uses it on a school network (1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 13, 14, 16, 18, 19, 20).
- *Risk:* the device ID can be cleared to dodge the cap. That doesn't matter much, because the global cap and the provider spend limit already bound the cost.
- *Why first:* it is the one item that turns word-of-mouth inside a school from a failure into a success.

**2. "My Closet": everything you made, saved on the device, plus an optional email link to recover it.**
- *What to build:* automatically save each document and its settings to IndexedDB. Add a "my closet" page, "make another like this", and saved presets. Then add an optional magic-link email that backs the closet up and adds the person to the weekly list.
- *Who it helps:* everyone except Dr. Chen (19).
- *Risk:* an email address is personal data, so keep it to email only, and make it clear it is optional and never needed.
- *Why it matters:* it is the reason to come back, and it is what the research report itself recommended ("an optional free account that saves work and builds the email list"). Leaving it out was the biggest departure from the research.

**3. "Versions in one go".**
- *What to build:* on the worksheet, quiz, reading passage and leveler tools, add a "Make versions" option: A/B (same skills, different items), three reading levels of the same content, two grades on one page, or English/Spanish side by side. The result is one streamed document that prints with each version on its own page.
- *Who it helps:* Frank, Denise, Luis, Earl, Rachel, Jordan, Sofía, Pat, Angela and Maya (10).
- *Risk:* longer output, so roughly two to three times the cost per call. That is still well under a cent on Haiku.
- *Why it matters:* adapting material is the best-evidenced teacher need (Stanford's MagicSchool data). A chat window makes the teacher ask for each version one at a time.

**4. Math answer keys computed and checked by code.**
- *What to build:* for arithmetic, fractions, decimals, percentages, ratios and linear equations, either generate the numbers in code and let the model write only the wording, or parse the model's key and recompute it. Mark checked keys with "✓ answers checked by computer".
- *Who it helps:* Frank, Maya, Rachel, Earl, Jordan, Pat, Sam and Denise (8).
- *Risk:* the coverage is narrow, and claiming "checked" on a key that wasn't checked would be fatal. Only show the badge where code really verified the answer.
- *Why it matters:* this is the clearest "we do it right, they don't bother" feature. It also defends against the cheap model's weakest spot.

**5. Make the reviewed library the product, not a side feature.**
- *What to build:* 27 items is a demo. The site needs several hundred reviewed, standards-tagged items before Google treats it as a resource. Group them by school-calendar month and unit ("October, 3rd grade: everything for fractions week") and mark what a human checked.
- *Who it helps:* everyone except Dr. Chen, Brooke and Amara (17).
- *Risk:* the owner's review time is the ceiling. At about 15 minutes per item, 300 items is 75 hours. Budget it honestly, and never bulk-publish.
- *Why it matters:* this is the only part the big chatbots can't copy. Human review is also the only copyrightable layer.

**6. School-readiness pack.**
- *What to build:*
  - A "For schools and IT" page.
  - Sign the Student Privacy Pledge, and offer the SDPC national data privacy agreement on request.
  - Serve only contextual, non-personalised ads, with none on the generator page itself.
  - No analytics or ad trackers on tool pages.
  - A WCAG 2.1 AA check and statement.
  - A named contact.
  - Get the legal review of state privacy laws that the README already flags.
- *Who it helps:* Dr. Chen directly, plus Devon. It also decides whether the 16 school-based users can reach the site at all.
- *Risk:* ad income drops slightly from losing personalised ads. That is worth it, because a blocked site earns nothing.

**7. Print-first layouts.**
- *What to build:* an "ink saver / compact" switch, a half-sheet or two-up option for exit tickets and bell ringers, "fit to one page", A4 paper, and a large-print option. Plain text is actually an advantage here if it is laid out well. The site should aim to make the best printouts any AI tool produces, which is something chat windows do badly.
- *Who it helps:* Maya, Frank, Denise, Rachel, Earl, Tanya, Amara, Jordan and Pat (9).
- *Risk:* little. This is mostly CSS work.

**8. A weekly "next week, ready to print" email.**
- *What to build:* the reader picks a grade once, and every Sunday afternoon gets three reviewed library items for the coming week (bell ringers, a seasonal activity, an exit ticket), each one click from printing.
- *Who it helps:* Maya, Rachel, Earl, Angela, Pat, Sam, Jordan, Emily and Rivera (9).
- *Risk:* it needs a real email service with unsubscribe handling before the first send. The current CSV export with no unsubscribe is a CAN-SPAM problem and something Dr. Chen will flag.
- *Why it matters:* it gives readers a reason to return without them having to remember the site, and it fills the sponsor slot.

**9. K-1 layout templates.**
- *What to build:* a small set of printable layouts the model fills with text: large type, dotted tracing lines, boxes to cut and paste, "draw here" frames, picture slots filled from an openly licensed icon set (for example OpenMoji), and song or chant formats.
- *Who it helps:* Tanya, Maya, Luis, Sofía, Denise, Rachel and Pat (7).
- *Risk:* scope creep into design-tool territory, where Canva wins. Keep it to five or six fixed templates. If it isn't built, stop advertising "K-12" and say "grades 2-12".

**10. Region setting (UK, IE, AU, CA).**
- *What to build:* one switch that sets spelling, Year groups, units, A4 paper and curriculum references in the prompt and the forms.
- *Who it helps:* Amara directly (1). Indirectly, it opens markets where ChatGPT for Teachers and Claude for Teachers aren't offered, and where Journey by Mediavine still accepts traffic.
- *Risk:* the library is US-centric, so non-US visitors land on the generator rather than the library.
- *Why it is on the list:* it is one of only two audiences (the other being homeschoolers and tutors) where "free, no verification" really does set the site apart.

**Honourable mentions** (each small, each helping 1-3 people): a phone-first "subbing now" projector mode (Sam, Rivera, Pat); a "paste your template headings" field on the lesson plan tool (Emily); and station-card output (Rivera).

---

## 3. What not to do

1. **Don't add a paywall, student-facing features or processing of real student data.** That means no student accounts, no essay feedback on real student work, and no IEP drafting from real details. Each one turns a consumer website into a vendor that districts must approve, and it undoes item 6. **Accept losing** Marcus (feedback on student work) and Denise's wish to draft from real IEP details.
2. **Don't court commercial creators or promise ownership.** AI output isn't copyrightable and TPT is moving to ban it. Making it easy to sell output would also flood the share queue with sales-bait the owner must reject. **Accept losing** Brooke.
3. **Don't grow the library faster than one person can review it, and don't chase images through AI image generation.** Bulk AI pages invite Google's scaled-content penalty and Mediavine or Raptive rejection. Image generation would break the tenth-of-a-cent budget. **Accept losing** Priya's diagram needs, and Tanya too if item 9 isn't built. Emily is short-lived either way.

---

## 4. What the owner is most likely wrong about

**That "free, no sign-up" is a reason to choose the site.** In late 2026 it isn't: the competitors are free, run on better models, and the teacher is already logged in to them. The design doubles down on the bit that has become free everywhere (generation) and skimps on the parts that would keep teachers coming back: memory, a library worth browsing, and a scheduled reason to return. Taking out accounts was meant to remove friction. It also removed the only mechanism by which a free site gets a second visit. On an ad model where each session earns a fraction of a cent, a site where nobody returns lives or dies on Google, and a new domain with 27 library pages won't get meaningful search traffic for six to twelve months.

Two related, more specific errors:

- **Thinking the ads are harmless because they are "quiet" and never printed.** The likelier cost is not annoyed teachers but school web filters and IT directors. Ads plus AI plus public user content from an unknown single-person domain is exactly the profile that gets blocked. Then the only usage is Sunday nights at home, which is the moment ChatGPT is already open.
- **Thinking 40 documents per network is generous.** For a school behind one public IP address it is about one document per teacher per day, and the cap runs out on the day the site is recommended in the staff room.
