<!-- Reviewer 14. Tool: worksheet. Inputs: {"topic":"AP Calculus AB: derivatives (chain, product, quotient rules, implicit differentiation) and definite/indefinite integrals including u-substitution","count":"12","style":"Short answer","grade":"12","subject":"math","details":"AP Calculus AB level, not watered down. Include trig, exponential and log functions. Full worked answer key. At least two problems should be AP free-response style."} -->

# AP Calculus AB Practice: Derivatives and Integrals

**Name:** ______________________  **Date:** ____________

**Directions:** Show all work. Answers without justification will not receive full credit. Calculators are permitted on Questions 9 through 12 only, unless your teacher says otherwise. Write your answers in the space provided.

## Worked Example

Find the derivative of y = sin(x^2) * e^(3x).

Use the product rule with u = sin(x^2) and v = e^(3x).

u' = cos(x^2) * 2x (chain rule), and v' = 3e^(3x).

dy/dx = u'v + uv' = 2x cos(x^2) e^(3x) + 3 sin(x^2) e^(3x)

Factor: dy/dx = e^(3x) [2x cos(x^2) + 3 sin(x^2)].

## Part A: Differentiation

1. Find dy/dx for y = (3x^2 - 5x + 1)^4.

_______________________________________________________________

_______________________________________________________________

2. Find dy/dx for y = ln(x^2 + 1) / x.

_______________________________________________________________

_______________________________________________________________

3. Find dy/dx for y = x^2 * cos(4x).

_______________________________________________________________

_______________________________________________________________

4. Find dy/dx for y = tan(5x) / (1 + x^2).

_______________________________________________________________

_______________________________________________________________

5. Given x^2 y + y^3 = 10, find dy/dx using implicit differentiation. Then find the slope of the curve at the point (1, 2).

_______________________________________________________________

_______________________________________________________________

6. Find the equation of the tangent line to y = e^(2x) * sin(x) at x = 0.

_______________________________________________________________

_______________________________________________________________

7. Let f(x) = x * e^(-x). Find all critical points of f and determine whether each is a relative maximum or minimum. Justify with the first derivative test.

_______________________________________________________________

_______________________________________________________________

## Part B: Integration

8. Evaluate the indefinite integral: integral of 6x * (3x^2 + 1)^5 dx. Use u-substitution and show the substitution explicitly.

_______________________________________________________________

_______________________________________________________________

9. Evaluate the indefinite integral: integral of (ln x)^2 / x dx.

_______________________________________________________________

_______________________________________________________________

10. Evaluate the definite integral: integral from 0 to pi/4 of sec^2(x) * tan(x) dx.

_______________________________________________________________

_______________________________________________________________

11. Evaluate the definite integral: integral from 0 to 1 of x * e^(x^2) dx.

_______________________________________________________________

_______________________________________________________________

## Part C: Free Response Style

12. Let R be the region bounded by the curve y = sqrt(x), the line y = x - 2, and the x-axis.

(a) Sketch R and set up an integral expression, with respect to x, for the area of R. Explain your setup.

_______________________________________________________________

_______________________________________________________________

(b) Find the area of R.

_______________________________________________________________

_______________________________________________________________

(c) The region R is revolved about the x-axis. Set up, but do not evaluate, an integral expression for the volume of the solid generated.

_______________________________________________________________

_______________________________________________________________

---

## Answer Key

**1.** Let u = 3x^2 - 5x + 1. Then dy/dx = 4u^3 * (6x - 5) = 4(6x - 5)(3x^2 - 5x + 1)^3.

**2.** Let u = ln(x^2 + 1), so y = u/x.
u' = 2x / (x^2 + 1).
dy/dx = [x * (2x/(x^2 + 1)) - ln(x^2 + 1)] / x^2
= [2x^2/(x^2 + 1) - ln(x^2 + 1)] / x^2.
Equivalently: (2x^2 - (x^2 + 1) ln(x^2 + 1)) / (x^2 (x^2 + 1)).

**3.** Product rule: dy/dx = 2x cos(4x) + x^2 * (-4 sin(4x)) = 2x cos(4x) - 4x^2 sin(4x).

