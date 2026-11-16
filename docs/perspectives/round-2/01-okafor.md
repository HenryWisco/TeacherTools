# Ms. Okafor, 4th grade teacher (all subjects)

**Verdict:** Would use, with conditions. I would use it tonight for reading passages and emails home. I would not trust the math word problem tool yet, and that is the one I would reach for most.

**In one sentence:** It is faster than ChatGPT for the "I need a printable in ten seconds" jobs and it followed my reading and email instructions to the letter, but the math set shipped a broken problem with a note in the answer key admitting it was broken, which is exactly what ChatGPT does on a bad day, so it has not yet given me a reason to switch for math.

## What I did

Pages visited: home page, /tools, /library, /library?band=3-5 (the grades 3 to 5 filter), the library resource "Equivalent Fractions Worksheet" (Grade 4), /about, /privacy, /terms, /support, /my.

Forms looked at: Math Word Problems, Reading Passage + Questions, Family Email, Ask for Anything.

Documents generated (3 of my 3):

1. `01-01-word-problems.md` - Math Word Problems, grade 4, 8 problems, book fair theme, standard 4.OA.A.3. I asked for multi-step problems using 2-digit by 2-digit multiplication and division with remainders, with at least 3 problems that make students interpret the remainder in different ways (round up, drop it, remainder is the answer), no decimals, work space. Took 8.7 seconds.
2. `01-02-reading-passage.md` - Reading Passage + Questions, nonfiction, about 300 words, grade 4 science, "How sea otters help keep kelp forests healthy", standard RI.4.2. I asked for exactly 6 questions (4 multiple choice, 2 written), one main idea, one vocabulary in context. Took 7.0 seconds.
3. `01-03-parent-email.md` - Family Email, warm tone, English + Spanish, a field trip notice with eight specific details (dates, times, cost, what to bring, chaperones). Took 4.6 seconds.

I worked every math answer by hand, counted the passage words, checked the science facts, checked every date and number in the email against what I typed, and read the Spanish.

## Problems found

### 1. Math problem 8 cannot be solved, and the answer key says so (blocker)
Where: `01-01-word-problems.md`, problem 8 and its answer.
What I saw: The problem says 36 students need bags, packs of 6, "5 dollars per pack", "the school has 25 dollars to spend. How many packs does the school need to buy, and how much money does the school have left". Six packs cost 30 dollars, more than the 25 they have. The answer key then says: "Note for teacher: as written, the cost is 30 dollars and the budget is 25 dollars. Teachers may wish to change the budget to 30 dollars or more".
Why it matters: The site noticed its own mistake and printed it anyway. If I had hit Print without reading the key, 25 fourth graders would have got an impossible question. Also, 36 divided by 6 has no remainder, so this problem does not practise the skill I asked for either.
Fix I want: Before a document is shown, any problem the key itself flags as not working should be rewritten or replaced automatically. The key should never contain "teachers may wish to change the numbers".

### 2. I asked for multi-step problems; five of the eight are one step (major)
Where: `01-01-word-problems.md`, problems 1, 3, 4, 5 (and 2 is two-step but trivial).
What I saw: The page prints the standard as "Solve multistep word problems", then problem 1 is "12 boxes of bookmarks. Each box holds 24 bookmarks. How many bookmarks are there in all?" Problems 3, 4 and 5 are each a single division. Only problems 1 and 6 use 2-digit by 2-digit multiplication.
Why it matters: The sheet claims a standard on its header that most of its problems do not meet. An administrator looking at it would notice.
Fix I want: When the request or the standard says multi-step, every problem (or a stated majority) should need two or more operations, and the skill I typed should show up in most problems, not two.

