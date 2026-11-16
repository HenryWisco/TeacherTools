# Review: Claude Haiku

Read: PROMPT.md, personas.md, README.md, src/tools.ts. No web research, no other files changed.

**Bottom line.** The product is sensibly scoped and the economics are coherent. Its biggest problems are not the model. They are (1) a daily cap per network that will lock out whole schools, (2) no way to bring the teacher's own text, format or standards into the output, (3) text-only output that shuts out early-years and some specialist teachers, (4) trust: answer keys, privacy and accessibility are all asserted rather than shown, and (5) a US-only frame.

## 1. Per-person reactions

1. **Maya, first-year 2nd grade teacher.** She would love fast, decent worksheets, bell ringers and family emails she can adapt on a Sunday night. She leaves within a minute if the output reads as generic or if her work vanishes when she comes back next week, because nothing is saved and she has to regenerate everything. The change that matters most to her is a "My documents" list kept in her own browser, with download. Her school's shared IP also means she may hit the per-network cap on a busy day.

2. **Frank, 24-year math veteran.** He tests the first answer key against his own, and the first wrong key ends his use. He would stay only for extra practice sets and Version A/B quizzes with matched keys. The single change for him is a verified answer pass on math and science keys, plus a "make Version B" button that reshuffles questions and options and rewrites the key to match. The site as described does not earn his trust.

3. **Denise, K-5 resource teacher.** She would use it to modify grade-level text, get a plain-language version of a passage, or draft generic accommodations. She will not put student-specific detail into it, and the IEP form still invites identifying context. She leaves when she sees ads and cannot find a plain statement of what text goes to the AI provider and what is kept. The change that matters most is a one-page data-flow statement plus a "several levels of one task" output.

4. **Luis, middle school ESL teacher.** The differentiation tool and text leveler are close to what he needs, but he needs the same content at four or five levels on one set of pages, with visuals and a home-language glossary. Right now each level is a separate generation, and there is no home-language support. He leaves if every version is a new click and he cannot paste his own reading passage. The change that matters most is a "one lesson, several levels" output with a glossary in a chosen language.

5. **Priya, 7th grade science teacher.** Cheap-materials labs, safety notes, data tables and analysis questions are useful to her. The site fails on diagrams, which it cannot produce, and on NGSS, where the standards field is free text that nobody checks. She leaves when she sees that the lab format is not one she can defend to her principal. The change that matters most is an NGSS performance-expectation picker and a paste-your-lab-template field.

6. **Sam, day-to-day substitute.** A phone-first, no-prep sub packet is exactly right. But the flow is built around a printer and a desktop screen, streaming output takes time on a phone, and the answer key is not easy to find. He leaves if the page is slow on his phone or the key sits in the middle of a long scroll. The change that matters most is a "five-minute sub packet" button that produces one phone-readable page with the key clearly separated, and a print view that works without a printer.

7. **Rachel, homeschooling parent of three.** She needs a week across subjects for children at different grades. Every tool makes one document for one subject and one topic, so she would build five separate things and give up. She also wants to keep work between sessions. The change that matters most is a week planner that spans subjects and grades and prints as a grid, plus a "My documents" list.

8. **Earl, rural K-8 combined-grade teacher.** The streaming output, page weight, strict filter and a black-and-white printer with a quota all work against him. The 40-per-network cap probably shuts out his whole school by mid-morning. He leaves when the page is slow, prints grey backgrounds, or hits a cap. The change that matters most is a light print view that uses ink sparingly and shows the page count, plus a higher per-network cap.

9. **Angela, instructional coach and team lead.** She wants a team to produce consistent, standards-aligned materials that she can share in Drive. The site offers individual tools with no template control and no standards mapping. She judges by whether weaker teachers produce good lessons, and the output varies run to run. The change that matters most is a paste-your-template box so the team can impose a format, with a standards picker. Team accounts are out of scope for now.

10. **Dr. Chen, district privacy director.** She would block the site on the school network on sight of display ads, AdSense tracking, affiliate links and a newsletter. The README says teacher text is not stored, but it does not say what the AI provider keeps or whether the API is excluded from training. She leaves within a minute without a data-processing statement and a tracker-free mode for generator pages. The change that matters most is that statement, with first-party analytics only on the generator and an ad-free mode for school networks.

