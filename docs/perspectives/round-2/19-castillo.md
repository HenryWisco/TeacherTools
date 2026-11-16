# Mr. Castillo, district special education director

**Verdict:** Would approve with conditions. I would not put this on our approved-tools list as it stands, mainly because of the IEP tool and the privacy page. The conditions are specific and fixable.

**In one sentence:** The drafts are better than I expected and the site says the right things about student names, but when I typed a student's name and diagnoses into the IEP tool nothing stopped me and the name was printed in the document title, and the privacy page is not yet something I could hand to our data-privacy officer.

## What I did

Pages visited: home, /tools, /tools/iep-goals, /tools/accommodations (the "Differentiation Ideas" tool), /tools/report-comments, /privacy, /terms, /about, /support, /my, /library, a library search for "IEP", and one library resource (20 Community-Building Bell Ringers, grade 9).

Documents generated (three):

1. `19-01-iep-goals.md` - IEP Goal Ideas, grade 4. On purpose I typed what a rushed teacher would type: a first name and initial ("Marcus T."), "autism and ADHD", a reading fluency level, a writing level, and a seat-leaving count.
2. `19-02-accommodations.md` - Differentiation Ideas, grade 7 social studies. A unit-test essay on causes of the American Revolution, for a class with four IEPs (two reading disabilities, one autism, one emotional disability), two 504 plans and three English learners. I asked it directly "what accommodations and modifications to give them."
3. `19-03-report-comments.md` - Report Card Comments, grade 5 ELA, three versions. I said the student has an IEP for a specific learning disability, gets resource room four days a week, reads two grade levels below, and I added "I think he may also have ADHD and should be evaluated" to see what it would do with that.

## Problems found

### 1. The IEP tool accepted a student's name and diagnoses and printed the name in the document title - BLOCKER
- **Where:** IEP Goal Ideas tool; sample `19-01-iep-goals.md`, first line.
- **What I saw:** The form says "Never enter a student's name, ID, diagnosis details or anything that could identify them." I entered "Marcus T. is a 4th grader with autism and ADHD..." There was no refusal and no warning in what came back, and the document is titled **"IEP Goal Ideas: Marcus T., Grade 4"**. It also refers to the student as "his". (Credit where due: it did leave "autism" and "ADHD" out of the document.)
- **Why it matters:** A name plus disability information is exactly the record FERPA and IDEA confidentiality rules protect. The site has no agreement with my district, so every time a teacher does this it is an unauthorized disclosure to an outside party, and the site's rule against it is only a sentence on the page. Teachers will do this; they are tired and they think in terms of the child.
- **Fix I would want:** Before anything is sent, check the box for things that look like a person's name, an ID number or a date of birth, and stop with a plain message ("This looks like a student's name. Please remove it.") At minimum, the document must never repeat a name: always write "the student". I could not see whether a browser shows a warning that my text-only view missed, but the printed title is proof the name went through.

### 2. Privacy page does not answer the questions a district has to ask - BLOCKER for district approval (major for an individual teacher)
- **Where:** /privacy and /terms.
- **What I saw:** "What you type into a tool is sent to our AI provider (Anthropic) ... and is not stored by us after the document is returned." Nothing about how long Anthropic keeps it, whether it is used for training, or under what agreement. Contact is "Questions or removal requests: the site owner" with no email, name or address. Both pages end with a visible note: "Site owner: review this page with a qualified adviser before launch, and add your business name and address."
- **Why it matters:** I cannot approve a tool when I cannot name the operator, cannot contact anyone about a breach or a deletion request, and cannot tell my superintendent what the AI company does with what was typed. Several states also require a signed data-privacy agreement before staff use an outside service with anything touching student records.
- **Fix I would want:** Name the operator and give a working contact email. State plainly what the AI provider retains, for how long, and that it is not used to train models (if true). Add a short "For schools and districts" paragraph: the site is not designed to receive student records, does not sign district data agreements, and teachers must use it only with de-identified descriptions. Remove the owner notes before launch.

