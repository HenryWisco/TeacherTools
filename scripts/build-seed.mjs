// Turns seed/*.json into seed/seed.sql (idempotent: re-running updates the starter library).
import { readdirSync, readFileSync, writeFileSync } from "node:fs";
import { createHash } from "node:crypto";

const dir = new URL("../seed/", import.meta.url);
const q = (s) => "'" + String(s ?? "").replace(/'/g, "''") + "'";
const TYPES = new Set(["lesson-plan","worksheet","quiz","rubric","reading-passage","exit-ticket","vocabulary","discussion-questions","sub-plan","unit-plan","bell-ringer","choice-board","word-problems","writing-prompts","study-guide","project","lab-activity","slide-outline"]);
const SUBJECTS = new Set(["math","ela","science","social-studies","world-languages","arts","pe-health","sel","cs-tech","esl","cte"]);
const GRADES = new Set(["K","1","2","3","4","5","6","7","8","9","10","11","12"]);

const files = readdirSync(dir).filter((f) => f.endsWith(".json")).sort();
const out = [];
let n = 0;
for (const f of files) {
  const r = JSON.parse(readFileSync(new URL(f, dir), "utf8"));
  const problems = [];
  if (!/^[a-z0-9-]+$/.test(r.slug || "")) problems.push("bad slug");
  if (!TYPES.has(r.type)) problems.push(`unknown type ${r.type}`);
  if (!SUBJECTS.has(r.subject)) problems.push(`unknown subject ${r.subject}`);
  if (!GRADES.has(String(r.grade))) problems.push(`unknown grade ${r.grade}`);
  if (!r.title || !r.summary || !r.body || r.body.length < 400) problems.push("missing or thin content");
  if (/<[a-z][^>]*>/i.test(r.body)) problems.push("contains raw HTML");
  if (problems.length) { console.error(`SKIPPED ${f}: ${problems.join(", ")}`); process.exitCode = 1; continue; }
  const id = "seed-" + createHash("sha1").update(r.slug).digest("hex").slice(0, 16);
  // Stagger dates so the library has a stable, mixed order.
  const created = new Date(Date.UTC(2026, 10, 1, 12, 0, 0) - n * 3600_000 * 7).toISOString();
  out.push(
    `INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES (` +
    [q(id), q(r.slug), q(r.title), q(r.type), q(r.grade), q(r.subject), q(r.summary), q(r.standards ?? ""), q(r.body), "'published'", "'seed'", "0", q(created)].join(", ") +
    `) ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;`
  );
  n++;
}
writeFileSync(new URL("seed.sql", dir), out.join("\n") + "\n");
console.log(`Wrote seed/seed.sql with ${n} resources`);
