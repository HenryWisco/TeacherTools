# Ms. Delgado, middle school math teacher
**Verdict:** Would not use as is. I would not hand any of these keys to a grader without checking every line myself, and then the tool has saved me nothing.
**In one sentence:** The questions are mostly good and the A/B versions are a real idea, but the answer keys contain wrong answers and visible "drafted hastily" corrections, which is the one thing I cannot accept.

## What I did
- Pages visited: home page (/), /tools, /library (first page of listings, including the grade 6 ratios worksheet and grade 8 slope exit ticket titles), form listings for the quiz and word-problems tools. I did not open individual library items.
- Generated 3 documents and worked every answer myself:
  1. 03-01-quiz.md: Grade 7 equations quiz, 10 questions, Mixed, Two versions.
  2. 03-02-word-problems.md: Grade 7 sports ratio/percent word problems, 8 problems, Two versions.
  3. 03-03-quiz.md: Grade 8 Pythagorean theorem and cylinder volume, 15 questions, multiple choice only, Two versions.
- Files are under C:\Users\henry\Desktop\TeacherTools\docs\perspectives\round-2\samples\.

## Problems found
1. **Wrong and self-correcting answer key, Pythagorean/cylinder quiz (03-03-quiz.md).** Blocker.
   Key lines contradict the correct answer. Version A: Q4 key says "A" but 12 inches is B ("the leg is 12... (see note below)"); Q11 key says A, then "Correct choice is B, 603.19 is a rounding error", and the corrected value 602.88 is not among the choices (the printed B is 603.19, so a student working it correctly finds no right answer); Q15 key says "A" then "The cylinder holds more is false. (Correct choice is B.)". Version B: Q4, Q5, Q10 and Q11 key lines are wrong (key says A, A, A, B; correct are B, B, B, A). The document ends with "Several answer-key entries above were drafted hastily and contain errors." Fix: check each key line against the options before output, and regenerate rather than printing a "corrections" note. A clean key only.
2. **Version A Q11 has no correct option.** Blocker. Choice B reads 603.19 cubic cm; the right answer with pi = 3.14 is 602.88. The note tells the teacher to edit the quiz by hand. Fix: compute choices in code or have the tool recheck that exactly one option equals the key.
3. **Equations quiz, Version B Q3 (03-01-quiz.md).** Major. Key line reads "C (y = 9)?" then "Correction: ... the correct choice is D (y = 9)". Choice C in the quiz is y = 5 and D is y = 9, so D is right, but the footer then says "Replace choice C with 'y = 40'", which is already choice B. Confusing, and a teacher could break the quiz following it. Fix: no uncertain notes in output; one clean key.
4. **Total points wrong on the equations quiz.** Major. Header says "Score: ______ / 20" and the key says "total 20 points", but 4x1 + 4x2 + 2x3 = 18. Fix: sum the stated points and print the true total.
5. **A and B versions share many identical answers.** Major for my purpose (stopping copying). In the equations quiz, Q5 is x = 6 in both, Q7 is n = 6 in both. In the word problems, Q2 is 3:4 in both and Q8 in both ends with "student tickets did not change". On the Pythagorean quiz Q1, Q2, Q9 and Q14 are the same question with options reordered. A student who sees a neighbor's "6" copies it. Fix: ask for different answers across versions, and vary or remove identical conceptual questions.
6. **Pythagorean quiz B Q14 and A Q14 give no way to compute.** Minor. The question only asks for the "reason" to use the theorem, and Version A adds an unneeded radius. Okay as reasoning but not a computation item.
7. **Word problems directions mismatch.** Minor. "Write your final answer in a complete sentence" but there is a single underscored line, no workspace to show work.
8. **Word problems answers 100 percent correct.** Not a problem. All 16 problems and keys checked out, and counts were 8 per version as asked.

## What worked
- Question counts matched what I asked in all three documents (10, 8 and 15 per version).
- The word-problem set (03-02) was entirely correct, with worked solutions and sensible rounding.
- Version B changes numbers and shuffles answer positions on most items, and each version gets its own key.
- Equations quiz Version A was fully correct; points per question are stated.
- Name and date lines are printed; key is on its own section.

## What I could not check
- Printing, Word download, the Edit and Version B buttons, and how it looks on a phone or printed.
- Whether the library resources are correct (I only read the listings, not the documents).
- Privacy, terms and about pages.

## What I would say to a colleague about this site
It writes decent quizzes quickly, and the two-version button is exactly what I want. But two of three runs had wrong keys, one with a quiz that had no right answer on a question, and the document itself admitted the errors. Check every answer yourself before you print. If the key problem were fixed I would use it for bell work, not tests, until I trusted it.