### 3. Seat-leaving goal measures something different from the baseline - MAJOR (real error)
- **Where:** `19-01-iep-goals.md`, Goal Option 3.
- **What I saw:** Baseline I gave: "leaves his seat about 6 times in a 30-minute lesson." The annual goal: "remain in his assigned seat for at least 80% of observed intervals." Objective 1 targets "at least 60% of intervals."
- **Why it matters:** There is no baseline in percent-of-intervals, so nobody can show progress from a starting point. A student who leaves six times briefly may already be seated more than 80% of the time, in which case the first objective is below where he is today. A goal with no matching baseline is the first thing a parent's advocate or a state complaint investigator circles.
- **Fix I would want:** Write the goal in the same unit as the baseline the teacher gave (here, number of unplanned seat departures per 30 minutes: 6 now, 2 or fewer by year end), or state clearly "collect a baseline in this measure before using this goal."

### 4. Writing goal and its own rubric do not agree - MAJOR (real error)
- **Where:** `19-01-iep-goals.md`, Goal Option 2 and the "Sentence Writing Rubric".
- **What I saw:** The goal is "at least six complete ... sentences, with no more than one run-on." The rubric's score 4 is "Six or more complete sentences; no run-ons" and score 3 is "Five complete sentences; one run-on." A paper with six sentences and one run-on meets the goal but fits neither row, and the goal never says which rubric score counts as "met". The baseline for run-ons is only "frequent".
- **Fix I would want:** Make the rubric's top levels match the goal's wording exactly and state the passing score in the goal ("a score of 3 or higher on..."). Where the teacher gave no number for a baseline, say so and tell them to collect one.

### 5. Annual goals have no time frame, and the reading objectives reach the annual target by the third quarter - MINOR to MAJOR (real error)
- **Where:** `19-01-iep-goals.md`, all three goals; reading objectives 1 to 3.
- **What I saw:** Each annual goal starts "Given..." with no "By [date]" or "within 36 instructional weeks". The reading goal's annual target is 70 words per minute at 95%; objective 3 is "By the end of the third quarter ... 70 WCPM with 95% accuracy." That is the annual goal, three quarters in, with nothing for the fourth quarter. The same pattern repeats in goals 2 and 3.
- **Fix I would want:** Start every annual goal with "By [annual review date]" and space the objectives so the last one falls short of, or lands on, the annual date.

### 6. The differentiation sheet labels things "This is an accommodation" as if that were settled - MAJOR
- **Where:** `19-02-accommodations.md`, "Students who need more support" items 5 to 7 and "attention" item 5.
- **What I saw:** "Offer a shortened reading with the same main ideas ... This is an accommodation." Also sentence banks and dictation to a scribe on an essay that I said is the unit test graded on the district writing rubric, each stamped "This is an accommodation." In many districts a shortened text is a modification, and sentence frames on a writing test change what the rubric is measuring.
- **Why it matters:** The opening paragraph is good; it tells the teacher to "check your district's policy and the IEP and 504 plan language." But then 18 separate lines give a flat legal-sounding label. A teacher will read the labels, not the paragraph. If she gives a support that is not in the IEP on a graded test, or withholds one that is, that is an implementation dispute.
- **Fix I would want:** Drop the per-item labels or soften them to "usually an accommodation; a modification if it changes what is graded". Add one firm line near the top: "Accommodations written in a student's IEP or 504 plan must be provided. These ideas do not replace or add to them."

### 7. The differentiation tool ignored two of the four students I described - MAJOR (did not do what was asked)
- **Where:** `19-02-accommodations.md`, whole document.
- **What I saw:** I listed four IEP students: two with reading disabilities, one with autism, one with an emotional disability. The sheet has sections for reading support, English learners, attention needs and challenge. There is nothing for the student with autism or the student with an emotional disability, and no note saying they were left out.
- **Fix I would want:** Either address every group the teacher names, or say plainly which ones were not covered and why (for example, "supports for these students depend on their individual plans").

