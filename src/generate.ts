import Anthropic from "@anthropic-ai/sdk";
import type { Env } from "./env";
import { SYSTEM_PROMPT } from "./prompt";
import type { Tool } from "./tools";

// The response is a stream of JSON lines so the browser can show text as it arrives:
//   {"t":"some text"}   a chunk of the document
//   {"error":"..."}     something went wrong (shown to the teacher)
//   {"done":true}       finished
export type Line = { t: string } | { error: string } | { done: true; demo?: boolean };

// Hard ceiling on what one generation can cost. ~3,500 tokens is a long worksheet plus key.
const MAX_OUTPUT_TOKENS = 4096;

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

export async function generate(env: Env, userPrompt: string, send: (line: Line) => void): Promise<void> {
  const client = new Anthropic({ apiKey: env.ANTHROPIC_API_KEY, maxRetries: 1 });
  const stream = client.messages.stream({
    model: env.MODEL || "claude-haiku-5-5",
    max_tokens: MAX_OUTPUT_TOKENS,
    // Thinking is billed as output; these are single-pass documents, so keep cost flat.
    thinking: { type: "disabled" },
    system: SYSTEM_PROMPT,
    messages: [{ role: "user", content: userPrompt }],
  });

  let wrote = false;
  for await (const event of stream) {
    if (event.type === "content_block_delta" && event.delta.type === "text_delta") {
      wrote = true;
      send({ t: event.delta.text });
    }
  }
  const final = await stream.finalMessage();
  if (final.stop_reason === "refusal") {
    send({ error: "The generator declined that request. Try rewording it as a classroom task." });
    return;
  }
  if (!wrote) {
    send({ error: "Nothing came back for that request. Please try again." });
    return;
  }
  if (final.stop_reason === "max_tokens") {
    send({ t: "\n\n*This document reached the length limit. Ask for a shorter version or fewer questions to get a complete one.*" });
  }
  send({ done: true });
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

| Skill | Got it | Still practising |
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
