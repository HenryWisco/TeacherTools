# Seed resource format

One JSON file per resource in this folder, named `<slug>.json`:

{
  "slug": "equivalent-fractions-worksheet-grade-4",   // lowercase, hyphens, unique, descriptive
  "title": "Equivalent Fractions Worksheet",
  "type": "worksheet",          // one of the type ids below
  "grade": "4",                 // one of: K 1 2 3 4 5 6 7 8 9 10 11 12
  "subject": "math",            // one of the subject ids below
  "summary": "One or two sentences a teacher would read in a search result.",
  "standards": "CCSS.MATH.CONTENT.4.NF.A.1",   // optional, "" if none
  "body": "Markdown string"
}

Type ids: lesson-plan, worksheet, quiz, rubric, reading-passage, exit-ticket, vocabulary,
discussion-questions, sub-plan, unit-plan, bell-ringer, choice-board, word-problems,
writing-prompts, study-guide, project, lab-activity, slide-outline

Subject ids: math, ela, science, social-studies, world-languages, arts, pe-health, sel, cs-tech, esl, cte

Body rules (Markdown):
- Do NOT repeat the title as a heading; start with content. Use `##` for sections, `###` below.
- Student-facing sheets (worksheet, quiz, exit-ticket, word-problems, reading-passage) start with
  the line `**Name:** ______________________  **Date:** ____________` then directions.
- Number questions with `1.` lists. For writing space use a line of underscores on its own line.
- Tables are allowed (GitHub-style pipes), e.g. for rubrics and choice boards.
- If there are questions, end with a section titled exactly `## Answer Key` (it prints on its own page).
- No raw HTML, no images, no links. Plain text math (3/4, x^2, sqrt(16)).
- Must be accurate, classroom-ready, age-appropriate, and complete: a teacher prints it and uses it.
- No real student names or personal data. Original writing only: no copyrighted passages, songs or poems.
