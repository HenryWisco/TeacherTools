<!-- Reviewer 14. Tool: anything. Inputs: {"topic":"A challenge problem set of exactly 6 problems for gifted AP Calculus BC students, harder than the AP exam (think early college / competition flavor). Include: (1) a limit needing L'Hopital's rule more than once or a clever rewrite, (2) a function defined by an integral, g(x) = integral from 0 to x^2 of f(t) dt, using the Fundamental Theorem with the chain rule, (3) an optimization problem, (4) an improper integral that converges, (5) a Maclaurin series problem, (6) a separable differential equation with an initial condition. Full worked solutions on a separate answer key page.","grade":"12","subject":"math"} -->

# Challenge Problem Set: Calculus BC Beyond the Exam

**Name:** ______________________  **Date:** ____________

Directions: Solve each problem completely. Show all steps, justify each claim, and state any theorem you use by name. Calculators may be used only for checking; every answer must be supported by algebra or calculus. Work in pencil and expect to spend 60 to 90 minutes on the full set.

1. Evaluate the limit

   lim (x -> 0) [ (sin(x) - x + x^3/6) / (x^5) ]

   Then evaluate

   lim (x -> 0) [ (e^x - 1 - x - x^2/2) / (x^3) ]

   Explain why L'Hopital's rule is needed more than once for the first limit, or find a rewrite that avoids repeated differentiation and justify it.

   ______________________________________________________________

   ______________________________________________________________

2. Let f be continuous for all real t, and define

   g(x) = integral from 0 to x^2 of f(t) dt.

   (a) Find g'(x) in terms of f, and state which theorems you used.

   (b) If f(t) = e^(-t^2), find g'(1) and g''(x) at x = 1. Hint: you may write g''(x) using the product rule.

   (c) Show that g is an even function of x when f is an even function of t. Then state whether g must be odd, even, or neither when f is odd, and justify your answer.

   ______________________________________________________________

   ______________________________________________________________

3. A rectangle is inscribed in the region bounded above by the parabola y = 12 - x^2 and below by the x-axis, with two vertices on the parabola and two on the x-axis, symmetric about the y-axis. A second rectangle is then built with its base on the x-axis and its top vertices on the parabola, but now the base has length b and the figure is restricted so that the rectangle's height is at most 6.

   (a) Find the dimensions of the first rectangle (symmetric inscribed rectangle) that maximize its area. Prove that your answer is a maximum using the first or second derivative test.

   (b) A closed cylindrical can must hold exactly 250 cubic centimeters. Find the radius and height that minimize the total surface area, including both circular ends. Give the exact answer, then a decimal approximation to two places.

   ______________________________________________________________

   ______________________________________________________________

4. Determine whether each improper integral converges or diverges. If it converges, find its exact value.

   (a) integral from 1 to infinity of ln(x) / (x^3) dx

   (b) integral from 0 to 1 of 1 / (x^(2/3) * (1 + x)) dx

   Hint for (b): consider the substitution u = x^(1/3).

   ______________________________________________________________

   ______________________________________________________________

5. Let f(x) = ln(1 + x^2) for x near 0.

   (a) Find the Maclaurin series for f(x) and state its interval of convergence. Show the convergence test you use at the endpoints.

   (b) Use your series to find the fourth-degree Taylor polynomial of f(x) at x = 0, and use it to evaluate f^(4)(0).

   (c) Use the series to evaluate the limit lim (x -> 0) [ (ln(1 + x^2) - x^2) / (x^4) ].

   ______________________________________________________________

   ______________________________________________________________

6. Solve the initial value problem

   dy/dx = (x^2 + 1) * y^2 / (x * (y + 1))? 

   Rewrite this as a separable equation, carefully: use the equation

   dy/dx = (x + 1) * y^2 / (x^2 + 1),  with y(0) = -1/2.

   (a) Separate the variables, integrate both sides, and solve for y as a function of x.

   (b) Apply the initial condition and state the domain on which your solution is valid.

   (c) Find the value of x, if any, at which the solution is undefined, and explain why it is not a solution beyond that point.

   ______________________________________________________________

   ______________________________________________________________

## Answer Key

1. First limit: sin(x) = x - x^3/6 + x^5/120 - ..., so sin(x) - x + x^3/6 = x^5/120 + O(x^7). Dividing by x^5 gives the limit 1/120. Repeated L'Hopital: differentiating five times is tedious; the series rewrite is cleaner. Second limit: e^x - 1 - x - x^2/2 = x^3/6 + O(x^4), so the limit is 1/6. Applying L'Hopital three times gives (e^x)/(6) evaluated at 0, which is 1/6, confirming the result.

