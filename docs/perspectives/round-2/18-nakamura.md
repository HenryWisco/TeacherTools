# Ms. Nakamura, district technology and data-privacy director
**Verdict:** Would not approve for the district allow-list as it stands. I would not block it outright, and I would not promote it. It could move to "allowed with a staff advisory" once the privacy pages are finished.

**In one sentence:** The site is honest and light on data, but the privacy and terms pages still carry the owner's unfinished notes, name no contact, and leave out the details I need on ad cookies, the AI provider and children's privacy law.

## What I did
Pages read: /, /privacy, /terms, /about, /support, /tools, /library, /my, /robots.txt, /ads.txt.
One document generated: a Family Email, saved as `18-01-parent-email.md`. It asked about Chromebook use and how to opt out of online accounts, with a district privacy contact.

## Problems found
1. **Unfinished owner notes are published on the legal pages** (blocker).
   - Where: /privacy and /terms.
   - Seen: "Site owner: review this page with a qualified adviser before launch, and add your business name and address." The terms say "Site owner: review this page with a qualified adviser before launch."
   - Fix: Remove these notes. Add the legal entity name, a postal address and a working privacy email before launch.
2. **No usable privacy contact** (blocker).
   - Where: /privacy "Contact".
   - Seen: "Questions or removal requests: the site owner." There is no email, form or named person. The same applies to "Ask the site owner to remove a shared document".
   - Fix: Publish a monitored email address, with a response time for removal requests.
3. **Ads.txt is empty although the site says it runs ads** (major).
   - Where: /ads.txt returns HTTP 200 with a blank body, while /privacy and /about describe ads and Google partners. The home and library pages show "Ad space (home)" and "Ad space (library)" placeholders.
   - Fix: Publish a real ads.txt that lists the authorized sellers, or remove it until ads go live. Name the ad networks used.
4. **The ad and cookie disclosure is too vague** (major).
   - Where: /privacy "Cookies and advertising".
   - Seen: "Our advertising partners, including Google, may still use cookies to deliver and measure ads."
   - Problem: I cannot tell which vendors run, whether they use device identifiers or fingerprinting, or whether a consent banner appears. I saw no banner, cookie table or opt-out link in the page text.
   - Fix: List each vendor, the cookies it sets, how long they last, and what each is for. Describe how ads are limited for school networks and users. Add a consent control where the law requires one. Confirm that the "personalized ads off" claim is a setting applied with each ad network, not just a statement.
5. **The wording contradicts itself on tracking** (major).
   - Where: the home page says "nothing is collected about students", and /about says "No record of who made what". /privacy describes a cookie-linked daily usage counter and a one-day hashed network address.
   - Problem: The site does collect pseudonymous identifiers. It also never says what a hashed-IP counter is retained for or for how long.
   - Fix: Say plainly "we collect a random ID and a hashed IP for abuse limits, kept for X days". Give the retention period for each item. Remove or qualify the absolute claims.
6. **The AI provider is named but its handling of data is not explained** (major).
   - Where: /privacy "What we collect".
   - Seen: "sent to our AI provider (Anthropic)... not stored by us".
   - Problem: Nothing says whether Anthropic retains prompts, trains on them, or processes them in the US. No other sub-processors are listed, such as hosting, email, analytics or ad vendors.
   - Fix: Add a sub-processor list. State the provider's retention and training terms. Say where data is processed.
7. **No statement on children's privacy law, FERPA, or a data-privacy agreement path** (major).
   - Where: /privacy and /terms.
   - Problem: The site says "not directed to children", but it names no law (COPPA, FERPA, state student-privacy laws). It has no governing law and no state, UK or EU data-subject rights. Districts usually need a DPA or a "no student data" attestation to put a tool on a list.
   - Fix: Add a short compliance statement. Offer a downloadable attestation or standard DPA. State that no student PII is accepted and what happens if some is entered by mistake.
8. **The only protection against student names is a warning** (minor).
   - Where: the footer, /privacy, and the "reference" text box on the home page.
   - Seen: "Only paste text you have right to use, and leave out student names." The generated email told families to "include your child's name" in the opt-out, which is fine for a teacher template. But nothing on the site blocks pasted names or warns when it sees them.
   - Fix: Add a visible check or warning when text looks like personal data, or state outright that no such check exists.
9. **Library reviews and shared-document handling are thinly described** (minor).
   - Where: /library, "reviewed before being listed", and /privacy "stored and, after review, published".
   - Problem: I do not know who reviews, against what, or how long shared text is kept before review.
   - Fix: Name the review process and the retention of pending submissions.
10. **Affiliate links and email sponsors appear only in the fine print** (minor).
    - Where: affiliate links are in /privacy and /about. Email sponsorship is in /about.
    - Fix: Give a plain disclosure on any page that carries a commercial link, and say whether sponsors in the weekly email can see subscriber data.
11. **The newsletter signup sits on every page with no purpose or retention statement beyond "never sell"** (minor).
    - Where: footer.
    - Fix: Name the email service provider and the retention period, and say what happens on unsubscribe.
12. **/my needs JavaScript and its storage is not described in the privacy page's cookie list** (minor).
    - Seen: "This page needs JavaScript switched on." The privacy page says it uses "browser storage" for documents, but its cookie section lists only two cookies.
    - Fix: List local storage as its own item so a filter or audit tool sees it.

## What worked
- No accounts, and the privacy page's short summary is clear and consistent with /about.
- Ads are said to be absent on printed documents and beside family, report-comment, IEP and differentiation tools. That is a good line for sensitive tools.
- The generated Family Email used placeholders for every name and contact, and asked for no personal data. It also offered an alternative assignment for opt-outs.
- /robots.txt keeps /admin and /api/ out of search indexing.
- The plain statements "18+" and "not for students" are repeated on every page.

## What I could not check
- Real network traffic: which trackers and cookies actually load, and whether a consent banner appears.
- Whether the ad slots will load third-party scripts once live.
- The hashed IP and cookie claims, which I cannot verify from the pages.
- Whether Word, Share or Copy buttons send content anywhere.
- The Anthropic retention terms.

## What I would say to a colleague about this site
"It is a one-person site, not yet launched. The pages are honest about not holding student data, but they are still drafts. They have no contact, no vendor list, an empty ads.txt, and the owner's own to-do notes are visible. Don't allow-list it for students (it says it is not for them). For teachers, hold off until the owner fixes the privacy page and gives us a contact and a vendor list. After that I would be comfortable with a staff advisory that says no student names, ever."
