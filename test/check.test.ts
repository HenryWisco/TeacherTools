import { describe, expect, it } from "vitest";
import { findProblems, tidy } from "../src/check";
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
  it("catches a score line that does not match the points", () => {
    const doc = cleanQuiz.replace("/ 4", "/ 30");
    expect(findProblems(doc, quiz, { topic: "Density", count: "3" }).join(" ")).toContain("add up to 4");
    const totalled = cleanQuiz + "\n**Total: 20 points**\n";
    expect(findProblems(totalled, quiz, { topic: "Density", count: "3" }).join(" ")).toContain("20");
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