11. **Marcus, 10th grade English teacher.** He hates generic AI prose. Discussion questions without the actual text are generic by construction, and rubrics and feedback comments need to match his state's standards and his voice. He leaves when the questions could be about any novel. The change that matters most is a paste-the-text field on discussion questions, quizzes and study guides, plus a standards-specific rubric option.

12. **Tanya, kindergarten teacher.** Her students cannot read. She needs big print, pictures, tracing lines and cut-and-paste activities. The site produces text only and cannot make any of those. She leaves within a minute. The best partial help is a large-print mode with emoji and symbol picture cues and word banks. Full need is not met.

13. **Coach Rivera, PE and health teacher.** She plans on a phone in the gym and needs stations, skill rubrics and activities that do not assume a desk or a device. The lesson, project and quiz tools assume a classroom. She leaves when long forms are hard to fill on a phone. The change that matters most is a station-plan tool with equipment-light options and a phone-readable layout.

14. **Amara, Year 5 teacher in England.** The site says Grade, uses US spelling and US standards codes, and has no metric or National Curriculum framing. She leaves when the first output says "Grade 5" and "Fahrenheit". The change that matters most is a UK/Commonwealth switch: Year groups, British spelling, metric units and National Curriculum references.

15. **Jordan, private tutor and after-school lead.** She needs a quick diagnostic on one skill, targeted practice, and a recap to send to parents. The worksheet and exit ticket come close, but there is no short diagnostic with a scoring guide, and no parent recap built from the session. She leaves when a diagnostic cannot be checked against an answer key. The change that matters most is a five-question skill diagnostic with a key and a parent recap through the family-email tool.

16. **Emily, student teacher.** She must submit the university's lesson-plan template with objectives, standards and a reflection. The lesson plan is close but is not her template, and she is anxious about being observed. She leaves if the output does not match her headings or lacks a reflection section. The change that matters most is a paste-your-template box and a reflection option.

17. **Brooke, 3rd grade TPT seller.** She wants polished, branded materials faster and asks whether she owns what she makes and whether she can sell it. The output has no branding and the site does not answer the rights question in plain words. She leaves if she cannot tell she may sell it. The change that matters most is a plain statement on rights, plus a paste-your-style-guide box for Google Docs output.

18. **Sofía, dual-language 1st grade teacher.** She needs both languages throughout and natural Spanish. The site offers "English + Spanish" only in the family-email tool, and its Spanish is untested. She leaves on machine-sounding Spanish. The change that matters most is a full-Spanish output option across tools, with family-message phrasing reviewed by native speakers.

19. **Devon, history teacher who is blind.** The headings and tables are right in principle, but underscore blanks are read aloud as "underscore, underscore" and streaming output may be announced token by token. Print and PDF output may not be tagged. She leaves within a minute if the page is hard to navigate by heading. The change that matters most is an accessibility pass tested with NVDA and VoiceOver, with real blank markup, table headers and tagged PDF or Word output.

20. **Pat, paraprofessional.** She has limited tech confidence and gets tasks at the last minute. Twenty-four tools and a free-text box are too much choice at first. She leaves at the choice screen. The change that matters most is a three-path home screen ("for a small group", "a worksheet", "a note home") with big buttons, examples and one-tap print.

## 2. Top 10 changes, ranked

1. **Raise the per-network cap and add a per-browser cap.** Set the network cap to about 300 a day, add a cookie-based per-browser limit, and keep the site-wide cap as the real cost guard. Helps about 12 of 20: every teacher on a shared school network. Effort: small. Risk: abuse. Worst case at about $0.001 a document is roughly $0.30 per network per day, and the site-wide cap still holds.

2. **Paste-your-template on every tool.** A box for a format or template, length-capped, used for layout only (structure and headings, not content). Helps 6: Emily, Angela, Brooke, Marcus, Priya, Denise. Effort: small. Risk: pasted text used as instructions, and copyrighted templates. Treat pasted text as data, and keep it format-only.

3. **A print-first mode.** Black-and-white print CSS with no grey backgrounds, ink-saving layout, adjustable type up to about 18 pt, a page count shown before printing, and a plain print view that works on slow connections. Helps 6: Earl, Tanya, Sam, Coach Rivera, Pat, Devon. Effort: small.