2. (a) By the chain rule and the Fundamental Theorem of Calculus (Part 1), g'(x) = f(x^2) * 2x. (b) g'(1) = f(1) * 2 = e^(-1) * 2 = 2/e. Differentiate g'(x) = 2x e^(-x^4): g''(x) = 2e^(-x^4) + 2x * (-4x^3) e^(-x^4) = (2 - 8x^4) e^(-x^4). At x = 1, g''(1) = (2 - 8) e^(-1) = -6/e. (c) If f is even, f(-t) = f(t), then g(-x) = integral from 0 to x^2 of f(t) dt, since (-x)^2 = x^2, so g(-x) = g(x) and g is even. If f is odd, f(t) = -f(-t), and g(x) depends only on x^2, so g is again even, not odd. Therefore g is always even, whether f is even or odd.

3. (a) For the symmetric inscribed rectangle under y = 12 - x^2, take the top vertices at (x, 12 - x^2) with width 2x. Area A(x) = 2x(12 - x^2) = 24x - 2x^3. A'(x) = 24 - 6x^2 = 0 gives x = 2. A''(x) = -12x < 0 at x = 2, so this is a maximum. Dimensions: width 4, height 12 - 4 = 8, area 32. (b) Volume V = pi r^2 h = 250, so h = 250/(pi r^2). Surface area S = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 500/r. S'(r) = 4 pi r - 500/r^2 = 0 gives r^3 = 125/pi, so r = 5/cube_root(pi). Numerically r is about 3.41 cm. Then h = 250/(pi r^2); since r^3 = 125/pi, h = 2r, so h is about 6.83 cm. Check: pi r^2 * 2r = 2 pi r^3 = 250, correct.

4. (a) Converges. Integrate by parts or use the antiderivative: integral of ln(x) x^(-3) dx = -ln(x)/(2x^2) - 1/(4x^2) + C. Evaluating from 1 to infinity gives 0 - (0 - 1/4) = 1/4. (b) Converges. Let u = x^(1/3), so x = u^3, dx = 3u^2 du, and x^(2/3) = u^2. The integral becomes integral from 0 to 1 of 3u^2 / (u^2 (1 + u^3)) du = integral from 0 to 1 of 3/(1 + u^3) du. Using partial fractions or the known antiderivative, this integral is finite, so it converges. Exact value: 3 times integral of 1/(1+u^3) from 0 to 1 = 3 * [ ln(2)/3 + pi/(3 sqrt(3)) ] = ln(2) + pi/sqrt(3).

5. (a) ln(1 + x^2) = sum from n = 1 to infinity of (-1)^(n+1) x^(2n) / n. Ratio test gives radius 1, so convergence for |x| < 1. At x = 1 the series is the alternating harmonic series, which converges; at x = -1 the same occurs. Interval of convergence: [-1, 1]. Note: the function is written in x^2, so the ratio test uses |x|^2 < 1. (b) The fourth-degree Taylor polynomial is x^2 - x^4/2. The coefficient of x^4 is -1/2, so f^(4)(0) = 4! * (-1/2) = -12. (c) (ln(1+x^2) - x^2)/x^4 = (-x^4/2 + x^6/3 - ...)/x^4 = -1/2 + O(x^2), so the limit is -1/2.

6. Separate: dy/y^2 = (x + 1)/(x^2 + 1) dx, which is not separable in the sense of y and x being fully isolated as stated, so rewrite the right side as (x/(x^2+1) + 1/(x^2+1)). Integrating: -1/y = (1/2) ln(x^2 + 1) + arctan(x) + C. Apply y(0) = -1/2: -1/(-1/2) = 2 = 0 + 0 + C, so C = 2. Thus -1/y = (1/2) ln(x^2+1) + arctan(x) + 2, so y = -1 / [ (1/2) ln(x^2+1) + arctan(x) + 2 ]. (b) The solution is valid where the denominator is nonzero and continuous, on the interval containing x = 0 where the denominator stays positive, which holds for x near 0 (the denominator equals 2 at x = 0 and is increasing in x, so it is positive for all x >= 0 and continues on the negative side until it reaches zero). (c) The solution becomes undefined where the denominator equals zero, which occurs at a negative value of x where (1/2) ln(x^2+1) + arctan(x) = -2; solving numerically gives x approximately -2.4. At that point y blows up, so the solution cannot be continued through it, and the solution is defined only on the interval on one side of this point containing x = 0.