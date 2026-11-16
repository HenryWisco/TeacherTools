<!-- Reviewer 14. Tool: word-problems. Inputs: {"topic":"AP Calculus related rates","count":"8","grade":"12","subject":"math","details":"AP Calculus AB/BC level. Include a sliding ladder, a conical tank draining, an expanding circle or sphere, a shadow problem, and two angle-of-elevation problems using inverse trig or tan. Give exact answers with units and full worked solutions. Make the last two harder than typical textbook problems."} -->

# Related Rates Word Problems

**Name:** ______________________  **Date:** ____________

Directions: Show all steps. Use exact answers unless a problem asks for a decimal. Include units in every final answer. Assume each situation is modeled as described.

1. A spherical balloon is being inflated so that its radius increases at a constant rate of 2 cm/s. Find the rate at which the volume is changing when the radius is 5 cm. Use V = (4/3)pi r^3.

__________________________________________________________________________

2. A 10-foot ladder rests against a vertical wall. The bottom of the ladder slides away from the wall at a rate of 1 ft/s. How fast is the top of the ladder sliding down the wall when the bottom is 6 feet from the wall?

__________________________________________________________________________

3. A circular oil spill on a calm lake grows so that its radius increases at 3 m/min. Find the rate at which the area of the spill is increasing when the radius is 20 m.

__________________________________________________________________________

4. A street lamp is 16 feet above the ground. A woman 5 feet tall walks away from the base of the lamp at 4 ft/s. How fast is the length of her shadow increasing when she is 12 feet from the base of the lamp?

__________________________________________________________________________

5. Water flows into an inverted right circular cone-shaped tank at a constant rate of 6 cubic meters per minute. The tank has height 10 m and radius 4 m at the top, with its vertex at the bottom. Find the rate at which the water level rises when the depth of the water is 5 m. Use V = (1/3)pi r^2 h with r/h = 4/10.

__________________________________________________________________________

6. A conical tank has height 12 feet and radius 6 feet at the top, with its vertex at the bottom. Water drains from the tank so that the depth h decreases at a rate that makes the volume decrease at 8 cubic feet per minute. Find the rate at which the depth changes when the water is 6 feet deep. Give your answer in feet per minute with the correct sign.

__________________________________________________________________________

7. A spectator stands 60 feet from the base of a vertical launch tower. A rocket rises straight up at a constant speed of 120 ft/s. Let theta be the angle of elevation from the spectator's eye (at ground level) to the rocket. Find the rate at which theta is changing, in radians per second, when the rocket is 60 feet above the ground. Use tan(theta) = h/60 and express your answer exactly.

__________________________________________________________________________

8. A lighthouse beacon is 200 meters from a straight, long shoreline point P. The beacon rotates at a constant rate of 1/4 revolution per minute. Let theta be the angle between the beam and the perpendicular line from the lighthouse to the shore. A small boat moves along the shore. Find the rate at which the beam's point of intersection with the shore is moving, in meters per second, when the beam makes an angle of pi/6 radians with the perpendicular. Express the answer exactly and explain your use of inverse tangent in setting up x = 200 tan(theta), where x is the signed distance from P along the shore.

__________________________________________________________________________

## Answer Key

1. V = (4/3)pi r^3, so dV/dt = 4 pi r^2 (dr/dt). At r = 5 cm and dr/dt = 2 cm/s: dV/dt = 4 pi (25)(2) = 200 pi cm^3/s, about 628 cm^3/s.

2. Let x be the distance of the bottom from the wall and y the height of the top. x^2 + y^2 = 100, so 2x(dx/dt) + 2y(dy/dt) = 0. When x = 6, y = 8. With dx/dt = 1: 2(6)(1) + 2(8)(dy/dt) = 0, so dy/dt = -12/16 = -3/4. The top slides down at 3/4 ft/s.

3. A = pi r^2, so dA/dt = 2 pi r (dr/dt). At r = 20 m and dr/dt = 3 m/min: dA/dt = 2 pi (20)(3) = 120 pi m^2/min, about 377 m^2/min.

4. Let x be the distance from the lamp base to the woman and s the shadow length measured from her feet. Similar triangles: (x + s)/16 = s/5, so 5x + 5s = 16s, giving s = 5x/11. Then ds/dt = (5/11)(dx/dt) = (5/11)(4) = 20/11 ft/s. The shadow grows at 20/11 ft/s, about 1.82 ft/s. (This is independent of her distance, since the position is linear.)

5. With r = (2/5)h, V = (1/3)pi (4/25)h^3 = (4 pi/75) h^3. dV/dt = (4 pi/25) h^2 (dh/dt). At h = 5 and dV/dt = 6: 6 = (4 pi/25)(25)(dh/dt) = 4 pi (dh/dt), so dh/dt = 3/(2 pi) m/min, about 0.477 m/min.

6. With r = h/2, V = (1/3)pi (h^2/4) h = (pi/12) h^3. dV/dt = (pi/4) h^2 (dh/dt). At h = 6 and dV/dt = -8: -8 = (pi/4)(36)(dh/dt) = 9 pi (dh/dt), so dh/dt = -8/(9 pi) ft/min, about -0.283 ft/min. The depth decreases at 8/(9 pi) ft/min.

7. tan(theta) = h/60, so sec^2(theta) (dtheta/dt) = (1/60)(dh/dt). At h = 60, tan(theta) = 1, so theta = pi/4 and sec^2(theta) = 2. With dh/dt = 120: 2(dtheta/dt) = 120/60 = 2, so dtheta/dt = 1 rad/s.

8. Let x = 200 tan(theta). Then dx/dt = 200 sec^2(theta) (dtheta/dt). The rotation rate is 1/4 rev/min = (pi/2) rad/min = (pi/2)/60 = pi/120 rad/s. At theta = pi/6: sec^2(pi/6) = 1/cos^2(pi/6) = 1/(3/4) = 4/3. So dx/dt = 200 (4/3)(pi/120) = (800 pi)/360 = 20 pi/9 m/s, about 6.98 m/s. The intersection point moves at 20 pi/9 m/s (about 6.98 m/s) along the shore. The inverse tangent appears because theta = arctan(x/200), which expresses the beam angle in terms of the position x; differentiating this relation links the angular rate to the linear rate.