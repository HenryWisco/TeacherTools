# Review: Claude Fable

Grounding: I read the prompt, the 20 personas, `README.md` and `src/tools.ts`. I did no web research, so claims about competitors, ad rates and law are my judgement, not checked facts.

Three facts from the code shape much of what follows:

- The daily cap is 40 documents **per network**. A school building usually shares one public address, so a whole school shares 40 documents a day.
- Grade is a fixed US K-12 list, and only the Family Email tool has a language field.
- Every tool makes one document at one level. Nothing makes versions A/B, three reading levels, or two languages in one go.

## 1. The 20 people

**1. Maya, first-year 2nd grade.** She would love a Sunday-night flow that hands her a week of bell ringers, a lesson and a worksheet without choosing among 24 tools. She leaves the first time she spots a wrong answer in a key, because "trust without checking every line" is exactly what a small model cannot promise. Text-only worksheets are also weak for 2nd grade (no number lines, ten frames or pictures). Most important change: an independent answer-key check with an honest "checked / please check question 4" mark on each document.

**2. Frank, veteran HS math.** He would use it only if a quiz comes as versions A and B with the same skills and different numbers, and every key is right. He leaves at the first wrong answer, or the first time an expression prints as `x^2/3` instead of proper notation. Text-only output also means no graphs or geometry figures, which rules out much of high school math. Most important change: verified keys plus a "make version B" button; without both he is gone and will tell colleagues.

**3. Denise, K-5 special education.** The text leveler and the careful wording on the IEP tool ("never enter a name") are what she wants to see. She leaves if she sees ads beside the IEP goal form, or if the privacy page cannot say plainly what happens to what she types. Making 14 modified versions one at a time is too slow. Most important change: one request producing the same task at three levels, on an ad-free support-tools page with a plain statement of what is and is not kept.

**4. Luis, middle school ESL.** He needs one text at five levels with sentence frames, a glossary and home-language support; the leveler does one level per run and offers only two English-learner levels. He would love a "same content, several levels" pack with frames and a bilingual glossary. He leaves when he sees he must run the tool five times and that there are no visuals. Most important change: multi-level output in one run with a home-language glossary option.

**5. Priya, 7th grade science.** The lab tool's structure (materials, safety notes, data table, teacher notes) fits her. No diagrams, and NGSS "alignment" that is just whatever code she typed, unvalidated, are the gaps. She leaves if the safety notes are generic or a procedure contains something she could not defend to her principal. Most important change: a stricter safety section (hazard list, goggles/heat/chemical flags, "have your school's safety policy checked") and honest wording that the standard is teacher-supplied, not verified.

**6. Sam, day-to-day substitute.** The site as described is built around printing, and he has no printer and five minutes. He would love one big button on a phone: grade, subject, minutes, "nothing needed but a board", producing something he reads from the screen. He leaves if he meets a form with dropdowns and a result formatted for paper. Most important change: a no-print "teach from your phone" mode for the sub plan and bell ringers.

**7. Rachel, homeschooling parent of three.** She wants a week across subjects for ages 6, 9 and 13; the site sells single documents for one grade to trained teachers. She would love a "one topic, three ages" plan with parent-friendly explanations and answer keys that show the reasoning. She leaves when the vocabulary ("formative assessment", "CCSS") assumes training she lacks. Most important change: multi-grade output from one request, in plain language.

**8. Earl, rural K-8, combined 5th/6th.** A text-only, no-login site is good for his slow connection and old laptop, provided ads and scripts do not make it heavy and the filter does not block it. Underscore answer lines and answer keys on their own page burn his print quota. With one shared network, the 40-per-network cap could lock out his whole school by mid-morning. Most important change: per-device limits, plus a "save paper" print option (compact layout, key on the same sheet, two-up).

**9. Angela, coach and team lead.** She judges by what her weakest teacher produces, and a small model gives generic lessons to vague requests. She would love a shareable "recipe" link that pre-fills a tool with her team's standard, format and expectations, so everyone starts from the same place. She leaves if copying into Google Docs breaks tables, or if her team hits the shared network cap. Most important change: shareable pre-filled tool links (no accounts needed; the settings live in the URL).

**10. Dr. Chen, district privacy director.** He will see third-party ad scripts, an affiliate programme, a newsletter sign-up, a tool named "IEP Goal Ideas", one unnamed owner and no vendor agreement. He blocks it within a minute; the README itself admits the student-privacy law question is unsettled. He cannot be made to love it, only to tolerate it. Most important change: non-personalised ads only, no ads at all on the IEP, report-comment and family-email pages, and a one-page plain data sheet ("teachers only, no student accounts, what you type is not stored, here are the third parties").

**11. Marcus, 10th grade English.** "Discussion questions for chapters 1-3 of the class novel" from a small model will be generic or wrong about the book, and he will notice at once. Feedback comments on student writing are not offered, and should not be (that is student work). He would stay for one thing: pasting an actual passage or his state's rubric language and getting questions and descriptors tied to it. Most important change: a "paste the text / paste the standard" field on discussion questions and rubric, with an instruction to quote the text.

