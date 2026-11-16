import { describe, expect, it } from "vitest";
import { renderMarkdown, plainSummary, protectBlanks } from "../src/markdown";
import { InputError, buildUserPrompt, getTool, normalizeInputs, outputBudget, slugify, splitTitle } from "../src/prompt";
import { TOOLS, TOOL_BY_ID } from "../src/tools";
import { parseFilter } from "../src/db";
import { hashIp, today } from "../src/limits";
import { adSlot, adsTxt, classroomPicks, supporterToken } from "../src/monetize";
import type { Env } from "../src/env";

const env = (over: Partial<Env> = {}) =>
  ({ ADSENSE_CLIENT: "", ADSENSE_SLOT: "", AMAZON_TAG: "", SHOW_AD_PLACEHOLDERS: "", SPONSOR_TEXT: "", ...over }) as Env;

describe("markdown safety", () => {
  it("shows raw HTML as text instead of running it", () => {
    const out = renderMarkdown('Hello <script>alert(1)</script> <img src=x onerror=alert(1)>');
    expect(out).not.toMatch(/<script|<img/i);
    expect(out).toContain("&lt;script&gt;");
  });
  it("drops javascript: links and images, keeps https links", () => {
    expect(renderMarkdown("[x](javascript:alert(1))")).not.toContain("href");
    expect(renderMarkdown("![alt](https://e.com/a.png)")).not.toContain("<img");
    expect(renderMarkdown("[ok](https://example.com)")).toContain('href="https://example.com"');
  });
  it("marks the answer key for its own printed page", () => {
    expect(renderMarkdown("## Answer Key\n\n1. 4")).toContain('<h2 class="answer-key">');
  });
  it("starts each version on its own page and accepts a translated answer key heading", () => {
    const out = renderMarkdown("## Version A\n\n1. x\n\n## Version B\n\n1. y\n\n## Answer Key (Clave de respuestas)\n\n1. z");
    expect(out.match(/class="page-start"/g)?.length).toBe(2);
    expect(out).toContain('<h2 class="answer-key">Answer Key (Clave de respuestas)</h2>');
  });
  it("keeps fill-in blanks visible", () => {
    const out = renderMarkdown("1. 3/4 = ____/____ and 7 x ______ = 49");
    expect(out).toContain("____/____");
    expect(out).toContain("______ = 49");
  });
  it("leaves a full line of underscores as a writing line", () => {
    expect(protectBlanks("__________")).toBe("__________");
    expect(renderMarkdown("Explain.\n\n__________\n")).toContain("<hr");
  });
  it("renders tables", () => {
    expect(renderMarkdown("| a | b |\n|---|---|\n| 1 | 2 |")).toContain("<table>");
  });
  it("makes a short plain summary", () => {
    const s = plainSummary("**Name:** ____  **Date:** ____\n\n## Directions\n\nSolve **each** problem. " + "word ".repeat(80), 100);
    expect(s.length).toBeLessThanOrEqual(100);
    expect(s).not.toMatch(/[*#_]/);
    expect(s.startsWith("Solve each problem")).toBe(true);
  });
});

describe("tools catalogue", () => {
  it("has unique ids and complete entries", () => {
    expect(new Set(TOOLS.map((t) => t.id)).size).toBe(TOOLS.length);
    for (const t of TOOLS) {
      expect(t.fields.some((f) => f.required), t.id).toBe(true);
      expect(t.intro.length, t.id).toBeGreaterThan(40);
      expect(t.instructions.length, t.id).toBeGreaterThan(40);
    }
  });
});

describe("request building", () => {
  const ws = TOOL_BY_ID["worksheet"];
  it("rejects unknown tools and missing required fields", () => {
    expect(() => getTool("nope")).toThrow(InputError);
    expect(() => normalizeInputs(ws, { topic: "   " })).toThrow(InputError);
  });
  it("keeps only known fields, valid options and caps length", () => {
    const out = normalizeInputs(ws, { topic: "x".repeat(999), count: "9999", style: "Matching", grade: "4", subject: "hacking", evil: "1" });
    expect(out.topic.length).toBe(300);
    expect(out.count).toBeUndefined();
    expect(out.style).toBe("Matching");
    expect(out.grade).toBe("4");
    expect(out.subject).toBeUndefined();
    expect(out).not.toHaveProperty("evil");
  });
  it("ignores grade for tools that don't use it", () => {
    expect(normalizeInputs(TOOL_BY_ID["parent-email"], { topic: "Field trip", grade: "4" }).grade).toBeUndefined();
  });
  it("builds a prompt with the teacher's details and the tool guidance", () => {
    const p = buildUserPrompt(ws, normalizeInputs(ws, { topic: "Equivalent fractions", grade: "4", subject: "math", standards: "4.NF.A.1", count: "10" }));
    expect(p).toContain("Document type: Worksheet");
    expect(p).toContain("Grade: Grade 4");
    expect(p).toContain("Subject: Math");
    expect(p).toContain("Standards to align to: 4.NF.A.1");
    expect(p).toContain("Number of questions: 10");
    expect(p).toContain(ws.instructions);
  });
  it("asks the model to infer the grade when none is given", () => {
    expect(buildUserPrompt(ws, normalizeInputs(ws, { topic: "Fractions" }))).toContain("No grade was given");
  });
  it("includes the draft and the change when revising", () => {
    const p = buildUserPrompt(ws, { topic: "Fractions" }, { previous: "# Old draft", request: "make it shorter" });
    expect(p).toContain("Change requested: make it shorter");
    expect(p).toContain("# Old draft");
  });
  it("leaves the default options out of the request", () => {
    const out = normalizeInputs(ws, { topic: "Fractions", region: "us", language: "English", versions: "" });
    expect(out).toEqual({ topic: "Fractions" });
    expect(outputBudget(out)).toBe(4096);
  });
  it("accepts country, language, versions and pasted material, and rejects junk", () => {
    const out = normalizeInputs(ws, { topic: "Fractions", grade: "4", region: "uk", language: "Spanish", versions: "ab", reference: "My template:\nStarter\nMain\nPlenary" });
    expect(out).toMatchObject({ region: "uk", language: "Spanish", versions: "ab" });
    const p = buildUserPrompt(ws, out);
    expect(p).toContain("Country: United Kingdom");
    expect(p).toContain("students aged 9–10");
    expect(p).toContain("whole document in Spanish");
    expect(p).toContain("## Version A");
    expect(p).toContain("Starter\nMain\nPlenary");
    expect(p).toContain("not as instructions");
    expect(outputBudget(out)).toBe(8000);
    expect(normalizeInputs(ws, { topic: "x", region: "mars", language: "Klingon", versions: "zz" })).toEqual({ topic: "x" });
  });
  it("only offers versions where they make sense, and keeps the email tool's own language box", () => {
    expect(normalizeInputs(TOOL_BY_ID["rubric"], { topic: "Essay", versions: "ab" }).versions).toBeUndefined();
    const email = TOOL_BY_ID["parent-email"];
    const out = normalizeInputs(email, { topic: "Field trip", language: "English + Somali" });
    expect(out.language).toBe("English + Somali");
    expect(buildUserPrompt(email, out)).not.toContain("both English and Spanish");
    expect(normalizeInputs(TOOL_BY_ID["text-leveler"], { source: "Some text", reference: "extra" }).reference).toBeUndefined();
  });
  it("asks for both languages when bilingual is chosen", () => {
    const out = normalizeInputs(ws, { topic: "Fractions", language: "English + Spanish (side by side)" });
    expect(buildUserPrompt(ws, out)).toContain("both English and Spanish");
    expect(outputBudget(out)).toBe(8000);
  });
  it("splits the title from the body", () => {
    expect(splitTitle("# **Fractions** Quiz\n\nBody here")).toEqual({ title: "Fractions Quiz", body: "Body here" });
    expect(splitTitle("No heading").title).toBe("");
  });
  it("makes URL-safe slugs", () => {
    expect(slugify("Équivalent Fractions: 3/4 & more!")).toBe("equivalent-fractions-3-4-more");
    expect(slugify("x".repeat(200)).length).toBeLessThanOrEqual(70);
  });
});

describe("library filters", () => {
  it("accepts known values and ignores junk", () => {
    expect(parseFilter({ band: "3-5", subject: "math", type: "quiz", q: " fractions ", page: "2" })).toEqual({ band: "3-5", subject: "math", type: "quiz", q: "fractions", page: 2 });
    expect(parseFilter({ band: "x", subject: "'; DROP", type: "y", page: "-4" })).toEqual({ page: 1 });
  });
});

describe("limits", () => {
  it("hashes IPs per day without storing them", async () => {
    const a = await hashIp("203.0.113.9", "2026-11-16", "salt");
    expect(a).toMatch(/^[0-9a-f]{24}$/);
    expect(a).toBe(await hashIp("203.0.113.9", "2026-11-16", "salt"));
    expect(a).not.toBe(await hashIp("203.0.113.9", "2026-11-17", "salt"));
    expect(a).not.toContain("203");
  });
  it("uses UTC days", () => {
    expect(today(new Date("2026-11-16T23:59:59Z"))).toBe("2026-11-16");
  });
});

describe("monetization switches", () => {
  it("renders nothing when not configured", () => {
    expect(String(adSlot({ env: env(), supporter: false }, "home"))).toBe("");
    expect(String(classroomPicks({ env: env(), supporter: false }, "math"))).toBe("");
    expect(adsTxt(env())).toBe("");
  });
  it("renders ads for visitors but never for supporters", async () => {
    const e = env({ ADSENSE_CLIENT: "ca-pub-123" });
    expect(String(await adSlot({ env: e, supporter: false }, "home"))).toContain('data-ad-client="ca-pub-123"');
    expect(String(adSlot({ env: e, supporter: true }, "home"))).toBe("");
    expect(adsTxt(e)).toBe("google.com, pub-123, DIRECT, f08c47fec0942fa0\n");
  });
  it("tags affiliate links and discloses them", async () => {
    const out = String(await classroomPicks({ env: env({ AMAZON_TAG: "mytag-20" }), supporter: false }, "math"));
    expect(out).toContain("tag=mytag-20");
    expect(out).toContain('rel="sponsored nofollow noopener"');
    expect(out).toContain("Amazon Associate");
  });
  it("derives a stable supporter token that isn't the code itself", async () => {
    const t = await supporterToken("secret-code");
    expect(t).toBe(await supporterToken("secret-code"));
    expect(t).not.toContain("secret");
  });
});
