# WISP submission — morning review (faithfulness pass)

**Live, public, share-ready:** https://wisp-onepersonunicorn.vercel.app
Page returns 200 in a clean browser, OG image works, no login wall. Open it in incognito before you submit anyway (the brief says a link that does not open counts as not submitted).

Last night's job was the one you asked for: **not prettier, but truer** — faithful to the assignment and faithful to what your teammates actually made. Here is everything.

---

## 1. What I changed (your list, done)

- **Prompt Log is now per-section, and even across the team.** Rebuilt as *"Prompt Log & Evidence — one per deliverable"*: an index row for **every part** with its **owner and its own evidence slot** (Name+Logo · Ido, Marketing · Mia, Market · Mei, Video · Yam, Deck · Mei, Cowork · Mia, Stretch · Yam). Your Part 4 is just a **GitHub link in that index, same as everyone** — no inline showcase, no spotlight. (Per your note: you don't get special treatment; you attach a link like the rest of the team.) I also **removed the standalone "Iterations" section** for the same reason — that story lives in your linked prompt log.
- **Reflection is now per-member.** Exactly what you said: each person reflects on **their own part and their own experience**, plus 2 AI-mistakes. Yours is filled (the 4 real cases). Mia / Mei / Ido each have their own card to write in.
- **Sources are now plain, visible citations** (a numbered list you can't miss), not the clever hidden "every claim is sourced" toggle. Removed the "every statistic is sourced and verified" line from the footer too.
- **AI tools are featured up front.** The build section now leads with the **8 distinct AI tools**, each mapped to who used it and for what: **Perplexity** (Mei), **Gemini** (team), **Adobe** (Ido, the logo), **Gamma** (Mei), **Claude / Claude Code** (Yam), **Claude Cowork** (Mia), **Higgsfield** (Yam), **ChatGPT** (Mei). ffmpeg / ImageMagick / **Mixkit** are demoted to a small "not counted as AI tools" footnote — Mixkit is off the headline, as you wanted.
- **Two missing deliverables now have real sections:**
  - **Name + Logo (Part 1)** — the WISP mark, name and tagline shown as fact; *why-WISP and the 2–3 rejected directions left as an Ido slot.* I did **not** invent Ido's rationale.
  - **Marketing & Content (Part 2)** — target audience + brand voice (real, from the team brief + the ad script) + the calendar, with the *marketing brief left as a Mia slot.*
- **Em-dashes** stripped from all site copy again. Your teammates' calendar posts keep theirs (faithful to source).
- Nav now maps cleanly to all 9 parts + Stretch; the sidebar still fits with no double-scroll.

---

## 2. Faithfulness verdict — nothing was invented

I traced **every** factual claim on the page back to a real source, and I had three separate agents re-check it. The short version: **the page is disciplined and honest.**

- **The 4 personas + their quotes** → verbatim from your team's product brief (compiled from your WhatsApp thread). The page also notes honestly that *the pitch deck shows two of the four.*
- **Market numbers** ($13.15B, $30.85B, 9.94% CAGR, 4.19%) → verbatim from Mei's market doc, with her 4 source links.
- **Competitor table, differentiator** → Mei's doc.
- **Brand voice "Never" lines** → the ad's own script.
- **Name + Logo** → presents only the final name/logo/tagline; rationale left to Ido.

**The one real integrity fix:** the **"80%"** stat had no source on the page, and Mei's research deliberately says "prevalent" (no number). I kept 80% (it's in your deck), dropped the word "regularly," and **added a real citation** (80–95% of college students procrastinate — solvingprocrastination.com, summarising published research). ⚠️ Worth knowing: your **deck says 80%** but Mei's **market doc says "prevalent."** That's a team-internal mismatch — you may want to align them.

Other small fixes from the review: removed an invented "most users switch personas in week one" line from the FAQ (zero-user product), corrected one hero call-line to the real brief quote, matched a citation to Mei's exact wording, marked the calendar month "illustrative," fixed a grammar slip, and improved contrast on the "add link" notes.

---

## 3. The real risk is completeness, not quality — ranked team actions

The graders reward process and thinking; your spine (video, both Stretch roles, market sources, tool breadth, honest AI-mistakes, the custom-built page) is strong. What's missing is **other people's parts.** In priority order:

| # | Action | Owner | Why it matters |
|---|---|---|---|
| 1 | **Build the Cowork skill** (Part 8) — it's still a placeholder | **Mia** | New-this-semester flagship; feeds "Thinking outside the box" (25 pts). Currently ungradeable. |
| 2 | **Add a proof-of-work link** (shared chat / screen recording) to Parts 1, 2, 5 (and Mei's research chat for 3) | Ido, Mia, Mei | "A part with no evidence is a part we can't grade." Slots are already on the page. |
| 3 | **NaaS → WISP** across the 12 calendar posts | Mia (her copy) | The posts all say "NaaS"; everything else says "WISP." This is the exact "easy points lost" the brief names (Consistency, 10 pts). I left them verbatim per your "don't rewrite" rule — but a find/replace is ~15 min and high value. **Your call.** |
| 4 | **Each write your Reflection + Contribution statement** (and sign) | Mia, Mei, Ido | 3 of 4 are placeholders. Part 9 is graded per-person. |
| 5 | **2–3 rejected logo/name directions** + why WISP won | Ido | Explicitly required in Part 1. |
| 6 | **The marketing brief** (positioning + channel plan) | Mia | Part 2 asks for it beyond the calendar. |
| 7 | Confirm the **GitHub repo is public** (I checked: it loads 200) and add 2–3 more prompt highlights to the index | all | The repo is the evidence for the video + the full 10–15 prompt log. |

---

## 4. Small decisions for you

- **Team name spelling:** the page says **Mia Nedivi** (matches the photo you gave me); the shared doc spells it "Nadivi." Confirm which is right.
- **Content-calendar authorship:** the page credits the posts to **Mia** (Marketing owner). An old code note said "Ido's doc." Confirm who wrote them so the credit is right (Part 9 grades attribution).
- **Prompt-log bubbles** are still English renderings of the real Hebrew exchanges — keep readable, or swap to verbatim? (unchanged from before.)
- Two calendar posts read a little like testimonials ("one freelance designer switched…", "a paper turned in at 8:47") for a pre-launch product — fine as ad copy, just be aware.

---

## 5. Where things live
Files: `06-landing/` (`index.html`, `styles.css`, `app.js`, `assets/`). Vanilla HTML/CSS/JS, no build step. To redeploy after edits: `cd 06-landing && npx vercel --prod --yes` then re-alias to `wisp-onepersonunicorn.vercel.app` (I can do this for you).
