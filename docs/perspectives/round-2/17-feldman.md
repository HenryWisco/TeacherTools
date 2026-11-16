# Dr. Feldman, district curriculum director

**Verdict:** I would not approve this for teachers in my district yet. I could approve it with conditions once the generator stops confirming standards codes that don't exist.

**In one sentence:** The library's standards tags are mostly accurate, but I typed in an NGSS code that does not exist and the generator printed a confident, made-up description of it in the teacher notes. That is exactly the "standards-aligned" problem I spend my time cleaning up.

## What I did

- Pages visited: home (/), /tools, /library (plus searches for "4.NF" and "MS-PS2"), /about, /terms.
- Library resources: I opened Equivalent Fractions Worksheet (Gr 4) and Cell Organelles Study Guide (Gr 9) in full. I also checked the standards line on 20 library resources against my own knowledge of CCSS and NGSS.
- Documents generated (3):
  1. `17-01-worksheet.md`: worksheet, Grade 5 math, topic "Fractions", 10 questions, Mixed, standard `CCSS.MATH.CONTENT.5.NF.B.3`. I left the topic vague on purpose to see whether the standard alone would steer the content.
  2. `17-02-quiz.md`: quiz, Grade 8 ELA, "Author's point of view and conflicting viewpoints in an informational text", 10 questions, Mixed, standard `CCSS.ELA-LITERACY.RI.8.6`.
  3. `17-03-lab-activity.md`: lab, Grade 7 science, "Conservation of mass in a chemical reaction", standard `NGSS MS-PS1-7`. **This code does not exist.** Middle school MS-PS1 only runs 1 to 6, and the conservation-of-mass standard is MS-PS1-5. HS-PS1-7 exists at high school. It is the kind of slip a teacher makes all the time.

## Problems found

### 1. The generator accepts a standards code that doesn't exist and makes up a description for it (BLOCKER)
- Where: lab-activity tool, sample `17-03-lab-activity.md`, Teacher Notes.
- What I saw: "This lab supports NGSS MS-PS1-7, which asks students to develop and use a model to describe that atoms are conserved in a chemical reaction and that the total mass is the same before and after."
- Why it matters: MS-PS1-7 is not a real standard. The site wrote a plausible description and put an alignment statement on the page. A teacher could copy that into lesson plans or a board presentation. This is the false "standards-aligned" claim I worry about most.
- Fix I want: check entered codes against a real list of CCSS, NGSS and state standards. If a code isn't found, say so plainly ("We couldn't find MS-PS1-7. Did you mean MS-PS1-5 or HS-PS1-7?") and never write a description for it. If you can't check codes, print the code exactly as the teacher entered it with "(entered by teacher, not verified)" and no made-up description.

### 2. The lab contains a science error and a contradictory step (MAJOR)
- Where: `17-03-lab-activity.md`, answer key Q1 and Procedure step 8.
- What I saw: Answer key Q1 lists "a rise in temperature (sometimes slight)" as evidence. Baking soda and vinegar is endothermic, so the mixture gets colder. Step 8 says "Gently press the bag once to release any gas that builds up, keeping the seal closed". Gas can't be released while the seal stays closed.
- Also questionable: 2 tablespoons of baking soda with 1/4 cup of vinegar in a quart bag gives off roughly a litre of CO2, so the bag may burst. The expected result ("within about 0.01 to 0.05 g") ignores the fact that an inflated bag pushes aside air and reads lighter on the balance, so classes will probably see a loss of around a gram and conclude that mass wasn't conserved. The data table has a "Trial 2" row, but the procedure only describes one trial.
- Fix I want: correct the temperature claim to "a drop in temperature". Remove or rewrite step 8. Reduce the amounts or use a larger bag or a bottle with a balloon. Add a teacher note about buoyancy, and either add a second trial to the procedure or drop the extra row.

### 3. The quiz's point total is wrong (MAJOR)
- Where: `17-02-quiz.md`, header and answer key.
- What I saw: The header says "Score: _______ / 25" and the key says "Total: 25 points". The items are 4 × 1 + 3 × 2 + 3 × 3 = 19 points.
- Fix I want: the generator should add up the points it assigns and print that total, or leave the total out.

### 4. The quiz's key contradicts its own passage on point of view, which is the standard I asked for (MAJOR)
- Where: `17-02-quiz.md`, Q1, Q2, Q6, Q10 and key.
- What I saw: The passage gives supporters', researchers', parents' and a board member's views and ends with "The debate will continue at the next board meeting". The key still says the answer to Q1 is "B. Opposed to early start times" because "the author clearly favors one side". The key for Q10 refers to "the author's stated preference", but the author never states one. In Q2 the "opinion" answer (D) is a factual report that a board member argued something, while B ("Bus schedules are also simpler...") is just as arguable. RI.8.6 is about determining the author's point of view, so a key that misreads the author's point of view fails the standard directly.
- Fix I want: when a passage and questions are generated together, check the key against the passage. Either write the passage with a clear authorial stance or make "balanced/neutral" the keyed answer. For opinion-versus-fact items, require exactly one clearly defensible answer.