### 3. "Interpret the remainder" was not really done (major)
Where: `01-01-word-problems.md`, problems 3, 4, 5.
What I saw: I asked for three different kinds of remainder thinking. Problems 3, 4 and 5 all hand the thinking to the student: "How many full teams can she make, and how many students are left over?", "how many stickers are left over?", "how much money does he have left?". Only problem 7 makes the student decide to round up.
Why it matters: The whole point of the skill is that the child has to decide what to do with the leftover. If the question asks for quotient and leftover separately, there is nothing to interpret.
Fix I want: Problems where the question asks only one thing ("How many buses are needed?", "How many full boxes?", "How many are left for the teacher?") so the student has to choose.

### 4. Problem 7 is padded with useless information and the hint points the wrong way (major)
Where: `01-01-word-problems.md`, problem 7.
What I saw: The question is only about bags (29 books, 4 per bag). But the problem adds book prices and "3 boxes that each hold 9 bookmarks. Each student gets one bookmark" (that is 27 bookmarks for 29 students, which does not even work), and then prints "Hint: First find how much money the class needs in all, then think about the bags." The money is never needed. The answer key works out 232 dollars and then never uses it. The final answer (8 bags, 1 book in the last) is correct.
Fix I want: No hints that send students to calculate something the question does not ask for. If extra information is included on purpose, say so in the key and make sure it is at least consistent.

### 5. Family email ends with an "Answer Key" section (major, easy fix)
Where: `01-03-parent-email.md`, the last lines.
What I saw: After my Spanish signature: "## Answer Key - Not applicable. This document contains no questions or problems for students."
Why it matters: If I press Copy for Google Docs or Word and paste into an email, that goes to 25 families. It looks silly and it shouts "a robot wrote this".
Fix I want: Family emails and report card comments should never have an answer key section. Also drop the big title above the "Subject:" line, since the subject line already says it.

### 6. Spanish in the email has wording a Spanish-speaking parent would trip on (minor to major, because it goes home)
Where: `01-03-parent-email.md`, Español section.
What I saw:
- "Acompañantes de los padres" as the heading for parent chaperones. That reads as "companions of the parents". It should be something like "Padres acompañantes" or "Adultos acompañantes".
- "devuelvan ambos antes del lunes 30 de noviembre" and "respondan antes del miércoles 25". English says "by Monday" (Monday is fine); "antes del lunes" says before Monday. A family could think Monday is too late. "A más tardar el lunes 30" is the usual wording.
- "Zapatos cerrados en la punta" is a word-for-word translation; "zapatos cerrados" is what people say.
Fix I want: Deadlines translated as "a más tardar"; a line on bilingual documents telling me to have a Spanish speaker read it before sending, since I cannot check it myself.

### 7. Reading passage calls kelp a plant (minor, but it is a science passage)
Where: `01-02-reading-passage.md`, first sentence and question 1 option A.
What I saw: "Deep under the ocean waves, tall plants called kelp grow in thick groups." Kelp is a large algae (seaweed), not a plant, and it grows in fairly shallow water where sunlight reaches, not "deep". The passage also says "a single animal can have a big effect" where it means one kind of animal.
Why it matters: I tagged this as science. Our science unit teaches the difference. ChatGPT makes the same slip, so this is not worse, but it is not better either.
Fix I want: "tall seaweed called kelp" and "in cool, shallow ocean water"; "one kind of animal".

### 8. Smaller things in the reading passage (minor)
Where: `01-02-reading-passage.md`.
- The answers to the four multiple choice questions are B, B, B, C. Kids spot that pattern. Mix the positions.
- The passage uses "25 percent of its body weight". Percent is not taught until 6th grade. The passage does give the answer in pounds, so it is usable, but "about one quarter of its body weight" would suit grade 4.
- I typed the standard RI.4.2 and it does not appear anywhere on the page. The math sheet did print its standard. Be consistent, or let me choose.

