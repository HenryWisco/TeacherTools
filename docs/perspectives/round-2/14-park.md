# Ms. Park, AP Calculus and gifted-program teacher

**Verdict:** Would use with conditions. Fine for routine AP Calculus AB practice, but I would not trust the "challenge" answer keys without working every problem myself, and the plain-text math notation is tiring at BC level.

**In one sentence:** The routine derivative, integral and related-rates work was correct and usable, but the one genuinely hard set I asked for came back with a wrong answer in the key, a garbled problem with the AI's own drafting notes left in, and a half-written problem that goes nowhere.

## What I did

- Pages visited: home page (/), all tools (/tools), the library (/library), a library search for "calculus" (no results), the library filtered to grades 9-12 math (only one resource), the Factoring Quadratic Trinomials worksheet (/library/factoring-quadratic-trinomials-worksheet-grade-9), and /about.
- Looked at the forms for Worksheet, Math Word Problems and Ask for Anything.
- Generated three documents, and worked every problem in all three by hand:
  1. `samples/14-01-worksheet.md`: Worksheet, grade 12 math, 12 short-answer questions on AP Calculus AB derivatives and integrals. I asked for trig, exponential and log functions, a full worked key, and **at least two** free-response-style problems.
  2. `samples/14-02-word-problems.md`: Math Word Problems, grade 12, 8 related-rates problems. I asked for a ladder, a draining cone, an expanding circle or sphere, a shadow problem, two angle-of-elevation problems using inverse trig or tangent, and I asked for **the last two to be harder than typical textbook problems**.
  3. `samples/14-03-anything.md`: Ask for Anything. I asked for exactly 6 challenge problems for gifted BC students (limits with L'Hopital, FTC with the chain rule, optimization, an improper integral, a Maclaurin series, and a separable differential equation) with full worked solutions.

## Problems found

### 1. Wrong answer in the differential equation key (challenge set, problem 6)
- **Where:** `14-03-anything.md`, Answer Key 6(b) and 6(c).
- **What I saw:** The key correctly gets y = -1 / [ (1/2) ln(x^2+1) + arctan(x) + 2 ]. It then says the denominator "is increasing in x" and that it hits zero at "x approximately -2.4", so the solution blows up there.
- **Why it is wrong:** The derivative of that denominator is (x+1)/(x^2+1), which is negative for x < -1, so it is not increasing everywhere. Its lowest value is at x = -1, where it equals about 0.35 - 0.79 + 2 = 1.56. It is never zero. At x = -2.4 it is about 1.78. The solution is defined for all real x, so the correct answer to 6(c) is "there is no such x". A strong student who gets this right would be marked wrong by the key.
- **How serious:** Blocker for this document. A wrong key on the hardest problem is exactly what I feared from a cheap AI.
- **Fix I would want:** Do a second checking pass on keys for upper-level math (re-derive each final answer, or check claims like "blows up at x = ..." numerically) before showing the document. Failing that, put a visible note on challenge-level math keys saying the answers have not been checked.

### 2. AI drafting notes left in a problem (challenge set, problem 6)
- **Where:** `14-03-anything.md`, problem 6, student page.
- **What I saw:** "dy/dx = (x^2 + 1) * y^2 / (x * (y + 1))? Rewrite this as a separable equation, carefully: use the equation dy/dx = (x + 1) * y^2 / (x^2 + 1)". The first equation ends in a question mark and is then dropped. The key adds "which is not separable in the sense of y and x being fully isolated as stated", but the equation is separable.
- **How serious:** Major. It is unusable as printed and makes the site look careless to students.
- **Fix I would want:** Check generated documents for stray question marks after equations and phrases like "rewrite this... use the equation", and regenerate when they appear. The prompt should tell the model to give each problem once, in its final form.

### 3. Half-written problem that goes nowhere (challenge set, problem 3)
- **Where:** `14-03-anything.md`, problem 3, student page.
- **What I saw:** "A second rectangle is then built with its base on the x-axis... the base has length b and the figure is restricted so that the rectangle's height is at most 6." No question is ever asked about it. Part (b) then switches to a cylindrical can that has nothing to do with the parabola.
- **How serious:** Major. Gifted students will spend time on the dangling setup and ask what they are supposed to do with it.
- **Fix I would want:** Same check as above. Every setup in a problem should lead to a question. Unrelated problems should get their own numbers, not be lettered parts of one problem.

### 4. "Full worked solutions" skipped the hardest step (challenge set, 4(b))
- **Where:** `14-03-anything.md`, Answer Key 4(b).
- **What I saw:** "Using partial fractions or the known antiderivative, this integral is finite... = ln(2) + pi/sqrt(3)." The value is correct, but the partial fractions on 1/(1+u^3) are the whole difficulty of the problem, and they are skipped.
- **How serious:** Minor to major. I asked for full worked solutions, and this is the one I would most need written out.
- **Fix I would want:** When "worked solutions" is requested, the key should not use "known antiderivative" shortcuts for the main step.

### 5. Asked for at least two free-response problems, got one (worksheet)
- **Where:** `14-01-worksheet.md`, Part C.
- **What I saw:** I wrote "At least two problems should be AP free-response style." Part C has only problem 12 (area and volume).
- **How serious:** Minor. It ignored part of what I asked for.
- **Fix I would want:** Count the requirements in "Anything else?" and meet them, or at least say so when it doesn't.

### 6. Calculator instruction doesn't make sense (worksheet)
- **Where:** `14-01-worksheet.md`, Directions.
- **What I saw:** "Calculators are permitted on Questions 9 through 12 only." Questions 9 to 12 are all exact u-substitution and area problems that no calculator helps with, and they cut across Parts B and C. It reads like a misunderstood copy of the AP format, where the calculator sections are separate.
- **How serious:** Minor, but an AP teacher notices it right away.
- **Fix I would want:** Leave out calculator rules unless the teacher asks for them, or tie them to whole parts that actually need a calculator.

### 7. "Harder than textbook" ignored, and problem 8 is garbled (related rates)
- **Where:** `14-02-word-problems.md`, problems 7 and 8.
- **What I saw:** The last two are the standard rocket and rotating-lighthouse problems found in every textbook. Both also give students the key equation ("Use tan(theta) = h/60"), which removes the hard part. Problem 8 says "A lighthouse beacon is 200 meters from a straight, long shoreline point P" and adds "A small boat moves along the shore", which has nothing to do with the problem. It also asks students to "explain your use of inverse tangent in setting up x = 200 tan(theta)", which uses tangent, not inverse tangent.
- **How serious:** Major for my use. The answers are right, but I asked for harder problems and got easier ones, and problem 8 would confuse students.
- **Fix I would want:** When harder problems are requested, don't hand students the setup equation. Clean up the wording of problem 8 and remove the boat.

### 8. Plain-text math is hard to read at calculus level (all three documents, and the library)
- **Where:** All three samples. The library factoring worksheet shows the same notation on the page (x^2).
- **What I saw:** "lim (x -> 0) [ (sin(x) - x + x^3/6) / (x^5) ]", "sum from n = 1 to infinity of (-1)^(n+1) x^(2n) / n", "integral from 0 to pi/4 of sec^2(x) * tan(x) dx", "r = 5/cube_root(pi)", "f^(4)(0)".
- **How serious:** Major for AP and BC. Students can decode it, but a page of series and integrals in this form is slow to read, and it looks nothing like the AP exam they are preparing for. Simple algebra reads fine.
- **Fix I would want:** Render math properly with real exponents, fraction bars, integral and sigma signs, at least in the printed and Word versions. A math-notation option for math tools would also work.

### 9. No calculus or upper-level math in the library
- **Where:** /library?q=calculus ("Nothing here yet for that combination") and /library?band=9-12&subject=math (one resource, the grade 9 factoring worksheet).
- **What I saw:** Nothing for precalculus, calculus or statistics.
- **How serious:** Minor. It's a gap, not an error.
- **Fix I would want:** Add a few reviewed AP Calculus items, such as a derivative rules worksheet and an FTC quiz.

### Small thing
The factoring worksheet page suggests buying "Fraction tiles & circles" and "Base ten blocks" under "Handy for this lesson". Those are elementary materials and don't fit a grade 9 factoring lesson.

## What worked

- **Doc 1 key is fully correct.** I worked all 12: chain, product, quotient, implicit (slope -4/13 at (1, 2), with the point checked), tangent line y = x, the critical point of x e^(-x) with a proper first-derivative-test justification, four u-substitutions, and the area problem (10/3, with the extraneous root x = 1 correctly thrown out) plus the washer setup. That is honest AP-level work.
- **Doc 2 answers are all correct:** 200 pi cm^3/s, -3/4 ft/s, 120 pi m^2/min, 20/11 ft/s (with the nice note that it doesn't depend on distance), 3/(2 pi) m/min, -8/(9 pi) ft/min with the sign explained, 1 rad/s, and 20 pi/9 m/s. Units are given throughout.
- **Doc 3 got most of the hard math right:** the limits 1/120 and 1/6, g''(1) = -6/e, the even/odd argument for g, the 32-square-unit rectangle, the can with h = 2r, the improper integrals 1/4 and ln 2 + pi/sqrt(3), and the ln(1+x^2) series with interval [-1, 1] and f^(4)(0) = -12. It counted to exactly 6 problems as asked.
- Generation was fast (10-15 seconds). No sign-up was needed. The /about page openly says AI can make mistakes and that you should read before handing anything out.

## What I could not check

- Whether Print, Word or Copy for Google Docs turns x^2 into a real exponent or leaves the caret. The helper only shows text.
- Whether the answer key starts on its own printed page.
- What the "Harder" and "Revise" buttons would do.
- How the site looks on a phone.

## What I would say to a colleague about this site

"It's quick and free, and for a routine AB derivative or u-sub worksheet the answers were right. I checked every one. But when I pushed it toward challenge-level BC work, the key had a flat-out wrong answer on the differential equation, and one problem still had the AI's scratch notes in it. Work every problem before you print, especially anything 'hard', and know that the math comes out as x^2 and 'integral from 0 to 1 of...', not real notation. Use it for a first draft, not for the final copy."
