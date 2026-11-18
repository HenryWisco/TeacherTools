import Anthropic from "@anthropic-ai/sdk";
import type { Env } from "./env";
import { SYSTEM_PROMPT } from "./prompt";
import type { Tool } from "./tools";
import { VERIFY_SYSTEM, hasAnswerKey, parseVerdict, verdictAsProblems, verifyPrompt, type Verdict } from "./verify";

// The response is a stream of JSON lines so the browser can show text as it arrives:
//   {"t":"some text"}   a chunk of the document
//   {"note":"..."}      a short progress message (e.g. while answers are double-checked)
//   {"replace":"..."}   the whole document again, cleaned up; swap it in for what was shown
//   {"check":{...}}     what the answer check did (how many answers, fixed, still unsure)
//   {"error":"..."}     something went wrong (shown to the teacher)
//   {"done":true}       finished
export type Line =
  | { t: string }
  | { note: string }
  | { replace: string }
  | { check: CheckReport }
  | { hidden: string[] } // student details removed before the request was sent (see names.ts)
  | { error: string }
  | { done: true; demo?: boolean };

// Hard ceiling on what one generation can cost, whatever the caller asks for.
const MAX_OUTPUT_TOKENS = 12000;

// A second pass is only worth showing if it is still a whole document.
const MIN_REPAIR_RATIO = 0.6;

export function lineStream(run: (send: (line: Line) => void) => Promise<void>): ReadableStream<Uint8Array> {
  const enc = new TextEncoder();
  return new ReadableStream({
    async start(controller) {
      const send = (line: Line) => controller.enqueue(enc.encode(JSON.stringify(line) + "\n"));
      try {
        await run(send);
      } catch (err) {
        send({ error: friendlyError(err) });
      } finally {
        controller.close();
      }
    },
  });
}

export function friendlyError(err: unknown): string {
  if (err instanceof Anthropic.RateLimitError || err instanceof Anthropic.InternalServerError) {
    return "The generator is busy right now. Please try again in a minute.";
  }
  if (err instanceof Anthropic.AuthenticationError || err instanceof Anthropic.PermissionDeniedError) {
    return "The generator isn't set up correctly yet (API key problem). Please let the site owner know.";
  }
  if (err instanceof Anthropic.APIConnectionError) {
    return "Couldn't reach the generator. Check your connection and try again.";
  }
  console.error("generation failed", err);
  return "Something went wrong while writing that. Please try again.";
}

// What generate() needs to check a finished document. Both are optional so the
// plain request path can be used (and tested) without them.
export type Checks = {
  tidy?: (doc: string) => string;
  findProblems?: (doc: string) => string[];
  // Re-work every answer in the answer key with a second request (see verify.ts).
  verify?: boolean;
};

// What the answer check found, reported to the browser so the page can say so honestly.
export type CheckReport = {
  checked: number; // answers re-worked by the second pass
  fixed: number; // problems that a rewrite cleared
  unsure: string[]; // questions still in doubt, named on the answer key page
};

// Room for the checker's working: about 60 tokens a question.
const VERIFY_TOKENS = 6000;

async function ask(
  env: Env,
  userPrompt: string,
  maxTokens: number,
  onText?: (text: string) => void,
  system = SYSTEM_PROMPT,
): Promise<{ text: string; stop: string | null }> {
  const client = new Anthropic({ apiKey: env.ANTHROPIC_API_KEY, maxRetries: 1 });
  const stream = client.messages.stream({
    model: env.MODEL || "claude-haiku-5-5",
    max_tokens: Math.min(Math.max(maxTokens, 256), MAX_OUTPUT_TOKENS),
    // Thinking is billed as output; these are single-pass documents, so keep cost flat.
    thinking: { type: "disabled" },
    system,
    messages: [{ role: "user", content: userPrompt }],
  });
  let text = "";
  for await (const event of stream) {
    if (event.type === "content_block_delta" && event.delta.type === "text_delta") {
      text += event.delta.text;
      onText?.(event.delta.text);
    }
  }
  const final = await stream.finalMessage();
  return { text, stop: final.stop_reason };
}

// The request for a second, clean copy of a draft that failed the checks in check.ts.
export function repairPrompt(userPrompt: string, draft: string, problems: string[]): string {
  return [
    userPrompt,
    "",
    "A first draft of this document is below. A checker found these problems in it:",
    ...problems.map((p, i) => `${i + 1}. ${p}`),
    "",
    "Write the complete document again as a clean final copy with every problem fixed. Work each affected question out again from scratch: change the question, its numbers or its answer choices where needed so that it has exactly one correct answer, and state that answer once in the answer key. Check that every other answer in the key is correct too. Keep everything that was already right, and keep the same sections and layout. Do not mention the draft, the checker or any correction.",
    `First draft:\n"""\n${draft}\n"""`,
  ].join("\n");
}

