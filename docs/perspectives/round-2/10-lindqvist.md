# Mr. Lindqvist, career and technical education teacher (welding and auto shop)

**Verdict:** Would use with conditions. Good for a first draft that I then correct line by line. Not safe to print and hand out as it comes, because all three documents had at least one technical mistake that matters in a shop.

**In one sentence:** It knows a surprising amount about my trades and writes a usable skeleton in 15 seconds, but it keyed a wrong lens shade on a safety quiz, told students to pass a brake rotor on its average thickness, and printed a rubric that argues with itself about the point total, so I cannot trust it unsupervised on anything where a kid can get hurt.

## What I did

Pages visited: home page, /tools, /library (plus searches for "welding", "shop" and "safety"), /about, /terms, and the forms for Quiz, Rubric, Lab or Hands-On Activity, Project Idea and Ask for Anything.

Documents generated (3 of my 3):

1. `10-01-quiz.md` - Quiz tool. 15-question welding shop safety quiz (oxy-acetylene and stick), grade 11, mixed question types. I asked for ANSI Z49.1 and OSHA rules, lens shade numbers and acetylene pressure limits, and said students must score 100% before touching equipment.
2. `10-02-lab-activity.md` - Lab or Hands-On Activity tool. Front disc brake pad replacement and rotor inspection, grade 10, 55-minute period, pairs, with a data table for rotor thickness and lateral runout, following the ASE Education Foundation brake tasks.
3. `10-03-rubric.md` - Rubric tool. Stick welding performance test, 3/8 inch plate T-joint fillet in the 2F position with 1/8 inch E7018, 4 levels, my six criteria, AWS D1.1 visual criteria, safety as pass/fail, 24 points total.

I left the Subject box on "Any" for all three because there is nothing in the list for my program.

## Problems found

### 1. Quiz answer key gives the wrong lens shade for torch cutting (blocker)
Where: `10-01-quiz.md`, question 2 and its answer key.
What I saw: The question asks for the lens shade for oxy-acetylene cutting of thick plate. The key says "D. Shade 12 to 14", then in the same breath says "ANSI Z49.1 and common shade charts list shade 4 to 8 for torch cutting and brazing." It then adds a note: "accept A or C only if the instructor's shop lens chart supports it; the answer key keys D as the best answer".
Why it matters: Shade 12 to 14 is an arc welding shade. Oxy-fuel cutting is about shade 3 to 6 depending on plate thickness (4 to 5 for medium plate), so the right choice is B. The key contradicts its own explanation, and the note does not even mention B. A student cutting behind a shade 14 cannot see the cut line or the puddle, which is its own hazard. This is a safety quiz that gates access to equipment.
Fix: Key B. More generally, when the tool's own explanation disagrees with the letter it picked, it should catch that before showing me the document.

### 2. Brake lab passes or fails a rotor on its average thickness (major)
Where: `10-02-lab-activity.md`, procedure step 13, analysis question 2 and answer key item 2.
What I saw: "Calculate the average rotor thickness and compare it to the minimum thickness stamped on the rotor" and in the key "If the average is below the stamped minimum, the rotor must be replaced."
Why it matters: You compare the thinnest reading to the discard thickness, not the average. An average can hide one spot that is under minimum. Four readings is also light; the real reason for multiple readings is thickness variation (parallelism), which the lab never has students calculate even though that is what causes most pedal pulsation.
Fix: Compare the smallest reading to the minimum. Add a "thickness variation = largest minus smallest" column to the data table.

### 3. Brake lab leaves out steps that make the runout reading valid and the job safe (major)
Where: `10-02-lab-activity.md`, steps 14 to 16 and Part D.
What I saw: The wheel comes off in step 5 and the dial indicator goes on in step 14, with nothing holding the rotor to the hub. On the slip-on rotors most training cars have, you have to put the lug nuts back on and snug them evenly or the reading is meaningless. The procedure is also written for one wheel ("Loosen the lug nuts on the front wheel", one jack stand) while the data table has left front and right front rows. It never says to do the other side, and pads are always replaced as an axle set. Nothing tells students to check the brake fluid level afterward, or how the car gets off the jack stand (raise it with the jack first).
Fix: Add "reinstall lug nuts and tighten evenly to hold the rotor before measuring runout", "repeat on the other side; pads are replaced in axle sets", "jack up, remove stand, lower", and "check fluid level" steps.

