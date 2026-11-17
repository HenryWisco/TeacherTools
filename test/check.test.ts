import { describe, expect, it } from "vitest";
import { evaluate, findArithmeticSlips } from "../src/arith";
import { findProblems, fixTotals, tidy } from "../src/check";
import { buildUserPrompt, normalizeInputs, outputBudget } from "../src/prompt";
import { TOOL_BY_ID } from "../src/tools";

// Every case here is a shortened version of something a reviewer found in a real
// generated document (docs/perspectives/round-2).
const quiz = TOOL_BY_ID["quiz"];
const email = TOOL_BY_ID["parent-email"];

const cleanQuiz = `# Density Quiz

**Name:** ______  **Date:** ______  **Score:** ______ / 4

1. Which is denser, lead or cork?
2. What is the density of 10 g in 5 mL?
3. Explain why ice floats.

## Answer Key

1. Lead. (1 point)
2. 2 g/mL. (1 point)
3. Ice is less dense than water. (2 points)
`;

describe("finding problems in a finished document", () => {
  it("passes a clean document", () => {
    expect(findProblems(cleanQuiz, quiz, { topic: "Density", count: "3" })).toEqual([]);
    expect(tidy(cleanQuiz, quiz)).toBe(cleanQuiz);
  });
  it("catches the AI correcting itself on the page", () => {
    const lines = [
      "8. A. Object X has the lower density. Correction note: Object Y is denser, so the correct answer is B.",
      "Hmm, the question asks for 2 round trips, so the answer is 169.2 miles.",
      "Wait, recounting: the total is 26.",
      "9. e = -12. Correction: For problem 9, 4e = -12 gives e = -3.",
      "Corrected answer for problem 11: g = 2",
      "(Recheck: 0.500 x 0.0821 x 300 / 1.20)",
      "Several answer-key entries above were drafted hastily and contain errors.",
      "Note for teacher: as written, the cost is 30 dollars. Teachers may wish to change the budget.",
      "Hamlet asks this in his soliloquy (Act 2, Scene 1, not in Act 3).".replace("(Act 2, Scene 1, not in Act 3)", "(not in Act 3)"),
    ];
    for (const line of lines) {
      const doc = cleanQuiz.replace("1. Lead. (1 point)", line + " (1 point)");
      expect(findProblems(doc, quiz, { topic: "Density", count: "3" }).join(" "), line).toContain("second thoughts");
    }
  });
  it("catches a key line that names one letter and then another", () => {
    const doc = cleanQuiz.replace("1. Lead. (1 point)", "1. C. V2 = (1.0 x 2.0)/2.0 = 1.0 L. (Note: the correct answer is A.) (1 point)");
    expect(findProblems(doc, quiz, { topic: "Density", count: "3" }).join(" ")).toContain("second thoughts");
    const twoLetters = cleanQuiz.replace("1. Lead. (1 point)", "1. B. Moles = 0.100, mass = 7.46 g, so the answer is A. (1 point)");
    expect(findProblems(twoLetters, quiz, { topic: "Density", count: "3" }).join(" ")).toContain("second thoughts");
    const fine = cleanQuiz.replace("1. Lead. (1 point)", "1. 8/12 + 3/12 = 11/12. Answer: C (1 point)");
    expect(findProblems(fine, quiz, { topic: "Density", count: "3" })).toEqual([]);
  });
  it("catches a question written twice or with repeated answer choices", () => {
    const twice = cleanQuiz.replace("2. What is the density of 10 g in 5 mL?", "2. What is the density of 10 g in 5 mL?\n   A. 2 g/mL\n   B. 5 g/mL\n   C. 2 g/mL\n   Note: Option C is intentionally replaced below.\n2. What is the density of 10 g in 5 mL?\n   A. 2 g/mL\n   B. 5 g/mL\n   C. 50 g/mL");
    const found = findProblems(twice, quiz, { topic: "Density", count: "3" }).join(" ");
    expect(found).toContain("Question 2 is written twice");
    expect(found).toContain("same answer choice twice (A and C)");
    const ok = cleanQuiz.replace("1. Which is denser, lead or cork?", "1. Which is denser?\n   A. Lead\n   B. Cork");
    expect(findProblems(ok, quiz, { topic: "Density", count: "3" })).toEqual([]);
  });
  it("does not mistake ordinary teaching words for a self-correction", () => {
    const iep = TOOL_BY_ID["iep-goals"];
    const doc = "# IEP Goal Ideas\n\nThe student will self-correct at least 80% of errors, with correction of errors recorded on a chart.\nThe correct answer is B because water is denser.\n";
    expect(findProblems(doc, iep, { topic: "Reading" })).toEqual([]);
  });
  it("catches the wrong number of questions", () => {
    const [problem] = findProblems(cleanQuiz, quiz, { topic: "Density", count: "5" });
    expect(problem).toContain("exactly 5");
    // Two versions are counted separately by the model, so the simple count is skipped.
    expect(findProblems(cleanQuiz, quiz, { topic: "Density", count: "5", versions: "ab" })).toEqual([]);
  });
  it("checks the arithmetic in the answer key with a calculator", () => {
    const wrong = cleanQuiz.replace("2. 2 g/mL. (1 point)", "2. 120,000 x (1.0379)^14 = 120,000 x 1.6976 = 203,712 people. (1 point)");
    const found = findProblems(wrong, quiz, { topic: "Density", count: "3" }).join(" ");
    expect(found).toContain("calculator check");
    expect(found).toContain("202003");
    const right = cleanQuiz.replace("2. 2 g/mL. (1 point)", "2. n = (1.50 x 4.00)/(0.0821 x 300) = 6.00/24.63 = 0.244 mol. (1 point)");
    expect(findProblems(right, quiz, { topic: "Density", count: "3" })).toEqual([]);
  });
});