### 8. Report card comments name the IEP and claim progress I never reported - MAJOR
- **Where:** `19-03-report-comments.md`, Versions 2 and 3.
- **What I saw:** "receives specialized instruction in the resource room four days a week, as outlined in the IEP" and "in line with the IEP". Version 3 also says "[Student] is making progress in reading". I never said he was making progress; I said he reads two grade levels below.
- **Why it matters:** Mentioning special education on a report card that goes to the parent is generally allowed, but report cards get copied for private school applications, camps and custody files, and many districts (mine included) keep IEP references off them and put them in the IEP progress report. The invented "making progress" line is worse: if the IEP progress report says otherwise, the report card becomes an exhibit.
- **Fix I would want:** By default, leave IEP, 504 and service details out of report card comments even when the teacher mentions them, and add a one-line note to the teacher explaining why. Never state progress the teacher did not state.

### 9. Smaller things
- **A "Name: ____ Date: ____" line is printed on teacher-only documents** (all three samples). On the IEP draft it invites someone to write the child's name on it. Minor. Remove it from IEP, differentiation and report-comment outputs.
- **"Five-paragraph essay" described with four paragraphs.** `19-02-accommodations.md`, Level 3 and the essay checklist: "a thesis, two body paragraphs ... and a conclusion." Minor.
- **Contradictory heading.** Same sample, attention item 5: "Provide a typed copy or a shorter writing window" followed by a description of extra time over two sessions. Minor.
- **The teacher's "may have ADHD, should be evaluated" remark was dropped without a word.** Dropping it was the right call. But a teacher who suspects a disability has a duty to refer, and a one-line note ("Left out: concerns about a possible disability belong in your school's referral process, not on a report card") would be worth more than silence. Minor, and partly my opinion.
- **Home page says "nothing is collected about students."** That is only true if teachers follow the rule; see problem 1. I would word it as "the site is not designed to receive student information." Minor.
- **Revise buttons that do not fit** on the IEP and report-comment pages: "More questions", "Sentence starters", "Harder". Minor.

## What worked

- The IEP document opens with the right sentence: "These are draft ideas for the IEP team to adapt, since goals must be individualized by the team based on the student's needs, input from the family, and current data." The tool is named "IEP Goal Ideas", not "IEP Goal Writer". That framing helps against a predetermination complaint.
- It did not recommend service minutes, placements or eligibility categories, and it kept the diagnoses I typed out of the document.
- The reading fluency goal is properly built: condition, behavior, criterion, measurement, weekly probes, three consecutive data points. Most first-year teachers write worse.
- The report card tool used "[Student]" throughout, stayed kind and factual, softened "disruptive" to "has difficulty staying on task", and did not repeat my ADHD speculation.
- The differentiation sheet's opening warning about accommodations versus modifications on a graded test is exactly what I would say in training.
- No ads beside the IEP, differentiation, report-comment and family-message tools, per the privacy page, and no "Share" button on those three tool pages (the home page has one). Good decisions.
- No accounts and documents kept in the teacher's own browser means there is no database of drafts to breach.
- The terms say "Drafts such as IEP goal ideas are starting points for qualified staff, not legal or clinical advice."
- The history in the differentiation sheet (Stamp Act, repeal, Townshend Acts, boycotts, 1763 to 1775) is correct.

## What I could not check

- Whether a browser shows a pop-up warning when a name is typed. My view was text only. The name in the printed title shows it was not stopped either way.
- What the AI company actually keeps, and for how long. The site does not say.
- Whether "My documents" really stays on the device only, and what happens on a shared classroom computer (the next person at that computer may see the last 20 drafts, including IEP drafts). I would want a "clear my documents" button; I could not see whether one exists.
- Print, Word and copy buttons, layout, and how it looks on a phone.
- The Spanish and other language options for IEP goals. A machine-translated goal handed to a parent is its own risk; I did not spend a document on it.
- Whether ads really are absent beside the special education tools.

## What I would say to a colleague about this site

"It writes a decent first draft and it is honest that a draft is all it is. But do not tell your teachers it is approved yet. I typed a made-up student's name and diagnoses into the IEP tool and it took them without a word and put the name in the title. The privacy page does not say who runs the site or what the AI company keeps. If the owner blocks names, fixes the privacy page, and stops the goals from using a measure that does not match the baseline, I would allow it for brainstorming with de-identified descriptions only, and I would still tell staff that nothing from it goes into an IEP or onto a report card without the case manager reading every line."
