import { findArithmeticSlips } from "./arith";
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
  out = fixTotals(out);
  return out.trimEnd() === doc.trimEnd() ? doc : out.trimEnd() + "\n";
}

// Adds up the points. The model is asked to mark each answer "(2 points)" and to
// write "[TOTAL]" wherever the total belongs, because when it does the adding
// itself the score line is often wrong (it writes "/ 30" before it has written
// the questions). A total it wrote anyway is corrected the same way. If the marks
// are incomplete the total is left blank for the teacher rather than guessed.
export function fixTotals(doc: string): string {
  const blank = (s: string) => s.replace(/^.*\bTotal\b.*\[TOTAL\].*\n?/gim, "").replace(/\[TOTAL\]/g, "______");
  const at = doc.search(/\n##\s*Answer Key[^\n]*\n/i);
  if (at < 0) return blank(doc);
  const body = doc.slice(0, at);
  const chunks = doc.slice(at).split(/\n(?=###\s)/);

  // One sum per part of the key that has numbered answers (one part, or one per version).
  const sums: (number | null)[] = [];
  const chunkSum = chunks.map((chunk) => {
    const answers = chunk.split(/\n(?=[ \t]*(?:\*\*)?\d+[.)]\s)/).slice(1);
    if (!answers.length) return undefined;
    const marks = answers.map((a) => a.match(/\((\d+)\s*(?:points?|pts?|puntos?)\b/i));
    const sum = marks.every(Boolean) ? marks.reduce((t, m) => t + parseInt(m![1], 10), 0) : null;
    sums.push(sum);
    return sum;
  });
  if (!sums.length) return blank(doc);

  const scoreLine = /^(.*\bScore\b.*?\/\s*)(\[TOTAL\]|\d+)(.*)$/gim;
  const scoreLines = body.match(scoreLine)?.length ?? 0;
  const same = sums.every((s) => s === sums[0]);
  let n = 0;
  const newBody = body.replace(scoreLine, (line, start: string, shown: string, rest: string) => {
    const sum = scoreLines === sums.length ? sums[n++] : same ? sums[0] : null;
    if (sum === null) return shown === "[TOTAL]" ? `${start}______${rest}` : line;
    return `${start}${sum}${rest}`;
  });

  const newKey = chunks
    .map((chunk, i) => {
      const sum = chunkSum[i] === undefined ? (sums.length === 1 ? sums[0] : same ? sums[0] : null) : chunkSum[i];
      return chunk.replace(/^(\W*(?:Version [A-C] )?Total\b[^\d[\n]*)(\[TOTAL\]|\d+)(\s*(?:points?|pts?|puntos?))[^\n]*$/gim, (line, start: string, shown: string, unit: string) => {
        if (sum === null || sum === undefined) return shown === "[TOTAL]" ? "" : line;
        // A corrected total drops whatever sums or notes followed the old one.
        return shown === String(sum) ? line : `${start}${sum}${unit}${/^\s*\*\*/.test(start) ? "**" : ""}`;
      });
    })
    .join("\n");
  return blank(newBody + newKey);
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
  /\bNote (?:for|to) (?:the )?teacher\b.{0,120}\b(?:should (?:be|read)|not \d|incorrect|error|mistake|typo|please correct)\b/i,
  /\bSee note below\b/i,
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

  // Calculations in the answer key, worked out by code (see arith.ts).
  const slips = findArithmeticSlips(key);
  if (slips.length) {
    problems.push(
      "A calculator check found arithmetic in the answer key that does not work out. Redo each calculation and everything that depends on it, including the answer choices if the answer changes:\n" +
        slips.map((s) => `  - "${s.shown}" is wrong: the left side comes to ${s.correct}`).join("\n"),
    );
  }

  return problems;
}