describe("tidying a finished document", () => {
  const messyEmail = `# Field Trip Reminder

**Name:** ______________________  **Date:** ____________

**Subject:** Field trip on Friday

Dear families, please return the slip by Friday.

## Answer Key

Not applicable. This document contains no questions or problems for students.
`;
  it("removes the student name line and the empty answer key from a family email", () => {
    const out = tidy(messyEmail, email);
    expect(out).not.toContain("**Name:**");
    expect(out).not.toContain("Answer Key");
    expect(out).toContain("# Field Trip Reminder");
    expect(out).toContain("please return the slip by Friday.");
  });
  it("keeps the name line on student sheets and on handouts inside a teacher plan", () => {
    expect(tidy(cleanQuiz, quiz)).toContain("**Name:**");
    const plan = "# Lesson Plan\n\n## Objectives\n\nI can add.\n\n## Student Handout\n\n**Name:** ____  **Date:** ____\n\n1. 2 + 2\n";
    expect(tidy(plan, TOOL_BY_ID["lesson-plan"])).toContain("**Name:**");
  });
  it("keeps a real answer key", () => {
    expect(tidy(cleanQuiz, quiz)).toContain("## Answer Key");
  });
});

describe("what the model is told", () => {
  it("makes the number of questions firm", () => {
    const p = buildUserPrompt(quiz, normalizeInputs(quiz, { topic: "Density", count: "5" }));
    expect(p).toContain("exactly 5, no more and no fewer");
  });
  it("tells teacher and family tools to leave off the name line and answer key", () => {
    expect(buildUserPrompt(email, normalizeInputs(email, { topic: "Field trip" }))).toContain("no Name/Date line and no Answer Key");
    const lp = TOOL_BY_ID["lesson-plan"];
    expect(buildUserPrompt(lp, normalizeInputs(lp, { topic: "Fractions" }))).toContain("only at the top of any student handout");
    expect(buildUserPrompt(quiz, normalizeInputs(quiz, { topic: "Density" }))).not.toContain("for the teacher");
  });
  it("keeps English in a text rewritten for English learners in another language", () => {
    const tl = TOOL_BY_ID["text-leveler"];
    const p = buildUserPrompt(tl, normalizeInputs(tl, { source: "Water evaporates.", target: "English learners (beginner)", language: "Arabic" }));
    expect(p).toContain("simplified English");
    expect(p).not.toContain("whole document in Arabic");
  });
  it("gives long documents enough room to finish", () => {
    const lp = TOOL_BY_ID["lesson-plan"];
    const rp = TOOL_BY_ID["reading-passage"];
    expect(outputBudget({ topic: "x" }, quiz)).toBe(5000);
    expect(outputBudget({ topic: "x" }, lp)).toBe(8000);
    expect(outputBudget({ topic: "x", reference: "my template" }, quiz)).toBe(8000);
    expect(outputBudget({ topic: "x", versions: "levels" }, rp)).toBe(12000);
    expect(outputBudget({ topic: "x", versions: "ab", language: "English + Spanish (side by side)" }, quiz)).toBe(12000);
  });
});