4. **An accessibility pass.** Test with NVDA and VoiceOver. Replace underscore blanks with real blank markup, add table headers and heading structure, stop streaming output from being announced token by token, and offer tagged PDF or Word output. Helps 4: Devon, Denise, Pat, Sam. Effort: medium. Risk: it can slow streaming, so keep the live region polite and update it in chunks.

5. **A self-check for math and science keys, and a Version B.** After generating, a second pass in the same call checks each key, shows work for numeric answers and flags disagreements. For quizzes, add a "make Version B" that reshuffles and rewrites the key to match. Helps 4: Frank, Maya, Rachel, Jordan. Effort: medium. Risk: a self-check is not a proof, so label it as a check, not a guarantee. Cost is perhaps 30 to 50 percent more output tokens, still a small fraction of a cent.

6. **Paste-your-text on text-based tools.** Discussion questions, quizzes, study guides, vocabulary and comprehension questions get an optional paste field of up to about 1,000 words, reusing the text leveler's pattern and its "only paste text you have the right to adapt" warning. Helps 4: Marcus, Luis, Jordan, Sofía. Effort: small to medium.

7. **A week planner for mixed grades and subjects.** One request produces a week grid across subjects, with combined-class or multi-grade differentiation and tasks split by child or group. Helps 6: Rachel, Earl, Maya, Coach Rivera, Angela, Jordan. Effort: medium.

8. **A locale switch and full-Spanish output.** A UK/Commonwealth option (Year groups, British spelling, metric, National Curriculum references) and a full-Spanish output option across tools. Helps 3: Amara, Sofía, Luis. Effort: small in prompts, but needs native-speaker checks.

9. **A plain rights and data-flow page, plus an ad-free school mode.** Say in one line that the teacher owns the output and may sell it. Say what the AI provider receives and keeps, and confirm the API is excluded from training. Use first-party analytics on generator pages only, and offer an ad-free mode for school networks. Helps 4: Dr. Chen, Brooke, Angela, Denise. Effort: small to write, but needs a legal read. Risk: an ad-free school mode gives up ad income, so price it or tie it to the supporter option.

10. **A "My documents" list and a three-path home screen.** The browser keeps the last 20 documents with download, and the home page offers three big paths with examples in place of 24 tool cards. Helps 5: Maya, Pat, Sam, Rachel, Jordan. Effort: small. Stays within the no-accounts rule because it is per-viewer.

Also worth doing after the top 10: a standards picker (state CCSS, NGSS, UK National Curriculum) that inserts real codes from a small local list. Helps about 4 (Priya, Angela, Marcus, Amara). Effort: medium, because the data has to be curated.

## 3. Things the site should deliberately not do

1. **Do not add accounts, cloud storage of teacher or student text, or student-level features** such as IEP profiles or student feedback. That is what would turn the site into a student-data vendor and wreck Dr. Chen's review. Accept losing Angela's team rollout and Denise's caseload use.
2. **Do not chase images, diagrams or tracing pages** with image generation, or move everything to a bigger model. Cost is 20 to 100 times higher and licensing is messy. Accept losing Tanya fully and Priya's diagrams.
3. **Do not build a paywall or premium tier for basic use, and do not try to be a standards database yet.** Accept losing Frank, who will not come back whatever the quality, and treat NGSS and state codes as a later phase.

## 4. What the owner is most likely wrong about

- **The 40-per-network cap protects cost.** It does not. It is the first thing a school will hit, and the site-wide cap already protects the bill. The cap should be raised and made per-browser.
- **Ads will cover the cost on this audience.** School networks, ad blockers, and AdSense's policies on mass-generated, thin pages can each cut revenue or end the account. The plan rests on approval and on school traffic that may be blocked. The research covers cost per document, not whether ads survive.
- **One reviewer can hold quality at scale, and the library drives traffic.** Thin AI pages at volume are exactly what search engines penalise. Quality per page, and the review bottleneck, matter more than the count of 27 starter resources.
- **"No storage of what teachers type" means privacy-safe.** The AI provider and any ad or analytics trackers still receive the text and the visitor. Dr. Chen will read the policy, and the README does not yet answer her questions.
- **Haiku plus a good prompt is enough for trust.** Answer keys will sometimes be wrong. Trust lost on one bad key is hard to recover, so the verification and "show work" steps are not optional polish.
- **The $30 supporter payment will matter.** Honour-system supporters at that price will be few. Do not build the plan around it.