**4.** Quotient rule with numerator tan(5x), denominator 1 + x^2:
Numerator derivative: 5 sec^2(5x).
dy/dx = [5 sec^2(5x)(1 + x^2) - tan(5x)(2x)] / (1 + x^2)^2.

**5.** Differentiate: 2xy + x^2 y' + 3y^2 y' = 0.
y'(x^2 + 3y^2) = -2xy, so dy/dx = -2xy / (x^2 + 3y^2).
At (1, 2): check 1*2 + 8 = 10. ✓
dy/dx = -2(1)(2) / (1 + 3*4) = -4/13.
The slope at (1, 2) is -4/13.

**6.** At x = 0: y = e^0 * sin(0) = 0. So the point is (0, 0).
y' = 2e^(2x) sin(x) + e^(2x) cos(x). At x = 0: y' = 0 + 1 = 1.
Tangent line: y = x.

**7.** f'(x) = e^(-x) - x e^(-x) = e^(-x)(1 - x).
Setting f'(x) = 0 gives x = 1, since e^(-x) is never zero. This is the only critical point.
For x < 1, f'(x) > 0 (test x = 0: f' = 1 > 0), so f is increasing.
For x > 1, f'(x) < 0 (test x = 2: f' = -e^(-2) < 0), so f is decreasing.
Therefore x = 1 is a relative maximum, with f(1) = 1/e.

**8.** Let u = 3x^2 + 1, so du = 6x dx.
Integral = integral of u^5 du = u^6/6 + C = (3x^2 + 1)^6 / 6 + C.

**9.** Let u = ln x, so du = (1/x) dx.
Integral = integral of u^2 du = u^3/3 + C = (ln x)^3 / 3 + C.

**10.** Let u = tan(x), so du = sec^2(x) dx. When x = 0, u = 0. When x = pi/4, u = 1.
Integral from 0 to 1 of u du = [u^2/2] from 0 to 1 = 1/2.

**11.** Let u = x^2, so du = 2x dx, meaning x dx = du/2. When x = 0, u = 0. When x = 1, u = 1.
Integral = (1/2) * integral from 0 to 1 of e^u du = (1/2)(e - 1) = (e - 1)/2.

**12.**
(a) The curves y = sqrt(x) and y = x - 2 intersect where sqrt(x) = x - 2. Squaring gives x = x^2 - 4x + 4, so x^2 - 5x + 4 = 0, giving (x - 1)(x - 4) = 0. Check: x = 1 gives sqrt(1) = 1 but 1 - 2 = -1, which is extraneous. x = 4 gives sqrt(4) = 2 = 4 - 2. ✓ So the curves meet at (4, 2).
The line y = x - 2 crosses the x-axis at x = 2. The region is bounded below by the x-axis from x = 0 to x = 2, and below by the line from x = 2 to x = 4, with the top boundary y = sqrt(x) throughout.
Area = integral from 0 to 2 of sqrt(x) dx + integral from 2 to 4 of [sqrt(x) - (x - 2)] dx.

(b) First integral: [(2/3) x^(3/2)] from 0 to 2 = (2/3)(2^(3/2)) = (4 sqrt(2))/3.
Second integral: integral from 2 to 4 of sqrt(x) dx = [(2/3) x^(3/2)] from 2 to 4 = (2/3)(8 - 2 sqrt(2)) = (16 - 4 sqrt(2))/3.
Integral from 2 to 4 of (x - 2) dx = [x^2/2 - 2x] from 2 to 4 = (8 - 8) - (2 - 4) = 2.
Second part = (16 - 4 sqrt(2))/3 - 2 = (10 - 4 sqrt(2))/3.
Total area = (4 sqrt(2))/3 + (10 - 4 sqrt(2))/3 = 10/3.

(c) Using the washer method with respect to x, for the solid revolved about the x-axis:
Volume = pi * integral from 0 to 2 of (sqrt(x))^2 dx + pi * integral from 2 to 4 of [(sqrt(x))^2 - (x - 2)^2] dx.
Simplified form: pi * integral from 0 to 2 of x dx + pi * integral from 2 to 4 of [x - (x - 2)^2] dx.