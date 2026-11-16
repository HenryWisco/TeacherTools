# Dr. Boyd, superintendent of a small district

**Verdict:** Would approve with conditions. Not yet: I would not put this on our approved list as it stands today.

**In one sentence:** The privacy design is closer to what I want than most free tools, but a quiz that printed the AI's own "Wait, recounting..." notes to students, plus privacy and terms pages that still say "Site owner: review this page before launch" and give no name or contact, mean I cannot defend it to my board yet.

## What I did

- Pages read: home (/), /tools, /library, one library resource (/library/then-and-now-local-history-interview-project-grade-8), /my, /about, /privacy, /terms, /support, and the IEP Goal Ideas tool page (/tools/iep-goals), because IEP goals are where we carry the most legal exposure.
- Documents generated (3):
  1. `20-01-quiz.md`: Grade 7 math quiz, 10 questions, mixed, percent problems (CCSS 7.RP.A.3).
  2. `20-02-reading-passage.md`: Grade 8 social studies, about 500 words of nonfiction on Reconstruction (1865-1877), with "balanced and factual" asked for in the extra details box.
  3. `20-03-parent-email.md`: a brief English + Spanish family letter telling families the teacher will use an AI-assisted site to prepare materials. I wanted to see whether a teacher could get a usable disclosure letter from the site itself.

## Problems found

### 1. The math quiz printed the AI's own working-out and corrections onto the student page (blocker)
- Where: `20-01-quiz.md`, the directions at the top and the answer key.
- What I saw: The score line says "_______ / 20". Right under the student directions, still on the student page, the text says: "Wait, recounting: 4 multiple choice at 2 points = 8, and 6 short answer at 3 points = 18, total 26. The score line below reflects the total of 26 points." The score line still says /20. In the answer key, Question 2 is given as "B" with "Wait, see note below", and at the very bottom there is a "Correction to the Part 1 answer key above: ... The correct answer is C ($45), not B."
- Why it matters to me: This is the headline risk exactly. A tired teacher prints it, a parent photographs it, and it is on the local Facebook group as "the district's AI quiz argues with itself." An answer key that gives the wrong letter first will also get students marked wrong. The underlying math was right once I worked it (Q1 28, Q3 25%, Q4 $43.20, Q5 12, Q6 30%, Q7 $9.60 and $73.60, Q8 $25.20, Q9 96 not 100, Q10 $70 vs $72). The problem is that the output is not finished, and the site handed it over as if it were.
- Fix I would want: The site should never show a document containing the model's self-corrections. Check every generated document for phrases like "Wait," "Correction to," "recounting" or "see note below" and regenerate quietly if found. Check that the score line total matches the points in the answer key, and that each answer key letter matches the option text, before showing the document.

### 2. Privacy and terms pages are visibly unfinished and name no responsible party (blocker for district approval)
- Where: /privacy and /terms.
- What I saw: Both pages end with the owner's to-do note shown to the public: "Site owner: review this page with a qualified adviser before launch, and add your business name and address." The privacy contact is just "Questions or removal requests: the site owner." No name, email, business or address anywhere on the site.
- Why it matters to me: I cannot sign off on, or even contact, a vendor I cannot identify. If a parent files a complaint, I need someone to send it to.
- Fix I would want: Remove the internal notes. Name the legal entity or person running the site, give a working contact email and a mailing address, and add an "effective date / last updated" line to both pages.

### 3. The privacy page says nothing about what Anthropic does with what teachers type (major)
- Where: /privacy, "What we collect".
- What I saw: "What you type into a tool is sent to our AI provider (Anthropic) to write your document and is not stored by us after the document is returned."
- Why it matters to me: The first question my tech director and board will ask is "does the AI company keep it or train on it?" The page only speaks for the site, not the provider. Teachers will paste in lesson notes, and despite the warnings, some will describe students (the IEP tool asks for "present level" data).
- Fix I would want: One or two plain sentences on the provider's retention and whether inputs are used for training, with a link to the provider's policy.

### 4. No school-facing privacy commitments (FERPA, COPPA, state student-privacy law, data agreement) (major)
- Where: /privacy, /terms, /about.
- What I saw: The site says it is for adults 18+, collects no student data, and asks teachers not to enter names. It does not mention FERPA or COPPA, it offers no data privacy agreement, and there is no page aimed at schools.
- Why it matters to me: Many states require a signed student data privacy agreement before staff use an online tool, even a free one. The "no accounts, nothing stored" design is good and would make that agreement easy, but I have nothing I can attach to a board packet.
- Fix I would want: A short "For schools and districts" page covering what is collected, where it goes, how long it is kept, who to contact, and an offer to sign a standard student data privacy agreement (for example a state consortium template) on request.

