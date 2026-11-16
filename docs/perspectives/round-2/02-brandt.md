# Mr. Brandt, high school chemistry teacher, 20 years in

**Verdict:** Would not use it in its current state.

**In one sentence:** The worksheet was almost right, but the quiz key has the wrong answer marked on about half the questions and shows the AI arguing with itself, and the titration lab is off by a factor of ten, so it cannot be run with the equipment it lists. That is exactly what has burned me before.

## What I did

- Pages visited: home (/), /tools, the library resource "Balancing Chemical Equations Worksheet" (Grade 11), /about, and the accuracy lines on /terms.
- Worked by hand, with a calculator, every equation in the library worksheet's answer key. All 13 balance and every atom count is correct.
- Generated three documents (all Grade 11, Science):
  1. `02-01-worksheet.md`: Worksheet, 10 word problems on stoichiometry, molarity and gas laws (honors, sig figs, full worked key).
  2. `02-02-lab-activity.md`: Lab, titration of vinegar with 0.100 M NaOH, 50-minute period, 3 trials, molarity and percent by mass.
  3. `02-03-quiz.md`: Quiz, 10 multiple-choice gas law and molarity calculations, Versions A and B, distractors built from common mistakes.

## Problems found

### 1. Quiz answer key marks the wrong letter on many questions, and the AI's "rechecking" is printed in the key (BLOCKER)
Where: `02-03-quiz.md`, Answer Key, Version A Q4, Q5 and Version B Q2, Q3, Q4, Q5, Q7.
What I saw:
- A Q5: bolded "**C. 0.549 L**", then in the same line "Correct answer is **A. 0.458 L**".
- B Q2: bolded "**B. 1.25 atm**", then "The correct answer is **A. 0.20 atm**". B Q5 and B Q7 do the same thing.
- B Q3: "Correct answer is B. 1.55 atm, which is not among the options, so teacher should revise". The correct answer, 1.5 atm, is not one of the choices.
- B Q4: worked answer is 0.261 mol, which is not among the choices. The key says "C. 0.261 mol", but option C is 0.624 mol.
- A Q4: n = (2.00 x 10.0)/(0.0821 x 300) = 0.812 mol. The key gives "B. 0.0813 mol" because it slipped a decimal. The right choice is A (0.81 mol), which the key marks as a distractor.
- A Q6 and A Q10 contain lines like "actually B uses 1.00 L" and "(Recheck: ...)".
Fix I would want: never show a key whose bolded letter disagrees with its own working. The site should check each answer (compute it, confirm it matches an option, confirm exactly one option is correct) and regenerate or refuse if the check fails. A key should never include the model's "recheck" notes.

### 2. Quiz questions with two correct answers (MAJOR)
Where: `02-03-quiz.md`, Version A Q9, Version B Q9, Version A Q10.
What I saw: A Q9 offers "B. 0.050 L" and "C. 50 mL", which are the same volume. B Q9 offers "A. 0.15 L" and "C. 150 mL". A Q10 offers "0.081 mol" and "0.0813 mol", and the key admits "options A and B differ only in rounding, so accept either". The true value is 0.0812, so 0.0813 is not even correctly rounded.
Fix: don't put the same quantity in different units among the choices, and keep distractors apart by more than rounding.

### 3. Quiz distractor and question wording errors (MINOR)
Where: `02-03-quiz.md`, Version B Q10 and Version A Q10.
What I saw: B Q10 says a student who leaves P as 760 would get "81.3 mol". 760 times 0.0812 is about 61.7 mol, and 81.3 is a factor of 1000, not 760. A Q10 gives 273 K in the stem, then says "uses 27 °C", then says "Use ... T = 300 K". Students won't know which temperature to use.
Fix: one clear scenario per question, with each distractor actually computed from the mistake it claims to represent.

### 4. Titration lab is off by a factor of ten and cannot be carried out as written (BLOCKER)
Where: `02-02-lab-activity.md`, Teacher Notes "Expected results", the worked example, and the Answer Key.
What I saw: "Volume of NaOH used is typically about 8.3 to 8.9 mL. Molarity of acetic acid is about 0.083 to 0.089 mol/L." Household 5% vinegar is about 0.83 M. 10.00 mL of 0.83 M acetic acid needs about 83 mL of 0.100 M NaOH. That is more than the 50 mL buret listed and more than the "about 60 mL" of NaOH given to each pair for all three trials. Students will empty the buret without ever reaching the endpoint. The notes then try to explain away the 10x gap with a false claim: "the label's 5 percent refers to percent by volume". Vinegar acidity is stated as grams per 100 mL. The same paragraph goes on to say students who get "near 0.85 M" are right, which contradicts the expected results printed just above it.
Fix: scale the lab so it works. Either dilute the vinegar 1:10 in a volumetric flask before titrating, or titrate 2.00 mL of vinegar, or use 0.500 M NaOH. Then recalculate the expected volumes and the worked example, and give each pair enough NaOH for three trials. Delete the "percent by volume" explanation.

