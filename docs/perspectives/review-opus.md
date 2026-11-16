# Review: Claude Opus

Grounding: I read the prompt, the personas, `README.md` and `src/tools.ts`. Where I say "the site does X" I mean what those files show. I did no outside research. Where I rely on general knowledge, I say so.

A few concrete facts from the code shape several judgements below:

- The **grade field takes one grade**. There is no way to say "combined 5/6", "ages 6, 9 and 13" or "Year 5".
- The **Sub Plan tool needs a topic** ("What should students work on?"). It is built for the teacher who will be absent, not for the substitute who turns up with nothing.
- **Discussion Questions, Rubric and Lesson Plan give you 1,500 characters at most** in "Anything else?". You cannot paste a chapter, your state's rubric language or your university's lesson template. Only the Text Leveler takes long text (7,000 characters).
- The **Text Leveler gives one level per run**. Luis needs five levels, so he has to run it five times and use up five of his 40 documents.
- The **Family Email has a language field**, which is good. No other tool has one.
- A **US-only site already uses British spelling** in its copy and prompts: "practise" (Choice Board), "behaviour" (IEP goals), "personalise" (Family Email). American teachers will notice, and the model may copy it into documents. It is a small thing, but it shows nobody has thought about locale on purpose.
- **The 40-a-day limit counts per network**, and the IP addresses are hashed. Almost every school sends all of its traffic out through one public IP address.

---

## 1. The 20 people

**1. Maya (first-year, 2nd grade).** She would love the home-page box: she types "phonics worksheet on short a, 2nd grade" at 9pm and has something printable in a few seconds, without signing up. She leaves when the "2nd grade worksheet" turns out to be a page of small text with underscore blanks and no pictures, which her 7-year-olds can't work with on their own. One wrong answer in a key would also do it, because she trusts the site to check things for her. **Most important change: a K-2 print layout (large type, handwriting lines, simple line icons, picture boxes), so early-grades output looks like something you could hand to a 7-year-old.**

**2. Frank (veteran HS math).** He would love one-click "Version B" of a quiz, with the same skills, different numbers and a correct key. That is exactly the narrow job he would hand over. He leaves the first time he finds a wrong answer in a key. On a small, cheap model doing multi-step algebra, that will happen. The "Double-check every calculation" line in the prompt does not make it stop. **Most important change: math answer keys checked by computing the answers, not by trusting the model, plus a "Make version B" button.**

**3. Denise (K-5 SPED resource).** The IEP Goal Ideas tool is set up sensibly: it warns against identifying details and frames the output as drafts. She would use it. She leaves if she can't quickly turn one grade-level worksheet into three or four modified versions, or if she can't tell her administrator exactly where typed text goes (Anthropic? stored? used for training?). The name warning is only help text that is easy to skip, and nothing checks for names. **Most important change: "Make tiered versions" on any document (the same content at 2-4 support levels in one go), backed by a plain data-handling statement she can show her administrator.**

**4. Luis (MS ESL, five proficiency levels).** The Text Leveler is the closest thing to what he needs, and it is a real help. But he needs five levels side by side, sentence frames for each level, a home-language glossary and visuals, and he gets one level per run with no images. He won't leave in a minute, but he will go back to the paid tools built for this. **Most important change: multi-level output in one run, with sentence frames per WIDA-style level and an optional home-language glossary column.**

**5. Priya (7th grade science).** She would like the Lab tool's cheap-materials focus and blank data tables. She leaves because there are no diagrams, and because "safety notes" written by a small model are not something she can defend to a principal. Standards are a free-text box the site does not check, so NGSS alignment is only as good as what the model claims. **Most important change: honest labelling plus a "describe the diagram to draw" convention, with labelled-diagram placeholders. Real diagrams are out of scope, so at the very least do not pretend otherwise. The real fix (curated, vetted labs in the library) is slow.**

**6. Sam (day-to-day sub, phone, no printer).** He is the person the site seems built for and actually fails. The Sub Plan tool assumes he knows the topic. Output is built to be printed. On a phone, a long streamed document with ads around it is hard to use five minutes before the bell. **Most important change: an "I'm a sub with nothing" mode (grade + minutes → no-copy activities he can run from a phone or the board), plus a projector/read-aloud view.**

