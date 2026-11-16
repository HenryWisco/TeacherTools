import type { Inputs } from "./prompt";
import type { Tool } from "./tools";

// Checks run on a finished document before the teacher relies on it.
//
// The model writes top to bottom and cannot go back, so when it notices a mistake
// while writing the answer key it tends to argue with itself on the page
// ("Correction: ...", "Wait, recounting..."). Thirty reviewers found that in about
// one document in eight. `tidy` fixes what code can fix on its own; `findProblems`
// lists what needs a second pass by the model (see generate.ts).

const NAME_LINE = /^\s*\*\*Name:\*\*.*$/;

// Removes things that should never be on this kind of document. No AI call needed.
export function tidy(doc: string, tool: Tool): string {
  let out = doc;

  // "## Answer Key / Not applicable" on a document that has no questions.
  out = out.replace(/\n+##\s*Answer Key[^\n]*\n+\s*(?:\*\*)?(?:Not applicable|N\/A|None)\b[^\n]*(?:\n(?!#)[^\n]*)*\s*$/i, "\n");

  // A student "Name / Date" line directly under the title of a page meant for the
  // teacher or for families. Student handouts further down keep theirs.
  if (tool.audience) {
    const lines = out.split("\n");
    let seen = 0;
    for (let i = 0; i < lines.length && seen < 3; i++) {
      if (!lines[i].trim()) continue;
      seen++;
      if (seen > 1 && NAME_LINE.test(lines[i])) {
        lines.splice(i, lines[i + 1]?.trim() === "" ? 2 : 1);
        break;
      }
    }
    out = lines.join("\n");
  }
  return out.trimEnd() === doc.trimEnd() ? doc : out.trimEnd() + "\n";
}

const SECOND_THOUGHTS: RegExp[] = [
  /\b(?:Hmm|Wait),/,
  /\bHmm\b/,
  /\bRe-?(?:check|count)(?:ing)?\s*:/i,
  /\bWait, (?:re|see|that|this|let)/i,
  /\bCorrect(?:ion|ed)(?: note| answer| version)?\s*:/i,
  /\b(?:Version [AB]|answer[- ]key) corrections\b/i,
  /\bCorrect(?:ion|ed) (?:answer )?(?:to|for) (?:the |item |problem |question |number |part |#)/i,
  /\bcorrect answer is\b[^.\n]{0,40}\bnot\b/i,
  /\bNote:\s*the correct (?:answer|choice|option|letter) is\b/i,
  /\b(?:intentionally|is|are) replaced below\b/i,
  /\b(?:drafted hastily|check the list again|would need checking|is actually correct)\b/i,
  /\bas written, (?:the|this)\b/i,
  /\bteachers? may wish to (?:change|replace|adjust)\b/i,
  /\bactually [A-D] (?:uses|is|gives)\b/,
  /\((?:not|actually) in (?:Act|Chapter|Scene)\b/i,
  /\[(?:Note|Nota) (?:for|to|para) (?:the |el |la )?(?:teacher|docente|maestr[oa])/i,
];

const COUNTED_TOOLS = new Set(["quiz", "worksheet", "word-problems"]);

const splitKey = (doc: string): { body: string; key: string } => {
  const m = doc.match(/\n##\s*Answer Key[^\n]*\n/i);
  if (!m || m.index === undefined) return { body: doc, key: "" };
  return { body: doc.slice(0, m.index), key: doc.slice(m.index + m[0].length) };
};

// Returns plain-language problems for the model to fix in a second pass. Empty = fine.
export function findProblems(doc: string, tool: Tool, inputs: Inputs): string[] {
  const problems: string[] = [];
  const { body, key } = splitKey(doc);

  const hits = new Set<string>();
  for (const line of doc.split("\n")) {
    if (SECOND_THOUGHTS.some((re) => re.test(line))) hits.add(line.trim().slice(0, 160));
  }
  // An answer-key line that names one letter and then says the answer is another:
  // "1. C. ... = 1.0 L. (Note: the correct answer is A.)"
  for (const line of key.split("\n")) {
    const first = line.match(/^\s*(?:\*\*)?\d+[.)]\s*(?:\*\*)?\(?([A-E])\b[.):]/);
    const later = line.match(/\b(?:correct answer is|answer is|Answer:)\s*(?:\*\*)?\(?([A-E])\b/);
    if (first && later && first[1] !== later[1]) hits.add(line.trim().slice(0, 160));
  }
  // A question written twice ("5. ... Note: Option C is intentionally replaced below. 5. ...")
  // or one whose answer choices repeat ("A. 0.12 mol ... C. 0.12 mol").
  let lastNumber = 0;
  let options = new Map<string, string>();
  for (const line of body.split("\n")) {
    const q = line.match(/^(\d+)\.\s/);
    if (q) {
      const n = parseInt(q[1], 10);
      if (n === lastNumber && n > 0) hits.add(`Question ${n} is written twice: ` + line.trim().slice(0, 110));
      lastNumber = n;
      options = new Map();
      continue;
    }
    if (/^#/.test(line)) lastNumber = 0;
    const o = line.match(/^\s*([A-E])[.)]\s+(\S.*?)\s*$/);
    if (o) {
      const same = options.get(o[2].toLowerCase());
      if (same) hits.add(`Question ${lastNumber || ""} has the same answer choice twice (${same} and ${o[1]}): ${o[2].slice(0, 80)}`);
      else options.set(o[2].toLowerCase(), o[1]);
    }
  }
  if (hits.size) {
    problems.push(
      "The draft contains second thoughts, corrections or notes to self. These lines must not appear in any form; rework the question or answer they refer to so it is simply correct:\n" +
        [...hits].slice(0, 8).map((l) => `  - ${l}`).join("\n"),
    );
  }

  // The number of questions the teacher chose on the form.
  const wanted = parseInt(inputs.count ?? "", 10);
  if (COUNTED_TOOLS.has(tool.id) && wanted > 0 && !inputs.versions && !(inputs.language ?? "").includes("+")) {
    const nums = [...body.matchAll(/^(\d+)\.\s/gm)].map((m) => parseInt(m[1], 10));
    const highest = nums.length ? Math.max(...nums) : 0;
    if (nums.length !== wanted && highest !== wanted) {
      problems.push(`The teacher asked for exactly ${wanted} questions but the draft has ${highest || nums.length}. Write exactly ${wanted}, numbered 1 to ${wanted}.`);
    }
  }

  // A printed total that disagrees with the points in the answer key. Only trusted
  // when every numbered answer carries exactly one point value; otherwise the sum
  // here would be a guess, and a wrong "fix" is worse than none.
  if (key && !inputs.versions) {
    const answers = key.split("\n").filter((l) => /^\s*(?:\*\*)?(?:Question\s+)?\d+[.):]/.test(l));
    const marks = answers.map((l) => [...l.matchAll(/\b(\d+)\s*(?:points?|pts?|puntos?)\b/gi)].map((m) => parseInt(m[1], 10)));
    if (answers.length >= 3 && marks.every((m) => m.length === 1)) {
      const sum = marks.reduce((a, m) => a + m[0], 0);
      const printed = new Set<number>();
      for (const m of body.matchAll(/^.*\bScore\b.*?\/\s*(\d+)\b.*$/gim)) printed.add(parseInt(m[1], 10));
      for (const m of key.matchAll(/^\W*Total\W+(\d+)\s*(?:points?|pts?|puntos?)/gim)) printed.add(parseInt(m[1], 10));
      const wrong = [...printed].filter((n) => n !== sum);
      if (wrong.length) {
        problems.push(`The points for the ${answers.length} questions in the answer key appear to add up to ${sum}, but the document prints a total of ${wrong.join(" and ")}. Recount, then make the score line and any stated total equal the real sum of the question points.`);
      }
    }
  }

  return problems;
}
