// The second opinion on an answer key.
//
// A finished document is handed back to the model with one job: solve every question
// again from the question alone, then compare with the key. It writes its working
// before its verdict, because (with thinking switched off to keep cost flat) the
// working on the page is the only reasoning it does. generate.ts turns any PROBLEM
// lines into a request for a corrected copy.

export const VERIFY_SYSTEM = `You check classroom documents for mistakes before a teacher prints them. You are careful, you do the arithmetic step by step, and you only report mistakes you are sure of.`;

// Only documents with questions for students have something to verify.
export function hasAnswerKey(doc: string): boolean {
  return /\n##\s*Answer Key\b/i.test(doc);
}

export function verifyPrompt(doc: string): string {
  return [
    "Below is a classroom document that ends with an answer key. Check every question and problem in it, in order. If it has versions or levels, check each one.",
    "",
    "For each question:",
    "1. Solve it yourself from the question alone, with brief working, before you look at the key. For a question about a reading passage, find the answer in that passage.",
    "2. Compare your answer with the answer key.",
    "",
    "Write exactly one line per question, in one of these two forms:",
    "Q<label> | <your working and your answer> | OK",
    "Q<label> | <your working and your answer> | PROBLEM: <what is wrong, and what the correct answer is>",
    "The label is the question number with nothing after it: Q4. In a document with versions use A4 and B4 (Version A or B, question 4); with levels use L1-4 (Level 1, question 4). For a question with parts use Q4a, Q4b.",
    "",
    "Write PROBLEM only when you are sure of one of these:",
    "- the key's answer is wrong;",
    "- the key's letter does not match the answer choice that holds the right value;",
    "- none of the answer choices is correct, or more than one is;",
    "- the question cannot be answered from the information or passage given, is impossible, or contradicts itself;",
    "- the key contradicts the passage or the question it belongs to;",
    "- the key gives two different answers, or argues with itself.",
    "Do not write PROBLEM for wording, style, difficulty, rounding in the last digit, or an open-ended question whose sample answer is reasonable. If you are not sure, write OK.",
    "",
    "After the last question, write one final line: PROBLEMS: <how many PROBLEM lines you wrote>",
    "",
    `Document:\n"""\n${doc}\n"""`,
  ].join("\n");
}

export type Verdict = {
  checked: number; // questions the checker worked through
  problems: { label: string; detail: string }[];
};

// Reads the checker's reply. Anything it cannot read counts as "no problem found",
// so a garbled check can never damage a good document.
export function parseVerdict(text: string): Verdict {
  const problems: { label: string; detail: string }[] = [];
  let checked = 0;
  for (const raw of text.split("\n")) {
    const line = raw.trim().replace(/^[-*]\s*/, "").replace(/\*\*/g, "");
    const first = line.indexOf("|");
    const last = line.lastIndexOf("|");
    if (first < 1 || last === first) continue;
    // The model does not always keep to the label format ("Q1 (A)", "A1 (B) — Q1").
    const label = line.slice(0, first).match(/\b(L\d-?\d+[a-z]?|[AB]\d+[a-z]?|Q?\d+[a-z]?)\b/i);
    const end = line.slice(last + 1).trim();
    const problem = end.match(/^PROBLEM\s*:\s*(.+)$/i);
    if (!label || !(problem || /^OK\b/i.test(end))) continue;
    checked++;
    // A line that talks itself back out of the problem is not a finding.
    if (problem && !/\b(?:OK on reflection|marked OK|no error|not a problem|so this is OK)\b/i.test(problem[1])) {
      problems.push({ label: label[1].replace(/^(\d)/, "Q$1"), detail: problem[1].trim().slice(0, 400) });
    }
  }
  return { checked, problems };
}

// How a verdict is handed to the rewrite step.
export function verdictAsProblems(v: Verdict): string[] {
  if (!v.problems.length) return [];
  return [
    "An independent check of the answer key found these mistakes. Fix each one by changing the question, its numbers, its answer choices or the key, so that the question has exactly one correct answer and the key states it:\n" +
      v.problems.map((p) => `  - ${p.label}: ${p.detail}`).join("\n"),
  ];
}