### 9. Nothing here tells an everyday ChatGPT user why this is better, and a few things are worse (opinion, but it is my main question)
Where: home page, /about, /my, the forms.
What I saw: The pitch is "Free, no sign-up, and ready to print". ChatGPT is also free. What ChatGPT gives me that I did not see here: it remembers my class and my preferences, I can upload a PDF of my curriculum page (here I can only paste text, up to 7,000 characters), and my history follows me from my school laptop to my phone. Here "/my" says "The last 20 documents made in this browser... they won't appear on another computer."
What this site does that ChatGPT does not: answer key on its own sheet, name and date lines, one-click Word and Google Docs, three-level versions from a dropdown, a library I can browse, and no account that my district has to approve.
Fix I want: Say that out loud on the home page in one line for people like me. And give me a way to save a few standing preferences in my browser (grade 4, US, "always leave work space", "always English + Spanish").

### Other small things I noticed
- /privacy and /terms both still show a note to the owner: "Site owner: review this page with a qualified adviser before launch, and add your business name and address." The privacy contact is just "the site owner" with no email address. (minor now, must be fixed before launch)
- /support says "Tell us what's missing" but there is no link, form or address to tell anyone. (minor)
- The library filtered to grades 3 to 5 has six resources in total, two for grade 4 (one math worksheet, one science lesson). Nothing for grade 4 reading, writing or social studies. For an all-subjects teacher that is a thin shelf. (minor, expected before launch)
- The library says "Ready-made and reviewed" and About says resources "have been reviewed before being listed", but nowhere does it say who reviews them or how. (minor)

## What worked

- The reading passage did exactly what I asked: 301 words against "about 300", exactly 6 questions, 4 multiple choice and 2 written, one main idea, one vocabulary in context. Every answer in the key is right and can be found in the passage. The otter facts I checked (eats about a quarter of its body weight, 60 pounds gives 15 pounds, wraps in kelp to sleep, urchin barrens) are correct. I would print this tomorrow after changing "plants" to "seaweed".
- The email kept every one of my details in both languages: Thursday, December 3; 8:45 and 2:15; 6 dollars; Monday, November 30; Wednesday, November 25; 4 chaperones; no glass, no peanuts; Room 12. It did not invent anything, and it left clear blanks ("[Teacher phone or email]", "[School name]") instead of making up a phone number. That is better behaviour than I usually get from a chatbot.
- All the arithmetic in the math key that could be checked is right (288, 2 dollars, 11 remainder 1, 8 remainder 2, 5 remainder 5, 360, 8 bags).
- Speed: 5 to 9 seconds each, no login. ChatGPT takes me longer because I have to type the formatting instructions every time.
- The Grade 4 Equivalent Fractions worksheet in the library is good. I checked all 15 answers and they are right, the teacher notes name the real misconception (adding the same number to top and bottom), and it shows the standard code. It also has a "Make my own version" link.
- The forms ask the right questions: standard code box, three levels (support, on level, challenge), A and B versions, English + Spanish side by side.
- Privacy page is short and plain. No account, and it tells me in several places not to type student names.

## What I could not check

- What anything looks like: layout, fonts, whether the work space is big enough for a 9-year-old, whether the answer key really prints on its own page.
- Whether Print, Word, Copy for Google Docs, Large print, Share and Edit buttons work.
- The "Want it different?" buttons (Shorter, Easier, Harder, In Spanish, Revise). This matters a lot for me: with ChatGPT I fix a bad problem 8 by saying "fix number 8". I could not test whether Revise does that here.
- The My documents page (it needs a real browser).
- How it works on a phone.
- The ads: how many, where, and whether they would be awkward to project in front of students.
- Library search.
- Whether the three-levels option produces genuinely different levels (I ran out of documents).

## What I would say to a colleague about this site

"Try it for reading passages and for emails home, it is quicker than ChatGPT and you do not have to fuss with formatting, and it actually stuck to my numbers and dates. Do not print the math word problems without working every one first; mine had a problem that could not be solved and most of the 'multi-step' problems were one step. If you send home the Spanish version, have someone read it first and delete the odd 'Answer Key' bit at the bottom. If you already live in ChatGPT like I do, this is a handy second tab, not a replacement yet."