describe("arithmetic worked out by code", () => {
  it("evaluates plain arithmetic and nothing else", () => {
    expect(evaluate("3 x 4 + 2")).toBe(14);
    expect(evaluate("(1.50 × 4.00)/(0.0821 × 300)")).toBeCloseTo(0.2436, 4);
    expect(evaluate("2^10")).toBe(1024);
    expect(evaluate("83 ÷ 4")).toBe(20.75);
    expect(evaluate("1 7/12")).toBeCloseTo(19 / 12, 9);
    expect(evaluate("11,630 - 630")).toBe(11000);
    expect(evaluate("2(4) - 5")).toBe(3);
    expect(evaluate("2x - 3")).toBeNull();
    expect(evaluate("1. 26 + 9")).toBeNull();
    expect(evaluate("sqrt(16)")).toBeNull();
  });
  it("flags a result that does not match its calculation", () => {
    expect(findArithmeticSlips("11. A = 8000 × 1.025^15 = 8000 × 1.453790 = 11,630")).toHaveLength(1);
    expect(findArithmeticSlips("3. 12 x 12 = 154")[0].correct).toBe("144");
    expect(findArithmeticSlips("Density = 135 / 50 = 3.7 g/cm^3")).toHaveLength(1);
  });
  it("accepts correct working, rounding, fractions, mixed numbers and remainders", () => {
    const fine = [
      "1. 26 + 9 = 35",
      "2. 3/4 + 5/6 = 9/12 + 10/12 = 19/12 = 1 7/12",
      "3. 7.50/28.74 = 0.261 mol",
      "4. 83 ÷ 4 = 20 remainder 3, so 20 books with 3 left over",
      "5. 0.100 x 58.44 = 5.84 g",
      "6. 12 × 24. 12 × 20 = 240 and 12 × 4 = 48. 240 + 48 = 288",
      "7. 15/20 = 75%",
      "8. V = 3.14 x 9 x 7 = 197.82, about 197.8",
      "9. 100/3 ≈ 33",
      "10. 1/3 = 4/12 and 1/4 = 3/12, so 4/12 + 3/12 = 7/12",
    ].join("\n");
    expect(findArithmeticSlips(fine)).toEqual([]);
  });
  it("leaves algebra, units, constants and deliberate mistakes alone", () => {
    const leave = [
      "11. g = 2 (5g + 10 - 3 = 4g + 9, so 5g + 7 = 4g + 9)",
      "dV/dt = 4 pi (25)(2) = 200 pi cm^3/s",
      "t = ln 2 / 0.06 = 0.693 / 0.06 = 11.55 years",
      "A = 5000e^(0.06 × 8) = 5000 × 1.616",
      "Jamal says 1/2 + 1/3 = 2/5, which is wrong because he added the denominators.",
      "Distractor B: 20.0/2463 = 0.812 forgets the decimal.",
      "y = 2x - 3 = 1 when x = 2",
      "10. 2 divided by (1/3) = 2 x 3 = 6 servings",
    ].join("\n");
    expect(findArithmeticSlips(leave)).toEqual([]);
  });
});

describe("adding up the points", () => {
  const key = "\n## Answer Key\n\n1. B (1 point)\n2. C (1 point)\n3. Ice is less dense. (2 points: 1 for the idea, 1 for the reason)\n\n**Total: [TOTAL] points**\n";
  it("fills in the total the model was told to leave to the site", () => {
    const out = fixTotals("# Quiz\n\n**Score:** ______ / [TOTAL]\n\n1. Q\n2. Q\n3. Q\n" + key);
    expect(out).toContain("**Score:** ______ / 4");
    expect(out).toContain("**Total: 4 points**");
    expect(out).not.toContain("[TOTAL]");
  });
  it("corrects a total the model wrote wrongly, and drops its excuse", () => {
    const doc = "# Quiz\n\n**Score:** ______ / 16 points\n\n1. Q\n" + key.replace("**Total: [TOTAL] points**", "**Total: 16 points** (6 at 1 point = 6; 4 at 2 = 8; total 14. See note below.)");
    const out = fixTotals(doc);
    expect(out).toContain("**Score:** ______ / 4 points");
    expect(out).toContain("**Total: 4 points**");
    expect(out).not.toContain("See note below");
  });
  it("gives each version its own total", () => {
    const doc = "# Quiz\n\n## Version A\n\n**Score:** ______ / [TOTAL]\n\n1. Q\n\n## Version B\n\n**Score:** ______ / [TOTAL]\n\n1. Q\n\n## Answer Key\n\n### Version A\n\n1. B (1 point)\n2. x = 2 (2 points)\n\n### Version B\n\n1. C (1 point)\n2. x = 5 (3 points)\n";
    const out = fixTotals(doc);
    expect(out.match(/\/ (\d+)/g)).toEqual(["/ 3", "/ 4"]);
  });
  it("leaves a blank instead of guessing when an answer has no points", () => {
    const out = fixTotals("# Quiz\n\n**Score:** ______ / [TOTAL]\n\n1. Q\n" + key.replace("2. C (1 point)", "2. C"));
    expect(out).toContain("**Score:** ______ / ______");
    expect(out).not.toContain("Total");
    expect(fixTotals("# Rubric\n\nScore: ____ / [TOTAL]\n")).toContain("/ ______");
  });
  it("does not touch a document whose total is already right", () => {
    const doc = "# Quiz\n\n**Score:** ______ / 4\n\n1. Q\n" + key.replace("[TOTAL]", "4");
    expect(fixTotals(doc)).toBe(doc);
  });
});
