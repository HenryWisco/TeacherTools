// The catalogue of generators. Adding a tool = adding one entry here.
// Each tool gets its own page at /tools/<id>, which doubles as a search landing page.

export type Field = {
  name: string;
  label: string;
  kind: "text" | "textarea" | "select";
  placeholder?: string;
  options?: string[];
  required?: boolean;
  max?: number; // character cap for this field
  help?: string;
};

export type Tool = {
  id: string;
  name: string;
  icon: string;
  blurb: string; // one line on cards
  intro: string; // paragraph on the tool page (also the meta description)
  group: "Plan" | "Practice" | "Assess" | "Read & write" | "Communicate" | "Support";
  fields: Field[];
  // What to tell the model about this kind of document.
  instructions: string;
  // Whether the common grade / subject / standards fields apply.
  common?: { grade?: boolean; subject?: boolean; standards?: boolean };
  libraryType?: boolean; // can be shared to the public library
  // Who reads the document. Student sheets (the default) get a Name/Date line; these do not.
  audience?: "teacher" | "family";
  noKey?: boolean; // never has an answer key (no questions for students)
};

// ---- Options every tool shares (the "More options" block) ----

export const REGIONS: Record<string, { label: string; guide: string }> = {
  us: { label: "United States", guide: "" },
  uk: { label: "United Kingdom", guide: "British spelling, metric units, pounds (£), UK year groups and key stages (US Grade N is roughly Year N+1 in England), and National Curriculum terms" },
  ca: { label: "Canada", guide: "Canadian spelling, metric units, Canadian dollars, and Canadian grade names and provincial curriculum terms" },
  au: { label: "Australia", guide: "Australian spelling, metric units, Australian dollars, Australian year levels (US Grade N is roughly Year N), and Australian Curriculum terms" },
  nz: { label: "New Zealand", guide: "New Zealand spelling, metric units, New Zealand dollars, and New Zealand year levels (US Grade N is roughly Year N+1)" },
  ie: { label: "Ireland", guide: "Irish/British spelling, metric units, euro (€), and Irish class names (US Grade N is roughly class N in primary school)" },
  other: { label: "Another country", guide: "international English, metric units, and neutral terms that do not assume the US school system or US currency" },
};

export const LANGUAGES = [
  "English",
  "Spanish",
  "English + Spanish (side by side)",
  "French",
  "Portuguese",
  "Chinese (Simplified)",
  "Vietnamese",
  "Arabic",
  "Tagalog",
  "Haitian Creole",
];

export const VERSIONS: Record<string, { label: string; guide: string }> = {
  ab: {
    label: "Two versions (A and B)",
    guide:
      'Make two parallel versions so neighbours cannot copy: same skills, same difficulty and same number of questions, but different numbers, examples and question order. Every question with a worked-out answer must have a different answer in Version B than in Version A; do not repeat a question word for word. Write nothing between the title and "## Version A" except directions. Put each under its own heading, exactly "## Version A" and "## Version B", each starting with its own name/date line (and no name/date line under the main title). Finish with one "## Answer Key" that covers Version A and then Version B.',
  },
  levels: {
    label: "Three levels (support, on level, challenge)",
    guide:
      'Make the same task at three levels so the whole class works on the same content. Use exactly these headings: "## Level 1: More support" (shorter, simpler wording, worked example, sentence starters or word bank), "## Level 2: On level", and "## Level 3: Challenge" (deeper reasoning, not just more questions). The levels must really differ: the support level uses easier numbers or shorter text, not the same questions with hints added. Each level is a complete handout for a different group of students, so it starts with its own name/date line (none under the main title), contains everything those students need, and never refers to the page of another level. If there is a reading passage, rewrite the passage itself for each level (the same content, shorter and simpler for Level 1) rather than printing identical text three times, and make sure the questions at each level can be answered from the passage printed at that level. Write nothing between the title and "## Level 1" except directions. Finish with one "## Answer Key" covering all three levels.',
  },
};

