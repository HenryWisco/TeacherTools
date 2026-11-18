INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-81d91b3690d2bdc3', 'academic-vocabulary-tier-two-words-grade-6', 'Academic Vocabulary: 12 Words You Will See in Every Class', 'vocabulary', '6', 'ela', 'Twelve tier-two academic words (analyze, infer, cite, evaluate and more) with student-friendly definitions and example sentences, plus matching and fill-in-the-blank practice with an answer key.', 'CCSS.ELA-LITERACY.L.6.6, CCSS.ELA-LITERACY.L.6.4', '**Name:** ______________________  **Date:** ____________

These twelve words show up in directions, test questions, and class discussions in every subject. When you know exactly what each word is asking you to do, you can give a stronger answer.

## Word List

| Word | Part of speech | Student-friendly definition | Example sentence |
|---|---|---|---|
| analyze | verb | to study something closely by breaking it into parts | We will analyze the poem by looking at one stanza at a time. |
| infer | verb | to figure out something the author does not say directly, using clues and what you already know | From her shaking hands, I can infer that the character is nervous. |
| summarize | verb | to tell the main ideas in a short way, using your own words | Summarize the article in two or three sentences. |
| evidence | noun | facts, details, or examples that show something is true | The muddy footprints were evidence that the dog had been in the kitchen. |
| compare | verb | to look at two or more things to see how they are alike | Compare the two maps and list three things they both show. |
| contrast | verb | to tell how two or more things are different | The teacher asked us to contrast life in a city with life on a farm. |
| evaluate | verb | to judge how good, useful, or strong something is | Evaluate the website to decide whether it is a trustworthy source. |
| justify | verb | to give reasons that show why an answer or choice is right | Justify your answer by explaining each step you used. |
| cite | verb | to name the source or the exact part of a text that supports your idea | Cite the paragraph where the author describes the storm. |
| predict | verb | to say what you think will happen next, based on clues | Based on the title, predict what the chapter will be about. |
| conclude | verb | to reach a decision after thinking about the facts | After testing all five magnets, we concluded that the largest one was not the strongest. |
| significant | adjective | important enough to have an effect or to be noticed | Moving to a new town was a significant change for the main character. |

## Study Tips

- **Compare and contrast** are partners. Compare = alike. Contrast = different.
- **Infer and predict** both use clues. You infer something that is true now but not stated. You predict something that has not happened yet.
- **Cite and justify** both support your thinking. You cite WHERE the proof is. You justify WHY your answer is right.

## Practice 1: Matching

**Directions:** Write the letter of the correct definition on the line next to each word. Use each letter once.

1. ____ analyze
2. ____ infer
3. ____ summarize
4. ____ evidence
5. ____ compare
6. ____ contrast
7. ____ evaluate
8. ____ justify
9. ____ cite
10. ____ predict
11. ____ conclude
12. ____ significant

**Definitions**

- A. to tell the main ideas in a short way, using your own words
- B. to say what you think will happen next, based on clues
- C. to figure out something the author does not say directly
- D. facts, details, or examples that show something is true
- E. to study something closely by breaking it into parts
- F. to tell how two or more things are different
- G. to judge how good, useful, or strong something is
- H. to give reasons that show why an answer or choice is right
- I. to name the source or exact part of a text that supports your idea
- J. to look at two or more things to see how they are alike
- K. to reach a decision after thinking about the facts
- L. important enough to have an effect or to be noticed

## Practice 2: Fill in the Blank

**Directions:** Choose the best word from the word bank to complete each sentence. Use each word once.

**Word bank:** cite, contrast, evidence, predict, significant, summarize

13. After reading both articles, we made a chart to ______________ the two rainforests and show how they are different.
14. Dark clouds are rolling in, so I ______________ that it will rain before recess.
15. Remember to ______________ the page number when you quote from the book.
16. The detective needed more ______________ before she could prove who took the trophy.
17. Please ______________ the chapter in three sentences instead of retelling every detail.
18. The invention of the printing press was a ______________ event because it changed how ideas spread.

## Practice 3: Use It Yourself

**Directions:** Choose any two words from the list. Write one original sentence for each word about something you are learning in another class (math, science, or social studies).

19. Word: ______________

______________________________________________

______________________________________________

20. Word: ______________

______________________________________________

______________________________________________

## Answer Key

**Practice 1: Matching**

1. E
2. C
3. A
4. D
5. J
6. F
7. G
8. H
9. I
10. B
11. K
12. L

**Practice 2: Fill in the Blank**

13. contrast
14. predict
15. cite
16. evidence
17. summarize
18. significant

**Practice 3: Use It Yourself**

19-20. Answers will vary. Give credit when the word is used with the correct meaning and part of speech, and the sentence gives enough context to show understanding. Example: In science, we had to justify our hypothesis by explaining what we already knew about plants. A sentence such as I will analyze does not show understanding and should be revised.', 'published', 'seed', 0, '2026-11-01T12:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-b29fbb0c0eae8d8e', 'algorithms-and-debugging-unplugged-worksheet-grade-5', 'Robot on the Grid: Algorithms and Debugging Worksheet (No Computer Needed)', 'worksheet', '5', 'cs-tech', 'An unplugged computer science worksheet with 10 items. Students trace step-by-step programs for a robot on a 5-by-5 grid, find and fix the bug in four short programs, and write two programs of their own. Includes an answer key with every path traced square by square.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** Read the rules, then use the grid to answer each question. Trace every program one step at a time with your finger or a pencil. You do not need a computer.

**Words to know:**

- An **algorithm** is a list of steps, in order, for doing a task.
- A **program** is an algorithm written in commands a computer can follow.
- A **bug** is a mistake in a program. **Debugging** means finding the bug and fixing it.

## The Grid

Columns have letters (A to E). Rows have numbers (1 to 5). Row 1 is at the top. A square is named by its column letter and then its row number, so the robot''s START square is A5.

| | A | B | C | D | E |
|---|---|---|---|---|---|
| **1** | | | WALL | | STAR |
| **2** | | WALL | | | |
| **3** | | | GEM | WALL | |
| **4** | | | WALL | | |
| **5** | START | | | | FLAG |

## The Rules

- The robot understands four commands. Each command moves it exactly one square.
  - **UP** moves toward row 1 (A5 to A4).
  - **DOWN** moves toward row 5 (A4 to A5).
  - **RIGHT** moves toward column E (A5 to B5).
  - **LEFT** moves toward column A (B5 to A5).
- **REPEAT 3 [UP]** means do the command in the brackets 3 times. The number can change.
- The robot follows the commands in order, from first to last.
- If a command would move the robot into a WALL square or off the grid, the program **crashes** and stops.
- The robot starts on A5 unless the question says something else.

## Part A: Follow the Program

1. Program: RIGHT, RIGHT, RIGHT, RIGHT

    On which square does the robot stop? ______________  What is on that square? ______________

2. Program: UP, UP, RIGHT, RIGHT

    On which square does the robot stop? ______________  What is on that square? ______________

3. Program: UP, UP, RIGHT, RIGHT, UP, RIGHT, RIGHT, UP

    On which square does the robot stop? ______________

    List every square the robot moves to, in order.

______________________________________________

4. Program: REPEAT 4 [RIGHT], REPEAT 4 [UP]

    How many moves does the robot make in all? ______________  On which square does it stop? ______________

## Part B: Find the Bug

Each program below has one bug. Trace it to find out what goes wrong, then fix it.

5. **Goal:** Move from START (A5) to the FLAG (E5).

    Program: RIGHT, RIGHT, RIGHT, UP

    Where does the robot stop? ______________  Which step is the bug? ______________

    Fixed program: ______________________________________________

6. **Goal:** Move from START (A5) to the GEM (C3).

    Program: RIGHT, RIGHT, UP, UP

    Fixed program: ______________________________________________

    At which step does the program crash, and why?

______________________________________________

7. **Goal:** Move from START (A5) to the STAR (E1).

    Program: UP, UP, RIGHT, RIGHT, UP, RIGHT, UP

    Where does the robot stop? ______________

    What is wrong with the program, and how would you fix it?

______________________________________________

8. **Goal:** Move from START (A5) to square A1.

    Program: REPEAT 5 [UP]

    Fixed program: ______________________________________________

    What goes wrong with the first program?

______________________________________________

## Part C: Write Your Own

9. Write a program that moves the robot from START (A5) to the GEM (C3) and then on to the FLAG (E5). The robot must not crash.

______________________________________________

______________________________________________

10. This time the robot starts on the STAR (E1). Write a program that takes it home to START (A5). Use REPEAT at least once.

______________________________________________

______________________________________________

**When you finish:** Trade papers with a partner. Trace each other''s programs for questions 9 and 10, one step at a time. If you find a bug, show your partner the step where it happens.

## Answer Key

In every trace below, the robot starts on the first square listed and each arrow is one command.

**Part A**

1. The robot stops on **E5**, the **FLAG**. Trace: A5 > B5 > C5 > D5 > E5.
2. The robot stops on **C3**, the **GEM**. Trace: A5 > A4 > A3 > B3 > C3.
3. Squares in order: A4, A3, B3, C3, C2, D2, E2, E1. The robot stops on **E1** (the STAR).

| Step | Command | Robot moves to |
|---|---|---|
| 1 | UP | A4 |
| 2 | UP | A3 |
| 3 | RIGHT | B3 |
| 4 | RIGHT | C3 |
| 5 | UP | C2 |
| 6 | RIGHT | D2 |
| 7 | RIGHT | E2 |
| 8 | UP | E1 |

4. **8 moves** (4 + 4 = 8). The robot stops on **E1** (the STAR). Trace: A5 > B5 > C5 > D5 > E5 > E4 > E3 > E2 > E1.

**Part B**

5. The robot stops on **D4**. Trace: A5 > B5 > C5 > D5 > D4. The bug is **step 4**: UP should be RIGHT. Fixed program: RIGHT, RIGHT, RIGHT, RIGHT. Trace: A5 > B5 > C5 > D5 > E5.
6. The program crashes at **step 3**. Trace: A5 > B5 > C5, then UP would move the robot into C4, which is a WALL. Sample fixed program: UP, UP, RIGHT, RIGHT. Trace: A5 > A4 > A3 > B3 > C3. Also correct: RIGHT, UP, UP, RIGHT. Trace: A5 > B5 > B4 > B3 > C3. Accept any program that reaches C3 without crashing.
7. The robot stops on **D1**, one square to the left of the STAR. Trace: A5 > A4 > A3 > B3 > C3 > C2 > D2 > D1. A step is missing. Sample fix: add RIGHT at the end, which moves the robot from D1 to E1. Also correct: add RIGHT just before the last UP, so the program ends RIGHT, RIGHT, UP. Trace of that ending: C2 > D2 > E2 > E1.
8. The loop repeats one time too many. Trace: A5 > A4 > A3 > A2 > A1, then the fifth UP would move the robot off the top of the grid, so the program crashes. Fixed program: REPEAT 4 [UP].

**Part C**

9. Answers will vary. Check each program by tracing it: it must reach C3, end on E5, and never enter a WALL (C1, B2, D3, C4) or leave the grid. The robot cannot go straight DOWN or RIGHT from the GEM, because C4 and D3 are WALLs, so it has to leave C3 by going UP or LEFT. The shortest correct programs have 10 moves. Two samples:

    - UP, UP, RIGHT, RIGHT, UP, RIGHT, RIGHT, DOWN, DOWN, DOWN. Trace: A5 > A4 > A3 > B3 > C3 > C2 > D2 > E2 > E3 > E4 > E5.
    - UP, UP, RIGHT, RIGHT, LEFT, DOWN, DOWN, RIGHT, RIGHT, RIGHT. Trace: A5 > A4 > A3 > B3 > C3 > B3 > B4 > B5 > C5 > D5 > E5.

10. Answers will vary. The program must use REPEAT, end on A5, and never crash. Sample: REPEAT 4 [DOWN], REPEAT 4 [LEFT]. Trace: E1 > E2 > E3 > E4 > E5 > D5 > C5 > B5 > A5. Note that REPEAT 4 [LEFT], REPEAT 4 [DOWN] does not work: after one move the robot is on D1, and the next LEFT would move it into the WALL at C1.', 'published', 'seed', 0, '2026-11-01T05:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-0194835657b67068', 'american-revolution-choice-board-grade-5', 'American Revolution Choice Board', 'choice-board', '5', 'social-studies', 'A 3x3 tic-tac-toe choice board with nine American Revolution activities, including a timeline, map, Patriot and Loyalist chart, biography card, and a soldier''s letter. Includes student directions, requirements for each activity, a scoring checklist, and a teacher fact reference.', '', '## Student Directions

Show what you know about the American Revolution! Choose **three** activities that make a line on the board, like tic-tac-toe. Your line can go across, down, or diagonally. Every line includes a different mix of writing, drawing, and research.

- Circle the three activities you choose.
- Read the requirements for each activity in the Activity Details section before you begin.
- Use your class notes, textbook, and other sources your teacher approves. Facts must be accurate.
- Do your best work. Neat, complete, and correct matters more than fancy.

**My three activities are numbers:** ______, ______, and ______

**Due date:** ______________________

## Choice Board

| | | |
|---|---|---|
| **1. Timeline** Make an illustrated timeline of 8 important events of the American Revolution, in order, with dates. | **2. Letter from Valley Forge** Write a letter home as a soldier in the Continental Army during the winter at Valley Forge. | **3. Vocabulary Cards** Make cards for 8 key words from the unit, with a definition, a sentence, and a picture for each. |
| **4. Patriot or Loyalist?** Make a two-column chart that gives 3 reasons a colonist might be a Patriot and 3 reasons a colonist might be a Loyalist. | **5. Biography Trading Card** Research one person from the Revolution and make a trading card about that person''s life and role. | **6. Front Page News** Write a newspaper front page that reports on one event as if it just happened. |
| **7. Battle Map** Draw and label a map of the 13 colonies and mark 5 important battles. | **8. Declaration in My Own Words** Explain three main ideas of the Declaration of Independence in your own words. | **9. Cause and Effect Chain** Make a chain that shows 5 causes of the Revolution and how the colonists responded to each. |

## Activity Details

### 1. Timeline

- Include at least 8 events between 1765 and 1783.
- Put the events in order and write the date (at least the year) for each one.
- Write one complete sentence that tells what happened and why it mattered.
- Add a small drawing or symbol for at least 4 events.

### 2. Letter from Valley Forge

- Write as a soldier in General Washington''s army in the winter of 1777 to 1778.
- Use letter format: date, greeting, body, closing, and signature (make up a name).
- Describe at least 3 true details about life in camp, such as the cold, the shortage of food, clothing, and shoes, sickness, the log huts, or the training led by Baron von Steuben.
- Tell why you are staying with the army even though it is hard.
- Write at least 2 paragraphs.

### 3. Vocabulary Cards

- Choose 8 words from this list: Parliament, tax, representation, boycott, repeal, Patriot, Loyalist, militia, Minutemen, independence, Continental Army, ally, treaty.
- On each card write the word, a definition in your own words, a sentence about the American Revolution that uses the word, and a small picture.

### 4. Patriot or Loyalist?

- Make a chart with two columns: Patriot and Loyalist.
- At the top of each column, write one sentence that tells what that group wanted.
- List 3 reasons a colonist might have chosen each side.
- Under the chart, write 3 to 5 sentences telling which side you think you would have chosen and why.

### 5. Biography Trading Card

- Choose one person: George Washington, Abigail Adams, Benjamin Franklin, Thomas Jefferson, John Adams, Samuel Adams, Paul Revere, Crispus Attucks, Phillis Wheatley, Mercy Otis Warren, Deborah Sampson, James Armistead Lafayette, Thomas Paine, the Marquis de Lafayette, King George III, or another person your teacher approves.
- Front of the card: the person''s name and a portrait you draw.
- Back of the card: the years the person was born and died, where the person was from, which side the person supported, 3 important facts about what the person did during the Revolution, and one sentence telling why this person is remembered.

### 6. Front Page News

- Choose one event: the Boston Massacre, the Boston Tea Party, the battles of Lexington and Concord, the signing of the Declaration of Independence, the Battle of Saratoga, or the surrender at Yorktown.
- Give your newspaper a name and a date that matches the event.
- Write a headline that grabs attention.
- Write a news article of at least 2 paragraphs that answers Who, What, When, Where, and Why.
- Draw one picture with a caption.

### 7. Battle Map

- Draw or trace a map of the 13 colonies and label each colony.
- Label the Atlantic Ocean.
- Mark and label these 5 battles: Lexington and Concord, Bunker Hill, Trenton, Saratoga, and Yorktown.
- Make a map key. Next to the key, write the year of each battle and which side won.
- Add a compass rose and a title.

### 8. Declaration in My Own Words

- Tell when the Declaration of Independence was approved and who its main author was.
- Explain these three ideas in your own words, with at least 2 sentences for each: (1) All people have rights that cannot be taken away. (2) Governments get their power from the people. (3) The colonists listed complaints against the king and declared that the colonies were free and independent states.
- End with 2 or 3 sentences about why this document still matters today.

### 9. Cause and Effect Chain

- Show 5 causes and effects in order. For each one, write what Britain did (cause) and how the colonists responded (effect).
- Choose from events such as the French and Indian War debt, the Stamp Act, the Townshend Acts, the Boston Massacre, the Tea Act, the Intolerable Acts (also called the Coercive Acts), and the march on Lexington and Concord.
- Connect the boxes with arrows.
- At the end, write 2 sentences that answer: Which cause do you think made the colonists the angriest? Why?

## Scoring Checklist

The teacher scores each of the three activities with this checklist. Each activity is worth 10 points, for 30 points in all.

| What I am looking for | Points |
|---|---|
| **Complete:** Every requirement in the Activity Details is included. | 4 |
| **Accurate:** Dates, names, places, and facts are correct. | 3 |
| **Clear:** Writing is in the student''s own words and is easy to understand. | 2 |
| **Careful:** Work is neat, with correct spelling of key names and words. | 1 |
| **Total for each activity** | **10** |

| Activity number | Score | Comments |
|---|---|---|
| ______ | ______ / 10 | |
| ______ | ______ / 10 | |
| ______ | ______ / 10 | |
| **Total** | **______ / 30** | |

## Teacher Notes

- **Time:** Plan about three 40-minute work periods, or assign the board as a one- to two-week project with some work done at home.
- **Materials:** Plain and lined paper, index cards (for activities 3 and 5), colored pencils, rulers, a blank outline map of the 13 colonies (optional support for activity 7), and unit texts or approved research sources.
- **Why tic-tac-toe:** Every row, column, and diagonal mixes different kinds of work, so no student can pick three drawing-only or three writing-only tasks.
- **Support:** Let students complete two activities instead of three, provide a blank map for activity 7, give a list of events with dates to sequence for activity 1, or allow students to dictate longer writing.
- **Challenge:** Ask students to complete a fourth activity of their choice, to use at least one primary source quotation in activity 6 or 8, or to add the viewpoints of enslaved people, women, or American Indian nations to activity 4.
- **Sensitive content:** The Revolution involved people with many viewpoints, including enslaved and free African Americans who fought on both sides and American Indian nations who were forced to choose between them. Encourage students to notice whose voices are included in their sources.

## Teacher Fact Reference

Use this list to check student work for accuracy.

### Key events and dates

| Date | Event |
|---|---|
| 1754 to 1763 | French and Indian War. Britain wins but is left with large debts. |
| 1765 | Stamp Act taxes printed paper in the colonies. Colonists protest ''no taxation without representation.'' It is repealed in 1766. |
| 1767 | Townshend Acts tax imported goods such as glass, paper, paint, and tea. Colonists boycott British goods. |
| March 5, 1770 | Boston Massacre. British soldiers fire into a crowd and five colonists die, including Crispus Attucks. |
| December 16, 1773 | Boston Tea Party. Colonists dump 342 chests of tea into Boston Harbor to protest the Tea Act. |
| 1774 | Britain passes the Coercive Acts (called the Intolerable Acts by colonists). The First Continental Congress meets in Philadelphia in September. |
| April 19, 1775 | Battles of Lexington and Concord in Massachusetts. The war begins. |
| June 17, 1775 | Battle of Bunker Hill near Boston, Massachusetts. The British take the hill but suffer heavy losses. |
| July 4, 1776 | The Continental Congress approves the Declaration of Independence. Thomas Jefferson was its main author. |
| December 25 to 26, 1776 | Washington crosses the Delaware River and wins the Battle of Trenton in New Jersey. |
| September to October 1777 | Battles of Saratoga in New York. The British army there surrenders on October 17, 1777. This American victory is the turning point of the war and helps convince France to become an ally. |
| Winter of 1777 to 1778 | The Continental Army camps at Valley Forge, Pennsylvania. |
| February 1778 | France signs an alliance with the United States. |
| October 19, 1781 | British General Cornwallis surrenders at Yorktown, Virginia. This is the last major battle of the war. |
| September 3, 1783 | The Treaty of Paris is signed. Britain recognizes the independence of the United States. |

### Battle map key (activity 7)

| Battle | Location | Year | Result |
|---|---|---|---|
| Lexington and Concord | Massachusetts | 1775 | American victory. The British were forced to retreat to Boston. |
| Bunker Hill | Massachusetts | 1775 | British victory, but with heavy British losses |
| Trenton | New Jersey | 1776 | American victory |
| Saratoga | New York | 1777 | American victory |
| Yorktown | Virginia | 1781 | American victory, with French help |

### The 13 colonies

New Hampshire, Massachusetts, Rhode Island, Connecticut, New York, New Jersey, Pennsylvania, Delaware, Maryland, Virginia, North Carolina, South Carolina, Georgia

### Vocabulary (activity 3)

- **Parliament:** the lawmaking body of Great Britain
- **tax:** money people must pay to a government
- **representation:** having someone speak and vote for you in government
- **boycott:** to refuse to buy or use something as a protest
- **repeal:** to cancel a law
- **Patriot:** a colonist who wanted independence from Britain
- **Loyalist:** a colonist who stayed loyal to Britain and the king
- **militia:** a group of ordinary citizens trained to fight in an emergency
- **Minutemen:** militia members who were ready to fight at a minute''s notice
- **independence:** freedom from the control of another country
- **Continental Army:** the army of the colonies, led by George Washington
- **ally:** a country or person that joins with another for a shared goal
- **treaty:** a formal agreement between countries

### Patriot and Loyalist reasons (activity 4)

Sample Patriot reasons: Colonists were taxed without having representatives in Parliament. British soldiers were stationed in their towns and colonists were made to house and supply them. They believed they had the right to govern themselves. They were angry about events such as the Boston Massacre and the Intolerable Acts.

Sample Loyalist reasons: They felt loyal to the king and saw themselves as British. They feared that war would bring violence and disorder. Their jobs or businesses depended on trade with Britain. They thought Britain''s army and navy were too strong to defeat. They believed problems could be solved peacefully.

### Biography notes (activity 5)

- **George Washington (1732 to 1799), Virginia:** commander of the Continental Army, later the first President.
- **Abigail Adams (1744 to 1818), Massachusetts:** wrote letters urging her husband John Adams to ''remember the ladies'' and reported on events in Massachusetts.
- **Benjamin Franklin (1706 to 1790), Pennsylvania:** helped write the Declaration and won French support as a diplomat.
- **Thomas Jefferson (1743 to 1826), Virginia:** main author of the Declaration of Independence.
- **John Adams (1735 to 1826), Massachusetts:** leader in the Continental Congress who argued for independence, later the second President.
- **Samuel Adams (1722 to 1803), Massachusetts:** organizer of protests against British taxes and a leader of the Sons of Liberty.
- **Paul Revere (1735 to 1818), Massachusetts:** silversmith who rode to warn that British troops were marching on the night of April 18, 1775.
- **Crispus Attucks (about 1723 to 1770), Massachusetts:** a man of African and American Indian ancestry who was killed at the Boston Massacre.
- **Phillis Wheatley (about 1753 to 1784), Massachusetts:** enslaved poet, the first African American to publish a book of poetry, who wrote in support of liberty.
- **Mercy Otis Warren (1728 to 1814), Massachusetts:** writer of plays and poems that supported the Patriot cause, and later of a history of the Revolution.
- **Deborah Sampson (1760 to 1827), Massachusetts:** disguised herself as a man to serve as a soldier in the Continental Army.
- **James Armistead Lafayette (about 1748 to 1830), Virginia:** enslaved man who served as a spy for the Americans before Yorktown and later won his freedom.
- **Thomas Paine (1737 to 1809), born in England:** wrote the pamphlet Common Sense in 1776, which argued for independence.
- **Marquis de Lafayette (1757 to 1834), France:** French officer who served as a general under Washington.
- **King George III (1738 to 1820), Great Britain:** king of Great Britain during the Revolution.', 'published', 'seed', 0, '2026-10-31T22:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-08e3e2f4f7aceaa4', 'argumentative-writing-prompts-with-counterclaims-grade-10', '12 Argumentative Writing Prompts with Counterclaims', 'writing-prompts', '10', 'ela', 'Twelve debatable prompts on issues teens actually argue about, each paired with a suggested counterclaim to address and ideas for evidence. Includes a planning frame, sentence starters for rebuttals, and a student checklist.', 'CCSS.ELA-LITERACY.W.9-10.1, CCSS.ELA-LITERACY.W.9-10.1.A, CCSS.ELA-LITERACY.W.9-10.1.B', '## Teacher Notes

**Ways to use these prompts**

- **Timed write (25 to 40 minutes):** Students choose one prompt and write a full argument.
- **Quick write (10 minutes):** Students write only a claim, one reason, and a response to the counterclaim.
- **Four corners:** Read a prompt aloud. Students move to a corner labeled Strongly Agree, Agree, Disagree, or Strongly Disagree, discuss with their corner, then write.
- **Flip it:** After drafting, students write one paragraph arguing the opposite side.

Every prompt can be argued either way. The suggested counterclaim is written for the more common student position. If a student takes the other side, the suggested counterclaim becomes a supporting reason, and the student should name the strongest objection to it instead.

Students may draw on personal experience and observation for in-class writing. For a longer assignment, require at least two credible sources.

## Student Directions

Choose one prompt. Take a clear position and defend it with reasons and evidence. Your argument must:

1. State a clear **claim** in your introduction.
2. Support the claim with at least **two reasons**, each backed by evidence or a specific example.
3. Fairly state a **counterclaim** (what a thoughtful person on the other side would say).
4. Answer the counterclaim with a **rebuttal** that explains why your position is still stronger.
5. End with a **conclusion** that follows from your argument.

## The Prompts

### 1. Phones in the classroom

Should schools require students to lock their phones away for the entire school day?

- **Counterclaim to address:** Students need their phones to reach family in an emergency and to manage jobs, rides, and other responsibilities.
- **Evidence ideas:** your own ability to focus with and without a phone nearby; how your school''s current policy works in practice; what teachers and students say.

### 2. School start times

Should high schools start no earlier than 8:30 a.m.?

- **Counterclaim to address:** A later start pushes sports, jobs, and homework later into the evening and creates problems for bus schedules and working families.
- **Evidence ideas:** how much sleep you and your classmates get; first-period alertness; after-school commitments.

### 3. Social media age limits

Should there be a minimum age of 16 to have a social media account?

- **Counterclaim to address:** Social media is how many teens find community, stay in touch with friends, and learn about the world, and age limits are easy to get around.
- **Evidence ideas:** benefits and harms you have observed; how well current age rules are enforced; the difference between banning and teaching responsible use.

### 4. Voting age

Should 16-year-olds be allowed to vote in local elections, such as school board races?

- **Counterclaim to address:** Many 16-year-olds do not yet have the life experience or independence from their parents'' views to cast an informed vote.
- **Evidence ideas:** responsibilities 16-year-olds already have (working, paying taxes on wages, driving); how school board decisions affect students directly.

### 5. AI tools and schoolwork

Should students be allowed to use artificial intelligence tools to help with writing assignments?

- **Counterclaim to address:** Relying on AI keeps students from developing their own thinking and writing skills, and it makes it hard for teachers to know what a student can really do.
- **Evidence ideas:** the difference between using a tool to brainstorm and using it to write; comparisons to calculators or spell check; what skills employers and colleges expect.

### 6. Homework

Should high schools limit homework to a set amount of time per night?

- **Counterclaim to address:** Practice outside of class is necessary to master difficult material, and a strict limit could leave students unprepared for college workloads.
- **Evidence ideas:** how long your homework takes; which assignments help you learn and which do not; the effect on sleep, jobs, and family time.

### 7. Part-time jobs

Is having a part-time job during the school year good for high school students?

- **Counterclaim to address:** Hours spent at work take time away from studying, sleep, and extracurricular activities, and grades can suffer.
- **Evidence ideas:** skills learned on the job; the experience of students who work; how many hours per week is too many.

### 8. Required financial literacy

Should every student have to pass a personal finance course to graduate?

- **Counterclaim to address:** Adding another graduation requirement leaves less room for electives such as art, music, and career classes that students choose for themselves.
- **Evidence ideas:** money decisions teens will face within a few years (loans, credit cards, rent, taxes); where students currently learn about money.

### 9. Dress codes

Should public schools get rid of dress codes?

- **Counterclaim to address:** Dress codes reduce distractions and conflict and help prepare students for workplaces that have expectations about appearance.
- **Evidence ideas:** whether your school''s code is enforced equally for all students; class time lost to dress code violations; self-expression.

### 10. Standardized tests and college admission

Should colleges stop requiring standardized test scores from applicants?

- **Counterclaim to address:** Grades mean different things at different schools, so a common test gives colleges one consistent way to compare applicants.
- **Evidence ideas:** access to test preparation; what a single test can and cannot measure; other ways to show readiness.

### 11. Community service

Should students be required to complete community service hours to graduate?

- **Counterclaim to address:** Service that is required is no longer truly voluntary, and the requirement is a burden for students who already work or care for family members.
- **Evidence ideas:** what students gain from service; local needs that volunteers could meet; how to make a requirement flexible.

### 12. Driving age

Should the minimum age for an unrestricted driver''s license be raised to 18?

- **Counterclaim to address:** Many teens, especially in rural areas with no public transportation, need to drive to get to school, work, and activities.
- **Evidence ideas:** the role of experience versus age in safe driving; graduated license rules such as night and passenger limits; how teens in your community get around.

## Planning Frame

Complete this before you draft.

**My claim:**

______________________________________________________________

**Reason 1 and the evidence that supports it:**

______________________________________________________________

______________________________________________________________

**Reason 2 and the evidence that supports it:**

______________________________________________________________

______________________________________________________________

**The strongest counterclaim:**

______________________________________________________________

**My rebuttal (why my claim still holds):**

______________________________________________________________

______________________________________________________________

## Sentence Starters for Counterclaims and Rebuttals

**Introducing the counterclaim**

- Some people argue that...
- Opponents of this idea point out that...
- It is true that...
- A reasonable concern is that...

**Turning to the rebuttal**

- However, this argument overlooks...
- While that concern is valid, ...
- Even so, the evidence suggests...
- This problem can be solved by...

## Self-Check Before You Turn It In

- [ ] My claim takes a clear side and appears in my introduction.
- [ ] Each body paragraph has one reason and specific evidence.
- [ ] I explained how my evidence supports my claim instead of just listing it.
- [ ] I stated the other side fairly, without making it sound foolish.
- [ ] My rebuttal answers the counterclaim directly.
- [ ] I used transitions to connect my ideas.
- [ ] I kept a formal tone and avoided phrases like *I think* and *in my opinion*.
- [ ] My conclusion does more than repeat my introduction.', 'published', 'seed', 0, '2026-10-31T15:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-f127ff75f13f39e5', 'balancing-chemical-equations-worksheet-grade-11', 'Balancing Chemical Equations Worksheet', 'worksheet', '11', 'science', 'Twelve equations to balance, arranged from simple synthesis reactions to combustion and reactions with polyatomic ions, plus a bonus. Includes a step-by-step method, a worked example, and an answer key with atom counts for every equation.', 'NGSS HS-PS1-7', '**Name:** ______________________  **Date:** ____________

**Directions:** Balance each equation by writing a whole-number coefficient on each blank. If the coefficient is 1, write 1. Use the smallest whole numbers that work. Never change a subscript.

## How to Balance an Equation

1. **Count** the atoms of each element on the reactant side and on the product side.
2. **Start** with an element that appears in only one substance on each side. Save hydrogen and oxygen for last, and save any element that stands alone (such as O2 or Fe) for the very end.
3. **Change coefficients only.** A coefficient multiplies every atom in the formula that follows it.
4. **Recount** after every change.
5. **Treat a polyatomic ion as one unit** if it appears unchanged on both sides, for example SO4 or PO4.
6. **Check and reduce.** Every element must match on both sides, and the coefficients should have no common factor other than 1.

**Tip for combustion:** balance C first, then H, then O. If you end up needing a fraction of O2, multiply every coefficient by 2.

### Worked Example

Unbalanced: Fe + O2 -> Fe2O3

- Oxygen: 2 on the left and 3 on the right. The least common multiple is 6, so use 3 O2 and 2 Fe2O3.
- Iron: 2 Fe2O3 contains 4 Fe, so use 4 Fe.
- Balanced: **4 Fe + 3 O2 -> 2 Fe2O3**
- Check: Fe 4 = 4, O 6 = 6.

## Level 1: Getting Started

1. ___ H2 + ___ O2 -> ___ H2O

2. ___ Na + ___ Cl2 -> ___ NaCl

3. ___ N2 + ___ H2 -> ___ NH3

4. ___ Zn + ___ HCl -> ___ ZnCl2 + ___ H2

## Level 2: Building Skill

5. ___ KClO3 -> ___ KCl + ___ O2

6. ___ Al + ___ O2 -> ___ Al2O3

7. ___ CH4 + ___ O2 -> ___ CO2 + ___ H2O

8. ___ Fe2O3 + ___ CO -> ___ Fe + ___ CO2

## Level 3: Challenge

9. ___ C3H8 + ___ O2 -> ___ CO2 + ___ H2O

10. ___ Al2(SO4)3 + ___ Ca(OH)2 -> ___ Al(OH)3 + ___ CaSO4

11. ___ Ca(OH)2 + ___ H3PO4 -> ___ Ca3(PO4)2 + ___ H2O

12. ___ C2H6 + ___ O2 -> ___ CO2 + ___ H2O

## Bonus

13. ___ C4H10 + ___ O2 -> ___ CO2 + ___ H2O

## Explain Your Thinking

14. A student balanced equation 1 by changing H2O to H2O2. Explain why this is not allowed.

______________________________________________________________

______________________________________________________________

15. What law requires the number of atoms of each element to be the same on both sides of a chemical equation? State the law in your own words.

______________________________________________________________

______________________________________________________________

## Answer Key

Coefficients are listed in the order the substances appear. Atom counts are the totals on each side of the balanced equation.

| # | Balanced equation | Coefficients | Atom check (each side) |
|---|---|---|---|
| 1 | 2 H2 + O2 -> 2 H2O | 2, 1, 2 | H 4, O 2 |
| 2 | 2 Na + Cl2 -> 2 NaCl | 2, 1, 2 | Na 2, Cl 2 |
| 3 | N2 + 3 H2 -> 2 NH3 | 1, 3, 2 | N 2, H 6 |
| 4 | Zn + 2 HCl -> ZnCl2 + H2 | 1, 2, 1, 1 | Zn 1, H 2, Cl 2 |
| 5 | 2 KClO3 -> 2 KCl + 3 O2 | 2, 2, 3 | K 2, Cl 2, O 6 |
| 6 | 4 Al + 3 O2 -> 2 Al2O3 | 4, 3, 2 | Al 4, O 6 |
| 7 | CH4 + 2 O2 -> CO2 + 2 H2O | 1, 2, 1, 2 | C 1, H 4, O 4 |
| 8 | Fe2O3 + 3 CO -> 2 Fe + 3 CO2 | 1, 3, 2, 3 | Fe 2, C 3, O 6 |
| 9 | C3H8 + 5 O2 -> 3 CO2 + 4 H2O | 1, 5, 3, 4 | C 3, H 8, O 10 |
| 10 | Al2(SO4)3 + 3 Ca(OH)2 -> 2 Al(OH)3 + 3 CaSO4 | 1, 3, 2, 3 | Al 2, S 3, Ca 3, H 6, O 18 |
| 11 | 3 Ca(OH)2 + 2 H3PO4 -> Ca3(PO4)2 + 6 H2O | 3, 2, 1, 6 | Ca 3, P 2, H 12, O 14 |
| 12 | 2 C2H6 + 7 O2 -> 4 CO2 + 6 H2O | 2, 7, 4, 6 | C 4, H 12, O 14 |
| 13 (bonus) | 2 C4H10 + 13 O2 -> 8 CO2 + 10 H2O | 2, 13, 8, 10 | C 8, H 20, O 26 |

### Notes on Common Errors

- **#5:** Students often stop at 1, 1, 1. Oxygen is 3 on the left and 2 on the right, so 6 is needed on each side.
- **#8:** Oxygen appears in every compound. Balance Fe first, then find the number of CO that works: each CO takes one O from Fe2O3, and there are three O to remove.
- **#10 and #11:** Count SO4 and PO4 as units. In #11, the 6 H from 3 Ca(OH)2 plus the 6 H from 2 H3PO4 make 12 H, which gives 6 H2O.
- **#12 and #13:** Balancing C and H first gives a fraction of O2 (7/2 for #12 and 13/2 for #13). Multiply every coefficient by 2.
- Answers that are balanced but not reduced, such as 4, 2, 4 for #1, show the right idea. Award partial credit and remind students to use the smallest whole numbers.

### Explain Your Thinking

14. Changing a subscript changes the identity of the substance. H2O is water, and H2O2 is hydrogen peroxide, a different compound with different properties. The reaction makes water, so only coefficients (how many molecules) may be changed.

15. The law of conservation of mass. In a chemical reaction, matter is neither created nor destroyed, so the atoms present in the reactants are rearranged into the products and the number of each kind of atom stays the same.', 'published', 'seed', 0, '2026-10-31T08:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-f17b3a4c68db6678', 'beginning-sounds-m-s-t-lesson-plan-kindergarten', 'Beginning Sounds m, s and t Lesson Plan (No Pictures Needed)', 'lesson-plan', 'K', 'ela', 'A 30-minute kindergarten lesson on hearing the first sound in a word for the letters m, s and t. It uses real classroom objects, word lists the teacher says aloud and movement, so there is nothing to print or cut out.', '', '## Overview

**Time:** 30 minutes

**Group:** whole class, seated on the carpet

**Students will:**

- listen to a spoken word and tell whether it starts with /m/, /s/ or /t/
- match each of the three sounds to its letter

**How to read this plan:** A letter between slashes, such as /m/, means the sound, not the letter name. Words in *italics* are the exact words to say to the class.

## Materials

- 3 sheets of paper. Write one large lowercase letter on each: m, s, t.
- A bag or box with 9 real objects inside:
  - marker, magnet, mitten
  - sock, soap, sack (a paper lunch bag)
  - tape, tissue, timer
- A board and something to write with

**If you do not have an object, swap it for one of these:**

| Sound | Other objects that work |
|---|---|
| /m/ | mug, mask, mat |
| /s/ | sandal, seed, sunglasses |
| /t/ | towel, tub, tag |

Do not use objects that start with sh, th, st or tr, such as a shoe, a thimble, a stapler or a truck. Their first sounds are harder to hear and will confuse this lesson.

## How to Say the Three Sounds

