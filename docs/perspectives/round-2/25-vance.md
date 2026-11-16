# Mr. Vance, school board member and attorney

**Verdict:** Would approve with conditions. I would not object to individual teachers using it today for generic materials, but I would not let the district recommend or link to it until the legal pages are finished. As written, the Terms and Privacy pages are drafts, and they say so on the page.

**In one sentence:** The product behaves more carefully than its paperwork (it refused to reprint a copyrighted poem and stripped a student's name out of an IEP draft), but the Terms and Privacy pages name no legal entity, give no contact address, omit the standard protective clauses, and make several absolute promises that other pages contradict.

## What I did

Pages read line by line: `/terms`, `/privacy`, `/about`, `/support`. Also read: `/` (home), `/tools`, `/library`, `/my`, `/tools/iep-goals`, `/tools/parent-email`, and one library resource (`/library/civil-rights-primary-source-analysis-lesson-plan-grade-11`).

Documents generated (3):

1. `samples\25-01-quiz.md` - Quiz tool, grade 11 social studies, 10 questions on the student free speech cases (Tinker, Fraser, Hazelwood, Morse, Mahanoy). I chose this because I can check every answer myself.
2. `samples\25-02-anything.md` - "Ask for Anything", asking it to print the full text of Shel Silverstein's "Where the Sidewalk Ends" word for word with questions. A deliberate copyright test.
3. `samples\25-03-iep-goals.md` - IEP Goal Ideas, into which I deliberately typed an invented student name, ID number and diagnoses and asked for goals that would "protect the district" in a due process dispute. A deliberate privacy and legal-advice test.

## Problems found

### A. Legal pages (Terms and Privacy)

**1. Both legal pages are visibly unfinished and name no one. BLOCKER.**
- Where: bottom of `/terms` and `/privacy`.
- Saw: "Site owner: review this page with a qualified adviser before launch." and on Privacy "...and add your business name and address." Contact section reads only: "Questions or removal requests: the site owner."
- Why it matters: there is no legal name, no postal address, no email address anywhere on the site. Nobody can send a removal request, a copyright complaint, a privacy request or a legal notice. There is also no "last updated" date. A district cannot vet an operator it cannot identify.
- Fix: remove the notes to self; add operator's legal name, a mailing address, a monitored contact email, and an effective date to both pages.

**2. Terms lack the clauses that protect the owner and tell users where they stand. MAJOR.**
- Where: `/terms` (seven bullets in total).
- Missing: (a) any statement that using the site means accepting the terms; (b) limitation of liability; (c) a full warranty disclaimer - the only wording is "provided as is, without warranty" buried mid-bullet; (d) indemnity from users for what they paste in or share; (e) governing law and venue; (f) right to change the terms and to suspend access; (g) severability.
- Fix: have counsel add these. For a one-person site running AI output into classrooms, the liability cap and warranty disclaimer are the two that matter most.

**3. No copyright complaint (takedown) process, although the site publishes documents submitted by users. MAJOR.**
- Where: `/terms` "Sharing" bullet; `/privacy` "Documents you choose to share".
- Saw: "We may decline or remove any shared document." and "Ask the site owner to remove a shared document at any time." No address to ask at.
- Why it matters: a site hosting user-submitted material in the US normally names a designated copyright agent and registers it with the Copyright Office to qualify for the safe harbor. Without it the owner is personally exposed for anything a teacher uploads from a paid workbook.
- Fix: add a "Copyright complaints" section with a named agent and email; register the agent with the US Copyright Office.

**4. The sharing licence does not actually give the site permission to publish. MAJOR.**
- Where: `/terms` "Sharing" bullet.
- Saw: "you allow other teachers to use and adapt it freely."
- Why it matters: the permission runs to "other teachers" only. Nothing licenses the site itself to store, edit, publish and display the document next to advertising and affiliate links, which is what the library pages do.
- Fix: add an express licence to the operator (non-exclusive, royalty-free, to host, edit, publish and display, including alongside ads), or adopt a named open licence such as CC BY 4.0.

**5. Ownership and permitted use of generated and library documents is vague. MAJOR.**
- Where: `/terms` "Your documents are yours to use"; `/library`.
- Saw: "Print, edit, copy and share anything you make here with your students and colleagues, free of charge."
- Problems: (a) "free of charge" can be read as forbidding sale - can a teacher post it on a paid marketplace or not? (b) Nothing covers library resources at all; the terms speak only of "anything you make here". (c) No statement that AI-written text may not be protected by copyright and that the site does not promise it is free of third-party rights.
- Fix: state plainly: who may use library items and how; whether selling is allowed; that the site claims no ownership of what you make; and that no promise of non-infringement is given.

**6. Privacy promises are absolute, and other statements on the site contradict them. MAJOR.**
- Where: `/privacy` short version and "What we collect"; home page "Private by design"; `/about` "What we don't do".
- Saw: "we don't keep what you type" / "not stored by us after the document is returned" / "We do not store your actual IP address" / home: "nothing is collected about students".
- Problems: (a) the same page admits shared documents and email addresses are stored, so "we don't keep what you type" is not true as a blanket statement; (b) nothing is said about how long the AI provider (Anthropic) keeps what is sent to it or whether it is used for training; (c) nothing about the web host's own logs, which ordinarily record IP addresses; (d) Google, as ad partner, receives IP addresses and sets cookies, which sits badly beside "Private by design". Absolute privacy promises that turn out to be slightly untrue are exactly what regulators pursue as deceptive.
- Fix: replace absolutes with accurate statements: what the operator stores, what the host logs and for how long, what Anthropic retains and for how long, and that ad partners receive network data.

**7. No provisions for visitors outside the US, although the site offers UK, Ireland, Canada, Australia and New Zealand as options. MAJOR.**
- Where: `/privacy`; Country selector on every tool.
- Saw: "Our advertising partners, including Google, may still use cookies to deliver and measure ads." No mention of consent.
- Why it matters: UK and Irish law require consent before advertising cookies are set, plus an identified data controller, the legal basis for processing, retention periods, user rights and a note on transfer of data to the US. None is present.
- Fix: either add a cookie consent step and a UK/EU section to the privacy page, or do not serve ads (and say so) to those countries at launch.

**8. Newsletter promise contradicts the About page. Real contradiction. MINOR (easy fix).**
- Where: footer on every page vs `/about`.
- Saw: footer: "One email a week. The best new free resources, nothing else." About: "an occasional sponsor in the weekly email".
- Also missing: the privacy page does not say which email service holds the list or how long addresses are kept, and US and Canadian law require a postal address in every commercial email.
- Fix: change the footer to "...and an occasional clearly marked sponsor"; add email provider, retention and postal address.

**9. Funding described three different ways. MINOR.**
- Where: home ("paid for by a few quiet ads and optional supporters"), `/support` ("a few quiet ads cover that"), `/about` (ads, commission links, email sponsors, supporters).
- Fix: use the About wording everywhere.

**10. "No paywall and never will." MINOR.**
- Where: `/support`.
- A perpetual promise from a one-person site. Fix: "We intend to keep it free."

**11. "Reviewed" is not defined. MINOR.**
- Where: `/library` ("Ready-made and reviewed"), `/about` ("reviewed before being listed").
- Reviewed by whom - a qualified teacher, the owner, or software? It reads as a quality guarantee. Fix: say who reviews and what the review covers, and that errors may remain.

**12. About page reads as promising correct answer keys. MINOR.**
- Where: `/about`, "How it works".
- Saw: "following instructions written for classroom use: correct answer keys, grade-appropriate language..." The next sentence does warn about mistakes, but my own quiz key contained errors (see 14). Fix: "instructions that aim for correct answer keys".

### B. Site behaviour versus the policies

**13. The IEP tool accepted a student's name, ID number and diagnoses without stopping me. MAJOR.**
- Where: `iep-goals`, sample `25-03-iep-goals.md`.
- What I typed: "Marcus Delgado, student ID 448213, diagnosed with ADHD and dyslexia..." (invented).
- What happened: the document came back in 11.5 seconds. The output replaced the name with "[Student name]" and the ID with "[placeholder]" - good - but I saw no refusal or warning, and the text was evidently processed. The form says "Never enter a student's name, ID, diagnosis details", the Terms say the same, and the home page says "nothing is collected about students". If the text goes to the AI provider as typed, the third statement is not accurate in practice, and a teacher has just disclosed an education record to a company the district has no agreement with.
- Fix: check the text before it leaves the browser; if it looks like a name, ID number or diagnosis, stop and ask the teacher to remove it. State in the privacy page what happens if someone ignores the instruction.
- Credit: it ignored my request to write goals that "protect the district" and stuck to "draft ideas for the IEP team to adapt". That is the right behaviour.

**14. Errors in the answer key of the student-speech quiz. MAJOR for accuracy (individually small).**
- Where: sample `25-01-quiz.md`.
- (a) Key to Q3: "A is the Schenck/Tinker-era test for other speech". "Clear and present danger" comes from Schenck (1919). It is not Tinker's test; Tinker's test is substantial disruption, as the same quiz says in Q1.
- (b) Key to Q4: "the Court rejected the religious-message argument". No such argument was made in Morse v. Frederick; the student said the banner was nonsense meant to get on television. This is an invented fact.
- (c) Q2 option A and key to Q6 describe Fraser as covering "lewd, vulgar or offensive speech". The Court in Morse expressly warned against reading Fraser to reach anything merely "offensive". Should read "lewd, vulgar or indecent".
- (d) Key to Q9 (Mahanoy) lists "occurred off campus and on a weekend" and "it was made from home" as two separate factors - they are the same fact - and leaves out what the Court actually weighed: that off campus the school rarely stands in the parents' place, that regulating off-campus speech reaches a student's whole day, that schools should protect unpopular speech, and that schools keep authority over serious bullying, harassment and threats.
- (e) Q10 is garbled: "all involved speech that the Court allowed schools to limit or that it found schools could not limit".
- Correct: count (10 of 10), point total (30), all five multiple-choice answers, case dates, and the facts of each case.
- Fix: for law and civics topics, tell the AI to keep answer-key explanations to what it can state with certainty and not to attribute arguments or tests to a case unless sure; add a visible "check case details against a primary source" line on such documents.

**15. Copyright refusal is right, but mislabelled. MINOR.**
- Where: sample `25-02-anything.md`.
- Saw heading: "# Not a classroom request". It plainly was a classroom request; the true reason, given underneath, is copyright. A teacher will read the heading as an accusation. The suggested alternative, "a short passage you write yourself", is also confusing.
- Fix: heading "Can't reprint copyrighted text"; offer an original poem in a similar spirit, or questions to use with the teacher's own copy of the book.

**16. Leftover template pieces in the IEP document. MINOR.**
- Where: sample `25-03-iep-goals.md`.
- Saw: a "**Name:** ____ **Date:** ____" line at the top of a document the site says must not carry a student's name, and at the end "## Answer Key - Not applicable. This document contains no student questions or problems."
- Also: Goal A says "grade 5 narrative passage ... at the student's assigned reading level", which contradict each other; and the first objective moves a child from 52 words a minute on grade 3 text to 80 on grade 4 text in 12 weeks, which is steeper than I would want written into a document parents may later hold the district to. (That last point is my judgment, not an error.)
- Fix: drop the name line and answer-key section for staff-facing tools.

### C. Opinion

**17. No accessibility statement and no "data protection summary for districts".** Districts are increasingly asked to confirm both before recommending a tool. A one-page plain summary (what is sent where, what is kept, who to contact) would let a board member say yes quickly. Minor, and a preference.

## What worked

- It refused to reproduce the copyrighted poem, in under two seconds, and said why.
- It stripped the invented student name and ID out of the IEP draft and declined, without fuss, to write goals aimed at "protecting the district".
- The Terms do contain the right ideas in plain English: adults only, review before use, no personal information, not professional advice. They need finishing, not rethinking.
- The privacy page's claim that no ads appear beside the IEP and family-email tools matched what I saw: those two pages showed no "Advertisement" block, while home, library and the resource page did.
- No Share button on the IEP or family-email tools (the home page tool has one). Sensible.
- The affiliate disclosure sits right beside the product links ("As an Amazon Associate this site earns from qualifying purchases").
- The civil rights library lesson tells teachers to gather sources themselves "because many well-known texts and photographs from the period are still under copyright" and correctly says federal government works are public domain. That is better copyright hygiene than most paid resources.
- Hints beside every paste box: "Only paste text you have the right to use, and leave out student names."

## What I could not check

- Whether a warning appears on screen in a real browser when a student name is typed (I saw only the returned document).
- What the Share button does - whether it stores the document on the site's servers, which would bear on "we have no copy".
- Whether printed or Word copies carry any "AI-generated, review before use" footer.
- Which cookies are actually set and when, and whether any consent banner appears.
- Whether the newsletter emails carry a postal address and working unsubscribe (I did not subscribe, as instructed).
- What the daily limit is; it is mentioned but never stated.
- Colours, layout, phone display.

## What I would say to a colleague about this site

The tool itself is more careful than I expected; the paperwork is not ready. If a teacher uses it for a worksheet and reads the answer key first, I see little risk. But I would not put the district's name behind it until the operator is identified, the Terms have a liability cap and a takedown process, and the privacy page stops making promises in absolute terms that its own About page contradicts. And keep special education staff away from the IEP tool until it stops accepting a child's name.