### 4. Brake lab lists a micrometer that cannot measure the rotors it describes (minor)
Where: `10-02-lab-activity.md`, Materials and Teacher Notes.
What I saw: Materials: "Outside micrometer (0 to 1 inch range)". Teacher notes: "front rotors are roughly 0.9 to 1.1 inch thick when new".
Fix: List a 0 to 1 inch and a 1 to 2 inch micrometer (or a brake rotor micrometer).

### 5. Rubric prints its own correction and contradicts itself on the total (major)
Where: `10-03-rubric.md`, Safety row and "Total Points" section.
What I saw: The Safety row says "Points: 4". The score breakdown says "Safety (pass/fail, 4 pts) + Machine Setup (4 pts) + ... = 24 pts total", which actually adds to 28. Then the printed document says: "Correction to the header values: Safety is shown as 4 points when passed. Total = 4 + 4 + 6 + 6 + 6 + 2 = 28. To keep the total at 24 as required, the Safety gate is ... not added to the 24."
Why it matters: The tool noticed its mistake and left both the mistake and the apology in the handout. I cannot give that to students or to my advisory committee.
Fix: The finished document should contain only the corrected version: Safety row with no points, one breakdown line that adds to 24.

### 6. Rubric weld size levels overlap, and other rows have duplicate levels (major)
Where: `10-03-rubric.md`, Weld Size row and Cleanup row.
What I saw: Level 3: "Legs measure within plus or minus 1/8 in. of the 3/8 in. target" (that is 1/4 to 1/2 inch). Level 2: "Legs measure 1/4 in. to 5/16 in. or 7/16 in. to 1/2 in." Same sizes, different scores. A 1/4 inch leg could be scored 5 or 2. In the Cleanup row, Level 2 and Level 1 are both "0 pts". There is also a confusing sentence: "Scores may fall between levels only if the instructor records a whole-number score that matches a level description."
Fix: Make each level's size range not overlap the next. For a 2-point criterion, use fewer levels or say so.

### 7. Rubric lets a cracked weld earn points and garbles the undercut rule (major)
Where: `10-03-rubric.md`, Defects row.
What I saw: Level 1 (0 to 1 pts) includes "or crack visible on the surface". Under AWS D1.1 any crack is a reject, full stop, but here a cracked weld could still total 18 of 24. The top level says "No undercut deeper than 1/32 in. and no more than 2 in. total length in any 12 in. section", which mashes two parts of the rule together (the code allows up to 1/32 inch generally, and up to 1/16 inch for no more than 2 inches in any 12). It cites "AWS D1.1 Table 6.1", which is the table number in older editions; in the 2020 edition it is Table 8.1. The rubric also assumes a 3/8 inch fillet from a 1/8 inch rod without mentioning that this takes multiple passes (a single horizontal pass tops out at 5/16 inch).
Fix: Add "any crack, or incomplete fusion = automatic fail of the test piece". State the undercut rule the way the code does. Say "current edition of AWS D1.1 visual acceptance table" instead of a table number. State number of passes or let me set the fillet size.

### 8. Quiz has a flawed acetylene pressure question and other loose ends (major)
Where: `10-01-quiz.md`, header, questions 4, 9 and 15.
What I saw:
- Score line reads "_______ / 100" but the points add up to 29 (10 + 9 + 10).
- Question 4: "What is the maximum working pressure you should not exceed for acetylene in a cylinder or regulator setting?" with choices "A. 15 psi" and "B. 15 psig, which is about 1.0 bar gauge". Two choices are effectively the same answer, and "in a cylinder" is wrong: a full acetylene cylinder sits around 250 psig (which is choice D). The 15 psig limit is for the delivery (working) pressure at the regulator.
- Question 9 key says "OSHA 1910.252 and NFPA 51B call for fire watch for at least 30 minutes". OSHA does say half an hour; the current NFPA 51B (2019 on) raised it to one hour.
- Question 15 calls a shade 9 lens "unsafe" for 1/8 inch stick. ANSI Z49.1 lists shade 8 as the minimum and 10 as suggested for that amperage range, so 9 is lighter than recommended but not below the minimum. The quiz claims to follow that standard.
- Question 15 point breakdown says symptoms are "1 point each, maximum 2.5 points".
Fix: Total the points and print the real total. Reword Q4 to "maximum working (delivery) pressure at the regulator" with one 15 psig choice. Fix the NFPA figure. Change Q15 to a shade that is clearly below minimum (for example a shade 5 cutting lens).

