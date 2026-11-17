import { createServer, type Server } from "node:http";
import { afterAll, beforeAll, describe, expect, it } from "vitest";
import { flagUnsure, generate, generateDemo, lineStream, plainLabel, type CheckReport, type Line } from "../src/generate";
import { VERIFY_SYSTEM, hasAnswerKey, parseVerdict } from "../src/verify";
import { TOOL_BY_ID } from "../src/tools";
import { findProblems, tidy } from "../src/check";
import type { Env } from "../src/env";

// A stand-in for the AI provider that speaks the same streaming format,
// so the real request/response path is exercised without spending money.
let server: Server;
let lastBody: any;
let mode: "ok" | "refusal" | "overloaded" | "messy" | "keyed" = "ok";
let calls = 0;
let draftKey = "3/4";
let repairKey = "3/4";

const sse = (event: string, data: object) => `event: ${event}\ndata: ${JSON.stringify({ type: event, ...data })}\n\n`;

beforeAll(async () => {
  server = createServer((req, res) => {
    let raw = "";
    req.on("data", (c) => (raw += c));
    req.on("end", () => {
      lastBody = JSON.parse(raw);
      calls++;
      if (mode === "overloaded") {
        res.writeHead(529, { "content-type": "application/json" });
        return res.end(JSON.stringify({ type: "error", error: { type: "overloaded_error", message: "Overloaded" } }));
      }
      res.writeHead(200, { "content-type": "text/event-stream" });
      const usage = { input_tokens: 10, output_tokens: 5 };
      res.write(sse("message_start", { message: { id: "msg_1", type: "message", role: "assistant", model: lastBody.model, content: [], stop_reason: null, stop_sequence: null, usage } }));
      if (mode === "ok") {
        res.write(sse("content_block_start", { index: 0, content_block: { type: "text", text: "" } }));
        res.write(sse("content_block_delta", { index: 0, delta: { type: "text_delta", text: "# Fractions " } }));
        res.write(sse("content_block_delta", { index: 0, delta: { type: "text_delta", text: "Quiz\n\n1. What is 1/2 + 1/4?" } }));
        res.write(sse("content_block_stop", { index: 0 }));
      }
      if (mode === "messy") {
        // First request: a draft that argues with itself. Second request (the repair): a clean copy.
        const repair = String(lastBody.messages[0].content).includes("A checker found");
        const top = "# Fractions Quiz\n\n1. What is 1/2 + 1/4?\n\n## Answer Key\n\n";
        const text = repair ? top + "1. 3/4" : top + "1. 2/6. Correction: the answer is 3/4.";
        res.write(sse("content_block_start", { index: 0, content_block: { type: "text", text: "" } }));
        res.write(sse("content_block_delta", { index: 0, delta: { type: "text_delta", text } }));
        res.write(sse("content_block_stop", { index: 0 }));
      }
      if (mode === "keyed") {
        // A document with an answer key. `draftKey` and `repairKey` are what the first
        // draft and the rewrite say the answer is; the checker accepts only 3/4.
        const content = String(lastBody.messages[0].content);
        const top = "# Fractions Quiz\n\n1. What is 1/2 + 1/4?\n\n## Answer Key\n\n";
        let text: string;
        if (lastBody.system === VERIFY_SYSTEM) {
          const key = content.slice(content.lastIndexOf("## Answer Key"));
          text = key.includes("1. 3/4")
            ? "Q1 | 2/4 + 1/4 = 3/4 | OK\nPROBLEMS: 0"
            : "Q1 | 2/4 + 1/4 = 3/4 | PROBLEM: the key says 2/6; the correct answer is 3/4\nPROBLEMS: 1";
        } else if (content.includes("A checker found")) {
          text = top + "1. " + repairKey;
        } else {
          text = top + "1. " + draftKey;
        }
        res.write(sse("content_block_start", { index: 0, content_block: { type: "text", text: "" } }));
        res.write(sse("content_block_delta", { index: 0, delta: { type: "text_delta", text } }));
        res.write(sse("content_block_stop", { index: 0 }));
      }
      res.write(sse("message_delta", { delta: { stop_reason: mode === "refusal" ? "refusal" : "end_turn", stop_sequence: null }, usage: { output_tokens: 5 } }));
      res.write(sse("message_stop", {}));
      res.end();
    });
  });
  await new Promise<void>((r) => server.listen(0, "127.0.0.1", r));
  const { port } = server.address() as { port: number };
  process.env.ANTHROPIC_BASE_URL = `http://127.0.0.1:${port}`;
  process.env.NO_PROXY = "127.0.0.1,localhost";
});
afterAll(() => server.close());

