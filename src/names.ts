// Catches student names before anything is sent to the AI model.
//
// The IEP, report comment, family email and differentiation forms ask teachers
// not to type a student's name, but reviewers typed one and saw it printed in the
// title. On those tools the text is checked here first and anything that looks
// like a student's name, ID number or date of birth is swapped for a placeholder,
// so it never leaves this server. This is a best-effort net, not a guarantee:
// it knows a few hundred common first names and a handful of give-away phrases.

const list = (s: string) => new Set(s.split(/\s+/).filter(Boolean));

// First names that are rarely anything else.
const NAMES = list(`
Aaliyah Aaron Abby Abdul Abdullah Abigail Abraham Adam Addison Adrian Adriana Ahmad Ahmed Aidan Aiden Aisha Alan Alana
Alejandra Alejandro Alex Alexa Alexander Alexandra Alexis Alfredo Ali Alice Alicia Alina Alisha Allison Alondra Alyssa
Amanda Amara Amari Amelia Amir Amy Ana Andre Andrea Andres Andrew Andy Angela Angelica Angelina Angelo Anika Anna
Annabelle Anthony Antonio Aria Ariana Arianna Ariel Arjun Armando Arturo Aryan Asher Ashley Ashton Aubrey Audrey Aurora
Ava Avery Ayaan Ayden Ayesha Bella Benjamin Bianca Blake Braden Bradley Brady Brandon Brayden Brenda Brendan Brian
Briana Brianna Brittany Brody Bryan Bryce Bryson Caden Caleb Cameron Camila Carla Carlos Carmen Caroline Carson
Cassandra Catherine Cecilia Cesar Charles Charlie Charlotte Chelsea Chloe Christina Christopher Claire Clara Cody Colin
Connor Cooper Cristian Daisuke Dakari Damian Daniel Daniela Danielle Dante Darius David Declan Deja Demetrius Derek
Deshawn Devin Devon Diana Diego Dominic Dylan Eduardo Edward Edwin Elena Eli Eliana Elias Elijah Elizabeth Ella Ellie
Emanuel Emilia Emiliano Emily Emma Emmanuel Enrique Eric Erica Erick Erik Erin Esmeralda Esteban Esther Ethan Eva
Evan Evelyn Ezekiel Ezra Fatima Felipe Fernanda Fernando Finn Francisco Gabriel Gabriela Gabriella Gavin Giovanni
Gianna Giselle Gloria Gracie Grayson Gregory Guadalupe Gustavo Hailey Haley Hamza Hannah Harper Hassan Hayden Hector
Henry Hiroshi Hudson Hugo Ian Ibrahim Imani Isaac Isabel Isabella Isabelle Isaiah Ismael Ivan Jabari Jackson Jacob
Jacqueline Jada Jaden Jaime Jake Jalen Jamal Jamar James Jamie Janelle Jared Jasmin Jason Javier Jaxon Jayden Jayla
Jaylen Jazmin Jeffrey Jennifer Jeremiah Jeremy Jesse Jessica Jimena Joaquin Joel Johnny Jonah Jonathan Jorge Jose
Joseph Joshua Josiah Josue Juan Julia Julian Juliana Julio Justin Kaden Kai Kaitlyn Kaleb Kamal Kareem Karen Karina
Karla Kate Katelyn Katherine Kayla Kaylee Keisha Kennedy Kenneth Kevin Khalil Kiara Kimberly Kofi Kwame Kyle Kylie
Laila Landon Laura Lauren Layla Leah Leila Leilani Leo Leonardo Leslie Levi Liam Liliana Lillian Lincoln Linh Logan
Lorenzo Luca Lucas Lucia Luis Luke Luna Lydia Mackenzie Madeline Madison Makayla Malachi Malia Malik Manuel Marco
Marcos Marcus Margaret Maria Mariah Mariam Mariana Marisol Marlon Martin Mateo Matias Matteo Matthew Mauricio Maya
Megan Mei Melanie Melissa Mia Micah Michael Michelle Miguel Mila Minh Miriam Mohamed Mohammad Mohammed Molly Monica
Morgan Muhammad Mya Nadia Naomi Natalia Natalie Nathan Nathaniel Nevaeh Nia Nicholas Nicolas Nicole Nina Noah Noelle
Nolan Nora Nour Oliver Olivia Omar Oscar Owen Pablo Paige Paola Patrick Paul Pedro Peter Peyton Priya Quentin Quinn
Rachel Rafael Rahul Ramon Raul Rebecca Ricardo Richard Riley Rodrigo Rohan Roman Rosa Ryan Sadie Samantha Samir
Samuel Santiago Sara Sarah Savannah Sean Sebastian Selena Serena Sergio Seth Shane Shanice Shawn Silas Simon Sofia
Sophia Sophie Stella Stephanie Stephen Steven Talia Tamara Tariq Tatiana Tessa Thiago Thomas Tiana Timothy Tomas
Tremaine Trevor Tristan Tyler Tyrone Valentina Valeria Vanessa Veronica Victoria Vincent Vivian Wesley William Wyatt
Xavier Ximena Yadira Yahir Yasmin Yesenia Yusuf Zachary Zainab Zara Zoe Zoey Zuri
`);