export async function generate(
  env: Env,
  userPrompt: string,
  send: (line: Line) => void,
  maxTokens = 4096,
  checks: Checks = {},
): Promise<void> {
  const first = await ask(env, userPrompt, maxTokens, (t) => send({ t }));
  if (first.stop === "refusal") {
    send({ error: "The generator declined that request. Try rewording it as a classroom task." });
    return;
  }
  if (!first.text) {
    send({ error: "Nothing came back for that request. Please try again." });
    return;
  }
  if (first.stop === "max_tokens") {
    send({ t: "\n\n*This document reached the length limit. Ask for a shorter version or fewer questions to get a complete one.*" });
    const cut = checks.tidy?.(first.text) ?? first.text;
    if (cut !== first.text) send({ replace: cut });
    send({ done: true });
    return;
  }

  // The teacher has watched the draft arrive. Now check it: the quick checks in
  // check.ts, then (for documents with an answer key) a second request that works
  // every answer again. If either finds problems, write the document once more, check
  // that copy the same way, and keep whichever is better. Anything still in doubt is
  // named on the answer key page. A failure anywhere here keeps the draft.
  const neat = (d: string) => checks.tidy?.(d) ?? d;
  let doc = neat(first.text);
  const quick = (d: string) => checks.findProblems?.(d) ?? [];
  const second = async (d: string): Promise<Verdict | null> => {
    if (!checks.verify || !hasAnswerKey(d)) return null;
    try {
      const reply = await ask(env, verifyPrompt(d), VERIFY_TOKENS, undefined, VERIFY_SYSTEM);
      return parseVerdict(reply.text);
    } catch (err) {
      console.error("answer check failed", err);
      return null;
    }
  };

  const found = quick(doc);
  if (checks.verify && hasAnswerKey(doc)) send({ note: "Checking the answers…" });
  const verdict = await second(doc);
  const report: CheckReport = { checked: verdict?.checked ?? 0, fixed: 0, unsure: [] };
  let doubts = verdict?.problems ?? [];
  const before = found.length + doubts.length;

  if (before) {
    send({ note: doubts.length ? `Fixing ${doubts.length === 1 ? "one answer" : doubts.length + " answers"} the check found…` : "Tidying up the answers…" });
    try {
      const problems = [...found, ...(verdict ? verdictAsProblems(verdict) : [])];
      const rewrite = await ask(env, repairPrompt(userPrompt, doc, problems), maxTokens);
      const whole = rewrite.stop === "end_turn" && rewrite.text.trim().startsWith("#") && rewrite.text.length >= doc.length * MIN_REPAIR_RATIO;
      if (whole) {
        const copy = neat(rewrite.text);
        const recheck = await second(copy);
        // If the first check ran but the recheck could not, there is no evidence the
        // rewrite is better on answers, so judge it on the quick checks alone.
        const after = quick(copy).length + (recheck ? recheck.problems.length : verdict ? doubts.length : 0);
        if (after < before) {
          doc = copy;
          report.fixed = before - after;
          if (recheck) {
            doubts = recheck.problems;
            report.checked = recheck.checked;
          }
        }
      }
    } catch (err) {
      console.error("repair pass failed", err);
    }
  }

  report.unsure = [...new Set(doubts.map((d) => plainLabel(d.label)))];
  if (report.unsure.length) doc = flagUnsure(doc, report.unsure);
  if (doc !== first.text) send({ replace: doc });
  if (verdict) send({ check: report });
  send({ done: true });
}

// "Q4" -> "question 4", "B4" -> "Version B question 4", "L1-4" -> "Level 1 question 4".
export function plainLabel(label: string): string {
  const level = label.match(/^L(\d)-?(\d+\w?)$/i);
  if (level) return `Level ${level[1]} question ${level[2]}`;
  const version = label.match(/^([AB])(\d+\w?)$/i);
  if (version) return `Version ${version[1].toUpperCase()} question ${version[2]}`;
  return "question " + label.replace(/^Q/i, "");
}

// Tells the teacher, on the answer key page, which answers the check could not settle.
export function flagUnsure(doc: string, unsure: string[]): string {
  const note = `> **Please check before use:** an automatic second check was not sure about ${unsure.slice(0, 12).join(", ")}${unsure.length > 12 ? " and others" : ""}. Work ${unsure.length === 1 ? "that answer" : "those answers"} yourself before handing this out.`;
  return doc.replace(/(\n##\s*Answer Key[^\n]*\n)/i, (heading) => `${heading}\n${note}\n`);
}

// With no API key (local preview, or before the owner adds one) the site still works
// end to end and returns a clearly labelled sample instead of failing.
export async function generateDemo(tool: Tool, topic: string, send: (line: Line) => void): Promise<void> {
  const subject = topic.split("\n")[0].slice(0, 80) || "your topic";
  const doc = `# Sample ${tool.name}: ${subject}

> **Preview mode.** This site has no AI key connected yet, so this is a fixed sample that shows the layout. Once the key is added, this will be a real ${tool.name.toLowerCase()} about “${subject}”.

**Name:** ______________________  **Date:** ____________

## Directions

Answer each question. Show your work in the space provided.

1. What is 3/4 + 1/8?

   ____________________________________________

2. Circle the larger fraction: 2/3 or 3/5. Explain how you know.

   ____________________________________________

3. A recipe needs 1/2 cup of milk. You are making three batches. How much milk do you need?

   ____________________________________________

| Skill | Got it | Still practicing |
|---|---|---|
| Adding fractions | | |
| Comparing fractions | | |

## Answer Key

1. 7/8 (3/4 = 6/8, and 6/8 + 1/8 = 7/8)
2. 2/3 is larger (2/3 = 10/15 and 3/5 = 9/15)
3. 1 1/2 cups (3 × 1/2 = 3/2)
`;
  for (const piece of doc.match(/[\s\S]{1,48}/g) ?? []) {
    send({ t: piece });
    await new Promise((r) => setTimeout(r, 12));
  }
  send({ done: true, demo: true });
}
