# Review: Claude Sonnet

Basis: PROMPT.md, personas.md, README.md and src/tools.ts only. No web research. Claims about what the site "does" come from those files, so where I say something is missing, it is missing from what I read.

Two structural observations shaped everything below.

1. **The site's biggest risks are trust and plumbing, not features.** A small model writes the answer keys, the standards codes and the lab safety notes. One wrong key loses a teacher for good. Separately, the "40 documents per network" cap is a school-wide cap, because a whole school usually sits behind one network address. That is probably the single most damaging line in the spec.
2. **The revision loop and the home box are the product, not the 24 tools.** Most teachers will not choose among 24 forms. They will type a sentence, then say "easier", "shorter", "in Spanish" or "version B". Making that loop one click away helps more people than any new tool.

---

## Part 1: The 20 people

**1. Maya (first-year, 2nd grade).**
*Love:* a complete timed lesson at 9pm that needs no assembly, and a library she can start from. *Leave:* the first wrong answer key or an age-inappropriate reading level, because she has no experience to catch it and no time to check every line. *Change that matters most:* make trust visible. Label library items "hand-checked" and generated items "AI draft, check the key". Add an opt-in "double-check the answers" pass. Let her start from a vetted library resource instead of from nothing.

**2. Frank (veteran math).**
*Love:* a fast extra practice set and an A/B quiz with different numbers. *Leave:* in under a minute if any answer key is wrong, and a cheap model will get some wrong. *Change that matters most:* a "Make Version B" button that changes the numbers and re-keys, plus the answer-check pass. Be honest that he is the hardest persona to win. He is one of the people I would accept mostly losing.

**3. Denise (K-5 special ed).**
*Love:* the IEP tool's "draft ideas for the team" framing, and fast modified versions of existing work. *Leave:* anything that looks like it stores or asks for student details, or that makes legal claims. *Change that matters most:* a "Modify this document" row of one-click revisions (fewer items, simpler words, sentence starters, more white space, read-aloud version). The generator is weakest where she needs it most, which is adapting a specific worksheet. The privacy statement must be exact (see change 4).

**4. Luis (ESL/ELL).**
*Love:* the text leveler with beginner and intermediate options, and the glossary extra. *Leave:* when he finds he can get one level at a time, no visuals and no home-language support. *Change that matters most:* one run that outputs the same content at three levels with sentence frames and a short glossary in the home language. Visuals can't be solved cheaply. Offer "draw here" boxes and labelled picture placeholders in place of images.

**5. Priya (7th grade science).**
*Love:* the lab tool with a data table, cheap materials and a safety section. *Leave:* when she sees a hallucinated NGSS code, an unsafe step, or finds there are no diagrams. *Change that matters most:* a validated standards picker (CCSS and NGSS lists) so codes are quoted rather than invented, plus a vetted lab set in the library. A defensible safety section from a small model is a risk. A blunt "review all safety steps yourself" banner is better than implied assurance. The missing diagrams are a permanent gap.

**6. Sam (substitute).**
*Love:* a one-tap sub plan he can read on a phone and run with a notebook and a whiteboard. *Leave:* if the page is slow, cluttered with ads on mobile, or assumes a printer. *Change that matters most:* a "no copies available" option on the sub plan and worksheet tools (board work, read-aloud, notebook paper), mobile-first output with large type, and a browser-saved "recent documents" list so he can find yesterday's plan.

**7. Rachel (homeschool, three kids).**
*Love:* free, no account, and anything that shortens planning. *Leave:* when she discovers there is no way to plan a week across subjects and ages, and each document is a separate transaction. *Change that matters most:* a "Setting: homeschool, mixed ages" option plus a Week Planner tool (one entry in tools.ts) that outputs a short grid. The length cap will limit it, so keep it to a grid with links to generate each piece. She is also the persona most likely to hit the document limit, since she makes many documents for three children.

**8. Earl (rural K-8).**
*Love:* light pages, text that prints cleanly in black and white, and "student copy without answer key". *Leave:* if the web filter blocks the site or its ad network, if pages are heavy, or if every print job wastes a page on the key. *Change that matters most:* print controls (student copy only, compact, black-and-white-safe) and a very light page. He also lives behind a shared school network address, so the per-network cap hits him first. Free-form combined 5th/6th requests need a "two grades in one room" hint.