// First names that are also ordinary words, months or places. These count only
// when the words around them point to a person ("Grace is", "for Jordan's").
const AMBIGUOUS = list(`
Angel April Art August Austin Autumn Bill Brooklyn Carter Chance Chase Christian Cruz Daisy Dakota Dallas Dawn Dean
Destiny Drew Eve Faith Frank Genesis Georgia Grace Grant Harmony Hazel Hope Hunter Israel Ivy Jack Jade Jasmine
Jesus Jordan Journey Joy June King Lane Lily London Major Mark Mason Max May Melody Miles Olive Paris Parker Pat
Pearl Penny Ray Reed River Rob Robin Rose Ruby Sage Sky Summer Sydney Taylor Trinity Victor Violet Will
`);

// Capitalised words that are never a name here, so "named Chromebook" style slips stay out.
const NOT_NAMES = list(`
I The A An He She They We It His Her Their This That These Those Monday Tuesday Wednesday Thursday Friday Saturday
Sunday January February March July September October November December English Spanish French Math Science Reading
Writing History Art Music Grade Kindergarten IEP ELL ESL Student Teacher Parent Family Dear Mr Mrs Ms Miss Dr
`);

const WORD = "[A-Z][a-zà-öø-ÿ]+";
const PERSON_AFTER = /^(?:'s|’s|\s+(?:is|was|has|had|needs|struggles|reads|writes|can|cannot|could|will|would|does|did|often|still|keeps|tends|scored|scores|loves|likes|works|gets|got|and\s+(?:his|her|their)))\b/;
const PERSON_BEFORE = /(?:\b(?:student|pupil|child|son|daughter|kid|boy|girl|named|called|name is|about|for|with|and|of|to|from)\s+|[.!?:;,\n]\s*|^\s*)$/i;
const NOT_PERSON_BEFORE = /\b(?:in|on|by|until|since|during|every|each|next|last|this|the|early|late|mid)\s+$/i;
const INTRODUCED = /\b(?:named|called|name is|my student|the student,?)\s+$/i;

export type Redaction = { text: string; found: string[] };

// Replaces what looks like a student's name, ID or date of birth with a placeholder.
export function redactStudentDetails(input: string): Redaction {
  const found: string[] = [];
  const note = (s: string) => { if (!found.includes(s)) found.push(s); };
  let text = input;

  text = text.replace(/\b(?:student\s+)?(?:ID|I\.D\.)\s*(?:#|number|no\.?)?\s*:?\s*#?\s*[A-Z]?\d{4,}\b/gi, () => {
    note("an ID number");
    return "[ID removed]";
  });
  text = text.replace(/\b(?:DOB|D\.O\.B\.|date of birth|born(?: on)?)\s*:?\s*(?:\d{1,2}[\/\-.]\d{1,2}[\/\-.]\d{2,4}|\d{4}-\d{2}-\d{2}|[A-Z][a-z]+ \d{1,2},? \d{4})/gi, () => {
    note("a date of birth");
    return "[date of birth removed]";
  });

  const re = new RegExp(`\\b${WORD}\\b`, "g");
  const spans: { start: number; end: number }[] = [];
  let m: RegExpExecArray | null;
  while ((m = re.exec(text))) {
    const word = m[0];
    const before = text.slice(Math.max(0, m.index - 24), m.index);
    const after = text.slice(m.index + word.length, m.index + word.length + 24);
    // "Ms. Rivera", "Dr. Chen": an adult's title and surname is the teacher's to give.
    if (/\b(?:Mr|Mrs|Ms|Mx|Miss|Dr|Sr|Sra|Srta|Coach|Principal|Professor)\.?\s+$/.test(before)) continue;
    let isName = false;
    if (NAMES.has(word)) isName = true;
    else if (AMBIGUOUS.has(word)) isName = PERSON_AFTER.test(after) && PERSON_BEFORE.test(before) && !NOT_PERSON_BEFORE.test(before);
    else if (!NOT_NAMES.has(word)) isName = INTRODUCED.test(before);
    if (!isName) continue;
    let end = m.index + word.length;
    // A surname or initial straight after the first name goes too: "Maria Gonzalez", "Maria G."
    const tail = text.slice(end).match(new RegExp(`^\\s+(?:${WORD}|[A-Z]\\.)(?![a-z])`));
    if (tail && !NOT_NAMES.has(tail[0].trim()) && !/^\s+(?:Is|Has|Was|Needs|Reads|Can|Will)\b/.test(tail[0])) end += tail[0].length;
    note(text.slice(m.index, end));
    spans.push({ start: m.index, end });
    re.lastIndex = end;
  }
  for (const s of spans.reverse()) text = text.slice(0, s.start) + "[Student]" + text.slice(s.end);
  return { text, found };
}