**7. Rachel (homeschool, ages 6/9/13).** She would love that it is free and has no paywall, because she pays for everything herself. She leaves because she wants "plan my week across subjects for three kids", and the site makes her run separate one-grade, one-tool requests that don't add up to a week. She isn't a trained teacher, so she can't spot a weak plan. **Most important change: allow several grades in one request, plus a weekly multi-subject planner, which can be a tool entry with a good prompt.**

**8. Earl (rural K-8, combined 5/6, slow, filtered, B&W quota).** He likes text-only output: it is light, it prints in black and white, and there are no colour images to waste toner. He leaves if the web filter blocks the site, which is likely: ad-supported sites with third-party ad scripts are exactly what strict school filters categorise and block. He also can't choose "5th and 6th". **Most important change: getting through school filters (no third-party ad or tracking scripts on tool pages, a clean domain category). Second, a multi-grade selector and a compact ink-saving print mode with a page-count estimate.**

**9. Angela (coach, 4th grade lead).** She judges the site by what her weakest teacher produces, and on a small model plus free text, output quality will vary. She leaves when she finds she can't fix a team format: every teacher's lesson plan looks different, there is no shared template, and it can't go straight to Drive. She is also the person most likely to hit the 40-per-network limit, by getting her whole team onto it at a PD session. **Most important change: shareable "team settings" links (a fixed template, grade, standards set and tone encoded in the URL, so no accounts are needed), plus fixing the per-network limit.**

**10. Dr. Chen (district privacy director).** He decides whether 10 to 20 of these people can use the site at work at all. He looks for third-party ad scripts (AdSense means Google cookies and possibly personalised ads on staff devices), the AI subprocessor (Anthropic), what happens to typed text, and whether there is a signed data-privacy agreement. Most of those answers are currently "talk to a lawyer". "No student data by design" is a strong position, but the site does not prove it, so he blocks it by default. **Most important change: a one-page "For IT and privacy staff" sheet (what is collected, subprocessors, retention, no student data, no personalised ads), with the ad set-up changed to match it.**

**11. Marcus (10th grade English).** He hates generic AI prose, and a small cheap model writes exactly that: flat, list-heavy and safe. Discussion questions about "Chapters 1-3 of the class novel" will be generic, because the model has not read his edition and he can't paste the chapter (1,500-character limit). Feedback comments on student writing would mean pasting student work, which the site rightly discourages. **Most important change: let him paste the actual text, up to the 7,000-character limit the Text Leveler already has, for discussion questions and rubrics, so questions are tied to real passages. Expect to lose him for feedback on student writing anyway.**

**12. Tanya (kindergarten).** The site as described fails her. Her students can't read; underscore blanks and numbered questions are useless to her. She needs tracing, pictures, cut-and-paste and songs, and only the songs are text. **Most important change: the K-2 print layout (dotted tracing lines, picture boxes, line icons placed from text tokens, cut lines). Even with it, centers and cut-and-paste crafts are mostly out of reach, and the site should accept that.**

**13. Coach Rivera (PE/health + art, phone in the gym).** PE & Health and Art are in the subject list, but the tool fields and prompts assume a classroom, desks and paper (name/date lines, worksheets). He won't stay if the "lesson plan" for a gym class arrives as a 45-minute classroom sequence with a written exit ticket. **Most important change: a "Where" setting (classroom / gym / outdoors / art room) that changes the prompt, plus a stations or circuit card format readable on a phone.**

**14. Amara (UK Year 5).** She will see "Grade", US spelling (where the copy is consistent), US units and CCSS placeholders, and decide within seconds that it isn't for her. Asking in the free-text box sometimes works, but she shouldn't have to every time. **Most important change: a remembered country setting (US / UK / Ireland / Canada / Australia / Nigeria / other) that maps Year to grade, sets spelling and units, and names the right curriculum. It is a prompt change of only a few lines.**