### 5. The standards code shows up in the document for some tools and not others (MINOR)
- Where: the worksheet printed "Standard: CCSS.MATH.CONTENT.5.NF.B.3 (Interpret a fraction as division...)", but the quiz, generated with RI.8.6, shows no standard anywhere on the page.
- Fix I want: always print the code the teacher entered, in the same place, on every tool. Better still, show the official wording of the standard and not a paraphrase.

### 6. The math worksheet goes beyond the standard and ignored "Mixed" (MINOR)
- Where: `17-01-worksheet.md`.
- What I saw: All 10 answers are correct and 9 of 10 items fit 5.NF.B.3 well. Q10 needs multiplying a fraction by 1/2 ("(1/2)(12/5)"), which is 5.NF.B.4. "Mixed" question style produced only written-answer items, with no multiple choice or other formats. The worked example's reasoning is muddled: "3 pizzas make 3 groups of 1/4". The key gives answers only, even though students are told to show their work.
- Fix I want: keep items within the entered standard, or label any stretch item. Honour "Mixed". Correct the worked example to "each friend gets 1/4 of each of the 3 pizzas = 3/4".

### 7. Library: one standards tag doesn't match the content (MINOR)
- Where: /library/cell-organelles-study-guide-grade-9, tagged "NGSS HS-LS1-2".
- What I saw: HS-LS1-2 is about the hierarchy of interacting body systems in multicellular organisms. The organelle-function standard is MS-LS1-2 (cell parts contributing to function). For high school, HS-LS1-1 or HS-LS1-2 is a stretch for an organelle study guide.
- Fix I want: retag it, or state which part of the standard it supports.

### 8. Library tags show codes without descriptions, and "reviewed" doesn't say by whom (MINOR)
- Where: library resource pages (e.g. "Worksheet · Grade 4 · Math · CCSS.MATH.CONTENT.4.NF.A.1"). The library page says "Every resource is reviewed before it is listed".
- What I saw: There is no wording for the standard and no note on who reviewed it or whether the standards tags were checked. The "Make my own version" link carries topic, grade and subject but not the standard (URL: `/tools/worksheet?topic=...&grade=4&subject=math`).
- Fix I want: show the official wording of the standard next to each code, say who reviews resources and what they check, and carry the standard into "Make my own version".

### 9. A leftover note for the site owner is visible on the Terms page (MINOR)
- Where: /terms.
- What I saw: "Site owner: review this page with a qualified adviser before launch."
- Fix I want: remove it before launch, after the review is done.

## What worked

- The library's standards tags are mostly accurate. I checked 17 tagged resources, and the codes were real and reasonable for the content in all but one (Cell Organelles). Examples: 4.NF.A.1 on equivalent fractions, 3.OA.A.3/A.4/B.6/C.7 on facts within 100, RF.1.2.B–D and RF.1.3.B on CVC words, MS-PS2-1/2 on Newton's laws, HS-PS1-7 on balancing equations. Resources without a good standard (Density lab, WWI quiz, American Revolution choice board) were left untagged rather than given a forced code, which I respect.
- The Equivalent Fractions worksheet was clean: all 15 items and answers check out, and the teacher notes correctly refer to items 12 and 14.
- Library search works by standard code ("4.NF" and "MS-PS2" both found the right resources).
- The worksheet tool printed the 5.NF.B.3 description accurately, and all 10 answers were correct.
- The About page, Terms page and footer honestly say AI can make mistakes and teachers must review.

## What I could not check

- How documents look when printed, or how the Word and Google Docs exports carry the standards line.
- Whether state standards (TEKS and others) are handled; I only tested CCSS and NGSS.
- Whether a teacher sees any warning in the browser when a code is unrecognised. The helper only showed me the document text, and nothing in it warned me.

## What I would say to a colleague about this site

The library is better than most teacher-marketplace material I see, and the standards tags there are mostly right. Don't trust the generator's standards claims, though. I gave it a code that doesn't exist and it wrote a confident description and an alignment statement for it. The lab it produced also had a wrong science fact, and the quiz added its points up wrong. If teachers use it, it should be for drafts they check line by line against the adopted curriculum, never as evidence of alignment. I'd revisit once it checks codes against a real standards list.