### 5. Lab safety section has gaps for a caustic base (MAJOR)
Where: `02-02-lab-activity.md`, Safety and Teacher Notes.
What I saw: The only first-aid step is for skin ("rinse with plenty of water for at least 15 minutes"). There is nothing about the eyewash station or what to do if NaOH splashes in an eye, which is the most serious hazard with NaOH. Teacher prep says "dissolving 4.00 g of solid NaOH in water" with no warning that dissolving it releases heat, and no advice to add the solid slowly to water while wearing goggles. Standardizing against KHP is described as "if time allows", even though solid NaOH picks up water and CO2 from the air, so an honors class's results will be off without it. The procedure never has students rinse the buret with NaOH before filling it.
Fix: add "eye contact: go to the eyewash and flush for at least 15 minutes, holding the eyelids open, and tell the teacher". Add the heat warning and the slow-addition step to teacher prep. Make standardization part of the prep, or say plainly that results depend on it. Add rinsing the buret with titrant before filling.

### 6. Lab: small technique error (MINOR)
Where: `02-02-lab-activity.md`, Common student errors.
What I saw: "Overtitrating, which shows as a deep pink color that fades slowly." When you overshoot, the deep pink stays. A faint pink that fades is the CO2 effect near the endpoint.
Fix: "Overtitrating shows as a dark pink or magenta that does not fade."

### 7. Worksheet key: two sig-fig slips, and one rounding error that marks a correct student wrong (MAJOR for an honors key)
Where: `02-01-worksheet.md`, Answer Key Q10, Q5 and Q9.
What I saw:
- Q10: the key gives the new volume as "17.3 L". It got that by rounding V1 to 16.7 L and then multiplying. Carried through without early rounding, V2 = 0.750 x 0.0821 x 308.15 / 1.10 = 17.2 L. Even with its own rounded temperatures (298 K and 308 K) the answer is 17.24, which is 17.2 L. A student who does it correctly gets marked wrong.
- Q5: "5.000 g NaOH" when 0.250 M limits the answer to 3 sig figs (5.00 g). I specifically asked for correct sig figs.
- Q9: "use 300. K for 3 sig figs". 27.0 + 273.15 = 300.2 K keeps a decimal place under the addition rule. The final answer of 3.94 atm happens to be unaffected.
Fix: carry unrounded values through multi-step problems and round only at the end. Apply the addition and multiplication sig-fig rules consistently.

### 8. Worksheet: asked for one percent-yield problem, got two (MINOR)
Where: `02-01-worksheet.md`, Part A.
What I saw: I asked for "one limiting reactant and one percent yield" among the 4 stoichiometry problems. Q3 and Q4 are both percent-yield problems, so there is no plain mole-to-mass problem besides Q1. I can live with it, but it is not what I asked for.
Fix: follow the requested mix exactly.

### 9. Placeholder note left on the public Terms page (MINOR)
Where: /terms.
What I saw: "Site owner: review this page with a qualified adviser before launch."
Fix: remove it before launch. A department head reading the terms will not trust a page that says it hasn't been reviewed.

### 10. Lab tool promises "safe" but nothing extra checks labs (opinion, MAJOR concern for me)
Where: /tools, tile "Lab or Hands-On Activity: A safe, low-cost investigation with data table."
What I saw: the word "safe" on the tool, and only the general footer warning ("Always review materials before using them"). The lab I got was missing the eyewash step.
Fix: drop "safe" from the tool description, or put a clear notice at the top of every generated lab, for example: "Check every safety step against your school's chemical hygiene plan and the SDS before use."

## What worked

- The library's Balancing Chemical Equations worksheet is correct. All 13 answers and every atom count check out by hand, and the "Notes on Common Errors" are what an experienced teacher would write.
- On the generated worksheet, 9 of 10 final answers are right. The problems are realistic, the molar masses are given where needed, and the worked solutions show units at every step.
- The lab layout is good: investigation question, materials, data table for 3 trials, step-by-step calculations, and analysis questions with sensible sample answers (the overshoot-makes-molarity-too-high answer is correct). The faults are in the numbers and some safety details, not the structure.
- The About page is honest that "AI can still make mistakes".
- No sign-up, and it is fast. Each document took 11 to 17 seconds.

## What I could not check

- How the documents look printed, and whether the answer key really lands on its own page.
- What the Print, Word, Revise, "Harder" and "Version B" buttons actually produce.
- How it looks on a phone.

## What I would say to a colleague about this site

"The ready-made library worksheet I checked was solid. But don't hand out anything it generates without working every problem yourself. The quiz key had the wrong letter on half the questions and the AI was arguing with itself in print. The titration lab would have had kids emptying a 50 mL buret without ever hitting an endpoint. It's fine as a quick first draft if you were going to check every line anyway. If you were hoping it would save you that step, it won't. And never trust its safety section without your own SDS sheets beside you."
