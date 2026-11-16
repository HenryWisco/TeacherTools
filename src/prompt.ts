import { GRADES, SUBJECTS, TOOL_BY_ID, gradeLabel, type Tool } from "./tools";

export const SYSTEM_PROMPT = `You write classroom materials for K-12 teachers. You are an experienced teacher and curriculum writer: accurate, practical and clear. A teacher will print what you write and use it with students, often the next morning.

Output format (strict):
- Reply with the finished document only, in Markdown. No greeting, no commentary before or after, no offers to revise.
- The first line is the title as a level-1 heading: "# Title". Use "##" for sections and "###" below that.
- Sheets that students write on begin, right after the title, with the line: **Name:** ______________________  **Date:** ____________
- Number questions with "1." lists. Give writing space with a line of underscores on its own line.
- Use Markdown tables for rubrics, schedules, choice boards and data tables.
- If the document contains questions or problems for students, end with a section titled exactly "## Answer Key". It is printed on a separate page.
- Plain text only: no HTML, no images, no links. Write math in plain text (3/4, x^2, sqrt(16)).

Quality bar:
- Everything must be correct. Check every calculation, date, definition and answer before writing the answer key.
- Match the stated grade: vocabulary, sentence length, numbers and concepts must fit students of that age.
- Be complete and specific. Write the actual questions, examples, directions and descriptors rather than describing what they should be.
- Use varied, inclusive names and contexts. Keep all content appropriate for school.
- If standards are given, align to them and name them. If none are given, do not invent standard codes.
- Never include real student information. Use placeholders in square brackets where personal details would go.
- Write original text. Do not reproduce copyrighted passages, poems or song lyrics.

Scope: this tool only makes materials for teaching and school work. If a request is clearly unrelated to education, reply with the single line "# Not a classroom request" followed by one sentence saying this tool only makes classroom materials.`;

export type Inputs = Record<string, string>;

export class InputError extends Error {}

const clean = (s: unknown, max: number): string =>
  String(s ?? "")
    .replace(/[\u0000-\u0008\u000B\u000C\u000E-\u001F]/g, "")
    .trim()
    .slice(0, max);

// Validates raw form input for a tool and returns only known, capped fields.
export function normalizeInputs(tool: Tool, raw: Record<string, unknown>): Inputs {
  const out: Inputs = {};
  for (const f of tool.fields) {
    const max = f.max ?? 200;
    let v = clean(raw[f.name], max);
    if (f.kind === "select" && f.options && v && !f.options.includes(v)) v = "";
    if (f.required && !v) throw new InputError(`Please fill in “${f.label}”.`);
    if (v) out[f.name] = v;
  }
  if (tool.common?.grade) {
    const g = clean(raw.grade, 3);
    if (GRADES.includes(g)) out.grade = g;
  }
  if (tool.common?.subject) {
    const s = clean(raw.subject, 30);
    if (s in SUBJECTS) out.subject = s;
  }
  if (tool.common?.standards) {
    const st = clean(raw.standards, 200);
    if (st) out.standards = st;
  }
  return out;
}

export const MAX_PREVIOUS = 12000;
export const MAX_REFINE = 500;

// Builds the user message. `refine` asks for a revision of an earlier result.
export function buildUserPrompt(
  tool: Tool,
  inputs: Inputs,
  refine?: { previous: string; request: string },
): string {
  const lines: string[] = [];
  lines.push(`Document type: ${tool.name}`);
  if (inputs.grade) lines.push(`Grade: ${gradeLabel(inputs.grade)}`);
  if (inputs.subject) lines.push(`Subject: ${SUBJECTS[inputs.subject]}`);
  if (inputs.standards) lines.push(`Standards to align to: ${inputs.standards}`);
  for (const f of tool.fields) {
    const v = inputs[f.name];
    if (!v) continue;
    const label = f.label.replace(/\s*\(optional\)\s*/i, "").replace(/\?$/, "");
    if (f.kind === "textarea") lines.push(`${label}:\n"""\n${v}\n"""`);
    else lines.push(`${label}: ${v}`);
  }
  lines.push("", `How to write this kind of document: ${tool.instructions}`);
  if (!inputs.grade && tool.common?.grade) {
    lines.push("No grade was given: infer a sensible grade from the request and state it under the title.");
  }
  if (refine) {
    lines.push(
      "",
      "The teacher already has the draft below and wants it changed. Rewrite the whole document with the change applied, keeping everything else that still fits.",
      `Change requested: ${clean(refine.request, MAX_REFINE)}`,
      `Current draft:\n"""\n${clean(refine.previous, MAX_PREVIOUS)}\n"""`,
    );
  }
  return lines.join("\n");
}

export function getTool(id: unknown): Tool {
  const tool = TOOL_BY_ID[String(id)];
  if (!tool) throw new InputError("Unknown tool.");
  return tool;
}

// Pulls "# Title" off the top of a generated document.
export function splitTitle(markdown: string): { title: string; body: string } {
  const m = markdown.match(/^\s*#\s+(.+?)\s*\n([\s\S]*)$/);
  if (m) return { title: m[1].replace(/[*_`]/g, "").trim().slice(0, 140), body: m[2].trim() };
  return { title: "", body: markdown.trim() };
}

export function slugify(s: string): string {
  return s
    .toLowerCase()
    .normalize("NFKD")
    .replace(/[̀-ͯ]/g, "")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 70)
    .replace(/-+$/, "");
}