### 9. No place for career and technical education anywhere on the site (major, missing feature)
Where: Subject list on the home page, every tool form, and the library filters; library search.
What I saw: Subjects are "Math, English Language Arts, Science, Social Studies, World Languages, Art & Music, PE & Health, Social-Emotional Learning, Computer Science & Tech, ESL / ELL". Nothing for CTE, trades, agriculture, health science, culinary, business. Library searches for "welding" and "shop" returned "Nothing here yet for that combination." The lab tool is described as "A safe, low-cost investigation with data table" with the hint "e.g. Density of liquids", and the brake job came back with an "Investigation Question" heading, which is science-class framing for what is really a job sheet.
Fix: Add a "Career & Technical Education" subject (ideally with a free-text trade field), let the Standard box hint at industry standards (ASE, AWS, NCCER, OSHA 10), and offer a job-sheet or performance-task layout with instructor sign-off lines.

### 10. No extra warning on safety-critical content (major, policy gap)
Where: /terms, /about, and the generated documents.
What I saw: The only caution is general: "Documents are written by AI and may contain errors. You are responsible for reviewing materials before classroom use." The brake lab and the welding quiz carry no notice that procedures must be checked against the service manual, the equipment manufacturer and the current standard. The quiz told me to "Verify against your current ANSI Z49.1 table" only on the one question it already knew was shaky. /terms also still shows "Site owner: review this page with a qualified adviser before launch."
Fix: When a request involves tools, machinery, chemicals, heat, lifting or electricity, print a short notice at the top of the teacher copy: "Safety-critical content. Verify every step, specification and answer against the manufacturer's service information and the current edition of the standard before use." Add a line about this to the terms.

### 11. ASE task list was requested but not referenced (minor)
Where: `10-02-lab-activity.md`.
What I saw: I asked it to follow the ASE Education Foundation brake task list. The document never mentions ASE or any task. I would rather it leave them out than invent numbers, but it should say so.
Fix: Either name the tasks in plain words (for example "inspect and measure rotor thickness, thickness variation and lateral runout") or add a line "ASE task alignment: fill in from your current task list".

## What worked

- Got exactly what I counted for: 15 quiz questions, six rubric criteria matching the ones I typed, 4 levels, data table for both thickness and runout.
- Fast: 15 to 18 seconds each.
- The brake lab's safety habits were mostly right and are the ones I drill: never work under a jack alone, instructor checks stand placement, do not blow brake dust with compressed air, do not hang the caliper by the hose, do not press the pedal with the caliper off, star pattern and torque wrench on the lugs, pump the pedal before moving the car.
- The quiz got the big welding items right: 15 psig acetylene working limit and why, acetylene upright because of acetone, oil and grease away from oxygen, 20 feet or a 5-foot barrier for storage, 35-foot rule for combustibles, shut the valve and report a leaking regulator, source-capture ventilation.
- The rubric knew E7018 runs DC electrode positive at roughly 110 to 140 amps for 1/8 inch, called for a fillet gauge, and built the safety gate the way I asked (any violation stops the test, score zero). The student checklist at the bottom is something I would actually use.
- It listened to "Anything else": 55-minute timing, pairs, my tool list, and the 100% rule all showed up.
- The site is honest that AI can be wrong and tells me to read before handing out.

## What I could not check

- How the wide rubric table prints on one page, and what Print, Word, and Copy for Google Docs produce.
- Colours, layout, how it looks on a phone.
- Whether the "Revise" box would fix the errors if I pointed them out (I had used my three documents).
- Whether choosing a subject such as "Science" or "Computer Science & Tech" would change the output.
- The exact wording of the current editions of ANSI Z49.1, NFPA 51B and AWS D1.1; I checked from what I teach from, and the owner should confirm against the current books.

## What I would say to a colleague about this site

It will save you the blank-page hour on a job sheet, a quiz or a rubric, and it clearly knows our vocabulary. But treat it like a first-year student teacher who read the textbook once: every number, every shade, every spec and every answer key letter has to be checked by you against the manual and the code book before it goes near a student. Out of three documents I got three that needed real corrections, one of them on a safety test answer. There is also no CTE subject and nothing for us in the library yet, so do not expect it to feel built for the shop. Use it for drafts, not for anything you would sign your name to unread.