**15. Jordan (tutor, grades 3-10).** He would like the speed and the range of grades. He needs a short diagnostic that maps each item to a sub-skill ("missed 3 and 7 → can't regroup across zero"), then targeted practice on one skill, then a parent note. The site has the parts (quiz, worksheet, family email) but nothing connects them. **Most important change: a Diagnostic Check tool whose key names the skill each item tests and what to practise if it is missed, plus a "Session note for family" button on any document.**

**16. Emily (student teacher, university template).** She would love a free, quick formal lesson plan the night before an observation. She leaves when it comes out in the site's fixed format and her university's template has different headings (rationale, prior knowledge, reflection) that she can't paste in. **Most important change: "Use my template": paste your headings, and the plan follows them exactly. Remember it in the browser.**

**17. Brooke (TPT seller).** She wants to know whether she owns the output and can sell it, and whether it looks designed. The answer to the second question is no and will stay no on this architecture. She will use it at most to draft text she then lays out in Canva. **Most important change: clear terms that say she owns what she generates and may use it commercially (the library is a separate matter). After that, accept that she isn't the audience.**

**18. Sofía (dual-language 1st grade).** The Family Email language field is a good start, but every other tool is English-only unless she asks in free text, every time. A small model's Spanish is usually correct, but it often sounds translated: literal phrasing and regional mix-ups. For 1st graders she also needs the K-2 layout. **Most important change: a remembered language setting with a "bilingual, side by side" option on every tool, with the Spanish written directly rather than translated (prompted that way), and an honest note that a fluent speaker should check it.**

**19. Devon (blind HS history teacher).** Text-first output is actually an advantage for him: no image-only worksheets. He leaves if the stream is read out token by token by an aria-live region, if action buttons are icon-only or unlabelled, or if the Word download puts out bold paragraphs instead of real headings and tables without header rows. Nothing in what I read suggests anyone has tested this with a screen reader. **Most important change: an accessibility pass (announce only "document ready", real heading and table semantics in the Word and Docs exports, fully keyboard-operable, tested with NVDA and VoiceOver), plus a large-print and plain-text export for braille translation.**

**20. Pat (paraprofessional, low tech confidence).** The single box on the home page suits Pat: no account, nothing to learn. Pat leaves if they have to choose between 24 tools and work out what "differentiation" or "choice board" means, or if the output needs editing before it can be used with a small group in five minutes. **Most important change: plain-language starting points on the home page ("I have 10 minutes with 4 kids who are stuck on ___"), plus library resources usable as they are.**

---

## 2. The 10 changes I would make, ranked

Counts are people from the list above who benefit directly. Effort assumes one person.

### 1. Change the daily limit from "per network" to "per browser, with a high network ceiling"
- **What:** give each browser a signed quota cookie (40/day), raise the per-network cap to several hundred, and show a Cloudflare Turnstile check only when a network gets near its ceiling. Keep the global cap as the real cost guard.
- **Helps (15):** anyone who works on a school network: Maya, Frank, Denise, Luis, Priya, Sam, Earl, Angela, Marcus, Tanya, Rivera, Emily, Sofía, Devon, Pat. Today one keen grade-level team can use up a whole school's allowance before lunch, and the site then tells every other teacher in the building they are done for the day. That is the worst possible first impression, and it hits exactly the word-of-mouth case you want.
- **Effort:** small to medium.
- **Risk:** people can clear cookies to get more. The global cap and the provider spend limit still hold, and Turnstile is already listed as "not built yet".

### 2. Make the site pass a district privacy review
- **What:** (a) Serve only non-personalised, contextual ads, or keep ads off tool pages and show them only on library pages. (b) Add no third-party analytics. (c) Publish a one-page sheet for IT and privacy staff: what is collected, the subprocessors (Cloudflare, Anthropic, the ad network), retention, "no student data by design". (d) Run a check in the browser for things that look like names, dates of birth or ID numbers before a request is sent, and warn the teacher.
- **Helps:** 4 directly (Dr. Chen, Denise, Earl, Angela), and it decides whether roughly 15 people can use the site at school at all.
- **Effort:** small to medium. It is mostly writing and ad settings, with a little client-side code.
- **Risk:** non-personalised ads pay less. I still think it is the right trade: a blocked site earns nothing during the school day.