**12. Tanya, kindergarten.** The site fails her as described; she says plain text worksheets are useless and that is what it makes. The parts that could serve her are teacher-facing: centre rotation plans, songs and chants, read-aloud questions, family notes. She leaves when the first "worksheet" is lines of text her students cannot read. Most important change: a small set of code-drawn printables (tracing lines, ten frames, large-print word cards, cut lines); short of that, be honest on the home page that K is teacher-facing only.

**13. Coach Rivera, PE/health/art.** The subject list includes PE and art, but lesson plans assume "direct instruction, guided practice, independent practice" at desks, and worksheets assume paper. On a phone in a gym he needs stations, equipment lists, space and group sizes, and skill rubrics he can read at a glance. He leaves if the form is fiddly on a phone. Most important change: an "activity / stations plan" tool (space, equipment, group size, minutes) that works one-handed.

**14. Amara, Year 5, UK.** The grade list is K-12 with "Grade N" labels, the examples say CCSS, and spelling and units will be American. She leaves on seeing the grade dropdown. The fix is cheap because it is mostly prompt wording. Most important change: a remembered "where do you teach" setting that switches year names, spelling, metric units and currency, and stops mentioning US standards.

**15. Jordan, tutor.** Single-skill practice sets and the exit ticket already fit him well. He lacks a short diagnostic (five questions that locate the gap, with "if they miss 3, reteach X") and a session note for parents. He leaves if answer keys are wrong, since he works one-to-one and will be caught in front of the child. Most important change: a "quick diagnostic on one skill" tool plus a "session summary for parents" option on the family email.

**16. Emily, student teacher.** Free and instant suits her, but her university's template is the whole point and the lesson plan tool has its own fixed structure. She would love pasting her template headings and getting them filled, including a reflection section she completes herself. She leaves if she cannot make it match, because a near miss is still a rewrite. There is also an academic-integrity risk she should be told about. Most important change: "use my template" paste field on the lesson plan.

**17. Brooke, TpT seller.** She wants designed, branded, sellable products; this makes plain text that anyone else can generate for free. Her ownership and resale questions have no clear answer on a site that also invites public sharing. She will leave, and the site should let her. Most important change (cheap, and worth doing for everyone): one plain sentence on what teachers may do with what they make.

**18. Sofía, dual-language 1st grade.** Only the Family Email tool has a language field; elsewhere she must remember to ask in the details box. Small-model Spanish for six-year-olds will often read as translated English, and she will hear it immediately. First-grade materials also need pictures. Most important change: a language choice on every tool (Spanish, or both side by side), written directly in Spanish rather than translated, with a note that a fluent reader should check it.

**19. Devon, blind HS history teacher.** A text-only site could be the most screen-reader-friendly tool in the field, which is a real advantage if the owner chooses to take it. It fails if streamed text is announced chaotically, if blanks are read as "underscore underscore underscore", or if the Word download has fake headings and layout tables. He leaves the moment the generated result is not reachable or readable by keyboard. Most important change: properly structured page and exports (real headings, real table headers, labelled blanks, a quiet "finished" announcement), tested with a screen reader.

**20. Pat, paraprofessional.** Pat needs "I have a small group for 15 minutes on subtracting with regrouping; what do I do?" and gets a home page of 24 tool names in teacher jargon. The free-form box is the right door, if its examples speak to Pat. Pat leaves if asked to choose a tool, a standard or a question style. Most important change: a small-group activity option with a script (what to say, what to watch for, what to do if the student is stuck) and plain-language examples under the home page box.

## 2. The ten changes, ranked

Counts are how many of the 20 are meaningfully helped.

**1. Check the answer keys, and say so on the page.** After a document with a key is written, run a second, independent pass that solves the questions without seeing the key and compares; do arithmetic in code where the question is numeric. Mark the document "key checked" or "please check questions 4 and 9". Helps 12: Maya, Frank, Denise, Priya, Rachel, Earl, Angela, Jordan, Emily, Pat, Sam, Luis. Effort: medium. Risk: roughly doubles cost on keyed documents (still a fraction of a cent), and a "checked" mark that is wrong is worse than no mark, so word it modestly.

**2. Limit per device, not per network.** Forty a day per network means forty per school. Count by a browser token with a much higher network ceiling behind it, and add the bot challenge the README already lists. Helps 15 (everyone working inside a school building): Maya, Frank, Denise, Luis, Priya, Sam, Earl, Angela, Marcus, Tanya, Rivera, Emily, Sofía, Devon, Pat. Effort: small. Risk: easier to abuse; the site-wide cap and provider spend limit still bound the damage.