// Tools where A/B versions or levelled versions make sense.
const VERSION_TOOLS = new Set(["worksheet", "word-problems", "quiz", "exit-ticket", "reading-passage", "vocabulary", "study-guide", "bell-ringer", "anything"]);
export const allowsVersions = (tool: Tool): boolean => VERSION_TOOLS.has(tool.id);
// Every tool can take a pasted text or template except the leveler, which already has its own text box.
export const allowsReference = (tool: Tool): boolean => tool.id !== "text-leveler";
export const MAX_REFERENCE = 7000;

// Ages shown beside grades for teachers outside the US.
export function gradeAges(g: string): string {
  const n = g === "K" ? 0 : parseInt(g, 10);
  return `${n + 5}–${n + 6}`;
}

export const GRADES = ["K", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];

export const SUBJECTS: Record<string, string> = {
  math: "Math",
  ela: "English Language Arts",
  science: "Science",
  "social-studies": "Social Studies",
  "world-languages": "World Languages",
  arts: "Art & Music",
  "pe-health": "PE & Health",
  sel: "Social-Emotional Learning",
  "cs-tech": "Computer Science & Tech",
  esl: "ESL / ELL",
};

export const BANDS: Record<string, { label: string; grades: string[] }> = {
  "k-2": { label: "K–2", grades: ["K", "1", "2"] },
  "3-5": { label: "3–5", grades: ["3", "4", "5"] },
  "6-8": { label: "6–8", grades: ["6", "7", "8"] },
  "9-12": { label: "9–12", grades: ["9", "10", "11", "12"] },
};

export function gradeLabel(g: string): string {
  if (!g) return "";
  return g === "K" ? "Kindergarten" : `Grade ${g}`;
}

const topic = (placeholder: string, label = "Topic"): Field => ({
  name: "topic",
  label,
  kind: "text",
  placeholder,
  required: true,
  max: 300,
});

const details: Field = {
  name: "details",
  label: "Anything else? (optional)",
  kind: "textarea",
  placeholder: "Class context, what students already know, materials you have, things to include or avoid…",
  max: 1500,
};

const FULL = { grade: true, subject: true, standards: true };