### 5. Ads and third-party ad cookies on a tool teachers would use on district devices (major, partly a policy preference)
- Where: /privacy ("Our advertising partners, including Google, may still use cookies"); "Ad space" blocks on home, library and resource pages; Amazon affiliate links on resource pages ("As an Amazon Associate this site earns...").
- What I saw: The site is honest about it, says ads are not personalized, and says ads never appear beside the family-message, report-comment, IEP or differentiation tools. I respect that.
- Why it matters to me: Third-party ad cookies on staff machines are something our network policy and our families notice. I cannot see from here what ads would actually run.
- Fix I would want: A school or district mode (a domain allow-list, or the supporter cookie offered free to verified school networks) that turns off ads and third-party cookies. At minimum, a published list of ad categories that are blocked.

### 6. The library says "reviewed" but never says by whom or how (minor)
- Where: /about ("reviewed before being listed"), /library ("Every resource is reviewed before it is listed").
- What I saw: No description of who reviews, against what standard, or how to report an error in a library item.
- Fix I would want: One paragraph on the review process (who, what they check) and a "Report a problem with this resource" link on each library page.

### 7. No way to contact the site or report a problem (minor, but adds to 2)
- Where: /support says "Tell us what's missing," but there is no link, form or email.
- Fix I would want: A contact link or email in the footer and on /support.

### 8. Small issues in the Reconstruction passage (minor)
- Where: `20-02-reading-passage.md`.
- What I saw: The facts I checked were accurate: amendments 1865, 1868 and 1870; Freedmen's Bureau created 1865 and ended 1872; Panic of 1873; the 1876-77 disputed election and troop withdrawal. The tone was balanced, which I asked for. Question 1 reads "In what year did Reconstruction begin and end?" (should be "years"). Question 4 asks "why do you think" but the key only accepts the reasons stated in the passage. The last sentence ("Both views help students understand how the promises...") is clumsy. Nothing I would worry about on a board level.
- Fix I would want: Tighten the question wording. These are teacher-review fixes, not site problems.

## What worked

- **The privacy design is the right one for schools.** No accounts, documents kept only in the teacher's browser, no IP addresses stored, and clear 18+ and "no student names" warnings repeated on the forms and footer. The IEP tool has an especially clear warning: "Never enter a student's name, ID, diagnosis details or anything that could identify them."
- **Honest disclaimers.** The site says plainly that documents are AI-written and must be reviewed, and that IEP drafts are "not legal or clinical advice." That is the posture I would want staff to take.
- **The library resource I opened was strong.** The local history interview project includes a permission form for the person being interviewed with a parent or guardian signature line, guidance to use first names or initials only, safety advice ("meet in a safe, familiar place with a trusted adult nearby"), and equity notes for students without an older relative. Whoever wrote it thought about liability.
- **The bilingual family letter was usable as written.** It was accurate to what I asked and the Spanish read naturally. A teacher could send it home today as a disclosure, which helps us be open with families.
- **Ads kept away from sensitive tools** (family messages, report comments, IEP, differentiation), and nothing ad-related prints.

## What I could not check

- What the ads actually look like or which advertisers appear (only "Ad space" placeholders showed).
- How the site looks on a phone or district Chromebook, or what Print, Word and Share actually produce.
- Whether the "My documents" page works (it needs JavaScript, which my viewer does not run).
- Whether the provider (Anthropic) retains or trains on inputs. The site does not say, and I did not go looking elsewhere.
- Whether the "Make it" button on the home page behaves the same as the separate tool pages.

## What would have to be true for me to be comfortable

1. Generated documents never contain the AI's own working-out or corrections, and score totals and answer keys are checked automatically before a teacher sees them.
2. A named operator, a working contact, and finished privacy and terms pages with an effective date.
3. A plain statement of what the AI provider keeps and whether it trains on inputs.
4. A short schools page and willingness to sign a standard student data privacy agreement.
5. A way to turn off ads and third-party cookies on district networks.

With those in place, I would list it as "approved for teacher planning use, not for student use," with a one-paragraph staff guidance memo: no student identifiers, review everything, and use the family letter template.

## What I would say to a colleague about this site

"It's free, there are no accounts, and it doesn't hold student data, which puts it ahead of most of what our teachers are already using without asking. But it isn't ready. One of my test quizzes printed the AI arguing with itself about the point total right on the student page, and the privacy page still has the owner's 'review before launch' note on it with no name or contact. Wait for the launch version, check that those are fixed, then consider it for teacher-only planning use."