**9. Angela (instructional coach).**
*Love:* a private share link she can drop into Drive, and a library consistent enough for a team to rely on. *Leave:* if weaker teachers produce confident but wrong lessons, because she judges the tool by them. *Change that matters most:* the trust package (checked labels, answer check, validated standards) and a generous school-level cap. Team workspaces would help her but should not be built. Shared links plus a small set of vetted templates get 80% of the value.

**10. Dr. Chen (district privacy director).**
*Love:* a short, precise page that says what data goes where, no trackers beyond a named ad vendor, no student data, and a stable domain. *Leave (and block the whole district):* vague language, ad networks that set cross-site cookies, or any statement that turns out to be inaccurate. *Change that matters most:* a district-readiness page and a clean "school mode". Concretely: contextual ads only, a list of subprocessors including the AI vendor, retention stated exactly, and a one-click ad-free mode for school networks. The README mentions both "no storage of IP addresses" and an `IP_SALT`; if a hashed address is stored for rate limiting, say so. Accuracy matters more to this reader than reassurance, and he is the gatekeeper for every teacher in his district.

**11. Marcus (10th grade English).**
*Love:* discussion questions about the text his class is actually reading, and rubrics that match his state's writing standards. *Leave:* on the first piece of generic AI prose, and because discussion questions take only a topic, not a pasted passage. *Change that matters most:* a "paste the text or excerpt" field on discussion questions, quiz, rubric and study guide, plus a "my standards or criteria" box. A feedback-comments tool on student writing is tempting but would push student work through the model, so I would not build it yet. A small model's prose will stay a little generic. Accept that.

**12. Tanya (kindergarten).**
*Love:* hardly anything as described, since a text worksheet is useless to her. A big-print, lots-of-white-space, "draw here" and counting-with-emoji mode would give her something. *Leave:* immediately, if she sees paragraphs and underscore lines. *Change that matters most:* an early-grades print mode (very large type, draw/trace boxes, emoji as pictures, no reading required of children). This is medium effort, serves only a few personas, and the site will never give her real pictures. I rank her as a persona to accept losing, with a prompt-level mitigation only.

**13. Coach Rivera (PE/health, some art).**
*Love:* stations and activity plans on a phone, with no classroom assumptions. *Leave:* when the lesson plan assumes desks, handouts and a projector. *Change that matters most:* a "Setting" selector (classroom, gym or field, small group, one-to-one, homeschool) that changes what the model assumes, and a skills-rubric preset. This is a prompt change plus one dropdown, and it serves several personas at once.

**14. Amara (Year 5, UK).**
*Love:* British spelling, metric units, "Year 5", and National Curriculum language by default. *Leave:* on the first "Grade 5" or "color" or "dollars". *Change that matters most:* a Region/curriculum selector (US, UK, other, free text) that sets spelling, units, year naming and curriculum references. Prompt-only and cheap. The grade picker ("K, 1, 2...") must also accept "Year 5". Be honest that curriculum alignment outside the US will be loose and say so.

**15. Jordan (tutor).**
*Love:* a quick diagnostic on one skill, targeted practice, and a short summary to send parents afterwards. *Leave:* if he needs more than two clicks to get a 10-minute check. *Change that matters most:* a "Skill check" tool (a short ladder of items from easy to hard, with a scoring note that says what to do next) and a Family Email preset for "session summary". Both are small additions to tools.ts. The "one-to-one or small group" setting option also fits him.

**16. Emily (student teacher).**
*Love:* a lesson plan with objectives, standards and reflection, shaped like her university's template. *Leave:* if the output doesn't map to her required headings, or if the standards codes are wrong while she is being observed. *Change that matters most:* a "Use my format" box on lesson plan where she pastes her template headings, plus validated standards. She also needs a plain warning to check her program's rules on AI use. The site shouldn't present itself as a way to avoid thinking about the lesson.

**17. Brooke (TPT seller).**
*Love:* speed. *Leave:* when she sees plain text with no design, and no clear answer on ownership and resale. *Change that matters most:* an honest, plain terms statement on what she may do with output, including that copyright in AI output is uncertain and that marketplaces have their own AI-disclosure rules. Do not build branding or design features for her. She is the clearest persona to accept losing.

**18. Sofía (dual-language).**
*Love:* a family message in both languages that sounds natural, and bilingual versions of materials. *Leave:* on stilted Spanish, or because only the family email supports a second language. *Change that matters most:* an "Also in Spanish" option on every tool and on the revision row, labelled as a draft to check, since a small model's Spanish will vary. Dropdown and prompt work. Be honest in the interface rather than promising native-quality text.