**3. A remembered "my classroom" setting applied to every tool.** Country (year names, spelling, metric), default grade or grades, output language or both languages, plain-language mode for non-teachers. Stored in the browser. Helps 9: Amara, Sofía, Luis, Rachel, Maya, Earl, Jordan, Denise, Pat. Effort: small to medium (mostly prompt wording and a settings panel). Risk: Spanish and other languages from a small model need an honest "have a fluent reader check" note.

**4. Versions in one request.** A "make versions" control: quiz A/B, the same task at three levels, two grades from one topic, two languages side by side. Helps 10: Frank, Denise, Luis, Rachel, Earl, Angela, Jordan, Sofía, Pat, Maya. Effort: medium. Risk: each use costs two to three documents; count it that way against the limit.

**5. Paste your own source.** Optional fields: "paste the text", "paste the standard", "paste your template". Discussion questions quote the passage; rubrics use the standard's wording; lesson plans follow the pasted headings. Helps 8: Marcus, Emily, Angela, Priya, Luis, Denise, Devon, Jordan. Effort: small. Risk: copyright and pasted student details (repeat the existing warning), and longer inputs cost more.

**6. A privacy posture a district can live with.** Non-personalised ads only; no ads on the IEP, report-comment and family-email pages; a one-page data sheet; a named contact. Helps Dr. Chen directly and Denise; indirectly it decides whether the 15 school-based people can reach the site at all. Effort: small to medium, plus the legal read the README already recommends. Risk: lower ad income per view.

**7. Phone and no-printer mode.** A "show on screen" view with large type, one step at a time, for sub plans, bell ringers and activity plans; forms that work one-handed; an activity/stations tool that does not assume desks. Helps 6: Sam, Rivera, Pat, Earl, Tanya, Jordan. Effort: small to medium. Risk: low.

**8. Structured, accessible, paper-saving output.** Real headings and table headers on the page and in the Word file, labelled answer blanks, a completion announcement, a large-print option, and a compact print option. Helps 7: Devon, Earl, Tanya, Denise, Luis, Angela, Maya. Effort: medium. Risk: low; needs real screen-reader testing, not a checklist.

**9. A handful of code-drawn printables.** Not AI images. Six to eight fixed building blocks the document can call for: handwriting/tracing lines, ten frames, number lines, blank coordinate grid, graph grid, clock faces, cut-apart cards, large-print word cards. Helps 9: Tanya, Maya, Sofía, Priya, Frank, Denise, Rachel, Pat, Luis. Effort: large (medium if held to six blocks). Risk: scope creep; it still will not satisfy Tanya or Brooke fully.

**10. Fewer doors, deeper library.** Home page leads with the box and six tools, the rest behind "more". Put the owner's time into the hand-checked library, in sets that solve a whole situation (an emergency sub day per grade band, a first week, a small-group pack). Helps 8: Maya, Sam, Pat, Rachel, Earl, Angela, Emily, Rivera. Effort: small for the home page, large and continuous for the library. Risk: one reviewer is the bottleneck; 27 items is a demo, not a library.

## 3. What not to do, and who to lose

1. **No student accounts, student-facing pages, or handling of student work** (no "paste the essay for feedback", no grading). It would turn a teacher tool into a student-data service that one person cannot run safely. This means not giving Marcus his feedback comments.
2. **No AI image generation or designed, branded templates.** It breaks the cost model and the print-clean promise, and it is a different product. Accept losing Brooke entirely, and accept serving Tanya only on the teacher-facing side.
3. **No chasing district approval paperwork or a "standards-aligned" claim.** One person cannot sign vendor agreements for every district or maintain a validated standards database for 50 states. Aim to be unobjectionable rather than approved, and never say "aligned" for a code the teacher typed.

Accept losing: Brooke; Dr. Chen as an approver (aim for "not blocked"); Tanya for student-facing materials; Frank for anything needing graphs or figures; Marcus for novel-specific work unless he pastes the text. Do not accept losing Devon: accessibility is achievable here and is the one place a text-only site can be better than its rivals.

## 4. What the owner is most likely wrong about

**That breadth and speed are the product, and that cost per document is the binding constraint.** Teachers have many places to get an instant generic document. What they lack is one they can hand out without checking, and the first wrong answer key ends the relationship for Maya, Frank and Jordan alike. Twenty-four tools on the cheapest model spreads thin quality wide. The sums also look tighter than they need to be: if a page with an ad earns even a few tenths of a cent per view, there is room to spend two or three times as much on the documents where being wrong matters (anything with a key), and that is the best use of money on the site.

Two related assumptions I would also question:

- **That the library will bring the traffic.** The plan rests on search visitors to library pages, but 27 pages is far too few to matter, growth depends on one person reviewing every submission, and the README itself notes search engines punish piles of AI pages. I think word of mouth among teachers ("the keys are right", "it works on my phone", "it does UK years") is the more realistic route, which again points at trust and fit rather than volume.
- **That "no sign-up, with ads" is neutral in schools.** No accounts is right for teachers, but ads plus an IEP tool is what gets a site blocked on school networks, and a per-network cap then throttles whoever is left. Most of the 20 people work inside those networks.