export const TOOLS: Tool[] = [
  {
    id: "lesson-plan",
    name: "Lesson Plan",
    icon: "📝",
    group: "Plan",
    blurb: "A complete, timed lesson ready to teach.",
    intro:
      "Free lesson plan generator for teachers. Enter a topic and grade and get a complete, timed lesson plan with objectives, materials, step-by-step activities, differentiation and an assessment.",
    fields: [
      topic("e.g. Adding fractions with unlike denominators"),
      {
        name: "duration",
        label: "Class length",
        kind: "select",
        options: ["30 minutes", "45 minutes", "50 minutes", "60 minutes", "90 minutes (block)"],
      },
      details,
    ],
    common: FULL,
    libraryType: true,
    audience: "teacher",
    instructions:
      "Write a complete lesson plan a teacher could teach from tomorrow. Include: learning objectives (student-friendly 'I can' statements), standards if given, materials, key vocabulary, a timed sequence (hook, direct instruction, guided practice, independent practice, closure) with minutes for each step that add up to the class length, the exact questions or examples the teacher will use, differentiation for students who need support and for students ready for more, and one quick formative assessment with expected answers. Be realistic about what fits in the time. If the plan mentions a student handout, card sort or recording sheet, include it in full under its own heading at the end.",
  },
  {
    id: "unit-plan",
    name: "Unit Plan",
    icon: "🗂️",
    group: "Plan",
    blurb: "Map out a multi-week unit, lesson by lesson.",
    intro:
      "Free unit plan generator. Get a multi-week unit outline with essential questions, a lesson-by-lesson sequence, assessments and a culminating task.",
    fields: [
      topic("e.g. Ecosystems and food webs"),
      { name: "length", label: "Unit length", kind: "select", options: ["1 week", "2 weeks", "3 weeks", "4 weeks", "6 weeks"] },
      details,
    ],
    common: FULL,
    libraryType: true,
    audience: "teacher",
    instructions:
      "Write a unit plan: unit overview, essential questions, what students will know and be able to do, a table with one row per lesson (day, focus, main activity, check for understanding), formative and summative assessments, a culminating task with success criteria, and common misconceptions to watch for.",
  },
  {
    id: "sub-plan",
    name: "Sub Plan",
    icon: "🧑‍🏫",
    group: "Plan",
    blurb: "An emergency plan any substitute can run.",
    intro:
      "Free substitute teacher plan generator. Make a clear, no-prep emergency sub plan with timed activities, directions and answer keys in seconds.",
    fields: [
      topic("e.g. Review of the solar system", "What should students work on?"),
      { name: "duration", label: "How long", kind: "select", options: ["One class period", "Half day", "Full day"] },
      { name: "tech", label: "Technology", kind: "select", options: ["No devices", "Student devices available"] },
      details,
    ],
    common: { grade: true, subject: true },
    libraryType: true,
    audience: "teacher",
    instructions:
      "Write a substitute plan that a non-specialist adult can run with no preparation. Start with a short 'Notes for the substitute' section (routines to expect, what to collect, what to do if students finish early), then timed activities with word-for-word directions to read aloud, self-contained student tasks, and answer keys. Details only the teacher knows (bell schedule, seating chart location, office extension, student helpers) go in ONE fill-in table called 'Fill in before you leave this plan', right after the title; do not scatter square-bracket blanks through the rest of the plan. Then list 'What to copy' (each student page and how many). Put each student page under its own heading with a name/date line, separate from the substitute's script. Do not rely on any link, online quiz or file the teacher has not provided: device activities need a paper fallback. For grades 6 to 12, write the plan for one class period of the length given (assume 50 minutes) and say how to repeat it for other periods; a full day for a younger class covers the whole school day. Do not ask the substitute to do anything that needs subject expertise. End with a short 'Report for the teacher' form (absences, what was finished, problems, notes).",
  },
  {
    id: "slide-outline",
    name: "Slide Outline",
    icon: "📽️",
    group: "Plan",
    blurb: "Slide-by-slide text and speaker notes.",
    intro:
      "Free slide deck outline generator for teachers. Get slide-by-slide titles, bullet points, speaker notes and check-for-understanding questions to paste into Google Slides or PowerPoint.",
    fields: [
      topic("e.g. Causes of the American Revolution"),
      { name: "count", label: "Number of slides", kind: "select", options: ["6", "8", "10", "12", "15"] },
      details,
    ],
    common: FULL,
    libraryType: true,
    audience: "teacher",
    instructions:
      "Write a slide deck outline. For each slide give: '### Slide N: Title', 3-4 short student-facing bullet points, a suggested visual (described in words), and speaker notes. Include at least two check-for-understanding slides with answers in the speaker notes, and end with a summary slide.",
  },
  {
    id: "worksheet",
    name: "Worksheet",
    icon: "✏️",
    group: "Practice",
    blurb: "Print-ready practice with an answer key.",
    intro:
      "Free worksheet generator for teachers. Create a print-ready worksheet with clear directions, varied practice questions and a full answer key for any topic and grade.",
    fields: [
      topic("e.g. Identifying main idea and supporting details"),
      { name: "count", label: "Number of questions", kind: "select", options: ["8", "10", "12", "15", "20"] },
      {
        name: "style",
        label: "Question style",
        kind: "select",
        options: ["Mixed", "Multiple choice", "Short answer", "Fill in the blank", "Matching", "Word problems"],
      },
      details,
    ],
    common: FULL,
    libraryType: true,
    instructions:
      "Write a student worksheet. Begin with a name/date line, then one or two sentences of directions, a worked example where it helps, and the requested number of questions ordered from easier to harder. Leave answer space with a line of underscores. End with a complete, correct answer key.",
  },
  {
    id: "word-problems",
    name: "Math Word Problems",
    icon: "🧮",
    group: "Practice",
    blurb: "Real-world problems with worked solutions.",
    intro:
      "Free math word problem generator. Create real-world word problems on any skill with step-by-step worked solutions, at the grade level you choose.",
    fields: [
      topic("e.g. Multiplying decimals", "Math skill"),
      { name: "count", label: "Number of problems", kind: "select", options: ["5", "8", "10", "12"] },
      { name: "theme", label: "Theme (optional)", kind: "text", placeholder: "e.g. sports, cooking, space, our town", max: 100 },
      details,
    ],
    common: { grade: true, standards: true },
    libraryType: true,
    instructions:
      "Write math word problems set in realistic, varied, culturally inclusive contexts. Begin with a name/date line. Order problems from easier to harder and include at least one multi-step problem; if the skill, standard or teacher's notes call for multi-step problems, every problem needs two or more operations. Each problem must be solvable with the numbers given, make sense in the real world, and contain no hint or information that points away from the solution. Use numbers that work out cleanly unless the skill requires otherwise. The answer key must show the worked solution for each problem, not just the final answer. Double-check every calculation.",
  },
  {
    id: "vocabulary",
    name: "Vocabulary List",
    icon: "🔤",
    group: "Practice",
    blurb: "Words, kid-friendly definitions and practice.",
    intro:
      "Free vocabulary list generator. Get key terms with student-friendly definitions, example sentences and a short practice activity for any topic or text.",
    fields: [
      topic("e.g. Photosynthesis — or paste a list of words"),
      { name: "count", label: "Number of words", kind: "select", options: ["8", "10", "12", "15"] },
      details,
    ],
    common: { grade: true, subject: true },
    libraryType: true,
    instructions:
      "Write a vocabulary list as a table with columns: Word, Part of speech, Student-friendly definition, Example sentence. Then add a short practice activity (matching or fill in the blank) that uses every word once, with an answer key.",
  },
  {
    id: "bell-ringer",
    name: "Bell Ringers",
    icon: "🔔",
    group: "Practice",
    blurb: "A week or more of five-minute warm-ups.",
    intro:
      "Free bell ringer generator. Create a set of five-minute warm-up questions or prompts to start class, with answers.",
    fields: [
      topic("e.g. Review of last week's fractions unit"),
      { name: "count", label: "How many", kind: "select", options: ["5 (one week)", "10 (two weeks)", "20 (a month)"] },
      details,
    ],
    common: { grade: true, subject: true },
    libraryType: true,
    instructions:
      "Write bell ringers: short warm-up tasks students can start silently in the first five minutes with no directions from the teacher. Number them, vary the format (quick problem, error to find and fix, would-you-rather with reasoning, vocabulary, quick write), and include answers or sample responses in the answer key.",
  },
  {
    id: "choice-board",
    name: "Choice Board",
    icon: "🎲",
    group: "Practice",
    blurb: "A 3×3 grid of ways to show learning.",
    intro:
      "Free choice board generator. Build a 3×3 choice board of varied activities so students can choose how to practice and show what they know.",
    fields: [topic("e.g. The water cycle"), details],
    common: FULL,
    libraryType: true,
    instructions:
      "Write a choice board as a 3-column, 3-row table of nine distinct activities covering different ways of working (write, draw, build, speak, compute, research, create). Each cell has a short bold title and one or two sentences of directions. Below the table, add student directions (for example: choose three in a row) and a simple scoring guide.",
  },
  {
    id: "lab-activity",
    name: "Lab or Hands-On Activity",
    icon: "🧪",
    group: "Practice",
    blurb: "A low-cost investigation with a data table.",
    intro:
      "Free science lab and hands-on activity generator. Get a low-cost investigation with materials, safety notes, procedure, data table and analysis questions.",
    fields: [topic("e.g. Density of liquids"), details],
    common: FULL,
    libraryType: true,
    instructions:
      "Write a hands-on activity or lab using inexpensive, commonly available materials. Include: question to investigate, background in two or three sentences, materials per group, safety notes, numbered procedure, a blank data table, analysis questions, and teacher notes with expected results and answers. Do not include anything hazardous; flag any step that needs adult handling. The whole procedure, including set-up and clean-up, must fit the class period the teacher gives (assume 45 minutes if none is given) and say how long each part takes. Quantities must work in practice with the equipment listed, and a comparison must be a fair test (change one thing only).",
  },
  {
    id: "quiz",
    name: "Quiz",
    icon: "✅",
    group: "Assess",
    blurb: "Questions at mixed difficulty with a key.",
    intro:
      "Free quiz generator for teachers. Make a quiz with multiple choice and short answer questions at mixed difficulty, plus an answer key, for any topic and grade.",
    fields: [
      topic("e.g. The three branches of government"),
      { name: "count", label: "Number of questions", kind: "select", options: ["5", "10", "15", "20"] },
      {
        name: "style",
        label: "Question types",
        kind: "select",
        options: ["Mixed", "Multiple choice only", "Short answer only", "True / false and multiple choice"],
      },
      details,
    ],
    common: FULL,
    libraryType: true,
    instructions:
      "Write a quiz. Begin with a name/date line and a line for the score. Mix recall, application and reasoning questions. Multiple choice questions have four options labelled A-D with exactly one correct answer and plausible distractors based on common mistakes. The answer key gives the correct answer for every question and a one-line explanation. Points: 1 for each multiple choice or true/false question and 2 for each written question unless the teacher says otherwise. End every answer in the key with its points, like (1 point) or (2 points). Write the score line as '**Score:** ______ / [TOTAL]' and end the key with '**Total: [TOTAL] points**'; the site fills in the total, so never write that number yourself.",
  },
  {
    id: "exit-ticket",
    name: "Exit Ticket",
    icon: "🎟️",
    group: "Assess",
    blurb: "Three to five quick checks for understanding.",
    intro:
      "Free exit ticket generator. Create a quick end-of-lesson check for understanding with three to five questions and an answer key.",
    fields: [topic("e.g. Today's lesson on theme vs. main idea", "What did you teach today?"), details],
    common: FULL,
    libraryType: true,
    instructions:
      "Write an exit ticket students can finish in five minutes: a name/date line, three to five short questions that directly check the lesson goal (including one that asks students to explain their thinking and one self-rating of confidence), then an answer key with what a correct response shows and what to reteach if students miss it.",
  },
  {
    id: "rubric",
    name: "Rubric",
    icon: "📊",
    group: "Assess",
    blurb: "Clear criteria and levels in a table.",
    intro:
      "Free rubric generator for teachers. Create a clear scoring rubric as a table with criteria, performance levels and specific descriptors for any assignment.",
    fields: [
      topic("e.g. Persuasive essay on school uniforms", "Assignment"),
      { name: "levels", label: "Levels", kind: "select", options: ["4 levels", "3 levels", "5 levels"] },
      { name: "criteria", label: "Criteria (optional)", kind: "text", placeholder: "e.g. thesis, evidence, organization, conventions", max: 300 },
      details,
    ],
    common: FULL,
    libraryType: true,
    instructions:
      "Write a rubric as a table: one row per criterion, one column per performance level from highest to lowest, with a point value in each column header. Descriptors must be specific and observable, describe what the work shows (not just 'good' or 'poor'), and stay parallel across levels. Below the table add a total points line and a short student-friendly checklist version.",
  },
  {
    id: "study-guide",
    name: "Study Guide",
    icon: "📚",
    group: "Assess",
    blurb: "Key ideas, terms and a self-check quiz.",
    intro:
      "Free study guide generator. Turn any topic into a student study guide with key ideas, vocabulary, worked examples and a self-check quiz.",
    fields: [topic("e.g. Unit test on cell structure and function"), details],
    common: FULL,
    libraryType: true,
    instructions:
      "Write a student study guide: the big ideas in plain language, key terms with definitions, worked examples or a summary table, common mistakes to avoid, and a short self-check quiz with an answer key.",
  },
  {
    id: "reading-passage",
    name: "Reading Passage + Questions",
    icon: "📖",
    group: "Read & write",
    blurb: "An original passage at the level you pick.",
    intro:
      "Free reading passage generator. Create an original fiction or nonfiction passage at the right reading level with comprehension questions and an answer key.",
    fields: [
      topic("e.g. How volcanoes form"),
      { name: "genre", label: "Type", kind: "select", options: ["Nonfiction", "Fiction", "Biography", "Poem"] },
      { name: "length", label: "Length", kind: "select", options: ["About 150 words", "About 300 words", "About 500 words", "About 800 words"] },
      details,
    ],
    common: FULL,
    libraryType: true,
    instructions:
      "Write an original reading passage at the stated grade's reading level (sentence length, vocabulary and concept load must fit the grade), accurate if nonfiction. Begin with a name/date line, then the passage under its own title, then comprehension questions that mix literal, inferential and vocabulary-in-context questions and include one that asks for text evidence. Keep the passage within 10% of the length chosen. End with an answer key that agrees with the passage. Never reproduce existing published texts.",
  },
  {
    id: "text-leveler",
    name: "Text Leveler",
    icon: "🪜",
    group: "Read & write",
    blurb: "Rewrite any text for a different reading level.",
    intro:
      "Free text leveler for teachers. Paste any text and rewrite it at a different reading level so every student can access the same content.",
    fields: [
      {
        name: "source",
        label: "Text to rewrite",
        kind: "textarea",
        placeholder: "Paste the text here (up to about 1,000 words).",
        required: true,
        max: 7000,
        help: "Only paste text you have the right to adapt. Leave out student names.",
      },
      {
        name: "target",
        label: "Rewrite for",
        kind: "select",
        options: ["Grade 1-2", "Grade 3-4", "Grade 5-6", "Grade 7-8", "Grade 9-10", "Grade 11-12", "English learners (beginner)", "English learners (intermediate)"],
      },
      { name: "extras", label: "Add", kind: "select", options: ["Nothing extra", "A short glossary", "Three comprehension questions", "Glossary and questions"] },
    ],
    common: {},
    instructions:
      "Rewrite the provided text for the target reading level. Keep every key fact and idea and the original order; change sentence length, vocabulary and structure to fit the level. Do not add new facts. Give the rewritten text a title. Add the requested extras after the text. A glossary lists only words that appear in your rewritten text. If comprehension questions are requested, write exactly three, each answerable from your rewritten text, and include an answer key. For the youngest and beginner levels keep sentences very short and cut the passage down to its main points.",
  },
  {
    id: "writing-prompts",
    name: "Writing Prompts",
    icon: "🖊️",
    group: "Read & write",
    blurb: "Prompts students actually want to answer.",
    intro:
      "Free writing prompt generator. Get engaging narrative, opinion, argumentative or informational writing prompts matched to your grade and topic.",
    fields: [
      topic("e.g. Friendship, or any unit theme", "Theme or topic"),
      { name: "mode", label: "Kind of writing", kind: "select", options: ["Mixed", "Narrative", "Opinion / argument", "Informational", "Journal / reflection"] },
      { name: "count", label: "How many", kind: "select", options: ["5", "10", "15", "20"] },
      details,
    ],
    common: { grade: true },
    libraryType: true,
    instructions:
      "Write numbered writing prompts that are specific, open-ended and interesting to students of this age. For each, add one line of scaffolding (a sentence starter or two guiding questions). Finish with a short checklist students can use to review their writing.",
  },
  {
    id: "discussion-questions",
    name: "Discussion Questions",
    icon: "💬",
    group: "Read & write",
    blurb: "Questions that get past yes and no.",
    intro:
      "Free discussion question generator. Create open-ended discussion questions for any text or topic, grouped from understanding to deeper thinking.",
    fields: [topic("e.g. Chapters 1–3 of the class novel, or any topic", "Text or topic"), details],
    common: { grade: true, subject: true },
    libraryType: true,
    audience: "teacher",
    instructions:
      "Write open-ended discussion questions grouped under three headings: Understand, Analyze, and Connect & Evaluate. Give four to five questions per group (or, if the teacher asks for a number of questions, exactly that many in total), plus follow-up probes for the teacher and a suggested discussion routine (for example think-pair-share). No question should be answerable with yes or no.",
  },
  {
    id: "project",
    name: "Project Idea",
    icon: "🛠️",
    group: "Plan",
    blurb: "A project with steps, timeline and rubric.",
    intro:
      "Free project-based learning generator. Get a student project with a driving question, steps, timeline, deliverables and a scoring rubric.",
    fields: [
      topic("e.g. Designing a school garden"),
      { name: "length", label: "Timeframe", kind: "select", options: ["2-3 class periods", "1 week", "2 weeks", "3-4 weeks"] },
      details,
    ],
    common: FULL,
    libraryType: true,
    instructions:
      "Write a project plan: driving question, what students will make, a student-facing task sheet with numbered steps and checkpoints, a timeline table, materials, group roles, and a rubric table. Keep materials inexpensive.",
  },
  {
    id: "parent-email",
    name: "Family Email",
    icon: "✉️",
    group: "Communicate",
    blurb: "A warm, clear message home.",
    intro:
      "Free parent email generator for teachers. Draft a warm, clear, professional message to families about any situation, ready to personalize and send.",
    fields: [
      {
        name: "topic",
        label: "What is the message about?",
        kind: "textarea",
        placeholder: "e.g. Reminder about Friday's field trip: permission slips, packed lunch, 8:15 departure",
        required: true,
        max: 1200,
        help: "Don't include student names or private details. Use [Student] and fill it in after.",
      },
      { name: "tone", label: "Tone", kind: "select", options: ["Warm and friendly", "Brief and factual", "Concerned but supportive", "Celebratory"] },
      { name: "language", label: "Language", kind: "text", placeholder: "English (or e.g. English + Spanish)", max: 60 },
    ],
    common: {},
    audience: "family",
    noKey: true,
    instructions:
      "Write an email from a teacher to a family or families. Give a subject line, then the message. Keep it short, plain, respectful and free of jargon; lead with the purpose; state clearly what, if anything, the family needs to do and by when. Use every detail the teacher gave (dates, times, amounts, items) exactly, and add none of your own. Use placeholders in square brackets such as [Student], [Teacher name], [date] only for specifics that were not provided, and list them once in a line that starts 'Before you send, fill in:' placed directly under the title, above the subject line. Never put notes to the teacher inside the message itself. If a second language is requested, give the full message in both languages.",
  },
  {
    id: "report-comments",
    name: "Report Card Comments",
    icon: "🗒️",
    group: "Communicate",
    blurb: "Specific, kind comments to adapt.",
    intro:
      "Free report card comment generator. Turn quick notes on strengths and next steps into specific, kind, professional report card comments.",
    fields: [
      {
        name: "topic",
        label: "Strengths and next steps",
        kind: "textarea",
        placeholder: "e.g. Strong reader, participates a lot; needs to show work in math and check answers; kind to classmates",
        required: true,
        max: 1200,
        help: "Don't type the student's name. The comment will use [Student] for you to replace.",
      },
      { name: "length", label: "Length", kind: "select", options: ["2-3 sentences", "One short paragraph", "Three versions to choose from"] },
    ],
    common: { grade: true, subject: true },
    audience: "teacher",
    noKey: true,
    instructions:
      "Write report card comments using the placeholder [Student] instead of a name and they/them pronouns. Be specific and evidence-based, lead with a genuine strength, name one or two concrete next steps and how the family can help, and keep a warm professional tone. Avoid labels and vague praise.",
  },
  {
    id: "iep-goals",
    name: "IEP Goal Ideas",
    icon: "🎯",
    group: "Support",
    blurb: "Draft measurable goals to refine with your team.",
    intro:
      "Free IEP goal idea generator. Draft measurable annual goals and short-term objectives from a described area of need, to refine with your IEP team.",
    fields: [
      {
        name: "topic",
        label: "Area of need and present level",
        kind: "textarea",
        placeholder: "e.g. Reading fluency: currently reads 45 words per minute on grade 3 text with 90% accuracy",
        required: true,
        max: 1200,
        help: "Describe the need in general terms only. Never enter a student's name, ID, diagnosis details or anything that could identify them.",
      },
    ],
    common: { grade: true },
    audience: "teacher",
    noKey: true,
    instructions:
      "Draft three measurable annual goal options for the described area of need, each with: condition, observable behavior, criterion, how it will be measured, and two or three short-term objectives. Add suggested accommodations and progress-monitoring ideas. Use 'the student'. Open with one sentence noting these are draft ideas for the IEP team to adapt, since goals must be individualized by the team.",
  },
  {
    id: "accommodations",
    name: "Differentiation Ideas",
    icon: "🧩",
    group: "Support",
    blurb: "Ways to adapt a lesson for every learner.",
    intro:
      "Free differentiation idea generator. Describe a lesson or task and get practical ways to adapt it for students who need support, English learners and students ready for more.",
    fields: [
      {
        name: "topic",
        label: "Lesson or task to adapt",
        kind: "textarea",
        placeholder: "e.g. Students read a two-page article on erosion and answer five written questions",
        required: true,
        max: 1500,
      },
      details,
    ],
    common: { grade: true, subject: true },
    audience: "teacher",
    noKey: true,
    instructions:
      "Give practical differentiation ideas for the described lesson, grouped under: Students who need more support, English learners, Students with attention or executive-function needs, and Students ready for more challenge. Each idea must be specific to this lesson and doable tomorrow with ordinary classroom resources. Finish with a version of the task at three levels of scaffolding.",
  },
  {
    id: "anything",
    name: "Ask for Anything",
    icon: "✨",
    group: "Plan",
    blurb: "Describe what you need in your own words.",
    intro:
      "Describe any classroom material you need in your own words and get a print-ready version in seconds. Free for teachers, no sign-up.",
    fields: [
      {
        name: "topic",
        label: "What do you need?",
        kind: "textarea",
        placeholder: "e.g. A 20-minute station activity on area and perimeter for 3rd grade with a recording sheet",
        required: true,
        max: 2000,
      },
    ],
    common: { grade: true, subject: true },
    libraryType: true,
    instructions:
      "Work out what kind of classroom material the teacher is asking for and write it in full, in the format a teacher would expect for that kind of document. If it includes questions for students, include an answer key.",
  },
];

export const TOOL_BY_ID: Record<string, Tool> = Object.fromEntries(TOOLS.map((t) => [t.id, t]));

// Display names for library resource types (tool ids plus a few seed-only types).
export const TYPE_LABELS: Record<string, string> = {
  ...Object.fromEntries(TOOLS.map((t) => [t.id, t.name])),
  anything: "Classroom Resource",
};

export function typeLabel(type: string): string {
  return TYPE_LABELS[type] ?? "Classroom Resource";
}