**19. Devon (blind, screen reader).**
*Love:* a plain-text-first site is a real advantage for him, if headings, tables and form controls are properly marked up. *Leave:* if text streams in without a sensible announcement and the screen reader babbles, if the Word and PDF exports are not structured, or if "underscore underscore underscore" blanks are read out character by character. *Change that matters most:* an accessibility pass tested with a real screen reader. That means real heading and table-header semantics in the page and in the Word export, a polite live-region announcement when generation completes, and a "screen-reader-friendly" option that turns underscore blanks into "Answer:" lines. Offer a plain structured text download. Do not leave this to the end. Without it the site fails him completely, and a district will ask about it.

**20. Pat (paraprofessional).**
*Love:* the home box, if it takes one plain sentence and gives something printable in a minute. *Leave:* when faced with 24 tool cards or a long form. *Change that matters most:* tap-to-start examples on the home page ("Practice for a small group", "Make this easier") and one-click revisions after generation. A "small group" setting and "no copies" option fit his situation. He has no say over curriculum, so a "paste the worksheet topic you were given" path matters.

---

## Part 2: The 10 changes that most improve the site

Counts are my judgement of how many of the 20 people each change materially helps.

**1. Fix the per-network cap (helps about 9: Angela, Earl, Dr. Chen, Maya, Emily, Pat, Denise, Priya, Rachel).**
*Build:* give each browser its own allowance of 40, raise the per-network cap substantially (a school can easily have 50 teachers behind one address), keep the global cap as the real cost control, and add Cloudflare Turnstile (already on the "not built" list) so abuse is handled by challenge instead of by blocking schools. Show the limit message kindly with a reset time, and don't count revisions the same as new documents.
*Effort:* small. *Risk:* a higher network cap raises worst-case cost, but the global daily cap and the provider spend limit already bound it.

**2. Make the answer keys trustworthy (helps about 10: Maya, Frank, Priya, Emily, Angela, Marcus, Jordan, Earl, Rachel, Amara).**
*Build:* (a) before launch, generate about 50 quizzes and worksheets and have a math teacher and a science teacher check the keys, so you know the real error rate; (b) add stricter prompt rules for keys; (c) add an opt-in "Double-check answers" button that re-solves independently and flags disagreements (costs one extra call only when clicked); (d) label every generated key "AI draft, check before use" and every library item "hand-checked".
*Effort:* medium. *Risk:* the same small model checking itself will miss errors. Call the button a "second look", never "verified", or it creates false confidence. This one change decides whether skeptics and careful teachers stay.

**3. One-click revision row (helps about 11: Denise, Luis, Frank, Tanya, Sofía, Pat, Jordan, Maya, Earl, Rachel, Sam).**
*Build:* chips under every document: easier, simpler words, fewer questions, add sentence starters, bigger spacing, make Version B, also in Spanish, shorter. They call the existing revision path with a fixed instruction.
*Effort:* small. *Risk:* chips multiply calls, so decide how they count against the daily limit.

**4. District-ready privacy and ads (helps about 5 directly, but gates whole districts: Dr. Chen, Denise, Angela, Earl, Emily).**
*Build:* a one-page "for school technology staff" statement that names every third party (ad network, AI vendor, hosting), says exactly what is retained (including any hashed network address used for rate limiting), and what is not. Use contextual-only ads, and add a school mode (no ads, no third-party scripts) switched by a URL parameter that a district can allowlist. Have a qualified person review `/privacy` and `/terms`, as the README already says.
*Effort:* small to medium. *Risk:* one inaccurate sentence here does more damage than having no page. Write only what you can prove.

**5. Remember things in the browser (helps about 10: Maya, Sam, Rachel, Emily, Angela, Earl, Pat, Coach Rivera, Jordan, Denise).**
*Build:* store the last 20 documents and the teacher's defaults (grade, subject, region, language) in local browser storage. No server storage, no accounts, and it fits the privacy story.
*Effort:* small to medium. *Risk:* storage can be cleared or unavailable, so the site must work without it. Say plainly that nothing is saved on the server.

**6. Accessibility pass (helps about 4 directly, and is a baseline for every school: Devon, Denise, Dr. Chen, Pat).**
*Build:* proper headings, table headers and labels in the page and in the Word export; an announcement when streaming finishes instead of constant updates; a screen-reader-friendly blanks option; a plain structured text download. Test with a real screen reader.
*Effort:* medium. *Risk:* streamed text and editable output are the likely trouble spots.