- **/m/** Close your lips and hum: mmmm. You can stretch this sound.
- **/s/** Put your teeth together and hiss: ssss. You can stretch this sound.
- **/t/** Tap your tongue once behind your top teeth. Keep it short and quiet. Do not add "uh" to the end.

## Lesson Steps

### Step 1: Listen for the first sound (3 minutes)

Say: *Today we are going to listen for the first sound in a word. The first sound is the sound your mouth makes at the very start. Listen to this word: mmmop. Mop. My mouth starts with /m/. Say it with me: /m/, mop.*

Do the same with two more words.

- Say: *Listen: sssun. Sun. My mouth starts with /s/. Say it with me: /s/, sun.*
- Say: *Listen: ten. Ten. My mouth starts with /t/. Say it with me: /t/, ten.*

### Step 2: Three sounds, three moves (6 minutes)

Teach one move for each sound. Hold up the matching letter paper as you teach it.

| Sound | Move | What to say |
|---|---|---|
| /m/ | Rub your tummy | *This letter is m. It makes the sound /m/. When we hear /m/, we rub our tummy and say mmmm. Show me.* |
| /s/ | Slide one hand through the air in a wavy line | *This letter is s. It makes the sound /s/. When we hear /s/, we slide our hand and say ssss. Show me.* |
| /t/ | Tap two fingers on your knee | *This letter is t. It makes the sound /t/. When we hear /t/, we tap our knee and say /t/, /t/, /t/. Show me.* |

Practice. Say: *Now I will say only a sound. You show me the move.*

Say the sounds in this order, and wait for the move each time: /s/, /m/, /t/, /t/, /m/, /s/.

### Step 3: Sort real objects (8 minutes)

Lay the three letter papers on the floor in a row where everyone can see them.

Take one object out of the bag at a time. Name the object yourself so that everyone uses the same word. For each object, use these words.

Say: *This is a sock. Say sock. What sound do you hear at the start of sock?*

Children answer /s/.

Say: *Yes. Sock starts with /s/.* Then choose one child and say: *Please put the sock on the letter s.*

Take the objects out in this order.

| Order | Object | First sound | Goes on letter |
|---|---|---|---|
| 1 | sock | /s/ | s |
| 2 | marker | /m/ | m |
| 3 | tape | /t/ | t |
| 4 | mitten | /m/ | m |
| 5 | soap | /s/ | s |
| 6 | tissue | /t/ | t |
| 7 | timer | /t/ | t |
| 8 | magnet | /m/ | m |
| 9 | sack | /s/ | s |

If a child picks the wrong letter, say the word again slowly and give two choices. Say: *Listen again: mmmitten. Watch my mouth. Is that /m/ or /t/?*

To finish, touch each pile and name what is in it. Say: *Marker, mitten, magnet. They all start with /m/.* Do the same for the s pile (sock, soap, sack) and the t pile (tape, tissue, timer).

### Step 4: Stand up and move (6 minutes)

Children stand in their own space.

Say: *I will say a word. Listen for the first sound. Then show me the move for that sound. Rub your tummy for /m/, slide your hand for /s/, tap your knee for /t/.*

Say each word clearly. After the children move, say the answer. For example: *Moon. /m/. Moon starts with /m/.*

| Order | Word | First sound | Move |
|---|---|---|---|
| 1 | moon | /m/ | rub tummy |
| 2 | sand | /s/ | slide hand |
| 3 | top | /t/ | tap knee |
| 4 | mud | /m/ | rub tummy |
| 5 | tiger | /t/ | tap knee |
| 6 | seven | /s/ | slide hand |
| 7 | table | /t/ | tap knee |
| 8 | mouse | /m/ | rub tummy |
| 9 | sink | /s/ | slide hand |
| 10 | milk | /m/ | rub tummy |
| 11 | soup | /s/ | slide hand |
| 12 | toe | /t/ | tap knee |

### Step 5: Match the sound to the letter (4 minutes)

Children sit down. Write m, s and t on the board in large lowercase letters, with space between them.

1. Point to each letter and say: *What sound does this letter make?* Children answer /m/, /s/, /t/.
2. Say: *Use your finger to write the letter in the air with me. Say the sound while you write.* Write each letter slowly on the board again while the children write in the air.
3. Say: *Now I will say a word. Point to the letter that starts the word.* Say these three words, one at a time: map (children point to m), sit (children point to s), tub (children point to t).

### Step 6: Quick check (3 minutes)

Say: *Last job. Close your eyes so that you do your own thinking. I will say a word. Show me the move for the first sound.*

Say the six words in the Answer Key at the end of this plan, one at a time. Watch the moves. Write down the names of children who miss two or more words, and work with them in a small group tomorrow.

Most of the class should show the right move for at least five of the six words.

To close, say: *Open your eyes. Today you listened for /m/, /s/ and /t/ at the start of words. Listen for those sounds all day long.*

## Time Check

| Step | Minutes |
|---|---|
| 1. Listen for the first sound | 3 |
| 2. Three sounds, three moves | 6 |
| 3. Sort real objects | 8 |
| 4. Stand up and move | 6 |
| 5. Match the sound to the letter | 4 |
| 6. Quick check | 3 |
| **Total** | **30** |

## Make It Easier or Harder

- **Easier:** Use only /m/ and /s/ at first. Both sounds can be stretched, so they are easier to hear. Add /t/ on another day.
- **Harder:** Ask a child to think of a new word that starts with /m/, /s/ or /t/. This lesson is about sounds, so accept any word that starts with the right sound, even if it is spelled with a different letter. "City" starts with /s/.
- If a child offers a word such as "ship" for s, say: *Ship starts with /sh/. That is a different sound. Listen: sssock, shhhip.*

## Answer Key

**Quick check (Step 6)**

| Order | Word to say | First sound | Move the child should show |
|---|---|---|---|
| 1 | sun | /s/ | slide hand |
| 2 | mop | /m/ | rub tummy |
| 3 | ten | /t/ | tap knee |
| 4 | map | /m/ | rub tummy |
| 5 | six | /s/ | slide hand |
| 6 | tail | /t/ | tap knee |', 'published', 'seed', 0, '2026-10-31T01:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-9f7acaa492a29892', 'causes-of-world-war-i-quiz-grade-10', 'Causes of World War I Quiz', 'quiz', '10', 'social-studies', 'A 30-point quiz on the long-term and immediate causes of World War I: militarism, alliances, imperialism, nationalism, the assassination at Sarajevo, and the July Crisis. Ten multiple choice and two short answer questions with a scoring guide.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** This quiz has two parts. In Part 1, circle the letter of the best answer (2 points each). In Part 2, answer each question in a well-developed paragraph (5 points each). Total: 30 points.

## Part 1: Multiple Choice

1. Historians often use the acronym M.A.I.N. to summarize the long-term causes of World War I. What do the letters stand for?
   - A. Monarchy, Alliances, Industrialization, Nationalism
   - B. Militarism, Alliances, Imperialism, Nationalism
   - C. Militarism, Anarchism, Imperialism, Neutrality
   - D. Mobilization, Armistice, Isolationism, Nationalism

2. Which event in June 1914 set off the crisis that led directly to the war?
   - A. Germany''s invasion of Belgium
   - B. The sinking of a British passenger ship
   - C. The assassination of Archduke Franz Ferdinand
   - D. The overthrow of the Russian czar

3. Where did this event take place?
   - A. Sarajevo, Bosnia
   - B. Vienna, Austria
   - C. Belgrade, Serbia
   - D. Berlin, Germany

4. Before the war began, which three countries made up the Triple Alliance?
   - A. Great Britain, France, and Russia
   - B. Germany, Russia, and the Ottoman Empire
   - C. France, Italy, and Serbia
   - D. Germany, Austria-Hungary, and Italy

5. Which statement best describes militarism in Europe before 1914?
   - A. Nations agreed to reduce the size of their armies to keep the peace
   - B. Nations built up their armed forces and gave military leaders a strong voice in government decisions
   - C. Nations refused to form partnerships with other countries
   - D. Nations gave up their overseas colonies to avoid conflict

6. Why were the Balkans called the *powder keg of Europe*?
   - A. Most of Europe''s weapons factories were located there
   - B. The region had large deposits of coal and oil
   - C. Nationalist movements and competing great-power interests made the region likely to explode into war
   - D. The region had recently been conquered by Germany

7. In the early 1900s, which two nations competed in a costly naval arms race centered on building dreadnought battleships?
   - A. Great Britain and Germany
   - B. France and Russia
   - C. Austria-Hungary and Serbia
   - D. Italy and the Ottoman Empire

8. In July 1914, what was the so-called *blank check*?
   - A. A loan from Great Britain to France to pay for weapons
   - B. Serbia''s agreement to accept every demand made by Austria-Hungary
   - C. Russia''s offer to pay for damage done in the Balkans
   - D. Germany''s promise to support Austria-Hungary in whatever action it took against Serbia

9. Which action led Great Britain to declare war on Germany in August 1914?
   - A. Germany''s declaration of war on Russia
   - B. Germany''s invasion of neutral Belgium
   - C. Austria-Hungary''s ultimatum to Serbia
   - D. Italy''s decision to stay out of the fighting

10. What was the goal of Germany''s Schlieffen Plan?
    - A. To blockade Great Britain with submarines
    - B. To persuade Italy to attack France from the south
    - C. To avoid a long two-front war by defeating France quickly and then turning east to fight Russia
    - D. To defend Germany''s borders without invading any other country

## Part 2: Short Answer

11. Explain how the alliance system turned a conflict between Austria-Hungary and Serbia into a war involving most of Europe''s great powers. Name at least three countries and describe how each was drawn in.

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

12. Choose ONE of the four M.A.I.N. causes other than alliances (militarism, imperialism, or nationalism). Define it and use at least two specific examples to explain how it increased tension in Europe before 1914.

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

## Answer Key

### Part 1 (2 points each, 20 points)

1. **B.** Militarism, Alliances, Imperialism, Nationalism.
2. **C.** Archduke Franz Ferdinand, heir to the throne of Austria-Hungary, was assassinated on June 28, 1914.
3. **A.** Sarajevo, Bosnia. The assassin, Gavrilo Princip, was a Bosnian Serb nationalist.
4. **D.** Germany, Austria-Hungary, and Italy. (Choice A lists the Triple Entente. Italy did not fight alongside its alliance partners in 1914 and joined the Allies in 1915.)
5. **B.** Nations built up their armed forces and military leaders gained influence over government decisions.
6. **C.** Nationalist movements, especially among Slavic peoples, and the rival interests of Austria-Hungary, Russia, and the weakening Ottoman Empire made the region unstable.
7. **A.** Great Britain and Germany.
8. **D.** Germany promised to back Austria-Hungary in whatever action it took against Serbia.
9. **B.** Germany invaded neutral Belgium on its way to France. Britain, which had pledged by treaty to protect Belgian neutrality, declared war on Germany on August 4, 1914.
10. **C.** The plan called for a rapid defeat of France by moving through Belgium, followed by a shift of forces east against Russia.

### Part 2 (5 points each, 10 points)

**Scoring guide for each short answer**

| Points | Description |
|---|---|
| 5 | Accurate and complete. Meets every part of the question with specific, correct details and clear explanation of cause and effect |
| 4 | Accurate and mostly complete. One required detail is missing or thinly explained |
| 3 | Generally accurate but lists facts without explaining how they connect, or meets only about half of the requirements |
| 2 | Limited. Some correct information mixed with significant errors or gaps |
| 1 | Minimal. One relevant correct fact |
| 0 | Blank or entirely incorrect |

**11. Sample response:** After the assassination, Austria-Hungary blamed Serbia and, with Germany''s backing, declared war on Serbia on July 28, 1914. Russia saw itself as the protector of the Slavic people of Serbia and began to mobilize its army. Germany, allied with Austria-Hungary, declared war on Russia on August 1 and on Russia''s ally France on August 3. To reach France quickly, Germany invaded neutral Belgium, which brought Great Britain into the war on August 4. Because each power was tied to others by alliances and promises of support, a regional conflict in the Balkans became a general European war within about a week.

*Look for:* at least three countries correctly named; a correct reason each one entered (Russia to support Serbia; Germany to support Austria-Hungary; France as Russia''s ally; Britain after the invasion of Belgium); and the idea of a chain reaction. Exact dates are not required for full credit.

**12. Sample responses** (students choose one):

- **Militarism:** the policy of building up strong armed forces and relying on military power to solve problems. Examples: Great Britain and Germany raced to build larger navies, including dreadnought battleships; the major continental powers used conscription to build huge armies; generals drew up detailed war plans such as Germany''s Schlieffen Plan, which depended on fast mobilization and left leaders little time to negotiate once a crisis began.
- **Imperialism:** the policy of extending a nation''s power by taking control of other lands. Examples: European powers competed for colonies and trade in Africa and Asia; Germany, a newer empire, wanted colonies to match those of Britain and France; France and Germany clashed over Morocco in 1905 and 1911, which deepened distrust and pushed Britain and France closer together.
- **Nationalism:** intense pride in and loyalty to one''s nation or ethnic group, often with the belief that it should have its own independent state. Examples: Serbian nationalists wanted to unite the South Slavs, which threatened multi-ethnic Austria-Hungary; France resented the loss of Alsace-Lorraine to Germany in 1871; Russia''s support for fellow Slavs (Pan-Slavism) tied it to Serbia; the assassin of Franz Ferdinand was motivated by nationalism.

*Look for:* a correct definition (1 point), two accurate and specific examples (1 point each), and an explanation of how each example raised tension or made war more likely (2 points).', 'published', 'seed', 0, '2026-10-30T18:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-a76e8f215cb6da27', 'cell-organelles-study-guide-grade-9', 'Cell Organelles and Their Functions Study Guide', 'study-guide', '9', 'science', 'A complete review of eukaryotic cell organelles with a function table, plant vs. animal and prokaryote vs. eukaryote comparisons, common misconceptions, memory analogies, and a 13-question self-check quiz with answers.', '', '## How to Use This Guide

1. Read each section once without trying to memorize anything.
2. Cover the Function column of the organelle table with a sheet of paper and try to say each function out loud.
3. Take the self-check quiz at the end without looking back.
4. Check your answers, then re-study only the items you missed.

## Big Ideas

- The **cell** is the basic unit of structure and function in all living things.
- An **organelle** is a specialized structure inside a cell that carries out a specific job.
- Organelles work together as a system. No organelle keeps a cell alive on its own.
- **Structure fits function:** the shape and makeup of each organelle helps it do its job.

## Two Kinds of Cells

| Feature | Prokaryotic cell | Eukaryotic cell |
|---|---|---|
| Nucleus | No. DNA floats in a region called the nucleoid | Yes. DNA is enclosed in a nucleus |
| Membrane-bound organelles | No | Yes (mitochondria, ER, Golgi, and others) |
| Ribosomes | Yes | Yes |
| Cell membrane | Yes | Yes |
| Cytoplasm | Yes | Yes |
| Typical size | Smaller | Larger |
| Examples | Bacteria and archaea | Plants, animals, fungi, protists |

## Organelle Table

| Structure | Function | Found in | Remember it as... |
|---|---|---|---|
| Cell membrane | Controls what enters and leaves the cell. It is selectively permeable and made of a phospholipid bilayer with proteins | All cells | Security gate |
| Cytoplasm | Jelly-like fluid (cytosol) that fills the cell and holds the organelles. Many chemical reactions happen here | All cells | Factory floor |
| Nucleus | Stores the cell''s DNA and controls cell activities by directing which proteins are made | Eukaryotic cells | Main office |
| Nucleolus | Dense region inside the nucleus that makes the parts of ribosomes | Eukaryotic cells | Machine-building shop |
| Ribosome | Builds proteins by linking amino acids together. Found free in the cytoplasm or attached to rough ER. Not surrounded by a membrane | All cells | Assembly worker |
| Rough endoplasmic reticulum (rough ER) | Network of membranes covered with ribosomes. Folds, modifies, and transports proteins | Eukaryotic cells | Assembly line |
| Smooth endoplasmic reticulum (smooth ER) | Network of membranes with no ribosomes. Makes lipids and helps break down toxins | Eukaryotic cells | Oil and cleanup department |
| Golgi apparatus | Modifies, sorts, and packages proteins and lipids, then ships them in vesicles | Eukaryotic cells | Shipping department |
| Vesicle | Small membrane sac that carries materials around the cell or to the cell membrane | Eukaryotic cells | Delivery truck |
| Mitochondrion (plural: mitochondria) | Carries out cellular respiration, releasing energy from food and storing it as ATP | Nearly all eukaryotic cells, including plant cells | Power plant |
| Chloroplast | Carries out photosynthesis, using light energy to make sugar. Contains the green pigment chlorophyll | Plant cells and algae | Solar panel |
| Lysosome | Sac of digestive enzymes that breaks down food particles, waste, and worn-out cell parts | Mostly animal cells | Recycling center |
| Vacuole | Stores water, nutrients, and wastes. Plant cells have one large central vacuole that pushes against the cell wall to keep the cell firm | Plant cells (large central vacuole); animal cells (small, if present) | Storage tank |
| Cell wall | Rigid outer layer outside the cell membrane that supports and protects the cell. Made of cellulose in plants | Plants, fungi, and most bacteria. Not in animal cells | Outer wall of the building |
| Cytoskeleton | Network of protein fibers that gives the cell its shape and helps move materials and organelles | Eukaryotic cells | Steel frame and conveyor tracks |
| Centrioles | Help organize cell division | Animal cells | Moving crew for cell division |

## Plant Cells vs. Animal Cells

| Structure | Plant cell | Animal cell |
|---|---|---|
| Cell wall | Yes | No |
| Chloroplasts | Yes | No |
| Large central vacuole | Yes | No (small vacuoles only) |
| Centrioles | No (in most plants) | Yes |
| Lysosomes | Rare | Common |
| Nucleus, ribosomes, ER, Golgi, mitochondria, cell membrane | Yes | Yes |
| Typical shape | Fixed and boxy | Rounded or irregular |

## How Organelles Work Together: Making and Shipping a Protein

1. The **nucleus** holds the DNA instructions for the protein. A copy of the instructions (mRNA) leaves the nucleus.
2. A **ribosome** on the **rough ER** reads the instructions and builds the protein.
3. The **rough ER** folds the protein and sends it off in a **vesicle**.
4. The **Golgi apparatus** modifies, sorts, and packages the protein.
5. A new **vesicle** carries the protein to the **cell membrane**, where it is released from the cell.
6. **Mitochondria** supply the ATP that powers these steps.

## Common Mistakes to Avoid

- **Plant cells have mitochondria too.** Chloroplasts make sugar. Mitochondria release the energy in that sugar. Plants need both.
- **Mitochondria do not create energy.** They convert the energy stored in food into a form the cell can use (ATP).
- **The cell wall and cell membrane are not the same thing.** Plant cells have both. The membrane controls what passes. The wall gives support.
- **Ribosomes are in every cell,** including bacteria. They are not membrane-bound.
- **The nucleus is not the cell''s brain.** It stores genetic information and controls which proteins get made.

## Key Vocabulary

- **ATP:** the molecule cells use as their main energy source
- **Cellular respiration:** the process that releases energy from sugar, mostly in the mitochondria
- **Photosynthesis:** the process that uses light energy, water, and carbon dioxide to make sugar and oxygen
- **Selectively permeable:** allows some substances to pass through but not others
- **Eukaryote:** an organism whose cells have a nucleus
- **Prokaryote:** a single-celled organism whose cell has no nucleus
- **Enzyme:** a protein that speeds up a chemical reaction

## Self-Check Quiz

**Multiple choice.** Circle the best answer.

1. Which organelle stores most of a eukaryotic cell''s DNA?
   - A. Ribosome
   - B. Golgi apparatus
   - C. Nucleus
   - D. Lysosome

2. What is the main job of a ribosome?
   - A. Storing water
   - B. Building proteins
   - C. Breaking down waste
   - D. Capturing light energy

3. Which organelle releases energy from food and stores it as ATP?
   - A. Mitochondrion
   - B. Chloroplast
   - C. Vacuole
   - D. Nucleolus

4. Which structure is found in plant cells but NOT in animal cells?
   - A. Mitochondrion
   - B. Ribosome
   - C. Cell membrane
   - D. Chloroplast

5. Which organelle modifies, sorts, and packages proteins for shipment?
   - A. Golgi apparatus
   - B. Smooth ER
   - C. Lysosome
   - D. Centriole

6. How is rough ER different from smooth ER?
   - A. Rough ER is found only in plant cells
   - B. Rough ER stores DNA
   - C. Rough ER carries out photosynthesis
   - D. Rough ER has ribosomes attached to it

7. A cell needs to break down a worn-out organelle. Which structure does this job?
   - A. Cell wall
   - B. Lysosome
   - C. Nucleus
   - D. Chloroplast

8. Which structure is selectively permeable and found in ALL cells?
   - A. Cell wall
   - B. Nucleus
   - C. Cell membrane
   - D. Central vacuole

**Short answer.** Write one to three sentences for each.

9. Name two structures a plant cell has that an animal cell does not, and tell what each one does.

______________________________________________________________

______________________________________________________________

10. List, in order, the organelles a protein passes through from the time it is built until it leaves the cell.

______________________________________________________________

______________________________________________________________

11. Muscle cells contain many more mitochondria than most skin cells. Explain why this makes sense.

______________________________________________________________

______________________________________________________________

12. A houseplant that has not been watered begins to wilt. Which organelle is most directly involved, and what is happening to it?

______________________________________________________________

______________________________________________________________

13. Give one difference and one similarity between prokaryotic and eukaryotic cells.

______________________________________________________________

______________________________________________________________

## Answer Key

**Multiple choice**

1. C. Nucleus
2. B. Building proteins
3. A. Mitochondrion
4. D. Chloroplast
5. A. Golgi apparatus
6. D. Rough ER has ribosomes attached to it
7. B. Lysosome
8. C. Cell membrane

**Short answer** (accept reasonable wording)

9. Any two of the following: the **cell wall** supports and protects the cell; **chloroplasts** carry out photosynthesis to make sugar; the **large central vacuole** stores water and keeps the cell firm.

10. Ribosome (on the rough ER), rough ER, vesicle, Golgi apparatus, vesicle, cell membrane. Full credit requires the order ribosome, rough ER, Golgi apparatus, cell membrane; vesicles are a bonus detail.

11. Muscle cells use a large amount of energy to contract. Mitochondria release energy from food as ATP, so cells with high energy needs have more mitochondria.

12. The large central vacuole. Without enough water, the vacuole loses water and shrinks, so it no longer pushes outward against the cell wall. The cells lose their firmness and the plant droops.

13. Differences (any one): prokaryotic cells have no nucleus; they have no membrane-bound organelles; they are usually smaller. Similarities (any one): both have a cell membrane, cytoplasm, ribosomes, and DNA.

**Score yourself:** 12 to 13 correct means you are ready. 9 to 11 correct means review the rows of the organelle table you missed. 8 or fewer means re-read the guide and retake the quiz tomorrow.', 'published', 'seed', 0, '2026-10-30T11:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-5b5b12b4856ad2d9', 'civil-rights-primary-source-analysis-lesson-plan-grade-11', 'Analyzing Primary Sources from the Civil Rights Movement', 'lesson-plan', '11', 'social-studies', 'A 50-minute lesson in which small groups analyze different types of civil rights era primary sources (photograph, flyer, government document, news report, oral history) and compare what each reveals and leaves out. Includes a source selection guide, analysis organizer, differentiation, and an exit ticket with scoring guide.', 'CCSS.ELA-LITERACY.RH.11-12.1, CCSS.ELA-LITERACY.RH.11-12.2, CCSS.ELA-LITERACY.RH.11-12.6, CCSS.ELA-LITERACY.RH.11-12.9', '## Overview

**Time:** 50 minutes

**Essential question:** What can different kinds of primary sources tell us about the civil rights movement, and what does each kind leave out?

Students work in small groups, each with a different type of primary source from the same event or campaign. They source and analyze their document, then meet with other groups to compare accounts. The lesson teaches a repeatable routine (source it, observe it, question it, corroborate it) that students can apply to any historical document.

**Prior knowledge:** Students should have a basic timeline of the movement from about 1954 to 1965 and know the terms *segregation*, *Jim Crow*, *boycott*, and *nonviolent direct action*.

## Objectives

By the end of the lesson, students will be able to:

1. Identify the author, audience, date, and purpose of a primary source.
2. Cite specific details from a source to support a claim about the civil rights movement.
3. Explain how a source''s point of view and purpose shape what it shows and what it leaves out.
4. Compare two sources about the same event and describe where they agree, differ, or fill in gaps.

## Materials

- One primary source set (five sources, one of each type described below), with enough copies for each group member
- Source Analysis Organizer, one per student (reproduced below)
- One additional photograph for the opening, displayed or printed large
- Chart paper or board space with the four routine steps written out
- Half sheets of paper for the exit ticket
- Timer

## Teacher Preparation: Building the Source Set

Choose **one event or campaign** so that students can compare sources. The Montgomery bus boycott (1955 to 1956), the school desegregation crisis in Little Rock (1957), the Greensboro lunch counter sit-ins (1960), the Birmingham campaign (1963), and the Selma voting rights marches (1965) all work well because many kinds of sources survive for each.

This plan describes the types of sources to gather instead of reprinting them, because many well-known texts and photographs from the period are still under copyright. The Library of Congress, the National Archives, presidential libraries, state archives, and university civil rights digital collections all publish classroom-ready sources with clear use terms. Works created by the federal government, such as laws, court opinions, executive orders, and presidential speeches, are in the public domain.

Gather one source of each type. Keep text excerpts to 150 to 250 words.

| Station | Source type | What to look for when choosing | What this type tends to reveal | What it tends to leave out |
|---|---|---|---|---|
| A | News photograph | A clear image of an action in progress (a march, sit-in, picket line, or confrontation) with people, signs, and setting visible. Remove the caption for the first look and provide it afterward | Who was present, how they dressed and carried themselves, the physical setting, the mood of a single moment | What happened before and after, what people said, why the photographer chose this frame |
| B | Movement document | A flyer, leaflet, meeting notice, or set of instructions for participants produced by a local organization or student group | Goals, strategy, how people were organized, the tone leaders used with their own community | Disagreements inside the movement, how many people actually followed the plan |
| C | Government document | An excerpt from a law, court opinion, executive order, presidential address, or a state or local ordinance requiring segregation | The official position of those in power and the exact legal language at stake | Whether and how the document was enforced, how ordinary people experienced it |
| D | Newspaper report from the time | A short news article or editorial about the event. If possible, pair two short excerpts: one from a local white-owned daily and one from a Black-owned newspaper | How the event was presented to the public as it happened, what language was considered normal at the time | The perspectives the paper''s editors chose not to include |
| E | Oral history or memoir | An excerpt from a recorded interview or written recollection by a participant, especially an ordinary participant and not a famous leader | Personal motives, fear, courage, daily details that official records skip | Exact dates and numbers; memories recorded decades later can shift |

**Content note:** Sources from this period can include racist language and images of violence. Preview everything, choose with your students in mind, and tell the class in advance that they will see the words and images of the time as evidence to be examined, not as language to repeat.

## Lesson Steps

### 1. Opening: Look Closely (5 minutes)

- Display the opening photograph with no caption.
- Students write silently for two minutes in two columns: *What I see* and *What I wonder*.
- Take three or four responses. Press students to separate observation (a line of people standing on a sidewalk) from inference (they are protesting).
- Reveal the caption and date. Ask: *What does the caption add? What does this photograph still not tell us?*
- State the essential question.

### 2. Mini-Lesson: Model the Routine (8 minutes)

Post the four steps and model them aloud with the opening photograph, filling in a sample organizer as you go.

1. **Source it.** Who made this? When? For whom? Why?
2. **Observe it.** What exactly does it say or show? Note three specific details.
3. **Question it.** Whose point of view is this? What is missing? What would I ask the creator?
4. **Corroborate it.** What other source would confirm, challenge, or complete this one?

Define *primary source* (created at the time by someone with direct knowledge of the event) and *corroborate* (to check one source against another). Emphasize that every source has a point of view, and that having a point of view does not make a source useless. It makes it evidence of how that person or group saw the event.

### 3. Expert Groups: Analyze One Source (15 minutes)

- Divide the class into five groups, A through E. Give each group its source and each student an organizer.
- Minutes 1 to 4: students read or study the source silently and annotate.
- Minutes 5 to 12: groups complete organizer sections 1 through 3 together. Every student records answers, because each will report alone in the next step.
- Minutes 13 to 15: each group agrees on a one-sentence answer to this question: *What is the most important thing this source tells us about the event?*
- Circulate. Useful prompts: *Where do you see that in the source? Who was meant to read this? What would someone on the other side of this event say about it?*

### 4. Mixed Groups: Compare Sources (12 minutes)

- Regroup so each new group has at least one member from A, B, C, D, and E.
- Each expert has 90 seconds to present their source: what it is, who made it, and the most important thing it shows.
- After all five have shared, the group discusses and each student completes organizer section 4:
  - Where do two of these sources agree?
  - Where do two of them differ or seem to describe the event differently? Why might that be?
  - What does one source tell us that no other source does?

### 5. Whole-Class Debrief (5 minutes)

- Ask two or three groups: *Which two sources were most different, and what explains the difference?*
- Ask the class: *If a historian had only the government document, what would they get wrong about this event? What if they had only the oral history?*
- Name the takeaway: historians build an account from many sources because no single source shows the whole event.

### 6. Exit Ticket (5 minutes)

Students answer on a half sheet and hand it in at the door.

1. Name the source your expert group analyzed. Who created it, and for what purpose?
2. What is one thing this source reveals about the civil rights movement? Cite a specific detail.
3. What is one thing this source leaves out, and which other source from today helped fill that gap?

## Source Analysis Organizer

**Name:** ______________________  **Date:** ____________  **Station:** ______

### Section 1: Source It

| Question | My answer |
|---|---|
| What type of source is this? | |
| Who created it? | |
| When and where was it created? | |
| Who was the intended audience? | |
| Why was it created? | |

### Section 2: Observe It

List three specific details (exact words, objects, people, or actions) that you notice.

1. ______________________________________________________________

2. ______________________________________________________________

3. ______________________________________________________________

### Section 3: Question It

Whose point of view does this source represent? How can you tell?

______________________________________________________________

______________________________________________________________

What is missing? Whose voice or what information is not here?

______________________________________________________________

______________________________________________________________

The most important thing this source tells us about the event (one sentence):

______________________________________________________________

### Section 4: Corroborate It (complete in your mixed group)

Two sources that agree, and what they agree about:

______________________________________________________________

Two sources that differ, and a reason they might differ:

______________________________________________________________

______________________________________________________________

Something only one source tells us:

______________________________________________________________

## Differentiation

### For Struggling Learners and English Learners

- Assign Station A (photograph) or a short Station B flyer, which carry less reading load but demand the same analytical thinking.
- Provide the text sources with five to six key terms defined in the margin and the most important two or three sentences already bracketed.
- Offer sentence frames: *This source was created by ___ in order to ___. One detail that shows this is ___. This source does not tell us ___.*
- Pre-fill the first two rows of Section 1 so students begin with analysis instead of searching for basic information.
- Pair students for the mixed-group share so that no one presents alone.
- Allow the exit ticket to be answered in bulleted phrases.

### For Advanced Learners

- Assign Station D with the two contrasting newspaper excerpts and ask students to compare word choice: which verbs and labels does each paper use for the same people and actions?
- Give a longer or unexcerpted government document and ask students to identify the legal reasoning, not only the outcome.
- Add a sixth question to the organizer: *What source that we do not have today would you most want to find, and where might a historian look for it?*
- Extension task: write one paragraph explaining how a textbook account of this event would change if it were based only on government documents.

## Assessment

**Formative (during the lesson):** Listen during expert groups for students citing specific details and distinguishing observation from inference. Check that organizer Section 1 is accurate before groups move on.

**Summative for the lesson:** Score the exit ticket with the guide below (6 points).

| Criterion | 2 points | 1 point | 0 points |
|---|---|---|---|
| Sourcing (question 1) | Correctly identifies the creator and a plausible, specific purpose | Identifies the creator or the purpose, but not both, or is vague | Missing or incorrect |
| Evidence (question 2) | Makes an accurate claim and supports it with a specific detail from the source | Makes an accurate claim with a general or no supporting detail | Missing or inaccurate |
| Limits and corroboration (question 3) | Names a real limitation of the source and connects it to a specific second source | Names a limitation or a second source, but does not connect them | Missing or off topic |

Students who score 4 or below should get a short reteach using a new single source at the start of the next class.

## Extension and Homework Options

- **Document-based paragraph:** Using at least two sources from class, answer the question: *How did ordinary people contribute to the success of this campaign?*
- **Find the gap:** Students propose one additional source type (for example a police report, a church bulletin, a letter to the editor, or a business ledger) and explain what it could add.
- **Local connection:** Students interview an older relative or community member about their memories of the period, then source their own interview using Section 1 of the organizer.

## Answer Key

Answers depend on the sources you select. Use these look-fors when checking organizers and exit tickets.

**Section 1: Source It**

- Students name a specific creator or kind of creator (a wire service photographer, a local boycott committee, a federal court, a city newspaper, a former student activist interviewed years later), not just *someone*.
- Purpose is specific to the source type: to report news, to recruit and instruct participants, to set or enforce law, to inform or persuade readers, to preserve a personal memory.

**Section 2: Observe It**

- Details are things that can be pointed to in the source (a quoted phrase, the wording on a sign, the number of people in the frame), not interpretations.

**Section 3: Question It**

- Point of view is tied to evidence, such as word choice, what is emphasized, or who is quoted.
- Typical gaps by type: a photograph lacks context before and after the moment; a flyer shows the plan but not the result; a government document shows official intent but not lived experience; a newspaper reflects its editors and readers; an oral history is shaped by memory and by the years that have passed.

**Section 4: Corroborate It**

- Agreement usually appears on basic facts: date, place, and what action took place.
- Differences usually appear in tone, labels for participants, explanations of cause, and judgments about who was responsible. Strong answers explain the difference by pointing to the creator''s audience or purpose.

**Exit ticket:** See the scoring guide under Assessment. A full-credit example for a movement flyer: *The flyer was made by a local organizing committee to tell Black residents to stay off the buses on a certain day. It shows the boycott was carefully planned, because it gives a specific date and tells people to find other ways to work. It does not tell us whether people actually took part. The news photograph of nearly empty buses helped answer that.*', 'published', 'seed', 0, '2026-10-30T04:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-7aa5ca455e9d536c', 'classroom-survival-vocabulary-newcomers-grade-6', 'Classroom Survival Vocabulary for Newcomers', 'vocabulary', '6', 'esl', 'Twenty words and phrases a new English learner needs in the first weeks of school: school objects, places in the building and polite requests. Each has a simple meaning and an example sentence, followed by a 20-item practice page with answer key.', '', '**For the teacher:** This list is for students who are new to English. Read each word aloud and have students repeat it. Point to the real object or walk to the real place when you can. Students may write the word in their home language in the last column. The practice page can be done with a partner.

## Part 1: School Objects

| Word | What it means | Example sentence | In my language |
|---|---|---|---|
| backpack | a bag that you carry on your back | My books are in my backpack. | |
| notebook | a book of blank paper that you write in | I write new words in my notebook. | |
| textbook | a book that you use to study a subject at school | Open your science textbook to page 12. | |
| eraser | a small piece of rubber that removes pencil marks | I made a mistake, so I used my eraser. | |
| locker | a small metal closet at school where you keep your things | I put my jacket in my locker. | |
| schedule | a list that shows your classes and the time of each one | My schedule says math starts at 9:00. | |
| homework | school work that you do at home | I do my homework after dinner. | |

## Part 2: Places at School

| Word | What it means | Example sentence | In my language |
|---|---|---|---|
| cafeteria | the room where students eat lunch | We eat lunch in the cafeteria at 12:00. | |
| gym | a big room for sports and PE class | We play basketball in the gym. | |
| hallway | the long space outside the classrooms that you walk through | My locker is in the hallway. | |
| library | a room with many books that you can borrow | I found a good book in the library. | |
| nurse''s office | the room where you go when you are sick or hurt | I cut my finger, so I went to the nurse''s office. | |
| office | the room where the principal and the school secretary work | If you come to school late, sign in at the office. | |
| restroom | a room with toilets and sinks (also called the bathroom) | The restroom is next to the gym. | |

## Part 3: Useful Requests

These are polite sentences. Practice saying them aloud.

| Say this | Use it when | 
|---|---|
| May I go to the restroom? | you need to use the bathroom |
| Can you repeat that, please? | you did not hear what a person said |
| I don''t understand. | you heard the words, but you do not know what they mean |
| May I borrow a pencil? | you need to use a pencil that belongs to another person |
| How do you say ___ in English? | you know a word in your language, but not in English |
| Where is the ___? | you cannot find a place or a thing |

## Practice

**Name:** ______________________  **Date:** ____________

### A. Match the word to its meaning

Write the letter of the meaning on the line.

1. backpack ____
2. eraser ____
3. homework ____
4. locker ____
5. schedule ____
6. textbook ____

**Meanings**

- **a.** school work that you do at home
- **b.** a list that shows your classes and the time of each one
- **c.** a bag that you carry on your back
- **d.** a book that you use to study a subject at school
- **e.** a small piece of rubber that removes pencil marks
- **f.** a small metal closet at school where you keep your things

### B. Finish the sentence

Choose a word from the box. Use each word one time.

**Word box:** cafeteria, gym, hallway, library, notebook, nurse''s office, office, restroom

7. I am hungry. It is time to eat lunch in the ______________.
8. I fell and hurt my knee. I need to go to the ______________.
9. I want to borrow a book about animals. I will go to the ______________.
10. I came to school late. I have to sign in at the ______________.
11. Please write these five sentences in your ______________.
12. I need to wash my hands. May I go to the ______________?
13. We play basketball in the ______________ during PE class.
14. Do not run in the ______________. Walk to your next class.

### C. What do you say?

Read what happens. Write the best request from Part 3. Use each request one time.

15. You need to use the bathroom during class.

______________________________________________

16. The teacher said the page number, but the bell was ringing and you did not hear it.

______________________________________________

17. You left your pencil at home and you need one for the test.

______________________________________________

18. You know the name of a fruit in your language. You want to learn its name in English.

______________________________________________

19. It is your first day. It is time for lunch, but you cannot find the cafeteria.

______________________________________________

20. You heard every word of the directions, but you do not know what they mean.

______________________________________________

## Answer Key

**A. Match the word to its meaning**

1. c
2. e
3. a
4. f
5. b
6. d

**B. Finish the sentence**

7. cafeteria
8. nurse''s office
9. library
10. office
11. notebook
12. restroom
13. gym
14. hallway

**C. What do you say?**

15. May I go to the restroom?
16. Can you repeat that, please?
17. May I borrow a pencil?
18. How do you say ___ in English? (Students may point to the fruit or say its name in their language in place of the blank.)
19. Where is the cafeteria?
20. I don''t understand.', 'published', 'seed', 0, '2026-10-29T21:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-effdc12cb52cae73', 'color-wheel-mixing-secondary-colors-lesson-plan-grade-3', 'Color Wheel Lesson Plan: Mixing Secondary Colors', 'lesson-plan', '3', 'arts', 'A 45-minute grade 3 art lesson in which students paint a six-part color wheel and mix orange, green and purple from red, yellow and blue. Works with tempera or watercolor and includes timed steps, set-up and clean-up, a safety section and a quick check with answers.', '', '## Overview

**Time:** 45 minutes, including set-up and clean-up

**Students will:**

- name the three primary colors and the three secondary colors
- mix each secondary color from two primary colors
- place all six colors in the correct order on a color wheel

**Key words**

- **Primary colors:** red, yellow and blue. In a paint set, these are the starting colors used to mix the others.
- **Secondary colors:** orange, green and purple (also called violet). Each one is made by mixing two primary colors.
- **Color wheel:** a circle that shows colors in order, so that each mixed color sits between the two colors that make it.

## Materials

**For each student**

- 1 sheet of heavy white paper (watercolor paper or construction paper)
- 1 pencil
- 1 paintbrush, medium size
- 1 paper towel
- A smock or old shirt

**For each table group**

- Red, yellow and blue paint only. Use tempera (a spoonful of each color on a paper plate) OR watercolor sets (cover or remove the other colors if you can).
- 1 extra paper plate or a plastic lid for mixing
- 1 container of water, half full
- 1 paper plate or bowl to trace around, about 8 inches across
- Newspaper or a table cover

**For the teacher**

- A board or chart paper and a marker
- Your own set of paint, brush, water and paper for the demonstration
- A flat place for wet paintings to dry
- Damp sponges or cloths for wiping tables

## Safety

Check every step against your school''s safety rules and the manufacturer''s instructions before use.

- Use only paint labeled non-toxic and made for children. Read the label before the lesson.
- Check for any student with a skin sensitivity or allergy before handing out paint.
- Paint, paint water and brushes stay away from mouths and eyes. Paint water is not for drinking.
- Wipe up spilled water or paint on the floor right away so that no one slips.
- Students wear smocks and wash their hands with soap and water at the end.
- Stay with the class the whole time, including during clean-up at the sink.

## Lesson Steps

### Step 1: Set-up (5 minutes)

Cover the tables. Students put on smocks and write their names in pencil on the back of their paper. Table helpers hand out brushes, paper towels, water and paint. Paint stays in the middle of the table, untouched, until Step 4.

### Step 2: Introduce and draw the wheel (7 minutes)

Say: *Today you will be color scientists. You will start with only three colors of paint and end with six.*

Ask: *Which three colors are on your table?* (Red, yellow and blue.) Say: *These are called the primary colors. We use them to mix other colors.*

Draw a large circle on the board. Draw three straight lines through the center so that the circle is cut into six equal slices, like a pizza. Students do the same on their paper:

1. Trace around the plate or bowl with a pencil.
2. Draw three lines through the middle to make six slices.
3. Lightly write a letter near the outside edge of every other slice. Start at the top slice and go around like a clock: Y in the first slice, skip a slice, R in the next, skip a slice, B in the next, skip a slice.

Check that each student has an empty slice between Y and R, between R and B, and between B and Y.

### Step 3: Demonstrate mixing (4 minutes)

Gather students where they can see your paper. Show these three habits.

- **Wash, wipe, dip.** Swish the brush in the water, wipe it on the paper towel, then dip into a new color. Do this every time you change colors.
- **Start with the lighter color.** Put the lighter color on the mixing plate first. Add the darker color a tiny bit at a time. A little dark paint changes a light color quickly.
- **Mix on the plate, not on the wheel.** Stir until the color is even, then paint the slice.

Mix orange in front of the class: a brushful of yellow, then a small touch of red. Ask: *What color did I make?* (Orange.) Paint it in the empty slice between Y and R. Ask: *Why does orange belong in this slice?* (It is made from the two colors next to it, yellow and red.)

### Step 4: Paint the primary colors (6 minutes)

Students return to their tables and paint the three lettered slices: yellow in Y, red in R, blue in B. Remind them to wash, wipe and dip between colors. Walk around and check that the three slices between the primary colors are still empty.

### Step 5: Mix and paint the secondary colors (10 minutes)

Students mix one secondary color at a time on the mixing plate and paint it in the slice between the two colors that made it.

| Mix | Start with | Add a little at a time | Paint it in the slice between |
|---|---|---|---|
| Orange | yellow | red | yellow and red |
| Green | yellow | blue | yellow and blue |
| Purple | red | blue | red and blue |

As you walk around, ask: *Which two colors made this one? What would you add to change it?*

**Fixing a mix**

- Orange looks too red: add more yellow.
- Green looks too blue: add more yellow.
- Purple looks brown or gray: the brush or the water was probably dirty, or the red paint leans toward orange. Rinse well, change the water, and try again with less paint. If the school has magenta paint, it mixes a cleaner purple with blue than an orange-red does.
- Watercolor looks pale: use less water on the brush and pick up more paint.

When the wheel is finished, the six colors go around in this order: yellow, orange, red, purple, blue, green, and back to yellow.

### Step 6: Quick check (5 minutes)

Students put brushes in the water container and leave their paintings flat on the table. Ask the six questions below aloud. For questions 1 to 4, have the whole class answer together or point to the color on their own wheel. For questions 5 and 6, give thinking time and call on two or three students. Expected answers are in the Answer Key at the end of this plan.

1. What are the three primary colors?
2. Which two primary colors mix to make orange?
3. Which two primary colors mix to make green?
4. Which two primary colors mix to make purple?
5. Why does each secondary color sit between two primary colors on the wheel?
6. Your green looks too blue. What should you add?

While students answer, look at the wheels. A finished wheel has six different colors, with each mixed color between the two colors that made it.

### Step 7: Clean-up (8 minutes)

Give one job at a time.

1. Carry your painting flat with two hands to the drying place.
2. Table helpers bring water containers to the sink. An adult empties them.
3. Brushes are rinsed until the water runs clear, then left to dry flat or with the bristles up.
4. Paper plates and paper towels go in the trash. Watercolor sets are wiped and closed.
5. Wipe the table with a damp sponge.
6. Wash hands with soap and water, then hang up smocks.

## Time Check

| Step | Minutes |
|---|---|
| 1. Set-up | 5 |
| 2. Introduce and draw the wheel | 7 |
| 3. Demonstrate mixing | 4 |
| 4. Paint the primary colors | 6 |
| 5. Mix and paint the secondary colors | 10 |
| 6. Quick check | 5 |
| 7. Clean-up | 8 |
| **Total** | **45** |

## Make It Easier or Harder

- **Easier:** Draw the circle and the six slices on each paper before class so that students only add the letters.
- **Harder:** Early finishers mix two different oranges on scrap paper, one with more yellow and one with more red, and describe the difference to a partner.

## Answer Key

**Quick check (Step 6)**

1. Red, yellow and blue.
2. Red and yellow.
3. Yellow and blue.
4. Red and blue.
5. Because it is made by mixing those two primary colors. For example, orange sits between red and yellow because red and yellow make orange.
6. Add more yellow.', 'published', 'seed', 0, '2026-10-29T14:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-b06ca7e9c5a757a6', 'community-building-bell-ringers-first-weeks-grade-9', '20 Community-Building Bell Ringers for the First Weeks of School', 'bell-ringer', '9', 'sel', 'Twenty five-minute warm-ups for the first four weeks of ninth grade that move from low-risk introductions to goal setting and class norms. Each prompt has a quick share format, and the set includes a daily routine and tips for making sharing safe.', '', '## How to Use These Bell Ringers

These prompts are ordered on purpose. Week 1 asks for low-risk, low-effort sharing. Later weeks ask students to work together, name what they value, and set goals. Use them in order, one per day, for the first four weeks.

**Daily routine (5 minutes)**

| Time | What happens |
|---|---|
| Before the bell | The prompt is on the board. Students begin when they sit down |
| Minutes 1 to 3 | Students write silently in a notebook or on an index card |
| Minutes 4 to 5 | Share, using the format listed with the prompt |
| Transition | One sentence from you that connects the prompt to the class or simply thanks students for sharing |

**Share formats**

- **Pair share:** Each partner talks for 30 seconds while the other listens. Then switch.
- **Whip-around:** Every student says one word or one short phrase, going quickly around the room.
- **Stand up, hand up, pair up:** Students stand, find a partner they have not talked with yet, share, and sit down.
- **Card collect:** Students write on an index card and hand it in. No one shares aloud. You read the cards later.
- **Volunteers:** Take three or four raised hands.

**Ground rules to teach on day 1**

1. **You may always pass.** A student can say *pass* during any share, with no explanation.
2. **Share at your own level.** Students choose how personal to be. A simple answer is a complete answer.
3. **Listen without commenting.** No side comments, no laughing at answers, no debating someone''s experience.
4. **What is shared here stays here.**

Answer the prompt yourself and share your own answer often. Students take more risks when the adult goes first. If a response makes you concerned about a student''s safety or well-being, follow your school''s reporting procedures and talk with the counselor.

## Week 1: Getting to Know You

The goal this week is for every student to say something aloud to at least one classmate each day and to learn names.

**1. Name story.** Write the name you want to be called in this class. Then write one thing about it: where it comes from, a nickname you like, or how to pronounce it correctly.

- *Share:* Whip-around. Each student says their name the way they want it said. Everyone listens for pronunciation.

**2. Would you rather.** Would you rather have an extra hour of free time every day or an extra $20 every week? Choose one and give your reason.

- *Share:* Students move to one side of the room for each choice, then tell a neighbor on their side why.

**3. Three small things.** List three small things that make an ordinary day better for you, such as a food, a song, a place, or a routine.

- *Share:* Pair share. Partners look for one thing they have in common.

**4. Unofficial expert.** What is something you know a lot about or could teach someone else to do? It does not have to be a school subject.

- *Share:* Stand up, hand up, pair up. Afterward, ask a few students to report what their partner is an expert in.

**5. One-word check-in.** Write one word that describes your first week of high school. Then write one sentence explaining why you chose it.

- *Share:* Whip-around with the one word only. Collect the written explanations.

## Week 2: Finding Connections

The goal this week is for students to discover what they share with classmates they did not already know.

**6. Common ground.** With the person sitting next to you, find three things you have in common that you could not tell just by looking at each other. Write them down.

- *Share:* Volunteers share the most surprising thing they have in common.

**7. Best teacher move.** Think of a class where you learned a lot. What is one thing that teacher or coach did that helped you learn? Do not name the person. Describe the action.

- *Share:* Volunteers. List the actions on the board and tell students which ones you will try to do.

**8. Two roses and a bud.** Write two good things from the past week (roses) and one thing you are looking forward to (a bud).

- *Share:* Pair share. Each partner shares one rose or the bud.

**9. How I learn best.** Finish each sentence: *I learn best when... It is hard for me to learn when... One thing a teacher should know about me is...*

- *Share:* Card collect. Read every card. This is some of the most useful information you will get all year.

**10. Shout-out.** Write a thank-you to someone at this school who helped you in the past two weeks. It can be a student, a teacher, or a staff member. Say what they did and why it mattered.

- *Share:* Volunteers read theirs. Encourage students to deliver the thank-you in person today.

## Week 3: Building Our Class

The goal this week is to turn what students have shared into agreements about how the class will work.

**11. A class that works.** Think of a group you have been part of that worked well together, such as a team, a club, a class, or a group of friends. What made it work? List at least three things.

- *Share:* Whip-around with one thing each. Record repeated ideas on the board and save the list for prompt 14.

**12. Respect looks like.** Complete this chart with specific actions, not general words.

| | Looks like | Sounds like |
|---|---|---|
| Respect from classmates | | |
| Respect from a teacher | | |

- *Share:* Pair share, then volunteers. Push for specifics: *What exactly would you see or hear?*

**13. When I disagree.** Finish each sentence: *When someone disagrees with me, I usually... When I disagree with someone, a respectful way to say it is...*

- *Share:* Volunteers share the second sentence only. Post three or four of the best sentence starters for future class discussions.

**14. Our agreements.** Look at the list we made of what makes a group work. Write the two agreements you most want this class to live by all year, and explain why you chose each one.

- *Share:* Students put a tally mark on the board next to their top two. Announce the top four or five as the class agreements and post them.

**15. What I bring.** Every person adds something to a group. What is one strength you bring to this class? Examples: asking good questions, staying calm, making people laugh, noticing who is left out, staying organized, not giving up.

- *Share:* Stand up, hand up, pair up.

## Week 4: Looking Ahead

The goal this week is for students to set a direction for the year and know where to get support.

**16. Future self.** Imagine it is the last day of ninth grade. What do you want to be able to say you did, learned, or became this year? Write three sentences.

- *Share:* Card collect. Keep the cards and hand them back in the last week of school.

**17. One goal, one step.** Write one goal for this semester in any area of your life. Then write the very first small step you could take this week. A goal like *get better at math* needs a step like *ask one question in class on Tuesday*.

- *Share:* Pair share the step only. Partners check: is the step small and specific enough to do this week?

**18. When it gets hard.** Describe something difficult that you kept working at until you improved. What kept you going? What would you tell another ninth grader who feels like giving up on something?

- *Share:* Volunteers share their advice.

**19. My support team.** List two people at school and two people outside of school you could go to if you needed help with schoolwork, a problem, or a hard day. If you cannot think of two at school yet, write one place in the building where you could start.

- *Share:* Card collect, or no share. Afterward, remind the class how to reach the counselor, where to get tutoring, and when you are available.

**20. A month in.** Look back over your first month of high school. Finish each sentence: *Something I am proud of is... Something that surprised me is... Something I want to change or try next month is...*

- *Share:* Whip-around with one of the three sentences, chosen by the student.

## Adapting the Prompts

- **For students who need more support with writing:** accept lists, single words, or a quick sketch with labels. The goal is participation, not a polished paragraph.
- **For English learners:** allow students to write in their home language first, and provide the sentence frames from the prompt on the board.
- **For classes that are slow to warm up:** stay with pair share and card collect longer before moving to whip-arounds.
- **For block schedules:** combine a prompt with a second share format, such as pair share followed by volunteers.
- **If you miss a day:** skip ahead within the week, but do not skip prompts 11 and 14, which depend on each other.

## Keeping It Going After Week 4

Repeat students'' favorite formats once a week for the rest of the semester. *One-word check-in* (5), *Two roses and a bud* (8), and *Shout-out* (10) work well as Monday or Friday routines. Revisit the class agreements from prompt 14 at the start of each grading period and ask: *Which agreement are we keeping best? Which one needs work?*', 'published', 'seed', 0, '2026-10-29T07:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-ce34e82a2ec4dd6b', 'counting-beats-4-4-time-worksheet-grade-5', 'Counting Beats in 4/4 Time Worksheet', 'worksheet', '5', 'arts', 'A 12-item music worksheet on counting beats in 4/4 time with whole, half, quarter and eighth notes and their rests. Everything is written in words and numbers, so no music notation is needed, and an answer key with the working is included.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** In 4/4 time, every measure holds exactly 4 beats. Use the chart to answer each question. A rest is silence, and it lasts as long as the note with the same name.

| Note or rest | Beats in 4/4 time |
|---|---|
| whole note or whole rest | 4 |
| half note or half rest | 2 |
| quarter note or quarter rest | 1 |
| eighth note or eighth rest | 1/2 |

## Part 1: How Many Beats?

Write the number of beats.

1. whole note = ______ beats

2. whole rest = ______ beats

3. quarter rest = ______ beat

4. eighth note + eighth note = ______ beat

## Part 2: Add the Beats

Add the beats for all the notes and rests. Write the total.

5. half note + quarter note + quarter note = ______ beats

6. quarter note + eighth note + eighth note = ______ beats

7. half rest + quarter note + eighth note + eighth note = ______ beats

8. eighth rest + eighth note + quarter note + half note = ______ beats

9. quarter note + quarter rest + half note = ______ beats

## Part 3: Finish the Measure

Each measure needs exactly 4 beats. Write the name of ONE note that finishes the measure.

10. half note + ____________________ = 4 beats

11. quarter note + quarter note + eighth note + eighth note + ____________________ = 4 beats

## Part 4: Check a Measure

12. A student wrote this measure in 4/4 time: half note + quarter note + eighth note.

    a. How many beats did the student write? ______

    b. Is the measure full? Circle one: Yes or No

    c. What ONE note or rest would make the measure full?

______________________________________________________________

## Answer Key

**Part 1: How Many Beats?**

1. 4 beats
2. 4 beats
3. 1 beat
4. 1 beat (1/2 + 1/2 = 1)

**Part 2: Add the Beats**

5. 4 beats (2 + 1 + 1 = 4)
6. 2 beats (1 + 1/2 + 1/2 = 2)
7. 4 beats (2 + 1 + 1/2 + 1/2 = 4)
8. 4 beats (1/2 + 1/2 + 1 + 2 = 4)
9. 4 beats (1 + 1 + 2 = 4)

**Part 3: Finish the Measure**

10. half note. The measure has 2 beats and needs 2 more (2 + 2 = 4).
11. quarter note. The measure has 1 + 1 + 1/2 + 1/2 = 3 beats and needs 1 more (3 + 1 = 4).

**Part 4: Check a Measure**

12. a. 3 1/2 beats (2 + 1 + 1/2 = 3 1/2)

    b. No. A measure in 4/4 time needs 4 beats.

    c. An eighth note or an eighth rest. Either one adds the missing 1/2 beat (3 1/2 + 1/2 = 4).

**Teacher notes**

- These beat values are for 4/4 time, where the quarter note gets one beat.
- In Part 3, a rest of the same length also fills the measure (a half rest for item 10, a quarter rest for item 11). The directions ask for a note, so decide whether you will accept a rest and tell students before they begin.
- Follow-up: have students clap and count each measure from Part 2 aloud, saying "1 and 2 and 3 and 4 and" and staying silent on the rests.', 'published', 'seed', 0, '2026-10-29T00:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-6b297696e6a745d9', 'counting-comparing-numbers-to-10-worksheet-kindergarten', 'Counting and Comparing Numbers to 10 Worksheet', 'worksheet', 'K', 'math', 'A 15-item kindergarten worksheet where students count dots, write numerals, compare numbers and groups (bigger, smaller, more, the same), fill in missing numbers, and draw a set. Includes read-aloud directions and an answer key.', 'CCSS.MATH.CONTENT.K.CC.A.2, CCSS.MATH.CONTENT.K.CC.B.5, CCSS.MATH.CONTENT.K.CC.C.6, CCSS.MATH.CONTENT.K.CC.C.7', '**Name:** ______________________  **Date:** ____________

**Directions:** Listen as your teacher reads each part. Touch each dot as you count. Take your time!

## Part 1: Count and Write

Count the dots. Write the number on the line.

1. ● ● ●

   How many? ______

2. ● ● ● ● ● ●

   How many? ______

3. ● ● ● ● ●   ● ● ● ●

   How many? ______

4. ● ● ● ● ●   ● ● ● ● ●

   How many? ______

## Part 2: Which Number Is Bigger?

Look at the two numbers. Circle the number that is **bigger**.

5. 4 or 7

6. 9 or 6

7. 10 or 8

## Part 3: Which Number Is Smaller?

Look at the two numbers. Circle the number that is **smaller**.

8. 3 or 1

9. 8 or 6

## Part 4: Compare the Groups

Count the dots in each group. Write how many. Then answer the question.

10. Group A: ● ● ● ● ●   ______

    Group B: ● ● ●   ______

    Circle the group that has **more**: Group A or Group B

11. Group A: ● ● ● ●   ______

    Group B: ● ● ● ● ●   ● ●   ______

    Circle the group that has **more**: Group A or Group B

12. Group A: ● ● ● ● ● ●   ______

    Group B: ● ● ● ● ● ●   ______

    Do the groups have **the same** number? Circle one: Yes or No

## Part 5: What Number Is Missing?

Write the missing number on the line.

13. 1, 2, ______, 4, 5

14. 6, 7, 8, ______, 10

## Part 6: Draw It

15. Draw **8** circles in the space below.

## Answer Key

**Part 1: Count and Write**

1. 3
2. 6
3. 9
4. 10

**Part 2: Which Number Is Bigger?**

5. 7
6. 9
7. 10

**Part 3: Which Number Is Smaller?**

8. 1
9. 6

**Part 4: Compare the Groups**

10. Group A has 5. Group B has 3. Group A has more.
11. Group A has 4. Group B has 7. Group B has more.
12. Group A has 6. Group B has 6. Yes, the groups have the same number.

**Part 5: What Number Is Missing?**

13. 3
14. 9

**Part 6: Draw It**

15. The student draws exactly 8 circles. Size and arrangement do not matter. Ask the student to count the circles aloud to check.

**Teacher notes**

- Read every direction aloud, one part at a time. Model the first item of each part on the board with different numbers.
- Watch for students who skip or double-count dots. Have them touch or cross out each dot as they say its number.
- Reversed numerals (for example, a backward 3 or 9) are common in kindergarten. Count the answer as correct if the quantity is right, and practice formation separately.
- Extension: ask early finishers to turn the page over and draw a group that has one more than 8, then write the number (9).', 'published', 'seed', 0, '2026-10-28T17:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-34734eccf20e3a68', 'daily-life-in-ancient-egypt-reading-passage-grade-6', 'Life Along the Nile: Daily Life in Ancient Egypt', 'reading-passage', '6', 'social-studies', 'An original 400-word informational passage about how ordinary ancient Egyptians farmed, ate, dressed, learned, and played, followed by 7 text-dependent questions (main idea, vocabulary, details, and a short written response) with an answer key.', 'CCSS.ELA-LITERACY.RH.6-8.1, CCSS.ELA-LITERACY.RH.6-8.2, CCSS.ELA-LITERACY.RH.6-8.4', '**Name:** ______________________  **Date:** ____________

**Directions:** Read the passage carefully. Then answer the questions. Go back to the passage to find evidence for your answers.

## Life Along the Nile

More than 4,000 years ago, most people in ancient Egypt were not pharaohs or priests. They were farmers, and their lives followed the rhythm of the Nile River.

Every summer, the Nile flooded its banks. When the water drained away a few months later, it left behind a layer of dark, rich mud called silt. Egyptians called this fertile strip of farmland the Black Land, and they called the dry desert beyond it the Red Land. As soon as the flood ended, farmers planted wheat, barley, and flax in the fresh soil. They dug canals to carry river water to their fields and harvested their crops in spring, before the next flood arrived. During the flood season, when the fields were underwater, many farmers worked on building projects for the king, such as temples and tombs.

Most families lived in small houses made of mud bricks that had been dried in the sun. Thick walls and small, high windows kept the rooms cool. Roofs were flat, so families often cooked, worked, and even slept on them during hot nights.

Bread was part of nearly every meal, along with a thick drink brewed from barley. People also ate onions, garlic, lentils, figs, dates, and fish from the river. Meat was expensive, so ordinary families ate it mostly at festivals. Instead of using coins, workers were usually paid in goods such as grain.

Clothing was simple and light. Egyptians wove flax into a cloth called linen. Men wore wrapped skirts called kilts, and women wore long, straight dresses. Both men and women lined their eyes with dark makeup called kohl.

Most children did not go to school. Instead, they learned their parents'' work: farming, baking, weaving, or a craft such as pottery. A small number of boys, usually from wealthier families, trained as scribes. They spent years learning hundreds of picture symbols called hieroglyphs. Because few Egyptians could read or write, scribes were respected and held good jobs. Children had time for fun, too. They played with balls, dolls, and carved wooden animals, and people of all ages enjoyed a board game called senet.

Egyptian women had more rights than women in many other ancient societies. They could own property, run businesses, and speak for themselves in court.

Life along the Nile was full of hard work, but the river''s yearly gift of water and soil allowed Egyptian civilization to last for about 3,000 years.

## Questions

1. Which sentence best states the main idea of the passage?

   - A. Pharaohs and priests were the most powerful people in ancient Egypt.
   - B. Most ancient Egyptians were ordinary people whose daily lives depended on the Nile River.
   - C. Ancient Egyptian children spent most of their time playing games.
   - D. Scribes had the most difficult job in ancient Egypt.

2. What is silt, and why was it important to Egyptian farmers?

______________________________________________

______________________________________________

3. Read this sentence from the passage: Egyptians called this **fertile** strip of farmland the Black Land. What does the word fertile mean in this sentence?

   - A. dry and sandy
   - B. flooded with water
   - C. able to grow many crops
   - D. far away from the river

4. What work did many farmers do during the flood season? Why were they able to do this work at that time of year?

______________________________________________

______________________________________________

5. Give TWO details from the passage that show how Egyptian houses were built for a hot climate.

______________________________________________

______________________________________________

6. According to the passage, why were scribes respected in ancient Egypt?

______________________________________________

______________________________________________

7. The last paragraph calls the flood the river''s yearly gift. In a short paragraph (3 to 5 sentences), explain how the Nile River shaped daily life in ancient Egypt. Use at least TWO details from the passage.

______________________________________________

______________________________________________

______________________________________________

______________________________________________

______________________________________________

## Answer Key

1. **B.** Most of the passage describes how ordinary Egyptians farmed, lived, ate, and worked, and it opens and closes with the importance of the Nile. Choices A, C, and D are either not supported or are only small details.

2. Silt is the dark, rich mud that the Nile left behind after each flood. It was important because it made the soil good for growing crops such as wheat, barley, and flax. (Full credit requires both what silt is and why it mattered.)

3. **C.** Able to grow many crops. Context clues: dark, rich mud; farmland; farmers planted crops in the fresh soil.

4. Many farmers worked on building projects for the king, such as temples and tombs. They could do this because their fields were underwater during the flood season, so they could not farm.

5. Any two of the following: thick walls kept rooms cool; small, high windows kept rooms cool; flat roofs let families cook, work, and sleep outside on hot nights. (Do not accept mud bricks alone unless the student connects it to the thick walls or to the hot, sunny climate that dried the bricks.)

6. Scribes were respected because few Egyptians could read or write. Scribes had a rare skill that took years of training, including learning hundreds of hieroglyphs.

7. Answers will vary. A strong response states that the Nile made life in Egypt possible or controlled the pattern of daily life, and supports this with at least two details from the passage. Possible details: the yearly flood left silt that made the soil fertile; farmers planted after the flood and harvested before the next one, so the river set the farming calendar; canals carried river water to the fields; people ate fish from the river; farmers did building work during the flood season; the crops grown in Nile soil supplied bread (wheat and barley) and linen clothing (flax); the river allowed Egyptian civilization to last about 3,000 years.

   Suggested scoring (4 points): 1 point for a clear main statement, 1 point for each of two accurate details from the passage, 1 point for complete sentences that explain how the details connect to daily life.', 'published', 'seed', 0, '2026-10-28T10:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-640ed85d03e83e4e', 'density-column-liquid-layers-lab-grade-7', 'Density Column Lab: Layering Household Liquids', 'lab-activity', '7', 'science', 'Students measure the mass and volume of six household liquids, calculate each density, predict the stacking order, and then build a layered density column to test their prediction. Includes materials, safety notes, step-by-step procedure, data table, analysis questions, and an answer key with sample data.', '', '**Name:** ______________________  **Date:** ____________  **Lab partners:** ______________________

## Overview

**Question:** Why do some liquids float on top of other liquids?

**Time:** One 45 to 50 minute class period (add 10 minutes if students will do the extension).

**Group size:** 3 or 4 students.

**Background:** Density is the amount of mass packed into a certain volume. You can calculate it with this formula:

**density = mass / volume**

For liquids, density is usually measured in grams per milliliter (g/mL). Water has a density of 1.00 g/mL. A liquid that is less dense than the liquid below it will float on top. A liquid that is denser will sink underneath.

## Materials (per group)

- 1 tall, narrow, clear container (a 250 mL graduated cylinder, a tall clear plastic cup, or a clean clear jar)
- 1 graduated cylinder, 25 mL or 50 mL
- Balance or digital scale that reads to 0.1 g
- 6 small cups, labeled with the names of the liquids
- About 25 mL of each liquid: honey, light corn syrup, liquid dish soap, water, vegetable oil, rubbing alcohol (isopropyl alcohol, 70% or 91%)
- Food coloring, 2 different colors (1 or 2 drops for the water, 1 or 2 drops of a different color for the rubbing alcohol)
- Spoon or plastic pipette for slow pouring
- Paper towels, plus warm water for rinsing
- Calculator
- Safety goggles for each student

**Teacher prep:** Pour the liquids into labeled supply containers before class. Color the water and the rubbing alcohol ahead of time so the two clear liquids are easy to tell apart. Keep the rubbing alcohol capped until it is needed.

## Safety

- Wear safety goggles for the whole lab.
- Rubbing alcohol is flammable. No open flames, hot plates, or other heat sources in the room. Keep the container capped when not in use and keep the room ventilated.
- Do not taste or drink anything, even the liquids that are foods. Lab materials are never for eating.
- Do not sniff the rubbing alcohol on purpose. Tell your teacher if it splashes on your skin or in your eyes, and rinse with water right away.
- Wipe up spills immediately. Oil, soap, and syrup make floors very slippery.
- Wash your hands with soap and water when you finish.
- Cleanup: do NOT pour the finished column down the sink. Follow your teacher''s directions (usually: pour it into the lined waste container, wipe the container with paper towels, then wash it with warm, soapy water).

## Procedure

### Part A: Measure the density of each liquid

Measure the thin liquids first so the cylinder is easier to clean: rubbing alcohol, water, vegetable oil, dish soap, corn syrup, honey.

1. Place the clean, dry graduated cylinder on the balance. Record its mass in the data table under Mass of empty cylinder.
2. Slowly pour the first liquid into the cylinder until it reaches exactly 20 mL. Read the volume at eye level, at the bottom of the curved surface (the meniscus).
3. Place the cylinder with the liquid on the balance. Record the mass under Mass of cylinder + liquid.
4. Subtract to find the mass of the liquid alone. Record it.
5. Calculate the density: divide the mass of the liquid by its volume (20 mL). Round to the nearest hundredth. Record it.
6. Pour the liquid into its labeled cup. Let thick liquids drain for a few extra seconds.
7. Rinse the cylinder with warm water and dry it completely with a paper towel. Find the mass of the empty cylinder again, because a little water or liquid left inside will change it.
8. Repeat steps 1 to 7 for each of the other five liquids.

### Part B: Predict

9. Use your calculated densities to predict the order of the layers from bottom to top. Write your prediction in the Prediction section BEFORE you build the column.

### Part C: Build the column

Add the liquids in order from MOST dense to LEAST dense. Pour slowly. Do not shake or stir.

10. Pour the densest liquid straight into the center of the tall container. Try not to let it touch the sides.
11. Pour the second densest liquid slowly into the center, on top of the first.
12. Add the third liquid the same way.
13. For the last three liquids (the thin ones), tilt the container slightly and let the liquid run slowly down the inside wall, or pour it gently over the back of a spoon held just above the surface. This keeps the layers from mixing.
14. Set the container on the table and wait 2 minutes for the layers to settle.
15. Draw and label your column in the Observations section. Record the order of the layers from bottom to top.

### Part D: Extension (optional)

16. Gently drop in three small objects, one at a time (for example: a metal paper clip or small bolt, a grape or raisin, and a small plastic bead or piece of crayon). Record the layer where each object stops.

## Data Table

| Liquid | Mass of empty cylinder (g) | Mass of cylinder + liquid (g) | Mass of liquid (g) | Volume (mL) | Density (g/mL) |
|---|---|---|---|---|---|
| Rubbing alcohol | | | | 20 | |
| Water | | | | 20 | |
| Vegetable oil | | | | 20 | |
| Dish soap | | | | 20 | |
| Corn syrup | | | | 20 | |
| Honey | | | | 20 | |

## Prediction

Based on my densities, the layers from BOTTOM to TOP will be:

1 (bottom). ______________  2. ______________  3. ______________  4. ______________  5. ______________  6 (top). ______________

## Observations

Actual order of layers from BOTTOM to TOP:

1 (bottom). ______________  2. ______________  3. ______________  4. ______________  5. ______________  6 (top). ______________

Sketch your column on the back of this page. Label each layer with the name of the liquid and its density.

Extension objects (optional):

| Object | Layer where it stopped | What this tells you about the object''s density |
|---|---|---|
| | | |
| | | |
| | | |

## Analysis Questions

1. List the six liquids in order from most dense to least dense, with the density you calculated for each.

______________________________________________

______________________________________________

2. Did your column match your prediction? Describe the relationship between a liquid''s density and its position in the column.

______________________________________________

______________________________________________

3. Suppose you had measured 40 mL of honey instead of 20 mL. Would the mass change? Would the density change? Explain.

______________________________________________

______________________________________________

4. A mystery liquid has a mass of 47.5 g and a volume of 50 mL. Calculate its density. Between which two layers of your column would it settle? (Assume it does not mix with them.)

______________________________________________

______________________________________________

5. A rubber stopper has a density of 1.20 g/cm^3. (1 cm^3 is the same volume as 1 mL.) Where in the column would the stopper come to rest? Explain how you know.

______________________________________________

______________________________________________

6. A student says, Oil floats on water because there is less oil than water in the cup. Is the student correct? Use the word density in your answer.

______________________________________________

______________________________________________

7. Why was it important to add the liquids slowly and to keep the vegetable oil between the water and the rubbing alcohol?

______________________________________________

______________________________________________

8. Name two possible sources of error in this lab and explain how each one could change your results.

______________________________________________

______________________________________________

9. When an oil tanker leaks, the oil spreads out across the surface of the ocean instead of sinking. Use what you learned to explain why.

______________________________________________

______________________________________________

## Answer Key

**Sample data.** Student values will vary with the brand of each product and with measuring accuracy. Typical results for 20 mL samples:

| Liquid | Mass of liquid (g) | Volume (mL) | Density (g/mL) |
|---|---|---|---|
| Rubbing alcohol (70%) | 17.4 | 20 | 0.87 |
| Water | 20.0 | 20 | 1.00 |
| Vegetable oil | 18.4 | 20 | 0.92 |
| Dish soap | 20.6 | 20 | 1.03 |
| Corn syrup | 27.4 | 20 | 1.37 |
| Honey | 28.4 | 20 | 1.42 |

Notes for the teacher: 91% rubbing alcohol is less dense (about 0.82 g/mL) and gives the same order. Dish soap brands range from about 1.02 to 1.06 g/mL. Honey and corn syrup are close in density (roughly 1.36 to 1.45 g/mL), so some groups may calculate corn syrup as slightly denser than honey; either order for those two can be accepted if it matches the group''s own data. Thick liquids are the hardest to measure accurately because they cling to the cylinder.

**Expected order, bottom to top:** honey, corn syrup, dish soap, water, vegetable oil, rubbing alcohol.

1. Honey (about 1.42 g/mL), corn syrup (about 1.37), dish soap (about 1.03), water (1.00), vegetable oil (about 0.92), rubbing alcohol (about 0.87 for 70%). Accept the student''s own calculated values if the work is correct.

2. Answers about the prediction will vary. The relationship: the denser the liquid, the lower it sits in the column. The most dense liquid is on the bottom and the least dense is on top.

3. The mass would change: it would double, because there is twice as much honey. The density would NOT change, because both the mass and the volume double, so mass divided by volume stays the same (for example, 56.8 g / 40 mL = 1.42 g/mL, the same as 28.4 g / 20 mL). Density is a property of the substance, not of the amount.

4. Density = 47.5 g / 50 mL = 0.95 g/mL. It is less dense than water (1.00) and denser than vegetable oil (0.92), so it would settle between the water and the vegetable oil.

5. The stopper would sink through the rubbing alcohol, vegetable oil, water, and dish soap, because it is denser than all of them. It would stop on top of the corn syrup, floating at the boundary between the dish soap and the corn syrup, because corn syrup (about 1.37 g/mL) is denser than the stopper (1.20 g/cm^3).

6. The student is not correct. Oil floats on water because oil is less dense than water (about 0.92 g/mL compared with 1.00 g/mL), not because of the amount. A large amount of oil will still float on a small amount of water.

7. Pouring quickly stirs the liquids together, so the layers blur or mix. The order matters too: water and rubbing alcohol dissolve in each other, so if they touch they mix into one layer. Vegetable oil does not mix with either one, so it acts as a barrier that keeps them separate. (Dish soap and water will also mix if poured roughly.)

8. Any two reasonable sources, each with an effect. Examples: some thick liquid (honey, corn syrup) stayed stuck in the cylinder or air bubbles were trapped, so the volume reading was off; the cylinder was not fully dry or clean, so the mass of the empty cylinder was wrong and the liquid mass was too high or too low; the volume was not read at eye level at the bottom of the meniscus, so the volume was not exactly 20 mL; the balance was not zeroed; liquids were poured too fast and mixed, so the layers were hard to identify.

9. Oil is less dense than ocean water, so it floats on top, just like the vegetable oil floated on the water in the column. Because it does not mix with water, it spreads out across the surface. (Salt water is even denser than fresh water, about 1.03 g/mL.)

**Extension:** Results vary with the objects used. Each object sinks until it reaches a liquid that is denser than the object, and rests on top of that layer. A metal paper clip or bolt is denser than every liquid and sinks to the bottom. A grape or raisin usually sinks through the water and rests in or below the dish soap layer, on the corn syrup. Many plastic beads rest near the water or oil layers, depending on the type of plastic.', 'published', 'seed', 0, '2026-10-28T03:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-f3937ac34af44a67', 'derivatives-power-rule-chain-rule-worksheet-grade-12', 'Derivatives Worksheet: The Power Rule and the Chain Rule', 'worksheet', '12', 'math', 'Twelve calculus problems that build from the power rule to the chain rule and finish with a nested chain rule and a tangent line. Includes a short review with worked examples and a fully worked answer key.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** Find the derivative of each function. Show your work on a separate sheet of paper and write your final answer on the blank. Simplify your answers and write them without negative exponents.

## Quick Review

### The power rule

If f(x) = x^n, then f''(x) = n x^(n - 1). Multiply by the exponent, then lower the exponent by 1.

- A constant multiple stays in front: the derivative of 3x^4 is 12x^3.
- The derivative of a constant is 0.
- Take the derivative of a sum or difference one term at a time.

**Rewrite roots and fractions as powers first.**

| Written as | Rewrite as |
|---|---|
| sqrt(x) | x^(1/2) |
| 1/x | x^(-1) |
| 1/x^n | x^(-n) |

**Example:** f(x) = 2/x^2

- Rewrite: f(x) = 2x^(-2)
- Power rule: f''(x) = -4x^(-3)
- Answer: f''(x) = -4/x^3

### The chain rule

Use the chain rule when one function is inside another. If f(x) = (inside)^n, then f''(x) = n (inside)^(n - 1) times the derivative of the inside.

**Example:** f(x) = (2x - 5)^4

- The inside is 2x - 5, and its derivative is 2.
- f''(x) = 4(2x - 5)^3 times 2
- Answer: f''(x) = 8(2x - 5)^3

## Part A: The Power Rule

1. f(x) = x^7

   f''(x) = ______________________

2. f(x) = 4x^5 - 3x^2 + 9

   f''(x) = ______________________

3. f(x) = 6 sqrt(x)

   f''(x) = ______________________

4. f(x) = 5/x^3

   f''(x) = ______________________

5. f(x) = x^3/3 - 2x + 1/x

   f''(x) = ______________________

## Part B: The Chain Rule

6. f(x) = (3x + 1)^5

   f''(x) = ______________________

7. f(x) = (x^2 - 4)^3

   f''(x) = ______________________

8. f(x) = sqrt(5x + 2)

   f''(x) = ______________________

9. f(x) = 1/(2x - 7)^4

   f''(x) = ______________________

10. f(x) = (x^3 + 2x)^6

    f''(x) = ______________________

## Part C: Challenge

11. f(x) = ((2x + 1)^3 + 1)^2

    f''(x) = ______________________

12. Find the equation of the line tangent to the curve y = sqrt(x^2 + 9) at the point where x = 4. Write your answer in the form y = mx + b.

    ______________________

## Answer Key

Equivalent forms are correct. For example, 3/sqrt(x) may also be written 3x^(-1/2) if negative exponents are allowed in your class.

### Part A

1. **f''(x) = 7x^6.** Multiply by the exponent 7 and lower the exponent to 6.

2. **f''(x) = 20x^4 - 6x.** Term by term: the derivative of 4x^5 is 20x^4, the derivative of -3x^2 is -6x, and the derivative of the constant 9 is 0.

3. **f''(x) = 3/sqrt(x).** Rewrite as f(x) = 6x^(1/2). Then f''(x) = 6 times (1/2) x^(-1/2) = 3x^(-1/2) = 3/sqrt(x).

4. **f''(x) = -15/x^4.** Rewrite as f(x) = 5x^(-3). Then f''(x) = 5 times (-3) x^(-4) = -15x^(-4) = -15/x^4.

5. **f''(x) = x^2 - 2 - 1/x^2.** Rewrite as f(x) = (1/3)x^3 - 2x + x^(-1). The derivative of (1/3)x^3 is x^2, the derivative of -2x is -2, and the derivative of x^(-1) is -x^(-2) = -1/x^2.

### Part B

6. **f''(x) = 15(3x + 1)^4.** The inside is 3x + 1, with derivative 3. f''(x) = 5(3x + 1)^4 times 3 = 15(3x + 1)^4.

7. **f''(x) = 6x(x^2 - 4)^2.** The inside is x^2 - 4, with derivative 2x. f''(x) = 3(x^2 - 4)^2 times 2x = 6x(x^2 - 4)^2.

8. **f''(x) = 5/(2 sqrt(5x + 2)).** Rewrite as f(x) = (5x + 2)^(1/2). The inside is 5x + 2, with derivative 5. f''(x) = (1/2)(5x + 2)^(-1/2) times 5 = 5/(2 sqrt(5x + 2)).

9. **f''(x) = -8/(2x - 7)^5.** Rewrite as f(x) = (2x - 7)^(-4). The inside is 2x - 7, with derivative 2. f''(x) = -4(2x - 7)^(-5) times 2 = -8(2x - 7)^(-5) = -8/(2x - 7)^5.

10. **f''(x) = 6(x^3 + 2x)^5 (3x^2 + 2).** The inside is x^3 + 2x, with derivative 3x^2 + 2. f''(x) = 6(x^3 + 2x)^5 times (3x^2 + 2). Also correct: (18x^2 + 12)(x^3 + 2x)^5.

### Part C

11. **f''(x) = 12(2x + 1)^2 ((2x + 1)^3 + 1).** The chain rule is used twice.
    - Outside: the square. Its derivative is 2((2x + 1)^3 + 1) times the derivative of the inside.
    - Inside: (2x + 1)^3 + 1. Its derivative is 3(2x + 1)^2 times 2 = 6(2x + 1)^2.
    - Multiply: 2((2x + 1)^3 + 1) times 6(2x + 1)^2 = 12(2x + 1)^2 ((2x + 1)^3 + 1).

12. **y = (4/5)x + 9/5**
    - Point: when x = 4, y = sqrt(16 + 9) = sqrt(25) = 5. The point is (4, 5).
    - Derivative: y = (x^2 + 9)^(1/2), so y'' = (1/2)(x^2 + 9)^(-1/2) times 2x = x/sqrt(x^2 + 9).
    - Slope: when x = 4, y'' = 4/sqrt(25) = 4/5.
    - Line: y - 5 = (4/5)(x - 4), so y = (4/5)x - 16/5 + 25/5 = (4/5)x + 9/5.

### Common mistakes to look for

- Forgetting to multiply by the derivative of the inside (for example, answering 5(3x + 1)^4 for problem 6).
- Raising the exponent instead of lowering it when the exponent is negative. In problem 4, the exponent -3 becomes -4, not -2.
- In problem 12, giving only the slope 4/5 and not the equation of the line.', 'published', 'seed', 0, '2026-10-27T20:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-b6d2cd3fd9cefde7', 'equivalent-fractions-worksheet-grade-4', 'Equivalent Fractions Worksheet', 'worksheet', '4', 'math', 'Fifteen problems on recognizing and generating equivalent fractions: missing numerators and denominators, writing equivalent fractions, deciding whether two fractions are equivalent, a fraction model, and a word problem. Includes a worked example and a full answer key with explanations.', 'CCSS.MATH.CONTENT.4.NF.A.1', '**Name:** ______________________  **Date:** ____________

**Directions:** Equivalent fractions name the same amount, even though the numbers are different. To make an equivalent fraction, multiply (or divide) the numerator and the denominator by the **same** number.

**Example:** 1/2 = 3/6, because 1 x 3 = 3 and 2 x 3 = 6. The whole is cut into 3 times as many pieces, so you need 3 times as many pieces to cover the same amount.

## Part A: Find the Missing Number

Write the number that makes the fractions equivalent.

1. 1/2 = ____/8
2. 2/3 = ____/12
3. 3/4 = 9/____
4. 2/5 = ____/10
5. 5/6 = 10/____
6. 6/8 = ____/4
7. 1/4 = ____/100

## Part B: Write Equivalent Fractions

Write **two** fractions that are equivalent to each fraction.

8. 1/3 = ________ = ________
9. 3/5 = ________ = ________
10. 4/6 = ________ = ________

## Part C: Equivalent or Not?

Circle **Yes** or **No**. Then explain how you know.

11. Are 2/4 and 4/8 equivalent? Yes or No

________________________________________________________________

12. Are 3/5 and 6/8 equivalent? Yes or No

________________________________________________________________

13. Are 6/9 and 2/3 equivalent? Yes or No

________________________________________________________________

## Part D: Models and Problem Solving

14. Draw a rectangle. Split it into 4 equal parts and shade 3 of them. Now draw a line that cuts every part into 2 equal pieces.

    a. How many equal pieces are in the whole rectangle now? ________

    b. How many of those pieces are shaded? ________

    c. Complete the equation: 3/4 = ____/____

    d. Did the shaded amount change when you drew the new line? Explain.

________________________________________________________________

15. Rosa and Dan each have a granola bar of the same size. Rosa eats 2/6 of her bar. Dan eats 1/3 of his bar. Dan says they ate the same amount. Is Dan correct? Explain with numbers, words, or a drawing.

________________________________________________________________

________________________________________________________________

## Answer Key

**Part A: Find the Missing Number**

1. 4 (1/2 = 4/8; multiply the numerator and denominator by 4)
2. 8 (2/3 = 8/12; multiply by 4)
3. 12 (3/4 = 9/12; multiply by 3)
4. 4 (2/5 = 4/10; multiply by 2)
5. 12 (5/6 = 10/12; multiply by 2)
6. 3 (6/8 = 3/4; divide the numerator and denominator by 2)
7. 25 (1/4 = 25/100; multiply by 25)

**Part B: Write Equivalent Fractions**

Answers will vary. Check that the numerator and denominator were multiplied or divided by the same number.

8. Sample answers: 2/6, 3/9, 4/12, 5/15, 10/30
9. Sample answers: 6/10, 9/15, 12/20, 60/100
10. Sample answers: 2/3, 8/12, 12/18, 20/30

**Part C: Equivalent or Not?**

11. **Yes.** 2/4 = 4/8 because 2 x 2 = 4 and 4 x 2 = 8. (Both also equal 1/2.)
12. **No.** 3/5 = 6/10, not 6/8. To get from 3 to 6 you multiply by 2, but 5 x 2 = 10, not 8. The numerator and denominator were not multiplied by the same number. (Also, 6/8 = 3/4, which is greater than 3/5.)
13. **Yes.** 6/9 = 2/3 because 6 ÷ 3 = 2 and 9 ÷ 3 = 3. (Or 2 x 3 = 6 and 3 x 3 = 9.)

**Part D: Models and Problem Solving**

14. a. 8 pieces

    b. 6 pieces

    c. 3/4 = 6/8

    d. No. The shaded amount stayed the same. The pieces got smaller, so there are more of them, but they cover the same part of the rectangle.

15. **Yes, Dan is correct.** 1/3 = 2/6 because 1 x 2 = 2 and 3 x 2 = 6. The bars are the same size, so 2/6 and 1/3 are the same amount. A correct drawing shows two same-size bars, one cut into 6 parts with 2 shaded and one cut into 3 parts with 1 shaded, with equal shaded amounts.

**Teacher notes**

- The most common error is adding the same number to the top and bottom instead of multiplying (for example, saying 3/5 = 6/8 because 3 + 3 = 6 and 5 + 3 = 8). Problem 12 is built to bring out this mistake.
- Problem 14 connects to the reasoning in the standard: when each part is cut into smaller equal pieces, the number of pieces and the number of shaded pieces both get multiplied by the same number, but the size of the shaded region does not change.
- Fraction strips or folded paper help students who need a concrete model for Parts A and C.', 'published', 'seed', 0, '2026-10-27T13:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-94f56b55eb3daac0', 'factoring-quadratic-trinomials-worksheet-grade-9', 'Factoring Quadratic Trinomials Worksheet (a = 1 and a > 1)', 'worksheet', '9', 'math', 'Eighteen factoring problems that move from x^2 + bx + c to ax^2 + bx + c and finish with GCF-first challenges. Includes a one-page review with worked examples and a full answer key with checks.', 'CCSS.MATH.CONTENT.HSA.SSE.A.2, CCSS.MATH.CONTENT.HSA.SSE.B.3.A', '**Name:** ______________________  **Date:** ____________

**Directions:** Factor each trinomial completely. Show your work on a separate sheet of paper and write your final answer on the blank. Check every answer by multiplying your factors back together.

## Quick Review

### When a = 1: x^2 + bx + c

Find two numbers that **multiply to c** and **add to b**. Those two numbers go in the binomials.

**Example:** x^2 + 5x + 6

- Multiply to 6 and add to 5: the numbers are 2 and 3.
- Answer: (x + 2)(x + 3)
- Check: x^2 + 3x + 2x + 6 = x^2 + 5x + 6

**Sign clues**

| If c is... | and b is... | then the two numbers are... |
|---|---|---|
| positive | positive | both positive |
| positive | negative | both negative |
| negative | positive or negative | one positive and one negative (the larger one has the same sign as b) |

### When a > 1: ax^2 + bx + c (the ac method)

1. Multiply a times c.
2. Find two numbers that multiply to ac and add to b.
3. Rewrite the middle term using those two numbers.
4. Factor by grouping.

**Example:** 2x^2 + 11x + 12

- a times c = 2 x 12 = 24
- Multiply to 24 and add to 11: the numbers are 8 and 3.
- Rewrite: 2x^2 + 8x + 3x + 12
- Group: 2x(x + 4) + 3(x + 4)
- Answer: (2x + 3)(x + 4)
- Check: 2x^2 + 8x + 3x + 12 = 2x^2 + 11x + 12

**Always look for a greatest common factor (GCF) first.** If every term shares a factor, pull it out before you do anything else.

## Part A: Leading Coefficient of 1

1. x^2 + 7x + 12 = ______________________

2. x^2 + 9x + 20 = ______________________

3. x^2 - 8x + 15 = ______________________

4. x^2 - 11x + 28 = ______________________

5. x^2 + 2x - 24 = ______________________

6. x^2 - 3x - 40 = ______________________

7. x^2 + x - 42 = ______________________

8. x^2 - 14x + 49 = ______________________

## Part B: Leading Coefficient Greater Than 1

9. 2x^2 + 7x + 3 = ______________________

10. 3x^2 + 10x + 8 = ______________________

11. 2x^2 - 9x + 10 = ______________________

12. 5x^2 + 13x - 6 = ______________________

13. 6x^2 - x - 12 = ______________________

14. 4x^2 - 20x + 25 = ______________________

15. 6x^2 + 11x - 10 = ______________________

## Part C: Challenge (Factor Out the GCF First)

16. 3x^2 + 15x + 18 = ______________________

17. 4x^2 - 4x - 48 = ______________________

18. 12x^2 + 10x - 8 = ______________________

## Think About It

19. A classmate factored x^2 - 5x - 14 as (x - 7)(x - 2). Multiply the factors to show that the answer is wrong, explain the mistake, and give the correct factorization.

______________________________________________________________

______________________________________________________________

______________________________________________________________

## Answer Key

The order of the two binomials does not matter: (x + 3)(x + 4) and (x + 4)(x + 3) are both correct.

### Part A

| # | Trinomial | Number pair (multiply to c, add to b) | Factored form |
|---|---|---|---|
| 1 | x^2 + 7x + 12 | 3 and 4 | (x + 3)(x + 4) |
| 2 | x^2 + 9x + 20 | 4 and 5 | (x + 4)(x + 5) |
| 3 | x^2 - 8x + 15 | -3 and -5 | (x - 3)(x - 5) |
| 4 | x^2 - 11x + 28 | -4 and -7 | (x - 4)(x - 7) |
| 5 | x^2 + 2x - 24 | 6 and -4 | (x + 6)(x - 4) |
| 6 | x^2 - 3x - 40 | -8 and 5 | (x - 8)(x + 5) |
| 7 | x^2 + x - 42 | 7 and -6 | (x + 7)(x - 6) |
| 8 | x^2 - 14x + 49 | -7 and -7 | (x - 7)(x - 7), also written (x - 7)^2 |

### Part B

| # | Trinomial | a times c | Number pair (multiply to ac, add to b) | Factored form |
|---|---|---|---|---|
| 9 | 2x^2 + 7x + 3 | 6 | 6 and 1 | (2x + 1)(x + 3) |
| 10 | 3x^2 + 10x + 8 | 24 | 6 and 4 | (3x + 4)(x + 2) |
| 11 | 2x^2 - 9x + 10 | 20 | -4 and -5 | (2x - 5)(x - 2) |
| 12 | 5x^2 + 13x - 6 | -30 | 15 and -2 | (5x - 2)(x + 3) |
| 13 | 6x^2 - x - 12 | -72 | -9 and 8 | (3x + 4)(2x - 3) |
| 14 | 4x^2 - 20x + 25 | 100 | -10 and -10 | (2x - 5)(2x - 5), also written (2x - 5)^2 |
| 15 | 6x^2 + 11x - 10 | -60 | 15 and -4 | (3x - 2)(2x + 5) |

**Sample worked solution for #13:** 6x^2 - x - 12 = 6x^2 - 9x + 8x - 12 = 3x(2x - 3) + 4(2x - 3) = (3x + 4)(2x - 3)

### Part C

16. 3x^2 + 15x + 18 = 3(x^2 + 5x + 6) = **3(x + 2)(x + 3)**

17. 4x^2 - 4x - 48 = 4(x^2 - x - 12) = **4(x - 4)(x + 3)**

18. 12x^2 + 10x - 8 = 2(6x^2 + 5x - 4) = **2(3x + 4)(2x - 1)**. For the trinomial inside, ac = -24 and the number pair is 8 and -3.

Answers that are factored but still contain a common factor, such as (3x + 6)(x + 3) for #16, are not factored completely. Award partial credit.

### Think About It

19. (x - 7)(x - 2) = x^2 - 2x - 7x + 14 = x^2 - 9x + 14, which does not match x^2 - 5x - 14. The classmate used two negative numbers, but two negatives multiply to a positive 14. Because c is negative (-14), the numbers must have opposite signs: -7 and 2 multiply to -14 and add to -5. Correct answer: **(x - 7)(x + 2)**.', 'published', 'seed', 0, '2026-10-27T06:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-43b616073655f0f0', 'finding-slope-exit-ticket-grade-8', 'Finding Slope Exit Ticket', 'exit-ticket', '8', 'math', 'A 5-item exit ticket on finding slope from two points and from a description of a graph, covering positive, negative, zero, and fractional slopes. Includes a worked answer key and a quick guide to common errors.', 'CCSS.MATH.CONTENT.8.F.B.4, CCSS.MATH.CONTENT.8.EE.B.6', '**Name:** ______________________  **Date:** ____________

**Directions:** Find the slope of each line. Show your work. Write each slope as an integer or as a fraction in simplest form.

## Slope from Two Points

1. The line passes through (2, 3) and (6, 11).

   Slope = ______________

2. The line passes through (-1, 4) and (3, -4).

   Slope = ______________

3. The line passes through (-2, 5) and (4, 5).

   Slope = ______________

## Slope from a Graph Description

4. A line on a coordinate grid passes through the point (0, 1). From that point, you count UP 3 units and RIGHT 4 units to reach the next grid point on the line, (4, 4).

   Slope = ______________

5. A line crosses the y-axis at (0, 6) and crosses the x-axis at (4, 0).

   a. Does the line rise or fall as you move from left to right? ______________

   b. Slope = ______________

**How do you feel about finding slope? Circle one:**  I''ve got it  /  I''m getting there  /  I need more help

## Answer Key

Slope = change in y / change in x = (y2 - y1) / (x2 - x1), or rise / run.

1. **2.** (11 - 3) / (6 - 2) = 8 / 4 = 2.
2. **-2.** (-4 - 4) / (3 - (-1)) = -8 / 4 = -2.
3. **0.** (5 - 5) / (4 - (-2)) = 0 / 6 = 0. The y-values are the same, so the line is horizontal.
4. **3/4.** Rise = 3 (up), run = 4 (right), so slope = 3/4. Check with the points: (4 - 1) / (4 - 0) = 3/4.
5. a. The line **falls** from left to right. b. **-3/2** (also accept -1.5 or -1 1/2). (0 - 6) / (4 - 0) = -6 / 4 = -3/2.

**Common errors to look for**

| If the student wrote | The likely mistake | Reteach |
|---|---|---|
| 1/2 for item 1, or 4/3 for item 4 | Put change in x over change in y (run over rise) | Slope is rise over run: y-change on top |
| 2 for item 2, or 3/2 for item 5 | Dropped the negative sign | A line that falls from left to right has a negative slope |
| -8/2 = -4 for item 2 | Computed 3 - 1 instead of 3 - (-1) | Subtracting a negative is the same as adding |
| Undefined or no slope for item 3 | Confused horizontal and vertical lines | 0 on top means slope 0 (horizontal); 0 on the bottom means undefined (vertical) |
| -6/4 for item 5 | Did not simplify | Divide the numerator and denominator by 2 |

**Sorting for tomorrow:** 5 correct = ready for slope-intercept form. 3 or 4 correct = quick review of the error type above. 0 to 2 correct = small-group reteach with a graph and slope triangles.', 'published', 'seed', 0, '2026-10-26T23:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-eebbe761445d0067', 'fitness-circuit-lesson-plan-grade-7', 'Six-Station Fitness Circuit Lesson Plan', 'lesson-plan', '7', 'pe-health', 'A 45-minute PE lesson built around a six-station fitness circuit that needs only cones and floor lines. Includes a timed warm-up, station descriptions with easier and harder versions, rotation timing, a cool-down, a student record card, and modifications.', '', '## Overview

**Time:** 45 minutes

**Space:** Gym, multipurpose room, or a flat outdoor area

**Big idea:** A circuit is a set of different exercises done one after another. Each student works at a personal pace and tries to match or beat their own first-round score, not anyone else''s.

## Objectives

By the end of the lesson, students will be able to:

- Perform six bodyweight exercises with the form cues for each one.
- Choose the version of each exercise (easier, standard, or harder) that fits them today.
- Record their own results and compare round 1 with round 2.
- Name one exercise that works the legs, one that works the upper body, and one that works the core.

## Materials

- 12 cones or floor markers (2 per station)
- Floor lines already in the gym, or floor tape or chalk for one line at Station 3
- A timer or stopwatch, and a whistle or music you can pause
- 6 station signs: station number, exercise name, and the form cues from this plan written in large print
- 1 Student Record Card and 1 pencil per student (the card is near the end of this plan)
- Exercise mats for Stations 2, 4, and 6 if you have them (optional)

## Before the Lesson

- Set the six stations in a large circle with at least 3 metres (about 10 feet) between them. Number them in order so rotation is always to the next higher number, and Station 6 moves to Station 1.
- At Station 5, place two cones 10 metres (about 11 yards) apart, away from walls.
- Put the pencils and record cards in a pile at each station so nothing has to be carried.
- Read the Safety section and the Modifications section, and plan versions for individual students ahead of time.

## Lesson at a Glance

| Part | Minutes |
|---|---|
| 1. Opening | 3 |
| 2. Warm-up | 6 |
| 3. Station demonstration | 5 |
| 4. Circuit, round 1 | 12 |
| 5. Water break and check-in | 2 |
| 6. Circuit, round 2 | 12 |
| 7. Cool-down and reflection | 5 |
| **Total** | **45** |

## Lesson Steps

### 1. Opening (3 minutes)

1. Students sit in the middle of the space. Take attendance.
2. Say: ''Today you will work through a six-station circuit, twice. Your goal is steady effort and good form. The only score you are trying to beat is your own.''
3. Explain the pace rule: ''Work hard enough that you are breathing faster, but you can still say a short sentence. If you cannot, slow down or switch to the easier version.''
4. Explain the stop rule: ''If something hurts or you feel dizzy or unwell, stop, sit down at the side, and tell me right away.''

### 2. Warm-up (6 minutes)

Students spread out in the open space. Lead these in order.

| Activity | Time |
|---|---|
| Easy jog or brisk walk around the edge of the space | 2 minutes |
| Arm circles: 30 seconds forward, 30 seconds backward | 1 minute |
| Walking lunges across the space, slow and controlled | 1 minute |
| Side shuffles across the space, switching the lead foot each crossing | 1 minute |
| Slow bodyweight squats, about one every 3 seconds | 1 minute |

### 3. Station Demonstration (5 minutes)

1. Walk the class around the circle. At each station, show the standard version, then the easier version, then the harder version. Spend about 40 seconds per station (4 minutes in all).
2. At each station, read the form cues on the sign aloud.
3. Tell students: ''Pick the version that lets you keep good form for the whole time. You can change versions in the middle of a station.''
4. In the last minute, split the class into 6 groups of about equal size and send one group to each station. Explain the signals: one whistle means start, two whistles mean stop and rest, a long whistle means rotate.

### 4. Circuit, Round 1 (12 minutes)

Each station takes exactly 2 minutes. Six stations take 12 minutes.

| Clock at each station | What students do |
|---|---|
| 0:00 to 0:40 | Work (40 seconds) |
| 0:40 to 0:50 | Rest in place (10 seconds) |
| 0:50 to 1:30 | Work (40 seconds) |
| 1:30 to 2:00 | Write the score on the record card, then walk to the next station (30 seconds) |

The score for each station is the total for both work periods added together. During the round, move around the circle, give one form cue at a time, and suggest the easier version to any student whose form is slipping.

### 5. Water Break and Check-In (2 minutes)

1. Students get a drink and return to the station where they started.
2. Ask: ''Which station was hardest for you? Show me the number on your fingers.'' Then say: ''In round 2, choose the version at that station that lets you keep your form.''

### 6. Circuit, Round 2 (12 minutes)

Repeat the circuit with the same timing. Students write their round 2 scores beside their round 1 scores. Remind them that changing to an easier or harder version is a good decision when it keeps their form strong, and that they should note the version they used.

### 7. Cool-Down and Reflection (5 minutes)

| Activity | Time |
|---|---|
| Slow walk around the space, breathing in through the nose and out through the mouth | 2 minutes |
| Shoulder stretch: pull one arm across the chest, 15 seconds each arm | 30 seconds |
| Calf stretch: one foot back with the heel pressed down, 15 seconds each leg | 30 seconds |
| Seated hamstring reach: sit with legs straight and reach toward the toes without bouncing | 30 seconds |
| Kneeling reach: kneel, sit back toward the heels, and stretch both arms forward on the floor | 30 seconds |
| Reflection | 1 minute |

For the reflection, students stay seated and answer on the bottom of the record card or aloud to a partner: ''Which station worked your legs, which worked your upper body, and which worked your core? What is one thing you would do differently next time?'' Collect the cards.

## The Six Stations

### Station 1: Squats (legs)

- **What to do:** Stand with feet shoulder-width apart. Bend the knees and push the hips back as if sitting down on a chair, then stand up tall.
- **Form cues:** Heels stay on the floor. Chest up. Knees point the same way as the toes.
- **Easier:** Bend only part of the way down, or sit down on a bench and stand up again.
- **Harder:** Pause for 2 seconds at the bottom of every squat.
- **Score:** Number of squats.

### Station 2: Push-Ups (upper body)

- **What to do:** Place the hands on the floor a little wider than the shoulders, with the body in a straight line from head to heels. Bend the elbows to lower the chest toward the floor, then push back up.
- **Form cues:** Straight line from head to heels. Eyes on the floor just ahead of the hands. Lower with control.
- **Easier:** Keep the knees on the floor, or do the push-ups standing with the hands on a wall.
- **Harder:** Lower for a slow count of 3 on every push-up.
- **Score:** Number of push-ups.

### Station 3: Line Hops (heart and lungs)

- **What to do:** Stand beside a line on the floor with feet together. Hop sideways over the line and back again on two feet.
- **Form cues:** Land softly on the balls of the feet. Knees slightly bent. Small, quick hops.
- **Easier:** Step over the line and back, one foot at a time.
- **Harder:** Hop on one foot for the first work period and the other foot for the second.
- **Score:** Number of times you cross the line.

### Station 4: Plank Hold (core)

- **What to do:** Rest on the forearms and toes with the elbows under the shoulders. Hold the body in a straight line.
- **Form cues:** Straight line from head to heels. Hips level, not lifted and not sagging. Keep breathing.
- **Easier:** Keep the knees on the floor, or hold a leaning plank with the forearms on a wall.
- **Harder:** Lift one foot a few centimetres off the floor and switch feet every 5 seconds.
- **Score:** Number of seconds held. A partner counts aloud. If you drop to the floor, rest for a breath, start again, and keep adding.

### Station 5: Shuttle (heart and lungs)

- **What to do:** Jog from one cone to the other, touch the floor beside the cone, turn, and jog back. Keep going.
- **Form cues:** Stay in your own lane. Bend the knees to touch the floor. Look up before you turn.
- **Easier:** Walk briskly and touch your knee in place of the floor.
- **Harder:** Side shuffle on the way out and jog on the way back.
- **Score:** Number of lengths (one length is cone to cone).

### Station 6: Bird Dog (core and balance)

- **What to do:** Start on hands and knees. Reach one arm forward and the opposite leg straight back. Hold for 2 seconds, lower, and switch sides.
- **Form cues:** Back flat like a table. Move slowly. Hips stay level.
- **Easier:** Reach only the arm, or only the leg.
- **Harder:** Before lowering, bring the elbow and the opposite knee together under the body, then reach out again.
- **Score:** Number of reaches.

## Modifications

- **Every student:** All three versions of each exercise are open to everyone, every round. Present the easier version as a smart choice, not a lesser one.
- **Students who use a wheelchair or have limited leg movement:** Plan a version for each station ahead of time with the student, the family, and any support staff. Possible swaps: seated arm punches at Station 1, seated wall or desk push-aways at Station 2, fast arm circles at Station 3, a tall seated posture hold with arms out in front at Station 4, wheeling the shuttle course at Station 5, and seated opposite arm and leg reaches at Station 6.
- **Students returning from an injury or with a medical note:** Follow the note. Offer a timekeeper or score-recorder role at any station the student cannot do, and a walking lap during that station.
- **Students who tire quickly:** Work for the first 40 seconds only and use the second work period as extra rest, or do round 2 as a walking lap with stretches.
- **Students who are sensitive to noise:** Use a visual signal such as a raised cone or a large timer display in place of the whistle.
- **English learners:** Keep the station signs short and demonstrate every version. Pair the student with a partner who models each station first.
- **Students who are ready for more:** Use the harder version at every station and aim to match the round 1 score in round 2 with the same form.

## Safety

Check every step against your school''s safety rules and the manufacturer''s instructions before use.

- Before class, check that the floor is dry and clear of bags, bottles, and loose equipment.
- Students wear closed athletic shoes with laces tied.
- Keep at least 3 metres (about 10 feet) between stations, and keep the shuttle lane away from walls and other groups.
- If you use mats, check that they lie flat and do not slide.
- Follow each student''s health plan and any medical notes on file.
- Any student who reports pain, dizziness, or trouble breathing stops at once. Follow your school''s procedure.
- Keep water available, and adjust or shorten the lesson in hot conditions according to your school''s rules.

## Assessment

- **During the circuit:** Watch for the form cues on each sign. Note students who need a different version next time.
- **Record card:** Check that both rounds are filled in and that the reflection names a legs, an upper body, and a core station. Do not grade the scores themselves. Grade completion, form, and effort.
- **Expected reflection answers:** Legs: Station 1 (squats). Also accept Station 3 or Station 5. Upper body: Station 2 (push-ups). Core: Station 4 (plank) or Station 6 (bird dog).

## Student Record Card

**Name:** ______________________  **Date:** ____________

| Station | Version I used (easier, standard, harder) | Round 1 score | Round 2 score |
|---|---|---|---|
| 1. Squats (count) | | | |
| 2. Push-ups (count) | | | |
| 3. Line hops (crossings) | | | |
| 4. Plank hold (seconds) | | | |
| 5. Shuttle (lengths) | | | |
| 6. Bird dog (reaches) | | | |

**Reflection:** Which station worked your legs, which worked your upper body, and which worked your core? What is one thing you would do differently next time?

________________________________________________________________

________________________________________________________________', 'published', 'seed', 0, '2026-10-26T16:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-ea2db29ab4bf7d58', 'french-greetings-and-introductions-quiz-grade-7', 'French 1 Quiz: Greetings and Introductions', 'quiz', '7', 'world-languages', 'A ten-question French 1 quiz on saying hello and goodbye, asking and giving a name, asking how someone is, and choosing between formal and informal speech. Six multiple-choice questions and a four-blank conversation, with answer key.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** Answer all ten questions. Each question is worth 1 point.

## Part A: Multiple Choice

Circle the letter of the best answer.

1. It is 9:00 in the morning. How do you greet your teacher?

    a. Bonsoir, madame.

    b. Bonjour, madame.

    c. Bonne nuit, madame.

    d. Au revoir, madame.

2. What does "Comment t''appelles-tu ?" mean?

    a. How are you?

    b. How old are you?

    c. What is your name?

    d. Where do you live?

3. A friend asks you, "Comment ça va ?" Which is the best answer?

    a. Je m''appelle Léa.

    b. Ça va bien, merci.

    c. J''ai douze ans.

    d. À demain.

4. School is over. You will see your friend again tomorrow. What do you say?

    a. À demain !

    b. Enchanté !

    c. Bonjour !

    d. S''il vous plaît !

5. You meet an adult you do not know. Which question is the polite way to ask how the person is?

    a. Comment vas-tu ?

    b. Ça va ?

    c. Comment allez-vous ?

    d. Salut, ça va ?

6. When do French speakers use the word "Salut"?

    a. Only to say hello to a teacher

    b. Only late at night

    c. With friends, to say hello or goodbye

    d. Only to say thank you

## Part B: Complete the Conversation

Hugo and Chloé meet on the first day of school. Choose a word or phrase from the box for each numbered blank. Use each one time.

**Word box:** ans, appelle, Au revoir, Enchantée

**Hugo:** Bonjour ! Je m'' (7) ______________ Hugo. Et toi ?

**Chloé:** Je m''appelle Chloé. (8) ______________, Hugo.

**Hugo:** Enchanté. Tu as quel âge ?

**Chloé:** J''ai douze (9) ______________.

**Hugo:** Moi aussi ! Bon, j''ai un cours de maths. (10) ______________, Chloé !

**Chloé:** À bientôt, Hugo !

Write your answers here.

7. ______________________
8. ______________________
9. ______________________
10. ______________________

## Answer Key

**Part A**

1. b. "Bonjour" is the greeting for the morning and the daytime. "Bonsoir" is for the evening, "Bonne nuit" is said at bedtime, and "Au revoir" means goodbye.
2. c. "Comment t''appelles-tu ?" means "What is your name?"
3. b. "Ça va bien, merci" means "I am doing well, thank you." The other choices give a name, give an age, or say "see you tomorrow."
4. a. "À demain" means "See you tomorrow."
5. c. "Comment allez-vous ?" uses "vous", the polite form for an adult you do not know. The other choices are informal.
6. c. "Salut" is informal. Friends use it for both "hi" and "bye."

**Part B**

7. appelle. "Je m''appelle Hugo" means "My name is Hugo."
8. Enchantée. It means "Pleased to meet you." Chloé is a girl, so the word is written with an extra -e. Hugo writes "Enchanté."
9. ans. "J''ai douze ans" means "I am twelve years old."
10. Au revoir. It means "Goodbye."

**Total: 10 points**', 'published', 'seed', 0, '2026-10-26T09:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-07b53540972daafb', 'how-honeybees-make-honey-reading-passage-grade-3', 'How Honeybees Make Honey: Reading Passage and Questions', 'reading-passage', '3', 'ela', 'An original 300-word nonfiction passage that explains, step by step, how honeybees turn flower nectar into honey. Six comprehension questions cover literal recall, sequence, vocabulary in context, and inference, with a full answer key.', 'CCSS.ELA-LITERACY.RI.3.1, CCSS.ELA-LITERACY.RI.3.3, CCSS.ELA-LITERACY.RI.3.4', '**Name:** ______________________  **Date:** ____________

**Directions:** Read the passage. Then answer the questions. Go back to the passage to find evidence for your answers.

## Sweet Work

**1** Have you ever spread honey on warm toast? That sweet, golden treat was made by thousands of tiny workers. Making honey is a big job, and honeybees do it step by step.

**2** The work begins at a flower. A worker bee lands on the blossom and uses her long tongue, which works like a straw, to sip a sugary liquid called nectar. She does not use this nectar as her own meal. Instead, she stores it in a special pouch called a honey stomach. She visits many flowers before her honey stomach is full.

**3** Next, the bee flies back to the hive. There she passes the nectar to another worker bee, mouth to mouth. The bees in the hive pass the nectar along from bee to bee. As they do, special juices in their bodies mix with the nectar and begin to change it into honey.

**4** Then the bees place the nectar in the small, six-sided wax cells of the honeycomb. At this point, it is still thin and watery. To fix this, the bees fan their wings very fast over the cells. The moving air helps the extra water evaporate, or dry up into the air. Slowly, the nectar becomes thick and sticky. Now it is honey!

**5** Finally, the bees seal each full cell with a cap of fresh wax. The cap works like a lid on a jar. It keeps the honey clean and safe until the bees need it.

**6** Why do bees work so hard? Honey is their food. In winter, there are few flowers, so the bees cannot gather nectar. They stay inside the hive and eat the honey they stored.

**7** One worker bee makes only about one-twelfth of a teaspoon of honey in her whole life. That means a single jar of honey takes the teamwork of a great many bees. The next time you taste honey, remember the busy bees that made it.

## Questions

1. Where does a worker bee store nectar while she carries it back to the hive?

   - A. in the honeycomb
   - B. in her honey stomach
   - C. on her wings
   - D. in a wax cap

2. What do the bees do right after they place the nectar in the wax cells?

   - A. They seal the cells with wax.
   - B. They fly to more flowers.
   - C. They fan their wings over the cells.
   - D. They eat the nectar.

3. Read this sentence from paragraph 4: ''The moving air helps the extra water evaporate, or dry up into the air.'' What does the word **evaporate** mean?

   - A. to become sweeter
   - B. to turn from a liquid into a gas and go into the air
   - C. to drip down to the bottom
   - D. to freeze into ice

4. In paragraph 5, the bees **seal** each full cell with wax. Which words from the passage help you understand what **seal** means? Write the words and tell what **seal** means.

________________________________________________________________

________________________________________________________________

5. Why is it important for bees to make and store honey before winter comes? Use details from the passage in your answer.

________________________________________________________________

________________________________________________________________

________________________________________________________________

6. The author says that a jar of honey ''takes the teamwork of a great many bees.'' Give **two** details from the passage that show bees work as a team to make honey.

________________________________________________________________

________________________________________________________________

________________________________________________________________

## Answer Key

1. **B. in her honey stomach** (literal, paragraph 2)

2. **C. They fan their wings over the cells.** (literal and sequence, paragraph 4) Sealing the cells with wax happens later, after the nectar has thickened into honey.

3. **B. to turn from a liquid into a gas and go into the air** (vocabulary, paragraph 4) The sentence gives the clue ''or dry up into the air.''

4. (vocabulary, paragraph 5) Sample answer: The words ''The cap works like a lid on a jar'' help me know that seal means to close something up tightly so nothing can get in or out. Also accept the clue ''It keeps the honey clean and safe.'' A full answer names a clue from the passage and gives a meaning such as close, cover, or shut tightly.

5. (inferential, paragraph 6) Sample answer: Bees need honey to live through the winter. In winter there are few flowers, so the bees cannot collect nectar. They stay in the hive and eat the honey they stored. Without stored honey, the bees would have no food. A full answer says that honey is the bees'' food and that nectar is hard to find in winter.

6. (inferential, paragraphs 3, 4, 5, and 7) Accept any two details that are supported by the passage, such as:

   - One bee gathers the nectar and passes it to another bee in the hive.
   - The bees pass the nectar from bee to bee.
   - The bees fan their wings over the cells to dry the nectar.
   - The bees seal the cells with wax.
   - One bee makes only about one-twelfth of a teaspoon of honey in her life, so it takes many bees to fill a jar.

**Teacher notes**

- Passage length: about 300 words. Paragraphs are numbered so students can cite where they found evidence.
- Words to preview if needed: nectar, hive, honeycomb, wax, evaporate, seal.
- Suggested scoring: 1 point each for questions 1 to 3, and 2 points each for questions 4 to 6 (1 point for a correct idea, 2 points for a correct idea supported by the passage). Total: 9 points.
- Science background: the ''special juices'' are enzymes that break down the sugars in nectar. Nectar is mostly water. Bees dry it until it is less than about one-fifth water, which is why honey is thick and keeps for a long time.', 'published', 'seed', 0, '2026-10-26T02:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-2172c879903c4626', 'literary-analysis-essay-rubric-grade-12', 'Literary Analysis Essay Rubric', 'rubric', '12', 'ela', 'A 20-point analytic rubric for literary analysis essays with four performance levels across five criteria: thesis, textual evidence, analysis, organization, and style and conventions. Includes scoring bands, a student self-assessment, and a teacher feedback section.', 'CCSS.ELA-LITERACY.W.11-12.1, CCSS.ELA-LITERACY.W.11-12.4, CCSS.ELA-LITERACY.W.11-12.9, CCSS.ELA-LITERACY.RL.11-12.1', '**Student:** ______________________  **Date:** ____________

**Essay title or text analyzed:** ______________________________________________

## How to Use This Rubric

- **Before writing:** Read the Proficient and Advanced columns with the class. Have students underline the words that separate a 3 from a 4 in each row.
- **During drafting:** Students complete the self-assessment below and revise their weakest criterion before turning in the essay.
- **When grading:** Circle or highlight one descriptor in each row, total the points, and write one strength and one next step. If an essay falls between two levels, score the lower level and name what would move it up.

Each criterion is worth up to 4 points, for a total of 20.

## Rubric

| Criterion | 4 Advanced | 3 Proficient | 2 Developing | 1 Beginning |
|---|---|---|---|---|
| **Thesis and Argument** | Thesis makes an insightful, arguable claim about how the author creates meaning. It goes beyond the obvious and accounts for complexity or tension in the text. The whole essay sustains and develops this claim | Thesis makes a clear, arguable claim about the meaning of the text or the author''s choices. The essay stays focused on the claim throughout | Thesis is present but states a fact, a broad topic, or an obvious observation instead of an arguable interpretation. Focus drifts in places | Thesis is missing, unclear, or only restates the prompt. The essay has no controlling idea |
| **Textual Evidence** | Evidence is precise, well chosen, and drawn from across the text. Quotations are trimmed to the most telling words and woven smoothly into the writer''s own sentences. All evidence is cited correctly | Evidence is relevant and sufficient to support each main point. Quotations are introduced with context and cited correctly, with minor lapses | Evidence is thin, loosely related to the point, or limited to one part of the text. Quotations are long, dropped in without introduction, or cited inconsistently | Little or no evidence from the text. The essay relies on general statements or on details that are inaccurate. Citations are missing |
| **Analysis and Interpretation** | Consistently explains how specific choices (diction, imagery, structure, point of view, and so on) create meaning and why they matter. Connects details to the work as a whole and offers original insight | Explains how the evidence supports the thesis and identifies relevant literary techniques and their effects. Analysis outweighs summary | Mostly summarizes the plot or paraphrases quotations. Literary techniques are named but their effects are not explained. Analysis is brief or general | Retells the story with no interpretation, or offers personal reactions unconnected to the text. Shows misreading of the text |
| **Organization and Coherence** | Ideas build on one another in a purposeful order that strengthens the argument. Topic sentences advance the thesis, transitions show the logic between ideas, and the conclusion extends the argument instead of repeating it | Clear introduction, body, and conclusion. Each paragraph has one main idea tied to the thesis. Transitions connect paragraphs and sentences | A basic structure is present, but paragraphs lack clear topic sentences, combine unrelated points, or follow the order of the plot instead of the logic of the argument. Transitions are mechanical or missing | No clear structure. Ideas appear in random order, paragraphing is missing, and there is no real introduction or conclusion |
| **Style and Conventions** | Writing is precise, varied, and controlled, with an academic voice. Uses literary present tense consistently. Virtually free of errors in grammar, usage, punctuation, and spelling. Formatting follows the required style | Writing is clear with appropriate academic tone and some sentence variety. Uses literary present tense with minor slips. Few errors, and none interfere with meaning. Formatting is mostly correct | Language is vague, repetitive, or informal in places. Tense shifts. Errors are frequent enough to distract the reader. Formatting has several mistakes | Language is unclear or inappropriate for academic writing. Errors are so frequent that they interfere with meaning. Required formatting is not followed |

## Scoring

| Criterion | Points earned (1 to 4) |
|---|---|
| Thesis and Argument | |
| Textual Evidence | |
| Analysis and Interpretation | |
| Organization and Coherence | |
| Style and Conventions | |
| **Total (out of 20)** | |

**Suggested grade bands** (adjust to your school''s grading scale)

| Total points | Performance | Suggested letter grade |
|---|---|---|
| 18 to 20 | Advanced | A |
| 15 to 17 | Proficient | B |
| 12 to 14 | Approaching proficient | C |
| 9 to 11 | Developing | D |
| 5 to 8 | Beginning: revise and resubmit | Not yet passing |

An essay that earns a 3 in every criterion totals 15 and meets the standard. To emphasize analysis in a particular unit, count the Analysis and Interpretation row twice and score out of 24.

## Teacher Feedback

**One strength of this essay:**

______________________________________________________________

______________________________________________________________

**One next step for revision:**

______________________________________________________________

______________________________________________________________

## Student Self-Assessment

Complete this before you turn in your essay. Be honest. The goal is to find what to revise.

| Check | Yes | Not yet |
|---|---|---|
| Someone could reasonably disagree with my thesis | | |
| My thesis says something about how or why, not just what happens | | |
| Every body paragraph includes at least one direct quotation with a citation | | |
| I introduce each quotation with context instead of dropping it in | | |
| After each quotation, I write at least two sentences explaining what it shows | | |
| I have more analysis than plot summary | | |
| Each topic sentence makes a point that supports my thesis | | |
| My conclusion answers the question *so what?* | | |
| I write about the text in present tense | | |
| I read my essay aloud and fixed the errors I heard | | |

**The criterion I am strongest in:** ______________________________________

**The criterion I revised or still need help with:** ______________________________________

## Quick Reference: Summary vs. Analysis

| Summary (tells what happens) | Analysis (explains how and why it matters) |
|---|---|
| The narrator describes the house as dark and silent | By describing the house only through what is absent (light, sound, movement), the narrator makes the setting reflect the family''s unspoken grief |
| The main character lies to her sister | The lie, told in the same calm tone the character uses everywhere else, suggests that deception has become ordinary to her |', 'published', 'seed', 0, '2026-10-25T19:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-b802e1918a90fd0a', 'multiplication-division-facts-quiz-grade-3', 'Multiplication and Division Facts Within 100 Quiz', 'quiz', '3', 'math', 'A 15-question quiz on multiplication and division facts within 100: basic facts, missing-number equations, and two word problems. Includes an answer key and scoring guide.', 'CCSS.MATH.CONTENT.3.OA.A.3, CCSS.MATH.CONTENT.3.OA.A.4, CCSS.MATH.CONTENT.3.OA.B.6, CCSS.MATH.CONTENT.3.OA.C.7', '**Name:** ______________________  **Date:** ____________

**Directions:** Solve each problem. Write your answer on the line. For the word problems, show your work and label your answer.

**Score:** ______ / 15

## Part 1: Multiply

1. 6 x 7 = ______
2. 8 x 4 = ______
3. 9 x 6 = ______
4. 7 x 8 = ______
5. 5 x 9 = ______

## Part 2: Divide

6. 36 ÷ 4 = ______
7. 63 ÷ 9 = ______
8. 48 ÷ 6 = ______
9. 81 ÷ 9 = ______
10. 56 ÷ 7 = ______

## Part 3: Find the Missing Number

11. 7 x ______ = 49
12. ______ ÷ 8 = 5
13. 72 ÷ ______ = 9

## Part 4: Word Problems

Show your work. Write an equation and label your answer.

14. Mrs. Lee buys 6 bags of oranges. Each bag has 8 oranges. How many oranges does she buy in all?

    Equation: ______________________

    Answer: ______________________

15. A teacher has 54 crayons. She shares them equally among 6 tables. How many crayons does each table get?

    Equation: ______________________

    Answer: ______________________

## Answer Key

**Part 1: Multiply**

1. 42
2. 32
3. 54
4. 56
5. 45

**Part 2: Divide**

6. 9
7. 7
8. 8
9. 9
10. 8

**Part 3: Find the Missing Number**

11. 7 (7 x 7 = 49)
12. 40 (40 ÷ 8 = 5, because 5 x 8 = 40)
13. 8 (72 ÷ 8 = 9, because 8 x 9 = 72)

**Part 4: Word Problems**

14. 6 x 8 = 48. **48 oranges** (Also accept 8 x 6 = 48.)
15. 54 ÷ 6 = 9. **9 crayons** (Also accept 6 x ? = 54, with 9 as the missing number.)

**Scoring guide**

Each question is worth 1 point. For questions 14 and 15, give the point for a correct answer. A missing label is worth a reminder, not a lost point.

| Score | What it shows | Next step |
|---|---|---|
| 14 to 15 | Strong command of facts | Move on to two-step problems and facts fluency games |
| 11 to 13 | Knows most facts | Practice the specific facts missed |
| 8 to 10 | Developing | Small-group practice with arrays and skip counting |
| 7 or below | Needs reteaching | Rebuild with equal groups, arrays, and the 2s, 5s, and 10s facts first |

**Teacher notes**

- Facts with 6, 7, 8, and 9 are the hardest for most third graders, so they make up most of this quiz. Look for patterns in errors. A student who misses 7 x 8, 56 ÷ 7, and 63 ÷ 9 needs work on the 7s facts.
- In question 12, a common wrong answer is 3 (from 8 - 5) or 13 (from 8 + 5). These students are not yet connecting division to multiplication. Teach them to ask, ''What number is 5 groups of 8?''
- Suggested time: 10 to 15 minutes. This quiz checks accuracy, not speed.', 'published', 'seed', 0, '2026-10-25T12:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-230d6a8ef7a7e536', 'my-daily-routine-sentence-frames-worksheet-grade-4', 'My Daily Routine: Sentence Frames Worksheet', 'worksheet', '4', 'esl', 'English learners practice the simple present tense and time words (first, then, after that, at 7:00) by choosing verbs, answering questions about a short text, and writing about their own day with sentence frames. Twelve items with an answer key and model answers.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** A routine is what you do every day. Read the helper boxes. Then do Parts A, B and C.

**Remember:**

- Use the **simple present** for things you do every day: I **eat** breakfast. We **walk** to school.
- With **he**, **she** or one person''s name, add **-s** or **-es** to the verb: She **eats** breakfast. He **brushes** his teeth. Lina **goes** to school.

**Time words:**

| To show order | To show when |
|---|---|
| First, | at 7:00 |
| Then | in the morning |
| Next, | in the afternoon |
| After that, | in the evening |
| Finally, | at night |

## Part A: Circle the Correct Verb

1. I ( wake / wakes ) up at 7:00 every morning.
2. My sister ( brush / brushes ) her teeth after breakfast.
3. We ( eat / eats ) lunch at school.
4. My dad ( go / goes ) to work at 8:00.

## Part B: Lina''s Morning

Read about Lina. Then finish each answer.

Lina wakes up at 6:30. First, she washes her face. Then she gets dressed. Next, she eats breakfast with her brother. After that, she brushes her teeth. Finally, she walks to school at 7:45.

5. What time does Lina wake up?

She wakes up at ______________.

6. What does Lina do first?

First, she ____________________________________.

7. What does Lina do after she eats breakfast?

After that, she ____________________________________.

8. How does Lina get to school?

Finally, she ______________ to school.

## Part C: My Day

Finish each sentence about your own day.

9. I wake up at ______________.

10. First, I ______________________________. Then I ______________________________.

11. After school, I usually ____________________________________.

12. At night, I go to bed at ______________.

**Challenge:** Write two sentences about the routine of a person in your family. Start with **He** or **She**. Remember the **-s** on the verb.

______________________________________________

______________________________________________

## Answer Key

**Part A**

1. wake. The subject is "I", so the verb has no -s.
2. brushes. "My sister" is one person (she), so the verb takes -es.
3. eat. The subject is "We", so the verb has no -s.
4. goes. "My dad" is one person (he), so the verb takes -es.

**Part B**

5. She wakes up at 6:30.
6. First, she washes her face.
7. After that, she brushes her teeth.
8. Finally, she walks to school.

**Part C**

Answers vary. Check that each verb after "I" has no -s and that the time words make sense. Model answers:

9. I wake up at 7:00.
10. First, I get dressed. Then I eat breakfast.
11. After school, I usually play soccer with my friends.
12. At night, I go to bed at 9:00.

**Challenge:** Answers vary. Check for -s or -es on each verb. Model answer: She gets up at 6:00. She makes coffee in the morning.', 'published', 'seed', 0, '2026-10-25T05:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-3ba58d51528c2b22', 'naming-feelings-calming-strategies-lesson-plan-grade-2', 'Naming Feelings and Choosing a Calming Strategy Lesson Plan', 'lesson-plan', '2', 'sel', 'A 30-minute lesson in which students learn five feeling words, hear a short original story about a knocked-over block tower, and practice four calm-down choices. Includes the words the teacher says, timed steps, partner practice, and a quick check.', '', '## Overview

**Time:** 30 minutes

**Setting:** Whole class on the carpet or at desks, with room to turn to a partner

**Big idea:** Everyone has feelings, and all feelings are okay. When a feeling gets big, we can name it and then choose something to do that helps our body slow down.

This is an everyday classroom routine, not counseling. If a student''s feelings seem bigger than a class lesson can help with, follow your school''s process for involving the counselor and the family.

## Objectives

By the end of the lesson, students will be able to:

- Name five feelings: happy, sad, mad, worried, and calm.
- Tell one clue from their face or body that goes with a feeling.
- Show four calm-down choices and pick one to try.
- Use the sentence ''I feel ______.''

## Materials

- Chart paper or board and a marker
- The Feeling Words chart from this plan, copied onto chart paper before the lesson
- A blank sheet of chart paper titled ''Calm-Down Choices''

## Lesson at a Glance

| Part | Minutes |
|---|---|
| 1. Welcome and feelings check | 3 |
| 2. Feeling words | 6 |
| 3. Story: The Block Tower | 5 |
| 4. Four calm-down choices | 7 |
| 5. Partner practice | 5 |
| 6. Quick check and close | 4 |
| **Total** | **30** |

## Feeling Words Chart

| Feeling word | What you might notice |
|---|---|
| happy | A smile, a light body, wanting to share |
| sad | A heavy body, a quiet voice, tears |
| mad | A hot face, tight hands, a loud voice |
| worried | A twisty tummy, lots of ''what if'' thoughts |
| calm | Slow breathing, loose hands, ready to learn |

## Lesson Steps

### 1. Welcome and Feelings Check (3 minutes)

1. Say: ''Today we are going to talk about feelings. Everybody has feelings, every day. There are no bad feelings. Some feelings are small and some are very big.''
2. Say: ''Think about how you feel right now. You do not have to tell anyone. Just notice it.'' Wait about 10 seconds.
3. Say: ''Give me a thumbs up if you can think of a time today when you felt happy. Now a thumbs up if there was a time this week when you felt mad or sad. Me too. That happens to everyone.'' Put your own thumb up.

### 2. Feeling Words (6 minutes)

1. Show the Feeling Words chart. Say: ''Here are five feeling words. When we can name a feeling, it is easier to know what to do next.''
2. Read each word. For each one, say: ''Show me what ______ looks like on your face,'' then read the clues in the second column. Have students say the word back to you.
3. After ''mad,'' say: ''Feeling mad is okay. Hitting, yelling at someone, or breaking things is not okay. Today we will learn what we can do when we feel mad.''
4. After ''worried,'' say: ''Worried is the feeling when you keep thinking that something might go wrong.''
5. Teach the sentence. Say: ''We can tell someone our feeling with three words: I feel, and then the feeling word. Say it with me: I feel calm.'' Have partners turn and tell each other, ''I feel ______,'' using any word from the chart.

### 3. Story: The Block Tower (5 minutes)

Say: ''Listen to this story about two children named Mina and Leo. Listen for how they feel.'' Read the story aloud and stop at each pause to ask the question.

> Mina spent all of choice time building a block tower. It was as tall as her chin. She picked up the last block and reached for the top.
>
> Just then, Leo hurried past to get his jacket. His elbow bumped the table. The tower wobbled. Then it crashed. Blocks rolled everywhere.
>
> Mina''s face got hot. Her hands squeezed into fists. She wanted to yell.

**Pause 1.** Ask: ''How do you think Mina feels? What clues tell you?''

> Leo stopped. His tummy felt twisty. He had not meant to knock it down. What if Mina never wanted to play with him again?

**Pause 2.** Ask: ''How do you think Leo feels? What clue tells you?''

> Mina put her hands on her belly. She took a slow breath in and a slow breath out. She did it three times. Her hands opened up.
>
> ''I feel mad,'' Mina said. ''I worked hard on that tower.''
>
> ''I am sorry,'' said Leo. ''I was going too fast. Can I help you build it again?''
>
> Mina nodded. They built the tower together, and this time they built it in the middle of the table.

**Pause 3.** Ask: ''What did Mina do before she talked to Leo? What words did she use to tell him how she felt?''

### 4. Four Calm-Down Choices (7 minutes)

1. Say: ''Mina did something to help her body slow down before she used her words. We are going to learn four calm-down choices. You get to pick the one that works for you.'' (1 minute)
2. Write each choice on the ''Calm-Down Choices'' chart with its number as you teach it. Model it, then have the class do it with you. Spend about a minute and a half on each choice. (6 minutes)

| Number | Choice | How to do it | What the teacher says |
|---|---|---|---|
| 1 | Balloon breaths | Hands on belly. Breathe in slowly through the nose for a count of 4. Breathe out slowly through the mouth for a count of 4. Do it 3 times. | ''Fill your belly like a balloon. Now let the air out slowly.'' |
| 2 | Count to ten | Count slowly from 1 to 10 in a whisper or inside your head. | ''Slow numbers, not fast numbers. One... two...'' |
| 3 | Squeeze and let go | Squeeze both hands into fists for a count of 5. Let go and wiggle the fingers. Do it 3 times. | ''Squeeze, squeeze, squeeze. Now let it all go.'' |
| 4 | Ask for help | Tell a grown-up or a friend: ''I feel ______. I need ______.'' | ''You do not have to handle a big feeling alone.'' |

After the fourth choice, say: ''Different choices work for different people. If one does not help, try another one.''

### 5. Partner Practice (5 minutes)

1. Say: ''I will tell you about something that could happen at school. With your partner, name the feeling. Then pick a calm-down choice and do it together.''
2. Read each situation. Give partners about one minute for each, then ask one or two pairs to share the feeling word and the choice they picked.
   - Situation A: ''It is time to write, and you cannot find your favorite pencil anywhere.''
   - Situation B: ''Tomorrow you will sing on the stage in front of the whole school.''
   - Situation C: ''At recess, your friend is playing with someone else and you have no one to play with.''
3. Accept more than one feeling word for each situation. Say: ''Two people can have different feelings about the same thing, and both are okay.''
4. In the last minute, ask: ''Did anyone and their partner pick different calm-down choices? That is fine. You know what works for you.''

### 6. Quick Check and Close (4 minutes)

Say: ''Here is one more. Listen, and answer without talking.'' Read: ''You are tying your shoe. The lace comes undone again. This is the third time.''

1. Say: ''Point to the feeling word on the chart that fits how you might feel.''
2. Say: ''Hold up 1, 2, 3, or 4 fingers to show the calm-down choice you would try.''
3. Say: ''Whisper to your partner: I feel ______.''

Scan the room on each question and note any student who does not point, hold up fingers, or whisper a sentence. Check in with those students later in the day.

Close by saying: ''Today you learned five feeling words and four calm-down choices. The chart will stay on our wall. Any time you have a big feeling, you can name it and pick a choice.'' Hang the ''Calm-Down Choices'' chart where students can see it from their seats.

## Support and Extension

- **Students who need more support:** Offer just two choices to pick from (balloon breaths or squeeze and let go). Let students point to the chart in place of speaking.
- **English learners:** Act out each feeling word with your face and body as you say it. Accept the sentence ''I feel ______'' with the feeling word in any language, then say the English word together.
- **Students who do not want to share:** Never require a student to tell the class about a personal feeling. The story and the made-up situations give everyone something to talk about that is not about them.
- **Students who are ready for more:** Add the words ''frustrated,'' ''excited,'' and ''nervous'' to the chart and ask how each one is different from mad, happy, and worried.
- **Follow-up:** During the week, name the choices when you see students use them: ''I saw you take balloon breaths. You picked a calm-down choice.''

## Answer Key

**Story pauses**

- Pause 1: Mina feels mad. Also accept angry, upset, or sad. Clues: her face got hot, her hands squeezed into fists, and she wanted to yell.
- Pause 2: Leo feels worried. Also accept sorry, scared, or sad. Clue: his tummy felt twisty, and he was thinking ''what if.''
- Pause 3: Mina took three slow breaths with her hands on her belly (balloon breaths). She said, ''I feel mad. I worked hard on that tower.''

**Partner practice (sample answers; accept any feeling the student can explain)**

- Situation A: mad or worried
- Situation B: worried. Some students will say happy.
- Situation C: sad or mad
- Any of the four calm-down choices is correct for every situation.

**Quick check**

1. Mad. Also accept sad or worried.
2. Any number from 1 to 4. The student should be able to show the choice that matches the number: 1 balloon breaths, 2 count to ten, 3 squeeze and let go, 4 ask for help.
3. A complete sentence in the form ''I feel ______'' with a feeling word.', 'published', 'seed', 0, '2026-10-24T22:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-26bd43ca9c85f4fe', 'newtons-three-laws-of-motion-lesson-plan-grade-8', 'Newton''s Three Laws of Motion: Stations Lesson Plan', 'lesson-plan', '8', 'science', 'A complete 50-minute lesson introducing Newton''s three laws with a quick demo, a short mini-lesson, and four hands-on stations using cheap classroom materials. Includes timed steps, a student record sheet, differentiation, an exit ticket, and an answer key.', 'NGSS MS-PS2-1, NGSS MS-PS2-2', '## Lesson Overview

**Grade:** 8  **Subject:** Physical science  **Time:** 50 minutes  **Grouping:** 8 groups of 3 or 4 students

Students see a quick inertia demonstration, learn the three laws in a short mini-lesson, and then rotate through four hands-on stations where they observe each law in action and explain what they see.

## Objectives

By the end of the lesson, students will be able to:

1. State each of Newton''s three laws of motion in their own words.
2. Identify which law best explains a given everyday situation and justify the choice.
3. Describe how changing the force on an object or the mass of an object changes its acceleration, and use F = m x a in a simple calculation.
4. Identify the action and reaction forces in an interaction between two objects.

## Key Vocabulary

- **Force:** a push or a pull, measured in newtons (N)
- **Inertia:** the tendency of an object to resist a change in its motion
- **Balanced forces:** forces that cancel out, so motion does not change
- **Unbalanced force:** a net force that changes an object''s speed or direction
- **Acceleration:** a change in speed or direction, measured in m/s^2
- **Mass:** the amount of matter in an object, measured in kilograms (kg)

## Materials

Set up TWO copies of each station (8 station tables in all) so groups stay small.

**Teacher demo:** 1 clear cup, 1 index card, 1 coin.

**Station 1, Crash Test (First Law), per table:** 1 toy car, 1 small ball of modeling clay (the passenger), a ramp made from a board or a large hardcover book propped on 2 textbooks, 1 thick marker or pencil taped to the table about 30 cm from the bottom of the ramp (the barrier), 1 rubber band.

**Station 2, Puff Power (Second Law), per table:** 1 ping-pong ball, 1 golf ball (or a large marble), 1 meter stick, masking tape for a start line, 1 clean drinking straw for EVERY student (straws are not shared).

**Station 3, Balloon Rocket (Third Law), per table:** 3 meters of string or fishing line tied between two chairs with a 5 cm piece of drinking straw already threaded onto it, tape, 1 balloon per group (groups keep their own balloon), 1 binder clip or clothespin to hold the balloon closed, a hand balloon pump if available.

**Station 4, Which Law? (All three laws), per table:** the scenario list from the student record sheet (it is printed on the sheet, so no extra materials are needed), 1 calculator.

**For every student:** 1 copy of the Student Record Sheet and Exit Ticket (below), pencil.

**Other:** a timer you can project or that students can hear.

## Safety

- Check for latex allergies before class. Use non-latex balloons if any student has an allergy.
- Each student uses only his or her own straw. Only one student per group inflates the group''s balloon (or use a balloon pump).
- Balls and cars stay on the tables. Nothing is thrown or launched at people.
- Keep walkways clear of the balloon rocket strings.

## Before Class

- Set up the 8 station tables and label them 1A, 2A, 3A, 4A and 1B, 2B, 3B, 4B. Groups in set A rotate only among the A tables, and groups in set B rotate only among the B tables.
- Test each ramp so the car reliably reaches the barrier.
- Write the three laws on the board, covered or hidden until the mini-lesson.

## Lesson Procedure

| Time | Minutes | What happens |
|---|---|---|
| 0:00 to 0:05 | 5 | Hook: coin drop demo and bell-ringer question |
| 0:05 to 0:13 | 8 | Mini-lesson: the three laws |
| 0:13 to 0:15 | 2 | Station directions and move to first station |
| 0:15 to 0:39 | 24 | Four station rotations, 6 minutes each (5 minutes of work, 1 minute to reset and move) |
| 0:39 to 0:46 | 7 | Whole-class debrief |
| 0:46 to 0:50 | 4 | Exit ticket |

### 1. Hook (5 minutes)

Place the index card on top of the cup and the coin on the center of the card. Ask: What will happen to the coin if I flick the card away quickly? Take 3 or 4 predictions. Flick the card horizontally. The card flies off and the coin drops straight into the cup.

Students write a one-sentence answer on the top of their record sheet: Why did the coin not fly away with the card? Call on two students. Do not confirm the answer yet. Say: By the end of class, you will be able to explain this with one of Newton''s laws.

### 2. Mini-lesson (8 minutes)

Reveal the laws on the board. Students copy the short version of each onto the record sheet.

- **First Law (inertia):** An object at rest stays at rest, and an object in motion keeps moving at the same speed in the same direction, unless an unbalanced force acts on it. Example: a soccer ball sits still until it is kicked, and a rolling ball slows down only because friction acts on it.
- **Second Law (F = m x a):** The acceleration of an object depends on the net force acting on it and on its mass. More force means more acceleration. More mass means less acceleration for the same force. Example: an empty shopping cart is easier to speed up than a full one. Work one calculation together: a 2 kg cart accelerates at 3 m/s^2. Force = 2 kg x 3 m/s^2 = 6 N.
- **Third Law (action and reaction):** When one object pushes or pulls on a second object, the second object pushes or pulls back on the first with a force that is equal in size and opposite in direction. Example: when you jump, your feet push down on the floor and the floor pushes up on you. Stress that the two forces act on DIFFERENT objects, so they do not cancel each other.

Check for understanding: Which law explains the coin demo? (First law: the coin was at rest and tended to stay at rest. The quick flick of the card put very little sideways force on the coin, so gravity pulled it straight down.)

### 3. Station directions (2 minutes)

Explain: You have 5 minutes at each station. Read the station directions on your record sheet, do the activity, and write your answers before the timer sounds. When it sounds, reset the station for the next group and move to the next number. Assign each group a starting table and start the timer.

### 4. Station rotations (24 minutes)

Circulate. Use these prompts:

- Station 1: What was the clay passenger doing just before the crash? What force stopped the car? Did that force act on the passenger?
- Station 2: What did you keep the same? What did you change? Which ball has more mass?
- Station 3: Which way does the air go? Which way does the balloon go? What is pushing on what?
- Station 4: Which words in the scenario are clues? Could more than one law apply? Which one fits BEST?

### 5. Debrief (7 minutes)

Go through the stations in order. For each, ask one group to share what they observed and another group to name the law and explain it. Key points to bring out:

- Station 1: The barrier stopped the car, but nothing stopped the passenger, so it kept moving forward. This is why seat belts matter. The rubber band acts as a seat belt by providing the unbalanced force that stops the passenger.
- Station 2: The same puff moved the ping-pong ball much faster and farther than the golf ball. A harder puff made the same ball speed up more. Force, mass, and acceleration are linked.
- Station 3: The balloon pushes the air backward and the air pushes the balloon forward. The forces are equal and opposite, and they act on different objects.
- Station 4: Review any scenarios that groups disagreed about.

Return to the hook: have students revise their first sentence about the coin using the word inertia.

### 6. Exit ticket (4 minutes)

Students complete the three exit ticket questions at the bottom of the record sheet on their own and hand the sheet in as they leave.

## Differentiation

**For students who need more support:**

- Give a half-sheet with the three laws, each with a small picture cue or keyword (inertia, F = m x a, action and reaction), to keep on the desk during stations.
- Provide sentence frames: The ______ kept moving because ______. When the mass was greater, the acceleration was ______. The ______ pushes on the ______, and the ______ pushes back on the ______.
- Assign roles within each group (reader, materials manager, recorder, timekeeper) so every student has a clear job.
- At Station 4, let students complete the first four scenarios only, and work the calculation with a partner.
- For English learners, pre-teach force, mass, and acceleration with gestures and allow answers in labeled sketches.

**For students who are ready for more:**

- At Station 2, have students design a fair test: measure how far each ball rolls in three trials, find the average, and identify the variables that were controlled.
- At Station 4, add this challenge: A 0.5 kg ball is kicked with a net force of 20 N. What is its acceleration? (40 m/s^2.) What net force gives a 1,200 kg car an acceleration of 2 m/s^2? (2,400 N.)
- Ask: If action and reaction forces are always equal, why does anything ever move? Have students write an explanation using the balloon rocket (the two forces act on different objects, so they do not cancel).
- Have students find and explain an example where all three laws apply in a single event, such as a rocket launch or a skateboard push-off.

## Assessment

- **Formative, during the lesson:** listen to station conversations and check record sheets as you circulate. Note groups that name the correct law but cannot explain why.
- **Exit ticket (3 questions, 3 points):** 3 = ready to move on; 2 = review the missed law with a quick example tomorrow; 0 or 1 = pull a small group for reteaching during the next class''s warm-up.
- **Record sheet:** collect and check for completion and accuracy (answer key below). Suggested score: 2 points per station (8 points) plus 3 exit ticket points, 11 points total.

**Common misconceptions to watch for:**

- A moving object needs a constant force to keep it moving. (It does not. Without friction or another unbalanced force, it would keep moving.)
- Action and reaction forces cancel out. (They act on different objects.)
- Heavier objects always push harder in a collision. (The forces between two colliding objects are equal in size. The lighter object accelerates more because it has less mass.)

## Student Record Sheet

**Name:** ______________________  **Date:** ____________

**Bell ringer:** Why did the coin not fly away with the card?

______________________________________________

**Notes: the three laws in my own words**

First Law: ______________________________________________

Second Law: ______________________________________________

Third Law: ______________________________________________

### Station 1: Crash Test

Set the clay passenger on top of the car (do not press it on). Release the car from the top of the ramp so it rolls into the barrier. Watch the passenger. Repeat once. Then attach the passenger with the rubber band and try again.

1. What happened to the passenger when the car hit the barrier?

______________________________________________

2. Which law explains this? Explain, and tell what changed when you added the rubber band.

______________________________________________

______________________________________________

### Station 2: Puff Power

Put the ping-pong ball on the start line. Give it one gentle puff through your straw and note how far it rolls. Now give it one hard puff. Then put the golf ball on the start line and give it one hard puff, as close as you can to the same strength.

3. Compare the gentle puff and the hard puff on the ping-pong ball. What changed about the ball''s motion?

______________________________________________

4. Compare the ping-pong ball and the golf ball with the same hard puff. Which sped up more? Which law explains both results, and how?

______________________________________________

______________________________________________

### Station 3: Balloon Rocket

Slide the straw to one end of the string. Inflate your group''s balloon and hold it closed with the clip (do not tie it). Tape the balloon to the straw so the opening points back toward the chair. Remove the clip and let go.

5. Which direction did the air move? Which direction did the balloon move?

______________________________________________

6. Name the action force and the reaction force. Which law is this?

______________________________________________

______________________________________________

### Station 4: Which Law?

Write 1, 2, or 3 for the law that BEST explains each situation. Be ready to explain.

7. ____ a. A bus stops suddenly and the standing passengers lurch forward.

   ____ b. A swimmer pushes backward on the water and moves forward.

   ____ c. An empty shopping cart is easier to speed up than a full one.

   ____ d. A soccer ball sits still on the grass until someone kicks it.

   ____ e. A rocket pushes hot gases downward, and the gases push the rocket upward.

   ____ f. Kicking a ball harder makes it speed up more.

8. Use F = m x a.

   a. A 2 kg cart accelerates at 3 m/s^2. What is the net force on it? ______________

   b. A net force of 10 N acts on a 5 kg box. What is its acceleration? ______________

### Exit Ticket

1. A hockey puck keeps sliding across the ice long after the stick stops touching it. Which law explains this, and why?

______________________________________________

______________________________________________

2. You push a 1 kg cart and a 4 kg cart with the same force. Which cart has the greater acceleration? How many times greater?

______________________________________________

3. You push on a wall with a force of 20 N. Describe the force the wall exerts on you (size and direction).

______________________________________________

## Answer Key

**Bell ringer:** The coin was at rest, and objects at rest tend to stay at rest (inertia, First Law). The card moved out from under it so quickly that very little sideways force acted on the coin, and gravity then pulled it straight down into the cup.

**Station 1: Crash Test**

1. The car stopped, but the clay passenger kept moving forward and slid or flew off the front of the car.
2. First Law (inertia). The passenger was moving with the car. The barrier put an unbalanced force on the car, but not on the passenger, so the passenger kept moving in the same direction. With the rubber band, the band applied a force to the passenger, so the passenger stopped along with the car, like a seat belt.

**Station 2: Puff Power**

3. The hard puff made the ball speed up more (greater acceleration), so it moved faster and rolled farther than with the gentle puff. More force, more acceleration.
4. The ping-pong ball sped up much more than the golf ball. Second Law: acceleration depends on force and mass. With the same force, the ball with more mass (the golf ball) has less acceleration. With the same mass, a greater force gives a greater acceleration.

**Station 3: Balloon Rocket**

5. The air rushed backward out of the opening (toward the starting chair). The balloon moved forward along the string, in the opposite direction.
6. Action: the balloon pushes the air backward. Reaction: the air pushes the balloon forward with an equal force in the opposite direction. Third Law. (Students may name the pair in either order.)

**Station 4: Which Law?**

7. a. 1  b. 3  c. 2  d. 1  e. 3  f. 2
8. a. F = 2 kg x 3 m/s^2 = 6 N.  b. a = F / m = 10 N / 5 kg = 2 m/s^2.

**Exit Ticket**

1. First Law. An object in motion stays in motion unless an unbalanced force acts on it. Ice has very little friction, so there is almost no force to slow the puck down.
2. The 1 kg cart has the greater acceleration. It accelerates 4 times as much, because with the same force, an object with one-fourth the mass has four times the acceleration (a = F / m).
3. The wall pushes back on you with a force of 20 N in the opposite direction (Third Law).', 'published', 'seed', 0, '2026-10-24T15:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-877deb66876239f0', 'no-tech-emergency-sub-plan-full-day-grade-6', 'Emergency Sub Plan: Full Day, No Technology', 'sub-plan', '6', 'ela', 'A complete print-and-go day for a substitute: an original short story with comprehension questions, a structured writing activity, ten math puzzles with answers, early-finisher options, and step-by-step notes for the sub. Written for grade 6 but works for grades 5 to 8 with no devices and no prior preparation.', '', '## Notes for the Substitute

Thank you for being here today. Everything you need is in this packet. No computers, projectors, or logins are required.

**What to copy (one per student):**

- Student Page 1: Reading (story and questions)
- Student Page 2: Writing
- Student Page 3: Math Puzzles

Keep the Answer Key at the end of this packet for yourself.

**What students need:** a pencil and a few sheets of lined paper.

**Regular teacher: fill in before you leave this in your sub folder**

| Information | Details |
|---|---|
| Bell schedule and lunch time | |
| Attendance procedure | |
| Helpful students in each class | |
| Nearby teacher who can help | |
| Office extension | |
| Restroom and hall pass procedure | |
| Emergency drill instructions are located | |
| Students with medical or support needs (see confidential note in folder) | |
| Dismissal procedure | |

**Tips for a smooth day**

- Greet students at the door and have the Welcome Task written on the board before they arrive.
- Tell students at the start: all three pages will be collected and given to their teacher.
- Give directions for one activity at a time. Hand out each page only when it is time to use it.
- Use a calm, consistent signal for attention, such as raising your hand and waiting.
- Students may work with a partner on the math puzzles. The reading questions and writing are done individually.
- If students finish early, use the Early Finisher list. If the class finishes everything, use the Whole-Class Games.
- Before you leave, please complete the End-of-Day Report at the bottom of these notes.

## Schedule

Times are flexible. Adjust them to the bell schedule. The plan fills about four hours of class time, not counting lunch and recess.

| Block | Time needed | Activity |
|---|---|---|
| Welcome | 15 minutes | Attendance, Welcome Task, overview of the day |
| Block 1 | 60 minutes | Reading: *The Ugliest Bridge* |
| Break | 10 minutes | Stretch, water, restroom |
| Block 2 | 60 minutes | Writing activity |
| Lunch and recess | Per school schedule | |
| Block 3 | 50 minutes | Math puzzle set |
| Block 4 | 30 minutes | Silent reading or Whole-Class Games |
| Wrap-up | 15 minutes | Share, collect work, clean up, dismissal |

**If students change classes each period:** use one block per class period. Give each class the reading in a 45 to 60 minute period, or give the math puzzle set to a math class.

## Welcome Task (15 minutes)

Write this on the board before students arrive:

*On a piece of lined paper, write your name and answer in two or three sentences: What is something you are good at now that you were bad at when you first tried it?*

Take attendance while students write. Then ask three or four volunteers to share. Explain that today''s reading and writing connect to this question. Go over the day''s schedule and your expectations.

## Block 1: Reading (60 minutes)

1. **Introduce (5 minutes).** Hand out Student Page 1. Ask: *Has anyone ever built something that broke?* Take two quick answers.
2. **First read (10 minutes).** Students read the story silently. Fast readers may read it twice.
3. **Second read (10 minutes).** Read the story aloud yourself, or ask volunteers to read one paragraph each. Do not require anyone to read aloud.
4. **Questions (25 minutes).** Students answer the ten questions on their own in complete sentences. Remind them to look back at the story.
5. **Review (10 minutes).** Go over answers using the Answer Key. Students correct their own papers in pen or by adding to their answers. Collect the pages.

## Block 2: Writing (60 minutes)

1. **Introduce (5 minutes).** Hand out Student Page 2. Read both prompt choices aloud.
2. **Plan (10 minutes).** Students choose a prompt and complete the planning box.
3. **Draft (30 minutes).** Students write at least three paragraphs on lined paper. This should be quiet, individual work time.
4. **Check (5 minutes).** Students use the checklist to reread and fix their writing.
5. **Share (10 minutes).** Students read their favorite sentence to a partner. Invite three or four volunteers to share a sentence with the class. Collect the writing, with the planning page stapled on top.

## Block 3: Math Puzzles (50 minutes)

1. **Introduce (5 minutes).** Hand out Student Page 3. Explain that these are puzzles, not a test. Students should show their thinking with drawings, lists, or tables, and they may work with one partner at a quiet voice level.
2. **Work time (30 minutes).** Circulate. If a pair is stuck, suggest they skip the puzzle and come back, or ask: *What do you know for sure? What could you try first?* Do not give answers yet.
3. **Review (15 minutes).** Go over answers with the Answer Key. For each puzzle, ask a student to explain how they solved it before you confirm the answer. Collect the pages.

## Block 4: Silent Reading or Whole-Class Games (30 minutes)

Students may read a book of their choice silently. If the class needs a change of pace, choose one of these no-materials games.

- **Twenty Questions.** One student thinks of an animal, object, or place. The class asks up to twenty yes-or-no questions to figure out what it is.
- **Category Chain.** Name a category, such as foods, countries, or animals. Going around the room, each student names an item that begins with the last letter of the item before it. No repeats.
- **Silent Line-Up.** Without talking, students line up in order of birthday, from January 1 to December 31, using only gestures. Check the order aloud at the end.
- **Count to Twenty.** The class tries to count aloud to twenty, one person at a time, with no set order. If two people speak at once, the count starts over.

## Early Finisher Options

- Read silently.
- On the back of the reading page, draw and label both of Imani''s bridges, using details from the story.
- Write three more number pattern puzzles like the ones in Puzzle 2 and trade with another early finisher.
- Write a new ending to the story in which a different bridge wins the strength ribbon.
- Design a bridge on paper using only triangles, and write three sentences explaining why you think it would be strong.

## Wrap-Up (15 minutes)

- Ask: *What was the most interesting thing you did today?* Take a few answers.
- Collect any remaining work and stack it by activity.
- Students clean their desk area, pick up trash from the floor, and push in chairs.
- Follow the dismissal procedure in the table above.

## End-of-Day Report

**Substitute name:** ______________________  **Date:** ____________

| Question | Notes |
|---|---|
| Students absent | |
| Activities completed | |
| Activities not finished | |
| Students who were especially helpful | |
| Any problems or incidents | |
| Anything else the teacher should know | |

## Student Page 1: Reading

**Name:** ______________________  **Date:** ____________

**Directions:** Read the story. Then answer the questions in complete sentences. Look back at the story to find evidence for your answers.

### The Ugliest Bridge

Imani had spent two weeks building her bridge for the sixth grade engineering contest. It was made from exactly one hundred craft sticks, the most the rules allowed, and it was beautiful: a smooth, flat road with a tall, straight tower at each end. She had even painted it silver.

The night before the contest, she decided to test it. She set the bridge across two stacks of books and began placing cans of soup on the middle, one at a time. One can. Two cans. Three. When she added the fourth can, there was a sharp crack, and the bridge folded in half like a closing book.

Imani stared at the wreckage. The contest was at nine o''clock the next morning.

Her older brother, Dev, leaned in the doorway. "You could just glue it back together," he said. "Nobody would know."

"I would know," Imani said. "And it would still be a weak bridge."

She thought about the old railroad bridge she passed every day on the bus. It was not smooth or pretty. Its sides were a crisscross of steel beams, triangle after triangle after triangle. She had always thought it was ugly. Now she wondered whether the triangles were there for a reason.

She pulled apart what was left of her bridge and started over. This time she built the sides out of triangles, pressing each joint until the glue held. It was midnight when she finished. There was no time to paint. Glue showed at every joint, and one side leaned a little. It was, she admitted, the ugliest thing she had ever made.

At the contest, the other bridges gleamed. One had tiny paper flags. Another had been sanded so smooth that it looked like a single piece of wood. A boy next to Imani glanced at her bridge and raised his eyebrows. Her face grew warm, but she set her bridge on the testing table anyway.

The judge, Mr. Okafor, hung a bucket beneath each bridge and poured in sand, one cup at a time. The bridge with the flags snapped at six cups. The smooth one broke at eleven. Then it was Imani''s turn.

Ten cups. Fifteen. Twenty. The room got quiet. At twenty-three cups, one stick finally popped loose, and the bucket thumped to the floor.

Nobody clapped harder than the boy who had raised his eyebrows.

Imani won the ribbon for strongest bridge. The ribbon for best-looking bridge went to the one with the flags. On the bus ride home, she watched the old railroad bridge slide past the window, triangle after triangle. For the first time, she thought it looked exactly the way it was supposed to.

### Questions

1. How many craft sticks did the contest rules allow?

______________________________________________________________

2. What happened when Imani tested her first bridge? Include how many cans it held before it broke.

______________________________________________________________

______________________________________________________________

3. What does Dev suggest, and what two reasons does Imani give for saying no?

______________________________________________________________

______________________________________________________________

4. Where does Imani get the idea for her second bridge?

______________________________________________________________

______________________________________________________________

5. The story says Imani *stared at the wreckage*. What does the word *wreckage* mean? What clues in the story help you know?

______________________________________________________________

______________________________________________________________

6. Find the simile in the second paragraph. What two things does it compare?

______________________________________________________________

______________________________________________________________

7. Why does Imani''s face grow warm at the contest? Use a detail from the story to explain.

______________________________________________________________

______________________________________________________________

8. Imani''s bridge broke at 23 cups of sand. How many more cups is that than the smooth bridge? How many more than the bridge with the flags? Show your work.

______________________________________________________________

9. How does Imani''s opinion of the railroad bridge change from the beginning of the story to the end? Why does it change?

______________________________________________________________

______________________________________________________________

______________________________________________________________

10. What is the theme, or lesson, of this story? Give one piece of evidence from the story that supports your answer.

______________________________________________________________

______________________________________________________________

______________________________________________________________

## Student Page 2: Writing

**Name:** ______________________  **Date:** ____________

**Directions:** Choose ONE prompt. Complete the planning box. Then write at least three paragraphs on lined paper.

**Prompt A (personal narrative):** Imani''s first bridge failed the night before the contest, and she had to start over. Write about a time when something you made or tried did not work the first time. What happened? What did you do next? What did you learn?

**Prompt B (opinion):** Is it more important for something to look good or to work well? Choose a side. Give at least two reasons, and support them with examples from the story, from your own life, or both.

### Planning Box

**The prompt I chose:** ______

**My main idea in one sentence:**

______________________________________________________________

**Beginning (how I will start and hook my reader):**

______________________________________________________________

**Middle (two or three key events or reasons, with details):**

______________________________________________________________

______________________________________________________________

______________________________________________________________

**End (what I learned or what I want my reader to remember):**

______________________________________________________________

### Checklist

Reread your writing and check each box when it is true.

- [ ] I wrote at least three paragraphs.
- [ ] My first sentence makes a reader want to keep reading.
- [ ] I included specific details, not just general statements.
- [ ] My writing has a clear beginning, middle, and end.
- [ ] Every sentence starts with a capital letter and ends with punctuation.
- [ ] I reread my writing and fixed at least one thing.

## Student Page 3: Math Puzzles

**Name:** ______________________  **Date:** ____________

**Directions:** Solve each puzzle. Show your thinking with numbers, drawings, lists, or tables. You may use the back of this page or lined paper.

1. **Mystery number.** I am a two-digit number. I am a multiple of 7. My two digits add up to 9. What number am I?

______________________________________________________________

2. **What comes next?** Write the next two numbers in each pattern, and describe the rule.

   - a. 3, 6, 12, 24, ____, ____
   - b. 1, 4, 9, 16, ____, ____
   - c. 2, 5, 11, 23, ____, ____

3. **Four fours.** Use exactly four 4s and any of the operations +, -, x, and / (with parentheses if you need them) to make each number from 0 to 5. Example of the idea: 4 + 4 + 4 + 4 = 16.

   - 0 = ______________________
   - 1 = ______________________
   - 2 = ______________________
   - 3 = ______________________
   - 4 = ______________________
   - 5 = ______________________

4. **Heads and legs.** A farmer has only chickens and cows. Altogether the animals have 20 heads and 56 legs. How many chickens and how many cows are there?

______________________________________________________________

5. **Magic square.** Fill in the empty boxes using each of the numbers 1 through 9 exactly once, so that every row, every column, and both diagonals add up to 15. Four numbers are already placed.

| | | |
|---|---|---|
| 2 | | 6 |
| | 5 | |
| | | 8 |

6. **Pocket change.** Maya has exactly 9 coins that are worth exactly $1.00 in total. She has only quarters, dimes, and nickels, and she has at least one of each. Find TWO different combinations of coins she could have.

______________________________________________________________

______________________________________________________________

7. **Who owns what?** Ana, Ben, and Cy each own a different pet: a dog, a cat, or a fish. Ana is allergic to fur. Ben does not own the dog. Who owns which pet?

______________________________________________________________

8. **Missing parentheses.** Add one pair of parentheses to make each equation true.

   - a. 3 + 5 x 2 - 4 = 12
   - b. 4 x 6 - 2 + 3 = 19

9. **Handshakes.** Six people meet at a party. Each person shakes hands exactly once with every other person. How many handshakes take place in all?

______________________________________________________________

10. **The snail.** A snail is at the bottom of a wall that is 10 feet tall. Each day it climbs up 3 feet. Each night it slides back down 2 feet. On which day does the snail first reach the top of the wall?

______________________________________________________________

## Answer Key

### Reading: The Ugliest Bridge

Accept answers in students'' own words that match the ideas below.

1. The rules allowed one hundred (100) craft sticks.
2. The bridge held three cans of soup. When Imani added the fourth can, it cracked and folded in half.
3. Dev suggests gluing the broken bridge back together because nobody would know. Imani says no because (1) she would know, and (2) it would still be a weak bridge.
4. She remembers the old railroad bridge she passes on the bus every day. Its sides are made of steel beams arranged in triangles, and she wonders if the triangles make it strong.
5. *Wreckage* means the broken pieces or remains of something that has been destroyed. Clues: the bridge cracked and folded in half, and later she pulls apart *what was left* of it.
6. The simile is *the bridge folded in half like a closing book*. It compares the breaking bridge to a book being closed.
7. She is embarrassed. Her bridge is unpainted, has glue showing, and leans, while the other bridges gleam, and a boy has just raised his eyebrows at it.
8. 23 - 11 = 12 more cups than the smooth bridge. 23 - 6 = 17 more cups than the bridge with the flags.
9. At the beginning she thinks the railroad bridge is ugly. At the end she thinks it looks exactly the way it is supposed to. Her opinion changes because she learns from building her own bridge that the triangles are what make it strong, so its design has a purpose.
10. Answers will vary. Acceptable themes: how well something works matters more than how it looks; failure can lead to a better result if you are willing to start over; honest work is better than a shortcut; do not judge things (or people''s work) by appearance. Evidence must come from the story, for example: the best-looking bridge broke at six cups while Imani''s plain bridge held until twenty-three, or Imani refused to simply glue the broken bridge back together.

### Writing

There is no single correct response. Please do not grade the writing. Collect it for the regular teacher. A complete response has at least three paragraphs, stays on the chosen prompt, includes specific details, and has a clear beginning, middle, and end.

### Math Puzzles

1. **63.** The two-digit multiples of 7 are 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, and 98. Only 63 has digits that add to 9 (6 + 3 = 9).

2. **Patterns**
   - a. **48, 96.** Rule: multiply by 2 each time.
   - b. **25, 36.** Rule: square numbers (1 x 1, 2 x 2, 3 x 3, and so on), or add 3, then 5, then 7, then 9, then 11.
   - c. **47, 95.** Rule: double the number and add 1 (or add 3, then 6, then 12, then 24, then 48).

3. **Four fours.** Many answers are possible. Check that each uses exactly four 4s and equals the target. Samples:
   - 0 = 4 + 4 - 4 - 4
   - 1 = (4 / 4) x (4 / 4), or (4 + 4) / (4 + 4)
   - 2 = (4 / 4) + (4 / 4)
   - 3 = (4 + 4 + 4) / 4
   - 4 = (4 - 4) x 4 + 4
   - 5 = (4 x 4 + 4) / 4

4. **12 chickens and 8 cows.** Check: 12 + 8 = 20 heads. Legs: 12 x 2 = 24 and 8 x 4 = 32, and 24 + 32 = 56. One way to solve: if all 20 animals were chickens there would be 40 legs. That is 16 legs short, and each cow adds 2 extra legs, so there are 8 cows.

5. **Magic square** (this is the only solution):

| | | |
|---|---|---|
| 2 | 7 | 6 |
| 9 | 5 | 1 |
| 4 | 3 | 8 |

   Check: rows 2 + 7 + 6, 9 + 5 + 1, and 4 + 3 + 8 each equal 15. Columns 2 + 9 + 4, 7 + 5 + 3, and 6 + 1 + 8 each equal 15. Diagonals 2 + 5 + 8 and 6 + 5 + 4 each equal 15.

6. **Pocket change.** There are exactly two combinations:
   - 1 quarter, 7 dimes, 1 nickel (25 + 70 + 5 = 100 cents; 1 + 7 + 1 = 9 coins)
   - 2 quarters, 3 dimes, 4 nickels (50 + 30 + 20 = 100 cents; 2 + 3 + 4 = 9 coins)

7. **Ana owns the fish, Ben owns the cat, and Cy owns the dog.** Ana is allergic to fur, so she has the fish. Ben does not own the dog, and the fish is taken, so Ben has the cat. That leaves the dog for Cy.

8. **Missing parentheses**
   - a. (3 + 5) x 2 - 4 = 12, because 8 x 2 - 4 = 16 - 4 = 12
   - b. 4 x (6 - 2) + 3 = 19, because 4 x 4 + 3 = 16 + 3 = 19

9. **15 handshakes.** The first person shakes 5 hands, the next person shakes 4 new hands, then 3, 2, and 1: 5 + 4 + 3 + 2 + 1 = 15. Another way: 6 x 5 / 2 = 15.

10. **Day 8.** The snail gains 1 foot for each full day and night, so at the start of day 8 it is 7 feet up. On day 8 it climbs 3 feet and reaches 10 feet before it can slide back. A common wrong answer is day 10, which forgets that the snail reaches the top during a daytime climb.', 'published', 'seed', 0, '2026-10-24T08:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-3ee30f408357f0c6', 'no-tech-emergency-sub-plan-full-day-kindergarten', 'Kindergarten Emergency Sub Plan: Full Day, No Technology', 'sub-plan', 'K', 'ela', 'A full-day kindergarten plan any adult can run with paper, crayons and a picture book from the classroom shelf. Includes word-for-word read-aloud directions, counting and pattern pages made of shapes for children who cannot read yet, movement breaks, circle games and a report form for the teacher.', '', '## Notes for the Substitute

Thank you for being here today. You do not need to be a kindergarten teacher to run this plan. You need paper, crayons and one or two picture books from the classroom shelf. No computers, screens or logins are used.

The table below was filled in by the regular teacher. Read it first. It has the clock times and the routines that only the teacher knows.

## Fill in before you leave this plan

**Regular teacher:** complete this table and leave the plan in your sub folder.

| Information | Details |
|---|---|
| School start time and morning arrival routine | |
| Attendance and lunch count: how and where to send them | |
| Snack time and routine | |
| Lunch time, where children eat, who walks them there | |
| Recess time, place and who supervises | |
| Specials today (art, music, PE, library): time and place | |
| Rest or quiet time: time and routine | |
| Restroom routine | |
| Attention signal the class knows | |
| Two or three helper children | |
| Other adults who come to the room, and when | |
| Nearby teacher who can help, and room number | |
| Office phone or extension | |
| Children with allergies, medical needs or support plans (where the confidential note is) | |
| Where the emergency drill directions are | |
| Where the paper, crayons and picture books are | |
| Dismissal time | |
| How each child goes home, or where that list is | |

## What to Copy

Make one copy for each child, on one side of the paper:

- Student Page 1: Count the Shapes
- Student Page 2: What Comes Next?

Keep the Answer Key at the end of this plan for yourself.

If you cannot make copies, skip the two student pages. Use the "No copier" directions inside Block 3 and Block 6 instead.

## What You Need

- Plain paper: about 4 sheets for each child
- Crayons: at least 10 for each child, or a shared tub for each table
- 1 or 2 picture books from the classroom shelf. Pick books with a clear story and large pictures that take about 5 to 10 minutes to read. Look through them before the children arrive.

## Tips for a Kindergarten Day

- Stay with the children all day. Five-year-olds need an adult watching and close by at all times, including in the hallway, at the restroom and at dismissal. If you must step away, call the office or the nearby teacher first.
- Give one direction at a time. Show it with your own hands, then let the children do it.
- Most children in this class cannot read yet. Read every direction aloud. Never ask a child to read directions alone.
- Use the attention signal in the table. If none is listed, raise one hand, say *Hands up, eyes on me* in a quiet voice, and wait.
- Keep sitting times short. If the children get wiggly, stop and do a Move and Wiggle Break, then go back.
- Say what you want to see: *Walking feet. Quiet voices. Hands to yourself.* Praise children who are doing it.
- Tears and small accidents are normal at this age. Stay calm, comfort the child and call the office if you need help.
- Send a child home only in the way listed in the table. If you are not sure who may pick up a child, keep the child with you and call the office.

## Schedule

Use the clock times in the table at the top. Fit the blocks below around snack, lunch, recess, specials and rest. The blocks add up to 250 minutes, a little over 4 hours of class time. You do not have to finish everything.

| Block | Minutes | Activity |
|---|---|---|
| Arrival | 20 | Attendance and Morning Circle |
| Block 1 | 20 | Read-Aloud |
| Block 2 | 25 | Draw the Story |
| Break | 10 | Move and Wiggle Break |
| Block 3 | 25 | Count the Shapes (Student Page 1) |
| Block 4 | 20 | Crayon Counting Game |
| Lunch and recess | See the table | |
| Quiet time | 20 | Rest and look at books |
| Block 5 | 15 | Read It Again |
| Block 6 | 25 | What Comes Next? (Student Page 2) |
| Break | 10 | Move and Wiggle Break |
| Block 7 | 25 | My Favorite Thing: draw and share |
| Block 8 | 20 | Circle Games |
| Wrap-up | 15 | Clean up and dismissal |

## Arrival and Morning Circle (20 minutes)

Greet each child at the door. Follow the arrival routine in the table. Take attendance and lunch count.

Bring the children to the carpet in a circle.

Say: *Good morning. Your teacher is away today, and I am here to take care of you. We are going to read, draw, count and play some games. I need your help to have a good day.*

Say: *We have three rules today. One: listening ears. Two: hands to yourself. Three: stay with the group. Show me your listening ears.* Cup your hands behind your ears and wait for the children to copy you.

Say: *Let us go around the circle. When it is your turn, say your name and one thing you like to eat.* Start with yourself. A child may say only a name, or pass.

Say: *If you need the restroom or you feel sick, come and tell me.* Explain the restroom routine from the table.

## Block 1: Read-Aloud (20 minutes)

Use one picture book from the classroom shelf. Sit on a low chair. The children sit on the carpet facing you. Hold the book open beside you so that the pictures face the children.

**Before reading**

1. Say: *Sit on your bottom. Put your hands in your lap. Eyes on me.*
2. Hold up the book. Say: *This is the book we will read today. Look at the front cover. What do you see?* Take three answers.
3. Say: *What do you think this book will be about?* Take two answers. Say: *Let us read and find out.*
4. Say: *While I read, your job is to listen with your ears and look at the pictures with your eyes.*

**During reading**

Read slowly. After each page, hold the book still for a moment so that everyone can see the picture. Stop two times:

- About halfway through, say: *What is happening on this page?* Take two answers.
- Just before the ending, say: *What do you think will happen next? Whisper it to the person next to you.* Wait about ten seconds, then keep reading.

**After reading**

1. Say: *Who was in this book?* Take answers.
2. Say: *What happened at the beginning?* Turn back to the first pages if the children need help.
3. Say: *What happened at the end?*
4. Say: *Think about the part you liked best. Turn to the person next to you and tell them your favorite part.* Give about one minute.

Any answer that matches the book is fine. You are not testing the children.

## Block 2: Draw the Story (25 minutes)

Each child needs one sheet of plain paper and crayons.

1. Say: *Now you will draw your favorite part of the book. First, write your name on your paper.* Help children who cannot write their name yet, or write it for them.
2. Say: *Draw who was in your favorite part. Then draw where they were. Use lots of colors and fill your paper.*
3. Walk around while the children draw. Ask each child: *Tell me about your picture.* Write the child''s words at the bottom of the paper, exactly as the child says them.
4. With five minutes left, say: *Hold up your picture and show it to the friends at your table.*
5. Collect the drawings for the teacher.

Children who finish early may turn the paper over and draw a new ending for the story.

## Move and Wiggle Break (10 minutes)

Use this break at the two times in the schedule, and at any other time the class needs to move. The children stand in their own space, an arm''s length from anyone else. Do each movement with them.

Say each line and do the movement:

1. *Reach up high and touch the sky. Count to five with me.*
2. *Touch your toes. Count to five.*
3. *March in place. Count ten steps.*
4. *Hop on two feet five times.*
5. *Make big slow arm circles. Count to ten.*
6. *Stand as still as a statue while I count to ten.*
7. *Take a big breath in through your nose. Blow it out slowly. Do it again.*
8. *Sit down as quietly as you can.*

If there is time left, play **Freeze**: the children walk slowly around the room. When you say *Freeze*, everyone stops like a statue. When you say *Go*, they walk again.

## Block 3: Count the Shapes (25 minutes)

Each child needs Student Page 1 and one crayon.

1. Say: *Write your name at the top.* Help where needed.
2. Draw four circles in a row on the board. Say: *Watch me. I touch each circle and count: one, two, three, four. There are four. I write the number 4.* Write a 4.
3. Say: *Put your finger on number 1. Touch each shape and count. Write how many on the line.*
4. Do numbers 1 and 2 together as a class. Then let the children work through number 8 while you walk around. Read the number of each row aloud for children who lose their place.
5. For numbers 9 and 10, say: *Now there are two rows of shapes. Count the top row. Count the bottom row. Draw a circle around the row that has more.*
6. Check each page against the Answer Key as you walk around. Collect the pages.

A child who cannot write numbers yet may draw that many dots or lines instead. A number written backward is normal at this age and counts as correct.

**No copier:** Draw each row of shapes from Student Page 1 on the board, one row at a time. The children count aloud with you and hold up that many fingers.

## Block 4: Crayon Counting Game (20 minutes)

Each child sits at a table with 10 crayons.

1. Say: *Count your crayons with me. Touch each one.* Count to 10 together.
2. Say: *I will say a number. You make a line of that many crayons in front of you. Push the other crayons away.*
3. Say these numbers one at a time: 3, 5, 2, 7, 4, 10, 6, 1, 9, 8. After each number, say: *Touch and count to check.* Count aloud together.
4. If there is time, say: *Make a line of 4 crayons. Now add one more. How many now?* (5) Then: *Make a line of 6 crayons. Take one away. How many now?* (5)
5. Say: *Put all your crayons back in the tub.*

## Quiet Time (20 minutes)

Follow the rest routine in the table. If none is listed, each child takes one book from the shelf and looks at it quietly at a table or on the carpet. Dim the lights if you can. Stay in the room, keep every child in view, and walk around quietly.

## Block 5: Read It Again (15 minutes)

Read the same book again, or choose a second picture book from the shelf. Children this age enjoy hearing a book twice and notice more the second time.

1. Say: *Sit on your bottom. Hands in your lap. Eyes on me.*
2. If it is the same book, say: *We know this book. Listen for something you did not hear the first time.* If it is a new book, say: *Look at the front cover. What do you think this book will be about?* Take two answers.
3. Read the book. Do not stop this time.
4. Hold up three fingers. Say: *Let us tell the story back. Touch one finger: what happened first?* Take an answer. *Touch the next finger: what happened next?* Take an answer. *Touch the last finger: what happened last?* Take an answer.

## Block 6: What Comes Next? (25 minutes)

Each child needs Student Page 2 and one crayon.

1. Say: *A pattern is something that repeats again and again. Watch and listen.* Clap, then pat your knees, then clap, then pat your knees. Say: *Clap, pat, clap, pat. What comes next?* (Clap.) Do it together a few times.
2. Draw on the board: circle, square, circle, square, circle. Say: *Circle, square, circle, square, circle. What comes next?* (Square.) Draw the square.
3. Say: *Write your name at the top. Put your finger on number 1. Say the shapes with me.* Say the shape names in row 1 aloud together. Say: *What comes next? Draw it on the line.*
4. Do number 2 together. Then let the children work through number 6 while you walk around. Help children say each row aloud while touching each shape.
5. For number 7, say: *Now make your own pattern. Draw shapes in the big empty space.*
6. Check each page against the Answer Key. Collect the pages.

**No copier:** Draw each pattern from Student Page 2 on the board, one at a time. The class says the shapes aloud and tells you what comes next. Then each child draws a pattern on plain paper.

## Block 7: My Favorite Thing (25 minutes)

Each child needs one sheet of plain paper and crayons.

1. Say: *Think of your favorite thing to do. It could be something you do at home, at school or outside. Tell the person next to you.*
2. Say: *Write your name on your paper. Now draw yourself doing your favorite thing.*
3. Walk around. Ask each child: *Tell me about your picture.* Write the child''s words at the bottom.
4. With ten minutes left, bring the children back to the carpet with their drawings. Each child who wants to may stand up, show the picture and say one sentence about it. Teach the class to say: *Thank you for sharing.*
5. Collect the drawings for the teacher.

## Block 8: Circle Games (20 minutes)

The children sit or stand in a circle on the carpet. Choose two or three games.

- **Copy Me.** Do a movement, such as patting your head. The children copy you. Change the movement every few seconds. Then let a helper child be the leader.
- **I See a Color.** Say: *I see something in our room that is red.* The children take turns guessing what it is. The child who guesses correctly picks the next color, with your help.
- **Count Around the Circle.** The first child says 1, the next child says 2, and so on around the circle up to 10. The next child starts again at 1. Help any child who gets stuck.
- **Find a Shape.** Say: *Look around the room without getting up. Can you see something shaped like a circle?* Take answers. Repeat with a square, a triangle and a rectangle.
- **Listen and Do.** Give two directions at once, such as: *Touch your nose, then clap two times.* The children wait until you finish speaking, then do both.

## Wrap-Up and Dismissal (15 minutes)

1. Say: *It is time to clean up. Crayons go in the tubs. Paper scraps go in the trash. Push in your chair.*
2. Bring the children to the carpet. Say: *What was your favorite part of today?* Take a few answers.
3. Say: *Thank you for a good day. I will tell your teacher how hard you worked.*
4. Help the children collect coats, bags and lunch boxes.
5. Follow the dismissal directions in the table at the top. Stay with the children until every child has left in the way listed. If a child has not been picked up, take the child to the office yourself.
6. Fill in the Report for the Teacher and leave it on the desk with the children''s work.

## Report for the Teacher

**Substitute name:** ______________________  **Date:** ____________

| Question | Notes |
|---|---|
| Children absent | |
| Blocks we finished | |
| Blocks we did not get to | |
| Picture book or books we read | |
| Children who were especially helpful | |
| Children who had a hard day, and what helped | |
| Injuries, illness, accidents or visits to the office | |
| Changes to how any child went home | |
| Messages from families or staff | |
| Anything else the teacher should know | |

## Student Page 1: Count the Shapes

**Name:** ______________________  **Date:** ____________

**Directions (an adult reads these aloud):** Touch each shape and count. Write how many on the line.

1. ● ● ● ●

   ______

2. ■ ■

   ______

3. ▲ ▲ ▲ ▲ ▲

   ______

4. ● ● ● ● ●   ● ●

   ______

5. ■ ■ ■

   ______

6. ▲ ▲ ▲ ▲ ▲   ▲

   ______

7. ● ● ● ● ●   ● ● ● ●

   ______

8. ■ ■ ■ ■ ■   ■ ■ ■

   ______

**Directions (an adult reads these aloud):** Count the top row. Count the bottom row. Draw a circle around the row that has more.

9. ▲ ▲ ▲ ▲ ▲   ▲

   ■ ■ ■ ■

10. ● ●

    ▲ ▲ ▲ ▲ ▲

## Student Page 2: What Comes Next?

**Name:** ______________________  **Date:** ____________

**Directions (an adult reads these aloud):** Touch each shape and say its name. What comes next? Draw it on the line.

1. ● ■ ● ■ ● ______

2. ▲ ● ▲ ● ▲ ● ______

3. ■ ■ ● ■ ■ ● ■ ■ ______

4. ● ▲ ▲ ● ▲ ▲ ● ______

5. ■ ● ▲ ■ ● ▲ ■ ______

6. ▲ ▲ ■ ■ ▲ ▲ ■ ■ ▲ ______

**Directions (an adult reads these aloud):** Make your own pattern. Draw it in the empty space.

7. My pattern:

## Answer Key

### Student Page 1: Count the Shapes

1. 4
2. 2
3. 5
4. 7
5. 3
6. 6
7. 9
8. 8
9. The top row has more. The top row has 6 triangles and the bottom row has 4 squares.
10. The bottom row has more. The top row has 2 circles and the bottom row has 5 triangles.

Accept dots or lines in place of a written number if the count is right. Accept numbers written backward.

### Student Page 2: What Comes Next?

1. ■ (square). The pattern is circle, square.
2. ▲ (triangle). The pattern is triangle, circle.
3. ● (circle). The pattern is square, square, circle.
4. ▲ (triangle). The pattern is circle, triangle, triangle.
5. ● (circle). The pattern is square, circle, triangle.
6. ▲ (triangle). The pattern is triangle, triangle, square, square.
7. Answers will vary. Any drawing in which shapes repeat in the same order at least two times is correct. Ask the child to say the pattern aloud while touching each shape.', 'published', 'seed', 0, '2026-10-24T01:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-d4456a9e3e9f7099', 'no-tech-emergency-sub-plan-one-period-grade-10', 'Emergency Sub Plan for High School: One Period, No Technology', 'sub-plan', '10', 'ela', 'A print-and-go plan for one 50-minute high school period that any adult can run and repeat for every class of the day, with notes for a 90-minute block. Students read an original nonfiction passage about how time zones began, answer eight questions and write a short argument. Answer key and a report form for the teacher are included.', '', '## Notes for the Substitute

Thank you for covering today. You do not need to know the subject, and you do not need a computer, a projector or a login. Every class does the same thing: students read a one-page passage, answer eight questions and write one paragraph. The plan below is written for one 50-minute period. Run it again for each class that comes in.

The work is a reading and writing task, so it fits an English class best, but it can be used in any high school class in grades 9 to 12.

**What students need:** a pen or pencil. Nothing else.

## Fill in before you leave this plan

Regular teacher: this table is the only part of the plan you need to complete.

| Information | Details |
|---|---|
| Teacher name and room number | |
| Bell schedule (start and end time of each period) | |
| Periods with no class (planning, lunch, duty) | |
| Number of students in each period | |
| How to take and send attendance | |
| A dependable student in each period | |
| Nearby teacher who can help | |
| Office phone extension | |
| Hall pass and restroom rule | |
| Phone rule for this room | |
| Where emergency drill instructions are kept | |
| Students with medical or support needs (see confidential note in folder) | |
| Where to leave collected work | |

## What to Copy

- **Student Page (passage, questions and written response):** one per student for every period of the day. It is the section of this packet that starts at *Student Page* and stops before the *Answer Key*. Add up the class sizes in the table above and make a few extra.
- **Answer Key:** one copy, for you only. Do not hand it out.
- **Report for the Teacher:** one copy, for you.

If the copier is down, read the passage aloud twice, write the questions on the board and have students answer on their own paper.

## The Plan for One 50-Minute Period

| Minutes | What happens | What you do |
|---|---|---|
| 0 to 5 | Students come in and sit down | Stand at the door. Take attendance. Hand each student a Student Page as you check names. |
| 5 to 8 | Introduction | Say the introduction below. |
| 8 to 18 | Silent reading | Students read the passage once all the way through, then a second time while underlining three facts that surprise them. |
| 18 to 33 | Questions 1 to 8 | Students work alone and quietly. Walk around the room. |
| 33 to 45 | Written response | Students write the paragraph at the bottom of the page. |
| 45 to 50 | Collect and close | Collect every page. Ask the closing question. Students stay seated until the bell. |

**Introduction (say this, in your own words if you like):**

*Your teacher is out today and has left work that will be collected and checked. You will read one page about how time zones began, answer eight questions and write one paragraph. Everything you need is on the page. You will work on your own, and I will collect your paper five minutes before the bell.*

**Closing question (if there is time):** *Before today, who thought time zones were created by the government?* Take two or three comments.

**While students work**

- If a student asks what a word means, tell them to read the sentences around it and make their best guess. That is part of the task.
- If a student asks whether an answer is right, say that the teacher will check it. Do not give out answers from the key in a 50-minute period.
- If a student finishes early, point to *If You Finish Early* at the bottom of the Student Page.
- If a student refuses to work, do not argue. Write the name on the report and move on.
- If a student says they have already done this page in an earlier class today, have them do the *If You Finish Early* tasks on a new sheet.

## Repeating the Plan for Each Period

- Use the same plan, start to finish, for every class that comes in. Nothing needs to change.
- Before each class arrives, count out the number of Student Pages for that period.
- At the end of each period, put that class''s papers in one stack and write the period number on a sticky note or on the top page. Keep the stacks separate.
- Fill in one row of the Report for the Teacher at the end of each period, while you still remember it.
- During periods with no class, stay in the room unless the office gives you another job.
- Students in a later period may have heard about the work from friends. That is fine. They still do their own paper.

## If the Period Is a 90-Minute Block

Keep the same order and add four steps. The total is 90 minutes.

| Minutes | What happens |
|---|---|
| 0 to 5 | Students come in. Attendance. Hand out pages. |
| 5 to 8 | Introduction |
| 8 to 18 | Silent reading, twice, underlining three surprising facts |
| 18 to 28 | **Added:** read the passage aloud. Ask for a volunteer for each paragraph, or read it yourself. Do not require anyone to read aloud. |
| 28 to 43 | Questions 1 to 8, working alone |
| 43 to 53 | **Added:** students compare answers with one partner and improve their own answers. They may not copy. |
| 53 to 63 | **Added:** go over questions 1 to 7 with the class using the Answer Key. Ask a student to answer first, then confirm. |
| 63 to 75 | Written response, first paragraph |
| 75 to 85 | **Added:** students write a second paragraph that answers the strongest argument against their own claim. They may use the back of the page. |
| 85 to 90 | Collect and close |

## If the Period Is Shorter Than 50 Minutes

Cut the second silent reading and tell students to answer questions 1 to 6 only. Keep the written response.

## Report for the Teacher

**Substitute name:** ______________________  **Date:** ____________

| Period | Students absent | Did most students finish the questions? | Did most students finish the paragraph? | Names and notes (helpful students, problems, anyone who did not work) |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |
| 6 | | | | |
| 7 | | | | |
| 8 | | | | |

**Anything else the teacher should know:**

______________________________________________________________

______________________________________________________________

______________________________________________________________

## Student Page

**Name:** ______________________  **Date:** ____________  **Period:** ______

**Directions:** Read the passage twice. On your second reading, underline three facts that surprise you. Then answer the questions and write the paragraph. Work on your own. This page will be collected.

### The Day of Two Noons

**(1)** For most of the 1800s, there were no time zones in the United States. Each town set its clocks by the sun. When the sun stood at its highest point in the sky, it was noon, and the town clock was set to match. Because that moment comes slightly earlier or later from place to place, each town had its own noon. Moving one degree of longitude east or west changes sun time by four minutes. When clocks in Washington, D.C., read noon, clocks in New York City read about 12:12.

**(2)** For people who traveled on foot or by horse, these small differences did not matter. Nobody moved fast enough to notice them. Railroads changed that. A train could pass through many towns, each with its own local time, in a single afternoon, and each railroad company ran its trains by the time of its own home city. By the early 1880s, American railroads were using dozens of different times. Passengers missed connections. Worse, a timekeeping mistake on a shared track could put two trains in the same place at the same moment.

**(3)** The fix did not come from the government. It came from the railroads themselves. A railroad engineer and editor named William F. Allen drew up a plan that divided the country into four zones: Eastern, Central, Mountain and Pacific. Inside each zone, every railroad clock would show the same time, and neighboring zones would differ by exactly one hour. The railroad companies agreed to switch on Sunday, November 18, 1883.

**(4)** On that day, telegraph signals carried the new time to stations across the country, and clocks were reset. In towns where the clocks had to be turned back, noon came twice: once by the sun and again, minutes later, by the new standard. The date became known as the day of two noons.

**(5)** Not everyone was pleased. Some towns kept their old sun time for years, and some people complained that railroad companies had no right to decide what time it was. They had a point. Railroad time was an agreement between companies, not a law. Still, it was so convenient that most cities soon adopted it. Congress did not make the time zones official until the Standard Time Act of 1918, thirty-five years after the trains had started running on them.

### Questions

Answer in complete sentences unless the question says otherwise.

1. Before 1883, how did a town decide when it was noon?

______________________________________________________________

______________________________________________________________

2. Use two facts from paragraph 1 to work out about how many degrees of longitude separate Washington, D.C., and New York City. Show your calculation.

______________________________________________________________

______________________________________________________________

3. Why did the differences between local times cause no trouble before the railroads?

______________________________________________________________

______________________________________________________________

4. Name two problems that the many local times caused for railroads and their passengers.

______________________________________________________________

______________________________________________________________

5. In paragraph 4, the word *standard* most nearly means (circle one):

   - A. a flag carried by an army
   - B. an agreed measure that everyone uses
   - C. something ordinary and unremarkable
   - D. a level of quality that is hard to reach

6. Why was November 18, 1883, called the day of two noons? Explain what happened to the clocks.

______________________________________________________________

______________________________________________________________

7. In paragraph 5, the author writes, *They had a point.* What was the point, and what evidence does the author give that it was a fair one?

______________________________________________________________

______________________________________________________________

______________________________________________________________

8. Write the central idea of the whole passage in one sentence of your own.

______________________________________________________________

______________________________________________________________

### Written Response

The railroads changed the time for almost everyone in the country without a vote and without a law. Was it right for private companies to make that decision?

Write one paragraph of six to eight sentences. State your claim in the first sentence. Support it with at least two pieces of evidence from the passage. End with a sentence that sums up your position.

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

______________________________________________________________

### If You Finish Early

Choose one and write on the back of this page.

- List three other things that most people follow even though no law requires them, and explain why people follow each one.
- The Earth turns 360 degrees in 24 hours. Work out how many degrees it turns in one hour, and explain how that connects to time zones that are one hour apart.
- Write a short diary entry from the point of view of a station worker on November 18, 1883.

## Answer Key

Accept answers in students'' own words that match the ideas below.

1. Each town set its clocks by the sun. Noon was the moment the sun was at its highest point in the sky, and the town clock was set to match.

2. About 3 degrees. The clocks in the two cities were about 12 minutes apart, and each degree of longitude changes sun time by 4 minutes, so 12 / 4 = 3.

3. People traveled on foot or by horse, which was too slow for anyone to notice a difference of a few minutes between one town and the next.

4. Any two of these: each railroad ran on the time of its own home city, so there were dozens of different times in use; passengers missed connections; a timekeeping mistake on a shared track could put two trains in the same place at the same moment.

5. **B.** In this sentence the new standard is the agreed time that every railroad clock in a zone would show.

6. The railroads switched to the new zone times on that day. In towns where clocks had to be turned back, noon arrived by the sun, the clocks were set back a few minutes, and noon then arrived a second time by the new time.

7. The point was that railroad companies had no right, or no authority, to decide what time it was for everyone. The author''s evidence is that railroad time was only an agreement between companies and not a law, and that Congress did not make the zones official until the Standard Time Act of 1918.

8. Answers will vary. A strong answer includes both the problem and the solution, for example: Time zones in the United States were created by railroad companies in 1883 to replace the confusion of every town keeping its own sun time, and they became law only in 1918.

### Written Response

There is no single correct answer, and the substitute does not need to grade the paragraph. A complete response states a clear claim in the first sentence, uses at least two pieces of evidence from the passage, and ends with a summing-up sentence.

- Evidence a student might use to argue it was right: the many local times made passengers miss connections and created a danger of collisions; the government had not acted; the plan was simple and convenient; most cities soon chose to adopt it; Congress later made it law.
- Evidence a student might use to argue it was not right: the railroads were private companies and nobody voted; railroad time was not a law; some people objected and some towns kept sun time for years; the change affected everyone, not only people who rode trains.

### If You Finish Early

- Second option: 360 / 24 = 15, so the Earth turns 15 degrees in one hour. Places 15 degrees of longitude apart have sun times one hour apart, which is why time zones that differ by one hour are each about 15 degrees wide.', 'published', 'seed', 0, '2026-10-23T18:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-960481d011582d46', 'nutrition-facts-label-worksheet-grade-6', 'Reading a Nutrition Facts Label Worksheet', 'worksheet', '6', 'pe-health', 'Students read a made-up nutrition facts label for a box of crackers and answer 10 questions, from finding the serving size to calculating calories and sodium for more than one serving. Includes an answer key with the work shown.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** Use the label below to answer every question. Show your work for the calculation questions and write the unit (calories, g, mg, or %) with each answer.

**Remember:**

- Every amount on a label is for **one serving**, not for the whole package.
- **Servings per container** tells how many servings are in the whole package.
- **g** means grams and **mg** means milligrams.
- **% Daily Value** shows how much of a full day''s reference amount of a nutrient is in one serving. The reference amounts are the same on every label. They are not a personal goal.

The product and the label are made up for this worksheet.

## The Label

| Sunny Oat Crackers: Nutrition Facts | Amount per serving | % Daily Value |
|---|---|---|
| Serving size | 6 crackers (30 g) | |
| Servings per container | 8 | |
| Calories | 140 | |
| Total fat | 5 g | 6% |
| Saturated fat | 1 g | 5% |
| Trans fat | 0 g | |
| Cholesterol | 0 mg | 0% |
| Sodium | 230 mg | 10% |
| Total carbohydrate | 21 g | 8% |
| Dietary fiber | 3 g | 11% |
| Total sugars | 4 g | |
| Includes added sugars | 3 g | 6% |
| Protein | 3 g | |

## Part A: Find It on the Label

1. What is the serving size?

______________________________________________

2. How many servings are in the whole container?

______________________________________________

3. Which two lines on the label show an amount of zero?

______________________________________________

## Part B: Calculate

4. How many calories are in the whole container?

______________________________________________

5. How many crackers are in the whole container?

______________________________________________

6. Devon eats 12 crackers.

    a. How many servings is that? ______________

    b. How many calories is that? ______________

    c. How many milligrams of sodium is that? ______________

7. One serving has 4 g of total sugars. Some of that is added sugars. How many grams of sugar in one serving are NOT added sugars?

______________________________________________

8. Use the label to find each amount.

    a. Grams of protein in 3 servings: ______________

    b. Grams of dietary fiber in the whole container: ______________

9. One serving has 10% of the Daily Value for sodium.

    a. What percent of the Daily Value for sodium is in 2 servings? ______________

    b. What percent is in the whole container? ______________

## Part C: Explain

10. **Find the mistake.** Riley looks at the label and says, ''This whole box has 140 calories.'' Explain what Riley got wrong and give the correct number of calories for the whole box.

______________________________________________

______________________________________________

______________________________________________

## Answer Key

**Teacher note:** This worksheet practices reading information and doing calculations. It is not advice about what or how much anyone should eat. Keep the discussion on the label and the math, and avoid comments on students'' own food.

**Part A**

1. 6 crackers (30 g). Accept either 6 crackers or 30 g.
2. 8 servings.
3. Trans fat (0 g) and cholesterol (0 mg).

**Part B**

4. 1,120 calories. 140 x 8 = 1,120.
5. 48 crackers. 6 x 8 = 48.
6. a. 2 servings (12 / 6 = 2). b. 280 calories (140 x 2 = 280). c. 460 mg of sodium (230 x 2 = 460).
7. 1 g. 4 - 3 = 1.
8. a. 9 g of protein (3 x 3 = 9). b. 24 g of dietary fiber (3 x 8 = 24).
9. a. 20% (10 x 2 = 20). b. 80% (10 x 8 = 80).

**Part C**

10. Riley read the calories for one serving and treated it as the amount for the whole box. The label says 140 calories per serving, and the box holds 8 servings. The whole box has 140 x 8 = 1,120 calories. Give full credit for an answer that says 140 is for one serving only and gives 1,120 calories.', 'published', 'seed', 0, '2026-10-23T11:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-574017630f5813d6', 'opinion-essay-rubric-grade-5', 'Opinion Essay Rubric', 'rubric', '5', 'ela', 'A 4-level, 5-criteria rubric for scoring fifth grade opinion essays: opinion and introduction, reasons and evidence, organization and transitions, conclusion, and conventions. Includes a score sheet, a score conversion guide, and a student self-check list.', 'CCSS.ELA-LITERACY.W.5.1, CCSS.ELA-LITERACY.W.5.1.A, CCSS.ELA-LITERACY.W.5.1.B, CCSS.ELA-LITERACY.W.5.1.C, CCSS.ELA-LITERACY.W.5.1.D, CCSS.ELA-LITERACY.L.5.2', '**Student:** ______________________  **Date:** ____________

**Essay title or topic:** ______________________________________________

## How to Use This Rubric

- Share the rubric with students **before** they write, so they know what a strong opinion essay looks like.
- Score each of the 5 criteria from 1 to 4. Circle or highlight the box that best matches the essay.
- If an essay falls between two levels, choose the level that describes most of the writing for that criterion.
- Add the five scores for a total out of 20.

## Rubric

| Criteria | 4 - Exceeds Expectations | 3 - Meets Expectations | 2 - Approaching Expectations | 1 - Beginning |
|---|---|---|---|---|
| **Opinion and Introduction** | Introduction hooks the reader, gives helpful background on the topic, and states a clear, focused opinion that the rest of the essay stays on. | Introduction names the topic and states a clear opinion. | Introduction names the topic, but the opinion is unclear, too broad, or changes later in the essay. | No clear opinion is stated, or the essay only retells facts about the topic. |
| **Reasons and Evidence** | Gives three or more strong, logical reasons. Each reason is supported with specific facts, details, or examples, and the writer explains how the evidence supports the opinion. | Gives at least two logical reasons. Each reason is supported with facts, details, or examples. | Gives one or two reasons, but support is thin, repeated, or mostly unsupported personal feelings. | Reasons are missing, off topic, or do not support the opinion. |
| **Organization and Transitions** | Ideas are grouped in clear paragraphs in an order that builds the argument. Varied linking words, phrases, and clauses (such as consequently, specifically, for instance, in addition) connect the opinion and reasons smoothly. | Related ideas are grouped in paragraphs in a logical order. Linking words and phrases (such as because, for example, also, another reason) connect the opinion and reasons. | Some ideas are grouped, but the order is confusing in places. Few linking words are used, or the same ones are repeated. | Ideas are listed in no clear order. There are no paragraphs and no linking words. |
| **Conclusion** | Conclusion restates the opinion in fresh words, sums up the main reasons, and leaves the reader with a strong final thought or call to action. | Conclusion is clearly related to the opinion and restates it. | Conclusion is present but only repeats the introduction word for word, or it adds a new, unrelated idea. | There is no conclusion. The essay just stops. |
| **Conventions** (grammar, capitalization, punctuation, spelling) | Almost no errors. Sentences are complete and varied in length and structure. The writing is easy and enjoyable to read. | A few errors, but they do not get in the way of meaning. Sentences are complete. | Several errors that sometimes make the writing hard to understand. Some run-on sentences or fragments. | Many errors that often make the writing hard to understand. |

## Score Sheet

| Criteria | Score (1 to 4) | Comments |
|---|---|---|
| Opinion and Introduction | | |
| Reasons and Evidence | | |
| Organization and Transitions | | |
| Conclusion | | |
| Conventions | | |
| **Total** | **______ / 20** | |

**One strength of this essay:**

________________________________________________________________

**One goal for next time:**

________________________________________________________________

## Score Conversion Guide

| Total points | Overall level |
|---|---|
| 18 to 20 | Exceeds expectations |
| 14 to 17 | Meets expectations |
| 9 to 13 | Approaching expectations |
| 5 to 8 | Beginning |

The lowest possible total is 5 and the highest is 20. If your school uses percent grades, adjust this guide to match your own grading policy rather than dividing the total by 20, since a score of 3 in every category (15 out of 20) means the student fully met grade-level expectations.

## Student Self-Check

Students can use this list before turning in a final draft.

- My introduction tells the topic and clearly states my opinion.
- I gave at least two reasons for my opinion.
- Each reason has facts, details, or examples to back it up.
- I put each reason in its own paragraph.
- I used linking words such as because, for example, in addition, and consequently.
- My conclusion restates my opinion in new words.
- I checked my capitalization, punctuation, and spelling.
- I read my essay out loud to make sure every sentence makes sense.

## Teacher Notes

- The Level 3 column describes what the grade 5 opinion writing standard asks for. Level 4 describes work that goes beyond it.
- For a quick conference, pick one criterion to celebrate and one to work on. Students revise more successfully with one clear goal than with five.
- To use the rubric for peer review, have partners highlight the opinion statement in one color and each reason in another color. Missing colors show the writer what to add.
- If students wrote from sources, add an expectation under Reasons and Evidence that facts come from the provided texts and are stated accurately.', 'published', 'seed', 0, '2026-10-23T04:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-d8ce45f02d3b4fe5', 'ratios-and-unit-rates-worksheet-grade-6', 'Ratios and Unit Rates Worksheet', 'worksheet', '6', 'math', 'Fifteen problems that move from writing ratios to finding unit rates, completing a ratio table, comparing prices, and solving real-world rate problems. Includes an error-analysis item and a full answer key with work shown.', 'CCSS.MATH.CONTENT.6.RP.A.2, CCSS.MATH.CONTENT.6.RP.A.3', '**Name:** ______________________  **Date:** ____________

**Directions:** Show your work for every problem. Label your answers with units (for example, miles per hour or dollars per pound). Write ratios in simplest form.

**Remember:**

- A **ratio** compares two quantities. It can be written three ways: 3 to 4, 3:4, or 3/4.
- A **rate** is a ratio that compares two quantities with different units, such as miles and hours.
- A **unit rate** tells how much for ONE of something. To find it, divide so the second quantity is 1. Example: 150 miles in 3 hours = 150 / 3 = 50 miles per 1 hour.

## Part A: Writing Ratios

1. A fruit bowl holds 8 apples and 6 oranges. Write the ratio of apples to oranges in simplest form.

______________________________________________

2. Using the same fruit bowl (8 apples and 6 oranges), write the ratio of oranges to ALL the fruit in simplest form.

______________________________________________

3. A class has 12 boys and 15 girls. Write the ratio of girls to boys in simplest form.

______________________________________________

## Part B: Finding Unit Rates

4. A car travels 240 miles in 4 hours. What is the unit rate in miles per hour?

______________________________________________

5. Six notebooks cost $9.00. What is the cost of one notebook?

______________________________________________

6. A student types 180 words in 4 minutes. What is the unit rate in words per minute?

______________________________________________

7. Five pounds of bananas cost $2.95. What is the price per pound?

______________________________________________

8. A leaky faucet drips 3 gallons of water in 12 hours. How many gallons does it drip per hour? Write your answer as a fraction or a decimal.

______________________________________________

## Part C: Ratio Table

9. A granola recipe uses 2 cups of flour for every 3 cups of oats. Fill in the three missing numbers in the table.

| Flour (cups) | 2 | 4 | ____ | 10 |
|---|---|---|---|---|
| Oats (cups) | 3 | ____ | 9 | ____ |

## Part D: Using Rates to Solve Problems

10. Store A sells a 12-ounce box of cereal for $3.00. Store B sells a 16-ounce box of the same cereal for $3.84. Find the price per ounce at each store. Which store has the better buy?

Store A: ______________  Store B: ______________  Better buy: ______________

11. Maya runs 3 laps around the track in 9 minutes. If she keeps running at the same rate, how long will it take her to run 7 laps?

______________________________________________

12. A car uses 5 gallons of gas to travel 140 miles.

    a. How many miles does the car travel per gallon? ______________

    b. At that rate, how far can the car travel on 8 gallons? ______________

13. To make green paint, an artist mixes 2 parts blue paint with 5 parts yellow paint.

    a. If the artist uses 15 cups of yellow paint, how many cups of blue paint are needed? ______________

    b. How many cups of green paint will that make in all? ______________

14. A printer prints 96 pages in 8 minutes.

    a. How many pages does it print per minute? ______________

    b. At that rate, how many minutes will it take to print 150 pages? ______________

15. **Find the mistake.** Jordan read that 4 pounds of apples cost $8. Jordan wrote: 4 / 8 = 0.5, so the apples cost $0.50 per pound. Explain what Jordan did wrong and give the correct price per pound.

______________________________________________

______________________________________________

______________________________________________

## Answer Key

**Part A**

1. 4:3 (also accept 4 to 3 or 4/3). 8:6, divide both numbers by 2.
2. 3:7. There are 8 + 6 = 14 pieces of fruit, so 6:14, divide both numbers by 2.
3. 5:4. 15:12, divide both numbers by 3. (Check that students put girls first.)

**Part B**

4. 60 miles per hour. 240 / 4 = 60.
5. $1.50 per notebook. 9.00 / 6 = 1.50.
6. 45 words per minute. 180 / 4 = 45.
7. $0.59 per pound. 2.95 / 5 = 0.59.
8. 1/4 gallon per hour (or 0.25 gallon per hour). 3 / 12 = 1/4.

**Part C**

9. Completed table:

| Flour (cups) | 2 | 4 | **6** | 10 |
|---|---|---|---|---|
| Oats (cups) | 3 | **6** | 9 | **15** |

Each column is the first column multiplied by the same number (x2, x3, x5).

**Part D**

10. Store A: 3.00 / 12 = $0.25 per ounce. Store B: 3.84 / 16 = $0.24 per ounce. Store B is the better buy because it costs less per ounce.
11. 21 minutes. 9 / 3 = 3 minutes per lap; 7 x 3 = 21.
12. a. 28 miles per gallon (140 / 5 = 28). b. 224 miles (28 x 8 = 224).
13. a. 6 cups of blue. 15 / 5 = 3, so multiply both parts by 3: 2 x 3 = 6. b. 21 cups of green paint (6 + 15 = 21).
14. a. 12 pages per minute (96 / 8 = 12). b. 12.5 minutes, or 12 1/2 minutes (150 / 12 = 12.5).
15. Jordan divided in the wrong order. Dividing 4 pounds by 8 dollars gives 0.5 pound per dollar, not dollars per pound. To find the price per pound, divide the cost by the number of pounds: 8 / 4 = $2.00 per pound.', 'published', 'seed', 0, '2026-10-22T21:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-2aca239ff75899ef', 'ser-vs-estar-worksheet-spanish-1-grade-9', 'Ser vs. Estar Worksheet (Spanish 1)', 'worksheet', '9', 'world-languages', 'Twelve present-tense sentences for Spanish 1 students to complete with the correct form of ser or estar, with a reference box of forms and uses. The answer key gives the reason for every answer.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** Spanish has two verbs that mean "to be": **ser** and **estar**. Use the boxes below to decide which verb each sentence needs, then write the form that matches the subject.

**Forms (present tense):**

| Subject | ser | estar |
|---|---|---|
| yo | soy | estoy |
| tú | eres | estás |
| él, ella, usted | es | está |
| nosotros, nosotras | somos | estamos |
| vosotros, vosotras | sois | estáis |
| ellos, ellas, ustedes | son | están |

**When to use each verb:**

| Use ser for | Use estar for |
|---|---|
| who or what someone is (identity, job) | where a person, place or thing is (location) |
| where someone is from (origin) | how someone feels right now (feelings, health) |
| the time, the day and the date | an action happening right now (estar + a verb ending in -ando or -iendo) |
| what something is made of (material) | |
| who owns something (possession) | |

## Part A: Fill in the Blank

Write the correct form of **ser** or **estar**.

1. Yo ______________ de México.
2. Mi hermana ______________ en la biblioteca ahora.
3. Nosotros ______________ estudiantes.
4. Hoy ______________ martes.
5. Los libros ______________ en la mochila.
6. ______________ las tres de la tarde.
7. Yo ______________ muy cansada hoy.
8. La mesa ______________ de madera.

## Part B: Circle and Explain

Circle the correct verb. Then write the reason on the line (for example: origin, location, feeling).

9. Mi mamá ( es / está ) doctora.

Reason: ______________________________

10. Ustedes ( son / están ) enfermos hoy.

Reason: ______________________________

11. El lápiz ( es / está ) de Ana.

Reason: ______________________________

12. Los niños ( son / están ) jugando en el parque.

Reason: ______________________________

## Answer Key

**Part A**

1. soy. Origin: where someone is from takes ser. (I am from Mexico.)
2. está. Location of a person takes estar. (My sister is in the library now.)
3. somos. Identity: who someone is takes ser. (We are students.)
4. es. The day of the week takes ser. (Today is Tuesday.)
5. están. Location of things takes estar. (The books are in the backpack.)
6. Son. Telling time takes ser, and the verb is plural for any hour except one o''clock. (It is three in the afternoon.)
7. estoy. A feeling or condition right now takes estar. (I am very tired today.)
8. es. Material: what something is made of takes ser. (The table is made of wood.)

**Part B**

9. es. Job or profession takes ser. (My mom is a doctor.)
10. están. Health or condition right now takes estar. (You all are sick today.)
11. es. Possession takes ser. (The pencil is Ana''s.)
12. están. An action happening right now takes estar + a verb ending in -ando or -iendo. (The children are playing in the park.)

**Note for the teacher:** Every location item here is about a person or a thing, which takes estar. The location of an event (a party, a class, a concert) takes ser. That rule is left out of this sheet on purpose so it can be taught on its own.', 'published', 'seed', 0, '2026-10-22T14:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-e13e32d536f5b56c', 'short-vowel-cvc-words-lesson-plan-grade-1', 'Short Vowel CVC Words Lesson Plan', 'lesson-plan', '1', 'ela', 'A complete 30-minute phonics lesson on blending, reading, and spelling short vowel consonant-vowel-consonant (CVC) words. Includes a scripted mini-lesson, word chains for guided practice, a printable practice page, a 5-word quick check, and differentiation.', 'CCSS.ELA-LITERACY.RF.1.2.B, CCSS.ELA-LITERACY.RF.1.2.C, CCSS.ELA-LITERACY.RF.1.2.D, CCSS.ELA-LITERACY.RF.1.3.B', '## Overview

**Time:** 30 minutes

**Grouping:** Whole group, then partners, then independent

CVC stands for consonant-vowel-consonant. In a CVC word such as *cat*, *bed*, or *sun*, the single vowel between two consonants usually makes its short sound. In this lesson students say each sound, blend the sounds into a word, and spell CVC words by listening for the first, middle, and last sound.

## Objectives

By the end of the lesson, students will be able to:

- Say the short sound for each vowel: a, e, i, o, u.
- Blend three sounds to read a CVC word (for example, /m/ /a/ /p/ makes *map*).
- Break a spoken CVC word into its three sounds and write a letter for each sound.
- Change one sound in a CVC word to make a new word (for example, *cat* to *cot*).

## Materials

- Whiteboard or chart paper and marker
- Vowel keyword chart (make one on chart paper before the lesson): a as in apple, e as in elephant, i as in itch, o as in octopus, u as in umbrella
- Student whiteboards, markers, and erasers (or paper and pencil)
- One copy per student of the Independent Practice Page (the section below)
- Half sheet of paper per student for the Quick Check
- Optional for support: three counters or chips per student, and letter tiles or magnetic letters

## Word Bank for the Teacher

Use these words anywhere in the lesson. Every word is a real, decodable CVC word.

| Short a | Short e | Short i | Short o | Short u |
|---|---|---|---|---|
| cat | bed | pig | dog | sun |
| map | hen | lip | mop | bug |
| bag | net | sit | top | cup |
| fan | red | fin | hot | tub |
| hat | web | kid | log | nut |
| jam | pen | zip | pot | rug |

## Lesson Steps

### 1. Warm-Up: Vowel Sound Drill (3 minutes)

1. Point to each vowel on the keyword chart. Say the letter name, the keyword, and the sound. Students echo. Example: ''a, apple, /a/.''
2. Go through all five vowels twice. The second time, point in a mixed-up order.
3. Play Thumbs Up: say a word slowly (*hat*, *hop*, *hit*, *hut*, *hen*). Ask, ''What vowel sound do you hear in the middle?'' Students say the sound together, then you point to the letter.

### 2. Mini-Lesson: Tap It, Blend It, Read It (7 minutes)

1. Tell students the goal: ''Today we will read and spell words that have three sounds: a consonant, a short vowel, and a consonant.''
2. Draw three connected boxes on the board. Write **m**, **a**, **p**, one letter in each box.
3. **Model (I do).** Touch under each letter and say its sound: /m/ ... /a/ ... /p/. Then slide your finger under the whole word and blend: ''mmmaaap, map.'' Say, ''The vowel is in the middle. It is between two consonants, so it says its short sound.''
4. Repeat the model with **red** and **sit**. Show students how to tap one finger to their thumb for each sound, then make a fist as they say the whole word.
5. **Together (we do).** Write **hop** in the boxes. Students tap and blend with you. Repeat with **cup** and **bag**.
6. **Model spelling.** Erase the boxes. Say, ''Now I will spell a word. My word is *pen*. I say the sounds: /p/ /e/ /n/. I hear three sounds, so I write three letters.'' Write p, e, n as you say each sound. Read the word back to check.
7. Common mix-up to address: short e and short i sound alike to many first graders. Have students say *pen* and *pin* while holding a hand under the chin. The mouth opens a little wider for /e/ than for /i/.

### 3. Guided Practice: Word Chains (8 minutes)

Students work on whiteboards. You say a word, students tap the sounds, write the word, and hold up their boards. Then change ONE sound to make the next word. Ask each time, ''Which sound changed: the first, the middle, or the last?''

**Chain 1:** cat, cot, cut, cup, cap, map, mop

**Chain 2:** pin, pen, ten, tin, tip, top

Steps for each word:

1. Say the word and use it in a short sentence. Example: ''Cot. I slept on a cot.''
2. Students repeat the word and tap the three sounds.
3. Students write the word and show their boards.
4. Write the correct word on the board. Students check and fix their own spelling.
5. Everyone reads the word aloud together.

If time allows, have partners read the full chain to each other from the board.

### 4. Independent Practice (8 minutes)

1. Hand out the Independent Practice Page.
2. Read the directions aloud. Do the example together.
3. Students work alone. Read the clues aloud to any student who needs it. The goal is the phonics skill, not reading the clue.
4. Walk around and listen to individual students tap and blend two or three of their finished words.

### 5. Quick Check (4 minutes)

1. Hand out half sheets of paper. Students number the paper 1 to 5.
2. Dictate the five words in the Quick Check section below. Say each word, use it in the sentence, and say the word again.
3. Collect the papers. Close by having the class read the five words together from the board.

## Independent Practice Page

**Name:** ______________________  **Date:** ____________

**Directions:** Read the clue. Write the missing vowel (a, e, i, o, or u) to make the word. Then write the whole word on the line.

**Example:** r _ d (the color of a stop sign) The missing vowel is **e**. The word is **red**.

1. c ___ t (a pet that says meow) ______________
2. b ___ d (you sleep in it) ______________
3. p ___ g (a farm animal that says oink) ______________
4. d ___ g (a pet that barks) ______________
5. s ___ n (it shines in the sky in the daytime) ______________
6. h ___ t (you wear it on your head) ______________
7. t ___ n (the number that comes after nine) ______________
8. l ___ p (a part of your mouth) ______________
9. m ___ p (you use it to clean the floor) ______________
10. b ___ g (an ant is one) ______________

## Quick Check

Dictate these five words. There is one word for each short vowel.

1. **map** - We looked at a map of the park. - map
2. **red** - The apple is red. - red
3. **sit** - Please sit on the rug. - sit
4. **hop** - A frog can hop. - hop
5. **cup** - I drank a cup of milk. - cup

**Scoring:** Give 1 point for each word spelled correctly (5 points total).

- 5 or 4 correct: The student is ready to move on to mixed CVC reading and words with digraphs.
- 3 correct: The student needs more practice. Look at which sound was missed (first, middle, or last).
- 2 or fewer correct: Reteach in a small group using sound boxes and counters.

Note which vowels each student misses. A student who writes *rid* for *red* or *set* for *sit* needs more work telling short e from short i.

## Differentiation

### For students who need more support

- Use sound boxes with counters before letters. The student pushes one counter into a box for each sound, then swaps each counter for a letter tile.
- Work with only one or two vowels at a time. Start with short a and short o, which sound the most different from each other.
- Use words that begin with sounds you can stretch out (m, s, f, n, r, l), such as *man*, *sun*, *fin*, and *red*. They are easier to blend than words that begin with b, d, or t.
- Keep the vowel keyword chart on the desk. Let the student point to the keyword picture or word before writing the vowel.
- On the practice page, assign items 1 to 5 only, and read every clue aloud.

### For students who are ready for more

- Add words with consonant digraphs or blends that keep the short vowel: *ship*, *chop*, *thin*, *flag*, *stop*, *drum*.
- Have students build their own word chain of five words, changing one sound each time, and trade with a partner to read.
- Ask students to write two sentences that each use at least two CVC words, such as ''The red hen sat on a log.''
- Have partners sort the Word Bank by vowel sound without looking at the headings.

### For English learners

- Pair every practice word with a quick sketch, gesture, or real object so the meaning is clear.
- Some short vowel sounds may not exist in a student''s home language. Give extra listening practice with word pairs such as *pen* and *pin*, or *cat* and *cut*, before asking for spelling.

## Assessment

- **During the lesson:** Watch whiteboards during the word chains. Note which students cannot tell which sound changed.
- **End of lesson:** Use the 5-word Quick Check and the scoring guide above.
- **Follow-up:** Collect the Independent Practice Page. A student who meets the objective writes the correct vowel in at least 8 of the 10 words.

## Answer Key

**Independent Practice Page**

1. a - cat
2. e - bed
3. i - pig
4. o - dog
5. u - sun
6. a - hat
7. e - ten
8. i - lip
9. o - mop
10. u - bug

**Quick Check (dictation)**

1. map
2. red
3. sit
4. hop
5. cup

**Word chains (which sound changed)**

- Chain 1: cat to cot (middle), cot to cut (middle), cut to cup (last), cup to cap (middle), cap to map (first), map to mop (middle)
- Chain 2: pin to pen (middle), pen to ten (first), ten to tin (middle), tin to tip (last), tip to top (middle)', 'published', 'seed', 0, '2026-10-22T07:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-338fb67e7ad00469', 'tape-measure-adding-subtracting-lengths-worksheet-grade-9', 'Workplace Math: Reading a Tape Measure and Adding and Subtracting Lengths', 'worksheet', '9', 'cte', 'Twelve shop math problems on reading a tape measure to the nearest 1/16 inch and adding and subtracting lengths in feet, inches and fractions. Written in words and numbers only, with a short review and a worked answer key.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** Solve each problem. Show your work. Write every fraction in lowest terms, and include the unit (in or ft) in every answer. When an answer has 12 inches or more, change it to feet and inches unless the problem says otherwise.

## Quick Review

### How a tape measure is marked

On a standard tape measure, each inch is divided into 16 equal spaces. Each small space is 1/16 of an inch. The marks have different lengths so you can read them quickly.

| Mark | How many in one inch | What it shows |
|---|---|---|
| Longest mark, with a number | 1 | whole inches |
| Next longest | 1 | the 1/2 inch |
| Medium | 2 | 1/4 and 3/4 |
| Short | 4 | 1/8, 3/8, 5/8, 7/8 |
| Shortest | 8 | 1/16, 3/16, 5/16, 7/16, 9/16, 11/16, 13/16, 15/16 |

**To read a measurement:** find the last whole inch before the mark, count the sixteenths past it, and reduce the fraction.

| Sixteenths past the inch | 2 | 4 | 6 | 8 | 10 | 12 | 14 |
|---|---|---|---|---|---|---|---|
| Lowest terms | 1/8 | 1/4 | 3/8 | 1/2 | 5/8 | 3/4 | 7/8 |

An odd number of sixteenths, such as 5/16 or 11/16, is already in lowest terms.

### Adding and subtracting lengths

1. Change the fractions to the same denominator (16 always works).
2. Add or subtract the fractions, then the inches, then the feet.
3. Regroup: 16/16 = 1 in, and 12 in = 1 ft.
4. Reduce the fraction.

**Example (adding):** 1 ft 9 3/4 in + 2 ft 5 1/2 in

- Fractions: 3/4 + 2/4 = 5/4 = 1 1/4
- Inches: 9 + 5 + 1 1/4 = 15 1/4 in, which is 1 ft 3 1/4 in
- Feet: 1 + 2 + 1 = 4 ft
- Answer: 4 ft 3 1/4 in

**Example (subtracting with borrowing):** 6 1/8 in - 2 3/4 in

- Same denominator: 6 1/8 - 2 6/8
- 1/8 is smaller than 6/8, so borrow 1 inch: 6 1/8 = 5 9/8
- 5 9/8 - 2 6/8 = 3 3/8 in

## Part A: Reading the Tape

1. The end of a board lines up with the mark that is 5 small spaces (sixteenths) past the 3 inch line. What is the measurement?

______________________________________________________________

2. A mark is 12 small spaces (sixteenths) past the 7 inch line. What is the measurement in lowest terms?

______________________________________________________________

3. A mark is 2 small spaces (sixteenths) before the 10 inch line. What is the measurement in lowest terms?

______________________________________________________________

4. A tape reads 53 1/2 in. Write this length in feet and inches.

______________________________________________________________

## Part B: Adding Lengths

5. 2 3/8 in + 4 1/4 in

______________________________________________________________

6. 5 7/8 in + 3 5/16 in

______________________________________________________________

7. Two pieces of pipe are joined end to end. One is 3 ft 8 1/2 in long and the other is 2 ft 6 3/4 in long. What is the total length?

______________________________________________________________

______________________________________________________________

8. A shelf unit needs three boards: 1 ft 4 3/16 in, 2 ft 9 5/8 in and 11 1/2 in. What is the total length of board needed?

______________________________________________________________

______________________________________________________________

## Part C: Subtracting Lengths

9. 9 3/4 in - 4 1/8 in

______________________________________________________________

10. 7 1/4 in - 2 11/16 in

______________________________________________________________

11. A board is exactly 8 ft long. You cut off a piece 3 ft 7 5/8 in long. How long is the piece that is left? Ignore the width of the saw cut.

______________________________________________________________

______________________________________________________________

12. A piece of trim is exactly 10 ft long. You cut two pieces from it, each 3 ft 4 5/8 in long. Each of the two saw cuts turns 1/8 in of the trim into sawdust. How long is the leftover piece?

______________________________________________________________

______________________________________________________________

______________________________________________________________

## Answer Key

### Part A

1. **3 5/16 in.** Five sixteenths past 3 inches. The fraction 5/16 is already in lowest terms.

2. **7 3/4 in.** Twelve sixteenths past 7 inches is 7 12/16 in, and 12/16 reduces to 3/4.

3. **9 7/8 in.** Two sixteenths before 10 inches is 14 sixteenths past 9 inches, because 16 - 2 = 14. That is 9 14/16 in, and 14/16 reduces to 7/8.

4. **4 ft 5 1/2 in.** There are 48 inches in 4 feet, and 53 1/2 - 48 = 5 1/2.

### Part B

5. **6 5/8 in.** Change 1/4 to 2/8. Fractions: 3/8 + 2/8 = 5/8. Inches: 2 + 4 = 6.

6. **9 3/16 in.** Change 7/8 to 14/16. Fractions: 14/16 + 5/16 = 19/16 = 1 3/16. Inches: 5 + 3 + 1 3/16 = 9 3/16.

7. **6 ft 3 1/4 in.** Change 1/2 to 2/4. Fractions: 2/4 + 3/4 = 5/4 = 1 1/4. Inches: 8 + 6 + 1 1/4 = 15 1/4 in, which is 1 ft 3 1/4 in. Feet: 3 + 2 + 1 = 6.

8. **5 ft 1 5/16 in.** Change 5/8 to 10/16 and 1/2 to 8/16. Fractions: 3/16 + 10/16 + 8/16 = 21/16 = 1 5/16. Inches: 4 + 9 + 11 + 1 5/16 = 25 5/16 in, which is 2 ft 1 5/16 in. Feet: 1 + 2 + 2 = 5.

### Part C

9. **5 5/8 in.** Change 3/4 to 6/8. Fractions: 6/8 - 1/8 = 5/8. Inches: 9 - 4 = 5.

10. **4 9/16 in.** Change 1/4 to 4/16. Because 4/16 is smaller than 11/16, borrow 1 inch: 7 4/16 = 6 20/16. Fractions: 20/16 - 11/16 = 9/16. Inches: 6 - 2 = 4.

11. **4 ft 4 3/8 in.** Rewrite 8 ft as 7 ft 11 8/8 in. Fractions: 8/8 - 5/8 = 3/8. Inches: 11 - 7 = 4. Feet: 7 - 3 = 4.

12. **3 ft 2 1/2 in.**
    - Two pieces: 3 ft 4 5/8 in + 3 ft 4 5/8 in = 6 ft 8 10/8 in = 6 ft 9 1/4 in.
    - Two saw cuts: 1/8 + 1/8 = 2/8 = 1/4 in.
    - Total used: 6 ft 9 1/4 in + 1/4 in = 6 ft 9 1/2 in.
    - Left over: rewrite 10 ft as 9 ft 11 2/2 in. Fractions: 2/2 - 1/2 = 1/2. Inches: 11 - 9 = 2. Feet: 9 - 6 = 3.

### Common mistakes to look for

- Leaving a fraction unreduced, such as 12/16 in place of 3/4.
- Regrouping feet and inches as if there were 10 inches in a foot. There are 12.
- In problem 12, forgetting the material lost to the two saw cuts, which gives 3 ft 2 3/4 in.', 'published', 'seed', 0, '2026-10-22T00:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-d52e6a3316884f59', 'theme-and-character-change-discussion-questions-grade-7', 'Theme and Character Change: Discussion Questions for Any Novel', 'discussion-questions', '7', 'ela', 'Eighteen discussion questions on theme and character change that work with any class novel, grouped into three levels of thinking (notice, analyze, evaluate and connect). Includes facilitation tips, sentence stems, a written reflection, and a what-to-listen-for guide.', 'CCSS.ELA-LITERACY.RL.7.2, CCSS.ELA-LITERACY.RL.7.3, CCSS.ELA-LITERACY.SL.7.1', '## How to Use These Questions

These questions fit any novel your class is reading. They work best once students have read at least half of the book, and again at the end.

- **Whole-class discussion (20 to 30 minutes):** Choose 1 or 2 questions from each level. Start at Level 1 to get everyone talking, then move up.
- **Small groups or literature circles:** Give each group one level, or cut the questions apart and let groups draw 3. Have one student record the group''s best evidence.
- **Written response or journal:** Assign one Level 2 or Level 3 question as a paragraph response.
- **Differentiation:** All students should try at least one question from every level. Students who need support can prepare a Level 1 answer in writing before discussion. Students who are ready for more can take any Level 3 question and argue the opposite side.

Before you begin, remind students of the ground rule: every claim needs evidence. Students should have the book open and be ready to point to a page.

## Quick Review for Students

- A **topic** is one or two words: friendship, courage, fairness. A **theme** is a complete sentence that says what the story teaches about that topic: True friends tell each other the truth, even when it is hard.
- A theme is not just about the characters in this book. It is an idea about life that could be true for other people, too.
- A **dynamic character** changes in an important way during the story (in beliefs, attitude, or behavior). A **static character** stays basically the same.
- Characters usually change because of something: a conflict, a choice, a loss, a relationship, or new information. Theme and character change are connected. What the main character learns is often what the reader is meant to learn.

## Level 1: Notice and Recall

These questions ask what the text says. Answers can be found in the book.

1. Describe the main character at the beginning of the novel. What three words best describe this character, and what is one thing the character does or says that shows each one?
2. What does the main character want most at the start of the story? What is standing in the way?
3. List the two or three most important events that have happened to the main character so far. Why did you choose those?
4. What topics or big ideas keep coming up in this book (for example: family, belonging, honesty, power, growing up)? Where do you see them?
5. Find a moment when the main character makes an important decision. What were the choices, and what did the character decide?
6. Which other character has the most influence on the main character? What does this character say or do that matters?

## Level 2: Analyze and Interpret

These questions ask how and why. Answers need evidence and explanation.

7. Compare the main character at the beginning of the novel with the main character now (or at the end). What has changed in the way this character thinks, acts, or treats other people? What has stayed the same?
8. What event or relationship caused the biggest change in the main character? Explain how you know that this was the turning point.
9. Choose one topic from question 4 and turn it into a theme statement: a complete sentence about what the novel says about that topic. What evidence from at least two parts of the book supports your statement?
10. How does the main character''s change help reveal the theme? Finish this sentence and explain it: Because the character learns ______, the reader understands that ______.
11. How does the setting (the time, place, or community) shape the main character''s choices? Would this character have changed in the same way in a different setting?
12. Find a line of dialogue or a short passage that you think captures the theme of the book. Read it aloud. Why did you choose it?
13. Choose a character who does NOT change. Why do you think the author kept this character the same? How does this character make the main character''s change easier to see?

## Level 3: Evaluate and Connect

These questions ask what you think and why it matters. There is more than one defensible answer.

14. Is the main character''s change believable? Did the author give enough reasons for it, or did it happen too quickly or too easily? Defend your opinion with evidence.
15. Did the main character change for the better, for the worse, or both? What was gained, and what was lost?
16. Novels often have more than one theme. Which theme do you think is the MOST important in this book? Try to convince someone who disagrees with you.
17. Do you agree with the novel''s message about life? Describe a situation from real life, history, or another book or movie where this theme holds true, or where it does not.
18. If the main character had made the opposite choice at the turning point, how would the ending be different? Would the theme of the book change? Explain.

## Sentence Stems for Discussion

Post these or give each group a copy.

- I think the theme is ______ because on page ____ ...
- At the beginning, the character ______, but later ______.
- The turning point was when ______, because after that ...
- I agree with ______, and I would add ...
- I see it differently because ...
- Can you show us where in the book you found that?
- That connects to the theme because ...

## Written Reflection (Exit Slip)

After the discussion, answer in 3 to 5 sentences:

What is one idea you heard from a classmate today that changed or deepened your thinking about the character or the theme? What evidence from the book supports that idea?

______________________________________________

______________________________________________

______________________________________________

______________________________________________

## Answer Key

These questions are open-ended, so answers depend on the novel. Use this guide for what to listen for at each level.

**Level 1 (questions 1 to 6).** Answers should be accurate to the plot and specific. Look for: character traits backed by an action, thought, or line of dialogue rather than physical description alone; a clearly stated goal and obstacle (question 2); events chosen because they affect the character, not just because they are exciting (question 3); topics named as words or short phrases (question 4). If students give a full theme sentence in question 4, note it and return to it in question 9.

**Level 2 (questions 7 to 13).** Strong answers make a claim, cite evidence from more than one part of the book, and explain the connection.

- Question 7: Names a change on the inside (belief, attitude, values), not only a change in situation. Moving to a new house is a change in situation; learning to trust people is a character change.
- Question 8: Identifies a specific cause and shows a before and after.
- Question 9: The theme statement is a complete sentence, is about life in general (no character names), and is not a single word, a command, or a cliche with no support. Weak: Friendship. Weak: The character learns to be brave. Strong: Courage means doing the right thing even when you are afraid.
- Question 10: Explicitly links what the character learns to what the reader understands.
- Question 11: Connects specific features of the setting to specific choices.
- Question 12: The passage chosen actually relates to the stated theme, and the student explains why.
- Question 13: Recognizes that an unchanging character can act as a contrast (a foil) that highlights the main character''s growth, or can represent a force the main character must face.

**Level 3 (questions 14 to 18).** There are no single right answers. Strong answers take a clear position, support it with evidence from the text, respond to other viewpoints, and connect beyond the book where asked. For question 18, listen for the understanding that the theme depends on the character''s choices and their results: a different choice would likely lead to a different lesson.

**Common misunderstandings to correct**

- Confusing topic and theme (a one-word answer is a topic).
- Stating the theme as a plot summary or using character names.
- Describing only outward changes (age, location, appearance) as character change.
- Assuming every book has exactly one correct theme. Any theme is acceptable if the text supports it.

**Quick participation rubric (optional, 4 points)**

| Points | Description |
|---|---|
| 4 | Shares ideas supported by specific evidence from the book AND builds on or respectfully challenges a classmate''s idea |
| 3 | Shares ideas supported by specific evidence from the book |
| 2 | Shares ideas or opinions but with little or no evidence |
| 1 | Listens respectfully but does not contribute, or contributes off topic |', 'published', 'seed', 0, '2026-10-21T17:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-71cb953f2303dba0', 'then-and-now-local-history-interview-project-grade-8', 'Then and Now: Local History Interview Project', 'project', '8', 'social-studies', 'A three-week oral history project in which students interview an older community member, research one aspect of local life, and create a then-and-now comparison showing change and continuity. Includes student steps, a day-by-day timeline, interview tips, a permission form, a note-taking organizer, and a 24-point scoring rubric.', 'C3 Framework D2.His.2.6-8, CCSS.ELA-LITERACY.WHST.6-8.7, CCSS.ELA-LITERACY.SL.8.4', '## Project Overview

History is not only in textbooks. It is in the memories of the people who live in your community. In this project you will interview someone who has lived in your area for a long time (or who lived somewhere else when they were your age), research one part of daily life, and show how that part of life has changed and how it has stayed the same.

**Driving question:** How has life in our community changed over time, and what has stayed the same?

**Length:** 3 weeks (about 10 class periods of lessons and work time, 2 days of presentations, plus an interview outside class)

**You will turn in:**

1. Your interview questions (approved by your teacher before the interview)
2. A signed interview permission form
3. Your interview notes
4. A then-and-now final product
5. A one-page written reflection

## Learning Goals

By the end of this project you will be able to:

- Plan and carry out an oral history interview with respectful, open-ended questions
- Use an interview as a primary source and support it with at least one other source
- Identify examples of change and continuity (things that stayed the same) over time
- Explain possible causes of the changes you found
- Present your findings clearly to an audience

## Step-by-Step Directions

### Step 1: Choose a focus topic

Pick ONE part of daily life to investigate. A narrow topic leads to a better project. Ideas:

- School (classes, rules, lunch, getting to school, technology)
- Work and jobs in our area
- Shopping and local businesses (downtown, markets, malls)
- Transportation and getting around
- Food and family meals
- Games, sports, and free time
- Communication (phones, mail, news)
- Holidays, celebrations, and community events
- The land itself (buildings, farms, parks, roads, neighborhoods)

### Step 2: Find someone to interview

Your interviewee should be an adult who is at least 30 years older than you: a grandparent, relative, neighbor, family friend, coach, faith community member, or school staff member. Ask with a parent or guardian''s help, and always meet in a safe, familiar place with a trusted adult nearby, or interview by phone or video call.

If you cannot find someone, tell your teacher by the Step 2 deadline. Your teacher will help arrange an interview with a school or community volunteer.

### Step 3: Do background research

Before the interview, find at least ONE other source about your topic or your community in the past. Possibilities: the public library''s local history section, the local historical society or museum, old yearbooks in the school library, old photographs, old newspapers, or town and county websites. Write down three facts you learned and where you found them. Background knowledge helps you ask better questions.

### Step 4: Write your interview questions

Write 10 to 12 questions. At least 8 must be open-ended, which means they cannot be answered with yes, no, or a single word. Begin with easy questions, then move to your focus topic, and end with a reflection question. Use the sample questions below for ideas, but write most of your own. Get your questions approved by your teacher before the interview.

### Step 5: Get permission and do the interview

- Explain the project and ask your interviewee to sign the permission form before you begin.
- Plan for 20 to 30 minutes.
- Take notes on the note-taking organizer. Record audio only if the person checks Yes on the form.
- Write down at least two direct quotations, word for word.
- Ask follow-up questions: Can you tell me more about that? What did that look like? How did you feel about it?
- If the person does not want to answer a question, say That''s okay and move on.
- Ask whether they have a photograph or object from that time that you could look at. Take a picture of it only with permission.
- Say thank you. A handwritten thank-you note afterward is required and counts toward your Interview score.

### Step 6: Organize what you learned

Within one day of the interview, reread your notes and fill in anything you remember while it is fresh. Then complete the Then and Now chart on the organizer. Find at least three changes and at least one continuity. For each change, think about WHY it happened (new technology, laws, population growth, businesses opening or closing, cost, and so on).

### Step 7: Create your final product

Choose ONE format:

- **Poster or trifold display** with a then side and a now side
- **Slideshow** of 6 to 8 slides
- **Illustrated magazine-style article** of 400 to 500 words
- **Podcast or video segment** of 3 to 4 minutes, with a written script

Whatever the format, your product must include:

- A title and your focus topic
- A short introduction to your interviewee (first name or initials only, the decade they were your age, and their connection to the community), shared only with their permission
- At least three clear then-and-now comparisons
- At least one example of continuity
- At least two direct quotations from the interview
- At least one fact from your other source, with the source named
- Your explanation of what caused at least one of the changes
- At least two visuals (your own drawings, photographs you took, maps, or images you have permission to use)

### Step 8: Write your reflection

Write one page (about 250 words) answering these questions:

- What surprised you most, and why?
- What is the most important change you found? What do you think caused it?
- What has stayed the same? Why do you think it lasted?
- Is an interview a reliable source of history? What are its strengths and its limits?
- What do you think a student will say about life today when they are interviewed 50 years from now?

### Step 9: Share

Present your product to the class in a 2 to 3 minute talk or during a gallery walk. Be ready to answer one question from the audience.

## Timeline

| Day | In class | Due at the end of the day or for homework |
|---|---|---|
| Week 1, Day 1 | Project launch. Read the directions and rubric. Brainstorm topics and possible interviewees. | Talk with family about who you could interview |
| Week 1, Day 2 | Choose a topic. Mini-lesson: primary and secondary sources. | **Checkpoint 1:** topic and interviewee name turned in |
| Week 1, Day 3 | Background research (library or computer lab). | Three facts and your source recorded |
| Week 1, Day 4 | Mini-lesson: open-ended questions. Draft your questions. Practice interview with a partner. | Draft of 10 to 12 questions |
| Week 1, Day 5 | Revise questions with teacher feedback. Review interview manners and the permission form. | **Checkpoint 2:** final questions approved |
| Week 2, Days 6 to 8 | Regular class lessons. Interviews happen outside class this week. | Complete your interview by Day 9 |
| Week 2, Day 9 | Bring your notes. Complete the Then and Now chart. | **Checkpoint 3:** signed permission form, interview notes, and chart |
| Week 2, Day 10 | Choose your format. Plan or outline your product. | Outline or storyboard |
| Week 3, Day 11 | Work day: build your product. | Keep working at home if needed |
| Week 3, Day 12 | Work day: finish the product. Peer review with the rubric. | Revise using peer feedback. Write your thank-you note. |
| Week 3, Day 13 | Write your reflection. | **Final product and reflection due** |
| Week 3, Days 14 to 15 | Presentations or gallery walk. | Deliver your thank-you note |

## Sample Interview Questions

**Warm-up**

- Where did you grow up, and what years were you in middle school?
- How long have you lived in this community? What brought you or your family here?

**Focus topic (change the wording to fit your topic)**

- What was a typical school day like when you were my age?
- How did you get from place to place?
- Where did your family shop for food and clothes? What were those places like?
- What did you and your friends do for fun?
- What did this neighborhood or town look like back then? What was where the ______ is now?
- What kinds of jobs did most people around here have?

**Reflection**

- What is the biggest change you have seen here in your lifetime?
- What is something about this community that has not changed?
- What do you miss about those days? What is better now?
- What do you wish young people today knew about that time?

## Interview Permission Form

I agree to be interviewed by ______________________ (student) for a school history project. I understand that:

- The student will take notes on what I say.
- My stories may be shared with the student''s class and teacher.
- I may skip any question and may stop the interview at any time.

The student may record audio of the interview:  Yes ____  No ____

The student may use my first name in the project:  Yes ____  No, use initials only ____

The student may photograph items or photos I share:  Yes ____  No ____

Signature: ______________________________  Date: ____________

Parent or guardian of student (signature): ______________________________  Date: ____________

## Note-Taking Organizer

Focus topic: ______________________________

Interview date: ____________  Place or method (in person, phone, video): ______________________

Interviewee (first name or initials): ______________  Decade when they were my age: ____________

**My background research**

Source: ______________________________________________

Three facts I learned:

1. ______________________________________________
2. ______________________________________________
3. ______________________________________________

**Interview notes**

| Question I asked | Notes on the answer |
|---|---|
| | |
| | |
| | |
| | |
| | |
| | |

**Direct quotations (word for word)**

1. ______________________________________________

______________________________________________

2. ______________________________________________

______________________________________________

**Then and Now chart**

| Part of life | Then | Now | Change or continuity? | Possible cause |
|---|---|---|---|---|
| | | | | |
| | | | | |
| | | | | |
| | | | | |

## Scoring Rubric

| Criteria | 4 - Exceeds | 3 - Meets | 2 - Approaching | 1 - Beginning |
|---|---|---|---|---|
| **Preparation and questions** | 10 to 12 thoughtful questions, nearly all open-ended and clearly shaped by background research; all checkpoints met on time | 10 to 12 questions, at least 8 open-ended; background source recorded; checkpoints met | Fewer than 10 questions, or fewer than 8 open-ended; background research incomplete; a checkpoint missed | Few questions, mostly yes or no; no background research; most checkpoints missed |
| **Interview and notes** | Detailed notes for every question, with follow-up questions and three or more direct quotations; signed form and thank-you note | Complete notes with at least two direct quotations; signed form and thank-you note | Notes are brief or incomplete; only one quotation; form or thank-you note missing | Very few notes; no quotations; no signed form |
| **Change and continuity** | Four or more accurate then-and-now comparisons and more than one continuity, each explained with specific detail | At least three clear then-and-now comparisons and one continuity | Two comparisons, or comparisons are vague; continuity missing | One or no comparisons; little understanding of change over time |
| **Evidence and explanation** | Quotations and facts from two or more other sources are woven in and cited; causes of several changes are explained thoughtfully | At least two quotations and one fact from another source, with the source named; cause of at least one change explained | Only one quotation or no outside source; cause of change is stated but not explained | No quotations or outside sources; no causes given |
| **Final product and presentation** | Product is well organized, visually engaging, and nearly error-free; presenter speaks clearly and confidently and answers questions well | Product has all required parts, is neat and organized, with few errors; presenter speaks clearly | Product is missing one or two required parts or has many errors; presentation is hard to follow | Product is incomplete or disorganized; little or no presentation |
| **Reflection** | All five questions answered with insight, including a careful evaluation of interviews as historical sources | All five questions answered in complete, thoughtful sentences | Some questions answered, or answers are very brief | Reflection is missing or only one or two sentences |

**Total: ______ / 24**

| Points | Grade |
|---|---|
| 22 to 24 | A |
| 19 to 21 | B |
| 17 to 18 | C |
| 14 to 16 | D |
| 13 or below | Not yet: revise and resubmit |

## Teacher Notes

- **Family communication:** Send the project overview and permission form home on Day 1 so families have a full week to help arrange an interview.
- **Access and equity:** Some students will not have an older relative or neighbor available. Recruit a few volunteers in advance (school staff, retired teachers, library or historical society volunteers, senior center members) and offer in-school interview times. Group interviews of one volunteer by 2 or 3 students work well, as long as each student writes his or her own questions and product.
- **Newcomers and families from elsewhere:** A then-and-now comparison between an interviewee''s childhood community and your community today is a valid and often rich version of the project.
- **Privacy:** Students use first names or initials only and should not include addresses, phone numbers, or other personal details in any product. Check permission forms before products are displayed outside the classroom.
- **Sensitive memories:** Remind students that some memories may be difficult. Interviewees may skip any question, and students should come to you if an interview raises something that worries them.
- **Extension:** Compile the class''s then-and-now findings into a shared timeline or a class book to donate to the school or public library.', 'published', 'seed', 0, '2026-10-21T10:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-bfcb1d627e12ce86', 'two-step-addition-subtraction-word-problems-grade-2', 'Two-Step Addition and Subtraction Word Problems Within 100', 'word-problems', '2', 'math', 'Twelve two-step word problems using addition and subtraction within 100, with space to show both steps. The answer key shows the equation for each step.', 'CCSS.MATH.CONTENT.2.OA.A.1', '**Name:** ______________________  **Date:** ____________

**Directions:** Each problem has **two steps**. Read the problem carefully. Show your work for Step 1 and Step 2. You may draw a picture, use a number line, or write equations. Write your final answer on the line with a label (for example, 12 apples).

**Helpful steps:**

- Read the whole problem. What is it asking?
- Solve the first part.
- Use that answer to solve the second part.
- Check: Does my answer make sense?

1. Maya has 24 stickers. Her friend gives her 18 more stickers. Then Maya gives 15 stickers to her brother. How many stickers does Maya have now?

   Step 1:

   Step 2:

   Answer: ______________________

2. There are 35 riders on a bus. At the first stop, 12 riders get off. At the second stop, 9 riders get on. How many riders are on the bus now?

   Step 1:

   Step 2:

   Answer: ______________________

3. Leo is reading a book that has 60 pages. He read 16 pages on Monday and 27 pages on Tuesday. How many pages does Leo have left to read?

   Step 1:

   Step 2:

   Answer: ______________________

4. A baker made 48 muffins. She sold 19 muffins in the morning and 14 muffins in the afternoon. How many muffins does she have left?

   Step 1:

   Step 2:

   Answer: ______________________

5. A basket holds 28 red apples and 34 green apples. The class eats 25 of the apples. How many apples are left in the basket?

   Step 1:

   Step 2:

   Answer: ______________________

6. Sam has 50 cents. He spends 22 cents on a pencil and 15 cents on an eraser. How many cents does Sam have left?

   Step 1:

   Step 2:

   Answer: ______________________

7. The second graders planted flowers in the school garden. They planted 17 tulips, 26 daisies, and 19 roses. How many flowers did they plant in all?

   Step 1:

   Step 2:

   Answer: ______________________

8. Nina had 73 beads. She used 38 beads to make a necklace. Then she bought 20 more beads. How many beads does Nina have now?

   Step 1:

   Step 2:

   Answer: ______________________

9. There were 45 ducks on a pond. First, 16 ducks flew away. Then 8 more ducks flew away. How many ducks are still on the pond?

   Step 1:

   Step 2:

   Answer: ______________________

10. The Blue Team scored 31 points in the first half of a game and 29 points in the second half. The Red Team scored 52 points in the whole game. How many more points did the Blue Team score than the Red Team?

    Step 1:

    Step 2:

    Answer: ______________________

11. A shelf can hold 90 books. There are 42 books on the shelf. The librarian puts 25 more books on the shelf. How many more books can still fit on the shelf?

    Step 1:

    Step 2:

    Answer: ______________________

12. Omar has 36 toy cars. Eli has 9 fewer toy cars than Omar. How many toy cars do the two boys have together?

    Step 1:

    Step 2:

    Answer: ______________________

## Answer Key

Students may solve the steps in a different order or use a different strategy. Accept any correct method that leads to the correct final answer.

1. Step 1: 24 + 18 = 42. Step 2: 42 - 15 = 27. **27 stickers**
2. Step 1: 35 - 12 = 23. Step 2: 23 + 9 = 32. **32 riders**
3. Step 1: 16 + 27 = 43. Step 2: 60 - 43 = 17. **17 pages**
4. Step 1: 48 - 19 = 29. Step 2: 29 - 14 = 15. **15 muffins** (Another way: 19 + 14 = 33, then 48 - 33 = 15.)
5. Step 1: 28 + 34 = 62. Step 2: 62 - 25 = 37. **37 apples**
6. Step 1: 50 - 22 = 28. Step 2: 28 - 15 = 13. **13 cents** (Another way: 22 + 15 = 37, then 50 - 37 = 13.)
7. Step 1: 17 + 26 = 43. Step 2: 43 + 19 = 62. **62 flowers**
8. Step 1: 73 - 38 = 35. Step 2: 35 + 20 = 55. **55 beads**
9. Step 1: 45 - 16 = 29. Step 2: 29 - 8 = 21. **21 ducks** (Another way: 16 + 8 = 24, then 45 - 24 = 21.)
10. Step 1: 31 + 29 = 60. Step 2: 60 - 52 = 8. **8 more points**
11. Step 1: 42 + 25 = 67. Step 2: 90 - 67 = 23. **23 more books**
12. Step 1: 36 - 9 = 27 (Eli''s cars). Step 2: 36 + 27 = 63. **63 toy cars**

**Teacher notes**

- A common error is stopping after one step. In problem 12, many students answer 27 (Eli''s cars) and forget to add Omar''s cars. Ask, ''Did you answer the question the problem asked?''
- In problem 10, watch for students who add all three numbers. Have them underline the question first.
- For support, assign problems 1, 2, 5, 8, and 9, which follow the story in order. For a challenge, ask students to write their own two-step problem with an answer of 40.', 'published', 'seed', 0, '2026-10-21T03:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-58bd1476e88aeb7f', 'two-step-equations-quiz-grade-7', 'Two-Step Equations Quiz', 'quiz', '7', 'math', 'A 15-point quiz on solving two-step equations with integers, fractions, decimals, and negative coefficients, plus two word problems and an error-analysis item. Answer key shows every step and a check.', 'CCSS.MATH.CONTENT.7.EE.B.4.A', '**Name:** ______________________  **Date:** ____________

**Directions:** Solve each equation. Show both steps of your work and circle your final answer. Each problem is worth 1 point (15 points total). You may check your answers by substituting them back into the original equation.

## Part A: Solve

1. 2x + 5 = 17

______________________________________________

2. 3x - 4 = 11

______________________________________________

3. 5n + 8 = -12

______________________________________________

4. -4y + 7 = 31

______________________________________________

5. x/3 + 2 = 9

______________________________________________

6. m/4 - 6 = -1

______________________________________________

7. 10 = 6 - 2k

______________________________________________

8. 0.5a + 3 = 7.5

______________________________________________

9. (x + 4)/2 = 9

______________________________________________

10. 3(p - 2) = 21

______________________________________________

11. (2/3)w - 5 = 7

______________________________________________

12. -x - 9 = 4

______________________________________________

## Part B: Write an Equation and Solve

For each problem, define a variable, write a two-step equation, and solve it. Answer in a complete sentence.

13. A gym charges a one-time joining fee of $25 plus $15 per month. Dana has paid the gym a total of $130. For how many months has Dana been a member?

Equation: ______________________________

______________________________________________

______________________________________________

14. The perimeter of a rectangle is 46 cm. Its length is 15 cm. What is its width?

Equation: ______________________________

______________________________________________

______________________________________________

## Part C: Find the Mistake

15. A student solved 4x - 6 = 18 this way:

    Step 1: 4x = 12

    Step 2: x = 3

    Explain the mistake the student made, then solve the equation correctly.

______________________________________________

______________________________________________

______________________________________________

## Answer Key

**Part A**

1. x = 6. Subtract 5: 2x = 12. Divide by 2: x = 6. Check: 2(6) + 5 = 17.
2. x = 5. Add 4: 3x = 15. Divide by 3: x = 5. Check: 3(5) - 4 = 11.
3. n = -4. Subtract 8: 5n = -20. Divide by 5: n = -4. Check: 5(-4) + 8 = -12.
4. y = -6. Subtract 7: -4y = 24. Divide by -4: y = -6. Check: -4(-6) + 7 = 24 + 7 = 31.
5. x = 21. Subtract 2: x/3 = 7. Multiply by 3: x = 21. Check: 21/3 + 2 = 9.
6. m = 20. Add 6: m/4 = 5. Multiply by 4: m = 20. Check: 20/4 - 6 = -1.
7. k = -2. Subtract 6: 4 = -2k. Divide by -2: k = -2. Check: 6 - 2(-2) = 6 + 4 = 10.
8. a = 9. Subtract 3: 0.5a = 4.5. Divide by 0.5: a = 9. Check: 0.5(9) + 3 = 7.5.
9. x = 14. Multiply by 2: x + 4 = 18. Subtract 4: x = 14. Check: (14 + 4)/2 = 9.
10. p = 9. Divide by 3: p - 2 = 7. Add 2: p = 9. (Also accept distributing first: 3p - 6 = 21, 3p = 27, p = 9.) Check: 3(9 - 2) = 21.
11. w = 18. Add 5: (2/3)w = 12. Multiply by 3/2 (or divide by 2/3): w = 18. Check: (2/3)(18) - 5 = 12 - 5 = 7.
12. x = -13. Add 9: -x = 13. Divide (or multiply) by -1: x = -13. Check: -(-13) - 9 = 13 - 9 = 4.

**Part B**

13. Let m = the number of months. Equation: 15m + 25 = 130. Subtract 25: 15m = 105. Divide by 15: m = 7. Dana has been a member for 7 months. Check: 15(7) + 25 = 105 + 25 = 130.
14. Let w = the width in centimeters. Equation: 2w + 2(15) = 46, or 2w + 30 = 46. Subtract 30: 2w = 16. Divide by 2: w = 8. The width is 8 cm. Check: 2(8) + 2(15) = 16 + 30 = 46. (Also accept 2(w + 15) = 46.)

**Part C**

15. The student subtracted 6 from 18 in Step 1. To undo subtracting 6, you must ADD 6 to both sides. Correct solution: 4x - 6 = 18; add 6: 4x = 24; divide by 4: x = 6. Check: 4(6) - 6 = 24 - 6 = 18. (The student''s answer does not check: 4(3) - 6 = 6, not 18.)

**Scoring guide:** 15 points total. For problems 13 and 14, give half credit for a correct equation with an arithmetic error. For problem 15, give half credit for the correct answer x = 6 without an explanation of the mistake.

| Score | Percent |
|---|---|
| 15 | 100% |
| 14 | 93% |
| 13 | 87% |
| 12 | 80% |
| 11 | 73% |
| 10 | 67% |
| 9 | 60% |', 'published', 'seed', 0, '2026-10-20T20:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-03fee8091db984b4', 'unit-circle-radian-measure-quiz-grade-11', 'Unit Circle and Radian Measure Quiz', 'quiz', '11', 'math', 'A ten-question precalculus quiz on converting between degrees and radians, exact values of sine, cosine and tangent on the unit circle, reference angles and arc length. Six multiple choice and four short answer questions, 12 points, with a worked answer key.', '', '**Name:** ______________________  **Date:** ____________

**Directions:** No calculator. Give exact values, such as sqrt(3)/2 or 5pi/6, not decimals. For questions 1 to 6, circle the one correct answer. For questions 7 to 10, write your answer on the line and show your work. The quiz is worth 12 points.

## Multiple Choice (1 point each)

1. What is 150 degrees in radians?

   - A. 2pi/3
   - B. 3pi/4
   - C. 5pi/6
   - D. 7pi/6

2. What is 7pi/4 radians in degrees?

   - A. 225 degrees
   - B. 270 degrees
   - C. 300 degrees
   - D. 315 degrees

3. What is the exact value of sin(pi/3)?

   - A. 1/2
   - B. sqrt(2)/2
   - C. sqrt(3)/2
   - D. sqrt(3)

4. What is the exact value of cos(5pi/6)?

   - A. -sqrt(3)/2
   - B. -1/2
   - C. 1/2
   - D. sqrt(3)/2

5. Which point on the unit circle matches the angle 5pi/4?

   - A. (sqrt(2)/2, -sqrt(2)/2)
   - B. (-sqrt(2)/2, -sqrt(2)/2)
   - C. (-sqrt(2)/2, sqrt(2)/2)
   - D. (-1/2, -sqrt(3)/2)

6. What is the exact value of tan(2pi/3)?

   - A. -sqrt(3)
   - B. -sqrt(3)/3
   - C. sqrt(3)/3
   - D. sqrt(3)

## Short Answer

7. (1 point) What is the exact value of sin(3pi/2)?

______________________________________________________________

8. (1 point) What is the reference angle for 7pi/6? Give your answer in radians.

______________________________________________________________

9. (2 points) Find every angle t, with t at least 0 and less than 2pi, for which cos(t) = -1/2.

______________________________________________________________

______________________________________________________________

10. (2 points) A circle has a radius of 6 cm. Find the length of the arc cut off by a central angle of 2pi/3 radians. Leave your answer in terms of pi and include the unit.

______________________________________________________________

______________________________________________________________

## Answer Key

Total: 12 points.

1. **C. 5pi/6.** Multiply degrees by pi/180: 150pi/180 reduces to 5pi/6. (1 point)

2. **D. 315 degrees.** Multiply radians by 180/pi: 7 times 180 / 4 = 1260 / 4 = 315. (1 point)

3. **C. sqrt(3)/2.** The angle pi/3 is 60 degrees, and its point on the unit circle is (1/2, sqrt(3)/2). Sine is the y-coordinate. (1 point)

4. **A. -sqrt(3)/2.** The angle 5pi/6 is 150 degrees, in Quadrant II, with reference angle pi/6. Cosine is negative in Quadrant II, and cos(pi/6) = sqrt(3)/2. (1 point)

5. **B. (-sqrt(2)/2, -sqrt(2)/2).** The angle 5pi/4 is 225 degrees, in Quadrant III, with reference angle pi/4. Both coordinates are negative in Quadrant III. (1 point)

6. **A. -sqrt(3).** The point for 2pi/3 is (-1/2, sqrt(3)/2). Tangent is y divided by x: (sqrt(3)/2) / (-1/2) = -sqrt(3). (1 point)

7. **-1.** The angle 3pi/2 is 270 degrees, and its point on the unit circle is (0, -1). Sine is the y-coordinate. (1 point)

8. **pi/6.** The angle 7pi/6 is in Quadrant III, so subtract pi: 7pi/6 - 6pi/6 = pi/6. (1 point)

9. **t = 2pi/3 and t = 4pi/3.** Cosine equals 1/2 at the reference angle pi/3. Cosine is negative in Quadrants II and III, so t = pi - pi/3 = 2pi/3 and t = pi + pi/3 = 4pi/3. Give 1 point for each correct angle, and take off 1 point if any extra angle is listed. (2 points)

10. **4pi cm.** Arc length is radius times the angle in radians: 6 times 2pi/3 = 12pi/3 = 4pi cm, which is about 12.6 cm. Give 1 point for the correct setup and 1 point for the answer 4pi with the unit. (2 points)', 'published', 'seed', 0, '2026-10-20T13:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
INSERT INTO resources (id, slug, title, type, grade, subject, summary, standards, body, status, source, views, created_at) VALUES ('seed-7648a2985df1cd6b', 'water-cycle-lesson-plan-grade-4', 'The Water Cycle Lesson Plan with Bag-on-the-Window Demonstration', 'lesson-plan', '4', 'science', 'A 45-minute lesson that teaches evaporation, condensation, precipitation, and collection using a simple water-cycle-in-a-bag demonstration taped to a window. Includes timed steps, vocabulary, an observation log, differentiation, and a 5-question exit ticket with answer key.', '', '## Overview

**Time:** 45 minutes, plus two short follow-up observations (2 to 3 minutes each) later the same day and the next day

**Big idea:** Earth''s water is always moving. Energy from the Sun and the pull of gravity move water from the surface to the air and back again, over and over. This never-ending path is called the water cycle.

## Objectives

By the end of the lesson, students will be able to:

- Name and describe four stages of the water cycle: evaporation, condensation, precipitation, and collection.
- Explain that the Sun provides the energy that drives the water cycle.
- Use a model (a sealed bag of water on a window) to show how water changes form and moves, and tell how the model is like and unlike the real water cycle.
- Draw and label a diagram of the water cycle with arrows that show the direction water moves.

## Materials

- 2 clear zip-top plastic bags, quart or gallon size (one for the class demonstration, one prepared the day before if possible)
- Water, about 1/4 cup (60 mL) per bag
- Blue food coloring, 2 to 3 drops per bag (optional, makes the water easier to see)
- Permanent marker
- Wide clear tape or packing tape
- A window that gets direct sunlight for part of the day
- Measuring cup
- Chart paper or board and markers
- Plain paper and pencils for student diagrams (colored pencils optional)
- One copy per student of the Exit Ticket (the section near the end of this plan)

## Before the Lesson

- **Strongly recommended:** Set up one bag the afternoon before and tape it to a sunny window. Droplets take from about an hour to a full day to form, depending on sunlight and temperature. A bag prepared ahead lets students see results during the lesson.
- If you cannot prepare a bag ahead, teach the lesson in the morning and plan the first follow-up observation for the end of the school day.
- No sunny window? Tape the bag near a warm (not hot) spot, or place it under a desk lamp. It will work more slowly on cloudy days.
- Write the four vocabulary words on the board or chart paper.

## Vocabulary

| Word | Student-friendly meaning | Hand motion |
|---|---|---|
| evaporation | Liquid water warms up and changes into a gas called water vapor, which rises into the air. You cannot see water vapor. | Wiggle fingers upward |
| condensation | Water vapor cools and changes back into tiny drops of liquid water. This is how clouds form. | Bring hands together to make a cloud shape |
| precipitation | Water falls from clouds to the ground as rain, snow, sleet, or hail. | Wiggle fingers downward |
| collection | Water gathers in oceans, lakes, rivers, and under the ground. | Cup hands together like a bowl |

## Lesson Steps

### 1. Engage: The Disappearing Puddle (5 minutes)

1. Ask: ''After it rains, there are puddles on the playground. A day later, they are gone. Where did the water go?''
2. Give students 1 minute to turn and talk with a partner.
3. Take 3 or 4 ideas and write them on the board without saying which are right. Expect answers such as ''it soaked into the ground,'' ''it dried up,'' and ''the Sun took it.''
4. Tell students: ''Today we will build a model that helps us see where the water goes, and we will learn why the same water has been used again and again for millions of years.''

### 2. Demonstration: Water Cycle in a Bag (10 minutes)

1. Hold up an empty zip-top bag. With the permanent marker, draw a Sun and a cloud near the top of the bag and wavy lines for water near the bottom. Let a student help.
2. Have a student measure about 1/4 cup of water. Add 2 to 3 drops of blue food coloring if you are using it. Pour the water into the bag.
3. Press out most of the extra air and seal the bag completely. Check the seal.
4. Tape the bag flat against the sunny window, with the zip seal at the top. Tape all the way across the top edge so it does not slip.
5. Ask students to predict in their notebooks: ''What do you think will happen to the water in the bag over the next day? Draw or write your prediction.''
6. Now show the bag you prepared the day before. Give students a minute to look closely. Ask:
   - ''What do you notice on the inside of the bag?'' (small drops of water, fog, drops running down the sides)
   - ''The water started at the bottom. How did drops get up near the top?''
   - ''Is the bag still sealed? Could water have gotten in or out?'' (No. It is the same water.)
7. Tell students they will come back to these questions after learning four science words.

### 3. Mini-Lesson: The Four Stages (12 minutes)

Draw a simple landscape on chart paper as you teach: an ocean or lake, land with a hill, a cloud, and the Sun. Add one labeled arrow for each stage.

1. **Evaporation (3 minutes).** Say: ''The Sun warms water in oceans, lakes, rivers, and puddles. Some of the liquid water changes into a gas called water vapor and rises into the air. We cannot see water vapor.'' Draw arrows going up from the water. Connect to the puddle: most of the puddle evaporated, and some soaked into the ground. Teach the hand motion.
2. **Condensation (3 minutes).** Say: ''High in the sky, the air is colder. When water vapor cools, it changes back into tiny drops of liquid water. Billions of tiny drops together make a cloud.'' Label the cloud. Everyday example: drops that form on the outside of a cold glass of water, or a foggy bathroom mirror after a shower. Teach the hand motion.
3. **Precipitation (2 minutes).** Say: ''The tiny drops in a cloud bump into each other and join. When the drops get too heavy to stay up, they fall. Gravity pulls them down as rain. If it is cold enough, they fall as snow, sleet, or hail.'' Draw rain falling from the cloud. Teach the hand motion.
4. **Collection (2 minutes).** Say: ''The water lands and collects. Some flows downhill into streams, rivers, lakes, and the ocean. That is called runoff. Some soaks into the ground and becomes groundwater.'' Draw arrows flowing down the hill to the water. Teach the hand motion.
5. **Put it together (2 minutes).** Trace the full loop with your finger and ask, ''Then what happens?'' (The Sun warms the water and it evaporates again.) Stress that a cycle has no beginning and no end. Have the class do all four hand motions in order while saying the words, twice.

**Misconceptions to correct as you teach:**

- Clouds are not water vapor. Water vapor is an invisible gas. Clouds are made of tiny drops of liquid water or tiny ice crystals that we can see.
- Water does not disappear when it evaporates. It is still there, in the air, as a gas.
- Water does not need to boil to evaporate. Evaporation happens at everyday temperatures, just more slowly.

### 4. Guided and Independent Practice: Connect the Model and Draw the Cycle (10 minutes)

1. **Connect to the bag (3 minutes).** Go back to the prepared bag. Ask partners to match what they see to the four words. Then confirm as a class:
   - Water at the bottom of the bag warmed by sunlight and turning into vapor = evaporation
   - Fog and small drops forming on the inside of the bag = condensation
   - Drops growing bigger and running down the sides = precipitation
   - Water gathering again at the bottom = collection
2. Ask: ''How is our bag different from the real water cycle?'' (Sample answers: there are no real clouds, the drops slide down the plastic instead of falling through the air, there is no land, plants, or wind, and it is much smaller.) Tell students that every model is like the real thing in some ways and different in others.
3. **Draw and label (7 minutes).** Each student draws a water cycle diagram on plain paper. The diagram must include:
   - the Sun
   - a body of water and some land
   - a cloud
   - four arrows that make a loop
   - the four labels: evaporation, condensation, precipitation, collection
4. Walk around and check that the arrows point the right way: up for evaporation, down for precipitation.

### 5. Exit Ticket and Wrap-Up (8 minutes)

1. Hand out the Exit Ticket. Students work alone for about 6 minutes.
2. Collect the tickets and diagrams.
3. Close by returning to the opening question: ''So where did the puddle go?'' Call on one student to answer using the word evaporation.
4. Remind students that the class will check the new bag later today and tomorrow.

## Follow-Up Observations

Check the class bag at the end of the day and again the next day. Have students record what they see in a table like this one in their notebooks.

| When | What I see in the bag | Water cycle stage I can see |
|---|---|---|
| Right after setup | | |
| End of the day | | |
| Next day | | |

**What to expect:** Right after setup, all of the water sits at the bottom and the inside of the bag is clear. Within a few hours in sunlight, the inside of the bag looks foggy and small drops appear, mostly near the top. By the next day, larger drops have formed and some have run down the sides in streaks back to the water at the bottom. If food coloring was used, the drops on the sides are clear, not blue, because the coloring is left behind when water evaporates.

## Differentiation

### For students who need more support

- Give a partly finished diagram with the picture already drawn and a word bank of the four terms. The student adds arrows and labels.
- Provide sentence frames: ''First, the Sun heats the water and it ______. Next, the water vapor cools and ______ into clouds. Then, water falls as ______. Last, the water ______ in lakes and oceans.''
- Keep using the hand motions. Let students show a stage with a motion before saying or writing the word.
- On the Exit Ticket, read the questions aloud and allow students to answer question 5 by speaking or by drawing.

### For students who are ready for more

- Add two more terms to the diagram: **runoff** (water that flows over the land into streams and rivers) and **groundwater** (water that soaks into the soil and is stored under the ground). Students can also research **transpiration** (plants giving off water vapor through their leaves).
- Writing challenge: ''Write the story of one drop of water as it travels through the whole water cycle. Use all four vocabulary words.''
- Investigation question: ''Would a bag on a shady window work as fast as a bag on a sunny window? Design a fair test.'' Set up a second bag in the shade and compare.
- Ask: ''Why are the drops on the side of the bag clear when the water at the bottom is blue?''

### For English learners

- Post the vocabulary table with a simple sketch beside each word.
- Point out the word parts: evapor-ation contains ''vapor.'' Precipitation is a long word for rain and snow.
- Pair students for the turn-and-talk and the bag matching task.

## Assessment

- **During the lesson:** Listen to partner talk during the bag matching task. Check diagrams for the four labels and correct arrow directions.
- **End of the lesson:** Use the Exit Ticket below. Each question is worth 1 point, except question 5, which is worth 2 points (6 points total). A score of 5 or 6 shows the student met the objectives. A score of 3 or 4 means review the stages the student mixed up. A score of 2 or below means reteach with the hand motions and a labeled diagram.
- **Diagram checklist (4 points):** Sun is shown (1), all four labels are present and spelled closely enough to read (1), arrows form a complete loop (1), arrows point the correct direction (1).

## Safety and Cleanup

- The demonstration uses only water and food coloring. Food coloring can stain clothing, so the teacher should add it.
- Double-check the seal and the tape so the bag does not leak onto the windowsill.
- When finished, pour the water down the drain. Rinse and dry the bag to use again, or throw it away.

## Exit Ticket

**Name:** ______________________  **Date:** ____________

1. What provides the energy that makes water evaporate?

________________________________________________________________

2. Which word names the change from liquid water to water vapor?

   - A. condensation
   - B. precipitation
   - C. evaporation
   - D. collection

3. In our bag model, small drops of water formed on the inside of the bag near the top. Which stage of the water cycle does this show?

________________________________________________________________

4. Name two forms of precipitation.

________________________________________________________________

5. Why is the movement of water on Earth called a **cycle**? Use at least two of the vocabulary words in your answer.

________________________________________________________________

________________________________________________________________

________________________________________________________________

## Answer Key

**Exit Ticket**

1. The Sun (also accept heat from the Sun, sunlight, or solar energy).
2. C. evaporation
3. Condensation. The water vapor cooled when it touched the plastic and changed back into drops of liquid water.
4. Any two of these: rain, snow, sleet, hail. (Also accept freezing rain or drizzle.)
5. Sample answer (2 points): It is called a cycle because it happens over and over and never ends. Water evaporates into the air, condenses into clouds, falls as precipitation, collects in oceans and lakes, and then evaporates again. Give 1 point for the idea that the process repeats or has no end. Give 1 point for correctly using at least two vocabulary words.

**Bag model matching (Step 4)**

- Water at the bottom warming and turning to vapor: evaporation
- Fog and small drops forming on the inside of the bag: condensation
- Large drops running down the sides: precipitation
- Water gathering at the bottom again: collection

**Extension question:** The drops on the sides of the bag are clear because only the water evaporates. The food coloring is left behind in the water at the bottom.', 'published', 'seed', 0, '2026-10-20T06:00:00.000Z') ON CONFLICT (id) DO UPDATE SET slug=excluded.slug, title=excluded.title, type=excluded.type, grade=excluded.grade, subject=excluded.subject, summary=excluded.summary, standards=excluded.standards, body=excluded.body;