### 3. Check answer keys instead of trusting them
- **What:** for Math Word Problems, Worksheet (math), Quiz and Bell Ringers, have the model put each numeric answer in a hidden machine-readable block as an expression, compute it on the server with a safe evaluator, and flag any mismatch inline ("Check #7"). For non-numeric quizzes, run a short, cheap second pass that only re-answers the questions and compares the answers. Show "Key re-checked", never "Verified correct".
- **Helps (12):** Frank, Maya, Rachel, Jordan, Pat, Sam, Emily, Earl, Angela, Amara, Denise, Priya.
- **Effort:** medium.
- **Risk:** the second pass adds roughly 30-60% to the cost of those tools only. Checking arithmetic in code costs nothing. A badge can create false confidence, so word it carefully. This is where I would spend money: one bad key loses a teacher for good, and an ad impression doesn't win them back.

### 4. One-click variants of any document
- **What:** after any result, offer buttons for "Version B (same skills, new numbers/order)", "3 support levels", "Simpler", "Harder" and "For English learners". Each one is a second request seeded with the first document.
- **Helps (10):** Frank, Denise, Luis, Earl, Rachel, Jordan, Angela, Pat, Maya, Sofía.
- **Effort:** small. The revision path already exists.
- **Risk:** each click is one more document against the limit, which is another reason to fix change 1.

### 5. Remembered settings for country and language
- **What:** settings saved in the browser for country (spelling, units, Year/Grade mapping, curriculum names, standards examples) and language (English / Spanish / bilingual side by side / other). They feed into every prompt. Also fix the stray British spellings in the US copy.
- **Helps (6):** Amara, Sofía, Luis, Maya, Denise and Jordan (the last three for family messages). It also opens up search traffic from outside the US at no extra cost.
- **Effort:** small.
- **Risk:** the small model's non-English writing quality. Label it a draft for a fluent speaker to check. Don't promise "natural Spanish" unless you have had a native speaker test it.

### 6. Use your own template, use your own text, and share settings with a team
- **What:**
  - Lesson Plan, Unit Plan and Rubric get an optional "Paste your template headings / your standards language" field.
  - Discussion Questions, Rubric and Study Guide accept pasted source text up to 7,000 characters.
  - Settings are remembered in the browser.
  - A "Share these settings" link encodes the template, grade, locale and tone in the URL, so a whole team gets the same format without accounts.
- **Helps (8):** Emily, Angela, Marcus, Denise, Rachel, Maya, Priya, Jordan.
- **Effort:** small.
- **Risk:** long pasted text raises input cost a little, and copyright: keep the existing "only paste text you have the right to adapt" warning.

### 7. Print layout for K-2 and icons in the text
- **What:**
  - A "Young learners" print stylesheet: large type, primary handwriting lines, a dotted tracing font (open-licensed), picture boxes and dashed cut lines.
  - The model can put tokens such as `[icon: apple]`, which the page replaces with black-and-white line icons from an open-licensed icon set bundled with the site.
  - No AI images, so the cost stays the same.
- **Helps (8):** Tanya, Maya, Sofía, Luis, Rachel, Pat, Denise, Jordan (younger students). Earl benefits too, because the icons are line art.
- **Effort:** medium.
- **Risk:** the icons will sometimes miss the meaning. Licence attribution needs handling. It will not make the site a match for designed TPT products, and it shouldn't try.

### 8. Modes for low-resource situations
- **What:**
  - An "I'm a sub with nothing" quick tool: grade + minutes in, no-copy activities out, with nothing about the topic required.
  - A projector/phone view: big type, one item at a time, a read-aloud script.
  - A compact ink-saving print mode with an estimated page count before printing.
  - A "Where" setting (classroom / gym / outdoors) for PE and similar subjects.
- **Helps (7):** Sam, Rivera, Earl, Pat, Rachel, Jordan, Maya.
- **Effort:** small to medium.
- **Risk:** low.