**7. Context options on every tool (helps about 9: Amara, Sofía, Luis, Coach Rivera, Jordan, Rachel, Sam, Earl, Pat).**
*Build:* one shared block of optional fields: region/curriculum (US, UK, other), "also in Spanish" (or another language), setting (classroom, gym, small group, one-to-one, homeschool), and copies (none / limited / normal). They add a sentence to the prompt.
*Effort:* small. *Risk:* more fields make the form heavier, so keep them folded under "more options".

**8. Paste-in text and "my format" fields (helps about 8: Emily, Marcus, Angela, Pat, Jordan, Denise, Luis, Frank).**
*Build:* a "paste the text" field on discussion questions, quiz, rubric and study guide (as the text leveler already has), and a "use my format" box on lesson plan for template headings. Include the same "no student names" help line.
*Effort:* small. *Risk:* pasted copyrighted text. Keep the text leveler's "only paste what you may adapt" wording.

**9. Grow and harden the library, and start from it (helps about 10: Maya, Sam, Pat, Earl, Emily, Angela, Rachel, Priya, Jordan, Coach Rivera, plus traffic and revenue).**
*Build:* use a stronger model once, offline, to draft new library resources, then read and fix each one yourself, since a one-time cost of a few cents each is affordable even though per-visit use is not. Make "make my own version" revise the vetted document instead of generating from scratch. Prefer gaps the personas point to: sub plans, early grades, ESL, labs, PE.
*Effort:* medium to large, because your reading time is the real cost. *Risk:* publishing piles of unreviewed pages hurts search rankings, so quantity must not outrun your review.

**10. Validated standards picker (helps about 7: Maya, Angela, Priya, Emily, Frank, Jordan, Marcus).**
*Build:* a static list of CCSS and NGSS codes with their exact wording, chosen from a dropdown or search box, and passed to the model verbatim. Keep free text for state standards, labelled "not checked".
*Effort:* medium (mostly data preparation). *Risk:* state standards vary widely, so don't imply coverage you don't have.

**Close calls that missed the top 10:** an early-grades print mode (large type, draw/trace boxes, emoji as pictures; helps Tanya, Maya, Sofía, Luis, Rachel; medium effort); and new tools for Week Planner and Skill Check (small each, but they enlarge a catalogue that is already too big).

---

## Part 3: What the site should deliberately NOT do

1. **Do not generate images or diagrams.** The cost, error rate and ad economics don't work, and a wrong diagram in a science handout is worse than none. *Accept losing:* Tanya, and most of what Priya and Luis want visually. Offer "draw here" boxes and picture placeholders as the honest substitute.
2. **Do not build accounts, saved classrooms, team workspaces or anything student-facing.** It would break the no-sign-up promise, create a student-data problem and bury a one-person operation. *Accept losing:* Angela's team-management wish and Brooke's brand-library wish. Shared private links cover most of what Angela needs.
3. **Do not court TPT sellers or promise "native-quality" Spanish, "verified" answers, or "standards-aligned" output.** Brooke's use makes a legal and reputational question the owner can't settle, and the others are claims a small model cannot honestly support. *Accept losing:* Brooke, and some of Sofía's trust.

---

## Part 4: What the owner is most likely wrong about

- **"A tenth of a cent per document" is the wrong frame for quality.** It is the right frame for survival, but the product's real cost is a teacher's trust. One wrong key spreads by word of mouth among exactly the people the site depends on. Budget for a pre-launch accuracy test and a small, targeted check feature, not for a bigger model on every document.
- **The 40-per-network cap looks conservative but is school-hostile.** It probably blocks whole buildings by mid-morning, and teachers at those schools are the core audience. This is the likeliest launch-week failure.
- **The 24 tools are not the product.** The owner has spent the design effort on breadth. Teachers, especially the least confident ones, will use the home box and the revision loop. Spend the next effort there, not on tool number 25.
- **Ads feel harmless to the owner and look like a risk to districts.** A privacy director sees an ad network on a site that teachers use near student work. Ad placement and wording of the privacy page decide whether the site is blocked, which matters more than ad revenue per page view.
- **The library is treated as an SEO asset, but it is really the trust asset.** The 27 hand-checked items are the only thing a cautious teacher can rely on. Growing it, and letting teachers build on it, is a better use of a stronger model than generating live documents with one.
- **"No accounts" is a strength but "nothing saved" is a cost.** Browser-only recent documents and remembered defaults keep the promise and remove most of the pain.