const env = { ANTHROPIC_API_KEY: "test-key", MODEL: "claude-haiku-5-5" } as Env;

async function collect(run: (send: (l: Line) => void) => Promise<void>): Promise<Line[]> {
  const text = await new Response(lineStream(run)).text();
  return text.trim().split("\n").map((l) => JSON.parse(l));
}

describe("generation", () => {
  it("streams the document and finishes", async () => {
    mode = "ok";
    const lines = await collect((send) => generate(env, "Document type: Quiz", send));
    const text = lines.map((l) => ("t" in l ? l.t : "")).join("");
    expect(text).toBe("# Fractions Quiz\n\n1. What is 1/2 + 1/4?");
    expect(lines.at(-1)).toEqual({ done: true });
  });
  it("sends a capped, low-cost request", async () => {
    mode = "ok";
    await collect((send) => generate(env, "Document type: Quiz", send));
    expect(lastBody.model).toBe("claude-haiku-5-5");
    expect(lastBody.max_tokens).toBeLessThanOrEqual(4096);
    expect(lastBody.thinking).toEqual({ type: "disabled" });
    expect(lastBody.stream).toBe(true);
    expect(lastBody.system).toContain("Answer Key");
    expect(lastBody.messages).toEqual([{ role: "user", content: "Document type: Quiz" }]);
  });
  it("gives bigger documents more room, up to a hard ceiling", async () => {
    mode = "ok";
    await collect((send) => generate(env, "x", send, 8000));
    expect(lastBody.max_tokens).toBe(8000);
    await collect((send) => generate(env, "x", send, 999999));
    expect(lastBody.max_tokens).toBe(12000);
  });
  it("rewrites a draft that corrects itself and swaps in the clean copy", async () => {
    mode = "messy";
    calls = 0;
    const quiz = TOOL_BY_ID["quiz"];
    const checks = { tidy: (d: string) => tidy(d, quiz), findProblems: (d: string) => findProblems(d, quiz, { topic: "Fractions" }) };
    const lines = await collect((send) => generate(env, "Document type: Quiz", send, 4096, checks));
    expect(calls).toBe(2);
    expect(lines.some((l) => "note" in l)).toBe(true);
    const swap = lines.find((l) => "replace" in l) as { replace: string };
    expect(swap.replace).toContain("1. 3/4");
    expect(swap.replace).not.toContain("Correction");
    expect(lastBody.messages[0].content).toContain("Correction: the answer is 3/4");
    expect(lines.at(-1)).toEqual({ done: true });
  });
  it("does not pay for a second pass when the draft is clean", async () => {
    mode = "ok";
    calls = 0;
    const quiz = TOOL_BY_ID["quiz"];
    const checks = { tidy: (d: string) => tidy(d, quiz), findProblems: (d: string) => findProblems(d, quiz, { topic: "Fractions" }) };
    const lines = await collect((send) => generate(env, "Document type: Quiz", send, 4096, checks));
    expect(calls).toBe(1);
    expect(lines.some((l) => "replace" in l)).toBe(false);
  });
  describe("checking the answer key", () => {
    const run = async () => {
      mode = "keyed";
      calls = 0;
      const lines = await collect((send) => generate(env, "Document type: Quiz", send, 4096, { verify: true }));
      const report = (lines.find((l) => "check" in l) as { check: CheckReport } | undefined)?.check;
      const swap = (lines.find((l) => "replace" in l) as { replace: string } | undefined)?.replace;
      return { lines, report, swap };
    };
    it("re-works a correct key once and leaves the document alone", async () => {
      draftKey = "3/4";
      const { lines, report, swap } = await run();
      expect(calls).toBe(2); // the draft, then the check
      expect(lastBody.system).toBe(VERIFY_SYSTEM);
      expect(swap).toBeUndefined();
      expect(report).toEqual({ checked: 1, fixed: 0, unsure: [] });
      expect(lines.at(-1)).toEqual({ done: true });
    });
    it("fixes a wrong answer and confirms the fix", async () => {
      draftKey = "2/6";
      repairKey = "3/4";
      const { report, swap } = await run();
      expect(calls).toBe(4); // draft, check, rewrite, check again
      expect(swap).toContain("1. 3/4");
      expect(swap).not.toContain("Please check");
      expect(report).toEqual({ checked: 1, fixed: 1, unsure: [] });
    });
    it("tells the teacher when an answer is still in doubt", async () => {
      draftKey = "2/6";
      repairKey = "2/6"; // the rewrite does not fix it
      const { report, swap } = await run();
      expect(report?.unsure).toEqual(["question 1"]);
      expect(report?.fixed).toBe(0);
      expect(swap).toContain("## Answer Key\n\n> **Please check before use:**");
      expect(swap).toContain("question 1");
    });
    it("is skipped for documents with no answer key, and when switched off", async () => {
      mode = "ok";
      calls = 0;
      const lines = await collect((send) => generate(env, "Document type: Rubric", send, 4096, { verify: true }));
      expect(calls).toBe(1);
      expect(lines.some((l) => "check" in l)).toBe(false);
      mode = "keyed";
      draftKey = "2/6";
      calls = 0;
      await collect((send) => generate(env, "Document type: Quiz", send, 4096, {}));
      expect(calls).toBe(1);
    });
    it("reads the checker's reply, whatever shape the labels take", () => {
      const v = parseVerdict(
        [
          "Q1 | 2 + 2 = 4 | OK",
          "Q2 (A) | 6y = 42, y = 7; key says C (y = 6) | PROBLEM: the key letter is wrong; the correct answer is D",
          "**B3** | 5y = 45, y = 9 | PROBLEM: the key gives two answers",
          "L1-4 | from the passage | OK",
          "Q5a | same value | PROBLEM: no error in value, so this is OK on reflection.",
          "Some chatter that is not a verdict line",
          "PROBLEMS: 2",
        ].join("\n"),
      );
      expect(v.checked).toBe(5);
      expect(v.problems.map((p) => p.label)).toEqual(["Q2", "B3"]);
      expect(parseVerdict("I could not read this document.")).toEqual({ checked: 0, problems: [] });
    });
    it("names doubtful questions in plain words on the answer key page", () => {
      expect([plainLabel("Q4"), plainLabel("B10"), plainLabel("L2-3"), plainLabel("Q6b")]).toEqual(["question 4", "Version B question 10", "Level 2 question 3", "question 6b"]);
      const doc = "# Quiz\n\n1. 2 + 2\n\n## Answer Key (Clave de respuestas)\n\n1. 4\n";
      const flagged = flagUnsure(doc, ["question 1"]);
      expect(flagged.indexOf("Please check before use")).toBeGreaterThan(flagged.indexOf("## Answer Key"));
      expect(flagged.indexOf("Please check before use")).toBeLessThan(flagged.indexOf("1. 4"));
      expect(hasAnswerKey(doc)).toBe(true);
      expect(hasAnswerKey("# Rubric\n\nNo questions here.")).toBe(false);
    });
  });
  it("explains a declined request instead of showing a blank page", async () => {
    mode = "refusal";
    const lines = await collect((send) => generate(env, "x", send));
    expect(lines.at(-1)).toHaveProperty("error");
    expect(lines.some((l) => "done" in l)).toBe(false);
  });
  it("turns provider outages into a friendly message", async () => {
    mode = "overloaded";
    const lines = await collect((send) => generate(env, "x", send));
    expect((lines.at(-1) as { error: string }).error).toMatch(/busy/);
  }, 20000);
  it("serves a labelled sample when no key is configured", async () => {
    const lines = await collect((send) => generateDemo(TOOL_BY_ID["quiz"], "Photosynthesis", send));
    const text = lines.map((l) => ("t" in l ? l.t : "")).join("");
    expect(text).toContain("Preview mode");
    expect(text).toContain("Photosynthesis");
    expect(lines.at(-1)).toEqual({ done: true, demo: true });
  });
});