### 9. Accessibility pass on the site and every export
- **What:**
  - Announce only when generation starts and finishes, not each streamed chunk.
  - Give every button a label and make every action work from the keyboard.
  - Give the Word and Docs exports real headings and table header rows.
  - Add placeholders for describing images or diagrams.
  - Add large-print and plain-text/Markdown exports for braille translation.
  - Test with NVDA and VoiceOver.
- **Helps:** 3-4 directly (Devon, Denise, Tanya with large print, Earl with a lighter page). It also matters to Dr. Chen: from general knowledge, US public bodies are under new web-accessibility obligations, so an accessible tool is easier to approve.
- **Effort:** small to medium.
- **Risk:** none worth naming. Not doing it is the risk.

### 10. Grow the library on purpose, in the gaps
- **What:** go from 27 to a few hundred hand-checked resources, weighted towards what the generator does badly or what people need with no time at all: sub-day packs, K-2 printables (once change 7 exists), multi-grade sets, PE stations, bilingual family letters, and checked math sets with A/B versions.
- **Helps (9):** Sam, Pat, Maya, Rachel, Earl, Rivera, Sofía, Frank, Angela.
- **Effort:** large and ongoing, mostly the owner's own time reviewing.
- **Risk:** burnout. The owner reviewing every shared item is a bottleneck. Search engines are wary of thin AI pages, so each one has to be genuinely checked or this hurts more than it helps.

Just missing the list: a Diagnostic Check tool (Jordan), a multi-grade weekly planner (Rachel, Earl), and plain-language home-page starting points (Pat). Each is small. I would do them soon after the ten.

---

## 3. What not to do

1. **Don't add accounts, cloud storage, an LMS or Google Classroom integration, or anything students use directly.** As soon as students touch it, or teachers store class information on it, it becomes an edtech vendor that needs data agreements and has student-privacy law exposure, and one person cannot carry that. "Teacher-only, nothing about students, nothing stored" is the site's best asset with Dr. Chen. **Accept losing** Angela's wish for Drive-native team workspaces (the settings links in change 6 cover most of it).
2. **Don't chase designed, TPT-style visuals or AI-generated images.** They would blow up the cost per document, add a new kind of quality failure (wrong pictures for children), and set the site against Canva and TPT on their strongest ground. **Accept losing** Brooke, and the centers and cut-and-paste half of Tanya's needs. Priya's diagrams are in the same category.
3. **Don't take student work or student data as input:** no "paste a student essay for feedback", no "upload an IEP to summarise". It is the privacy line, and the small model would also do it badly. **Accept losing** Marcus's feedback-comment use and the parts of Denise's work that need real student records.

(Also: don't switch the whole site to a bigger model. Spend extra model calls on checking, as in change 3, not across the board.)

---

## 4. What the owner is most likely wrong about

**That the site's users are individuals on home wifi.** In fact they are employees on school networks run by someone like Dr. Chen.

Three design choices come straight from that assumption, and they compound each other:

- **The limit is per network.** A school is one network, so the site rations a whole building as if it were one person.
- **The site is paid for with third-party ad scripts.** Those are the first thing school filters and privacy reviews flag. So the money model is what is most likely to get the site blocked during the hours teachers would use it most.
- **Privacy is left to "have someone qualified read /privacy".** For this audience, privacy is not a legal footnote. It decides whether the site is reachable at all.

The README's plan (grow on library search traffic, then move to premium ad networks) is a consumer-website playbook. Teachers do search at home on Sunday nights, and that part will work. But word of mouth among teachers happens in a building, on the school network, at a PD day, and the current design breaks right at that moment.

A second, related mistake: **treating "free, fast, no sign-up AI documents" as the edge.** By 2026 that is a commodity. Teachers have general chatbots and several free, school-licensed teacher-AI tools. A small model's text-only output can't win on polish. It can win on being **trustworthy and immediately usable**: keys that have been re-checked, a format that fits their country, grade and template, output that prints well on a black-and-white printer or works on a phone, and a vetted library. Most of my top ten are about that, and almost none of it needs a bigger model.
