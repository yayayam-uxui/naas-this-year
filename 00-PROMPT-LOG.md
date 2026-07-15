# Prompt Log — Video / Ad Deliverable
**Company:** Nudge as a Service (NaaS) · **Course:** One Person Unicorn, Reichman University
**Owner of this deliverable:** Yam Meir · **Team:** Mai, Maya, Ido, Yam
**Started:** 14 July 2026

---

## How to read this log

Each entry follows the format the brief asks for:

> **The prompt I wrote → what the output got wrong → the revised prompt → what changed**

Entries are numbered in the order they happened, not in the order they appear in the final video.
Dead ends are kept on purpose. They are the point.

**Companion file:** the full unabridged conversation (every Yam question ↔ every Claude answer) is in [00-CONVERSATION-LOG-VIDEO.md](00-CONVERSATION-LOG-VIDEO.md). This file is the curated rubric-format view; that one is the raw record.

**Tools used in this deliverable (running list — update as we go):**

| Tool | What it was used for | Why this tool and not another |
|---|---|---|
| Claude Code (Claude Fable 5) | Orchestrator: research team, creative direction, storyboard, prompt engineering | Only tool here that can run a multi-agent research team and write files to disk |
| _(TBD)_ | | |

---

## Entry 001 — Framing the whole deliverable
**Date:** 14 July 2026 · **Tool:** Claude Code
**Stage:** Kickoff

### Prompt (abridged — full text preserved below)
> "I want to share a document of my university assignment. I'm doing it with a team — Mai, Maya, Ido and me. We already had a call and split the work. My role is to produce the video. The tools available: Claude, ChatGPT, Codex, Perplexity, Higgsfield, Gemini, Flow by Google — and I'm trying to think whether there's anything else.
> Part of the assignment is to consistently document prompts and process, so create a log file starting from this conversation.
> I think we'll work with Flow, Gemini, Midjourney — but I want to research before. Research video creation for the product I'll describe. Research working styles and innovation in the field: (1) Google omni-channel, (2) storyboards. As part of the process, research skills and agents in the field. Interview and add to the team people with relevant knowledge, with an orchestrator managing everything.
> The assumption is someone has done this before us and our goal is to produce a video fast — but I want a marketing video at Pepsi level, so let's develop it together in ping-pong."

### What I deliberately put INTO the prompt (and why it matters)
- **The full assignment PDF** — so the model optimizes for the rubric, not for a generic "make a cool video."
- **The raw WhatsApp thread** — so it sees the real product debate, the personas, and Ido's voice-sampling idea, not a sanitized summary.
- **A named quality bar** ("Pepsi level") — a vague "make it good" produces vague output.
- **An explicit constraint on process** ("ping-pong", "research before") — this blocks the model from jumping straight to a finished artifact.
- **An admission of uncertainty** ("I'm trying to think whether there's anything else") — invites the model to challenge the tool list instead of accepting it.

### What the first output got wrong
_To be filled in as the conversation proceeds._

### Revised prompt
_To be filled in._

### What changed
_To be filled in._

---

## Entry 002 — Standing up the research team
**Date:** 14 July 2026 · **Tool:** Claude Code (multi-agent)
**Stage:** Research

### The prompt
Five specialist research agents were dispatched in parallel, each with a narrow brief, via a `deep-research` multi-agent workflow (run `wf_d96c0fd2-7b5`): 5 search angles → source fetching → **3-vote adversarial verification per claim** → cited synthesis.
Full briefs are in [`01-research/agent-briefs.md`](01-research/agent-briefs.md).

| Agent | Brief |
|---|---|
| Tool Scout | Map the AI video tool landscape as of July 2026 — which tool wins which shot type |
| Storyboard Analyst | How AI-native storyboarding actually works; consistency techniques |
| Ad Craft Critic | Deconstruct what makes a 60s brand ad "Pepsi-grade"; find reference ads for the nudge/accountability category |
| Google Stack Researcher | Flow / Veo / Vids — real capabilities and limits; resolve the "omni-channel" ambiguity |
| Agents & Skills Researcher | Skills, MCP servers and agentic workflows for video production |

### What the output got wrong
_To be filled in._

### Revised prompt
_To be filled in._

### What changed
_To be filled in._

---

## Entry 003 — Scouting our own tools before trusting the web
**Date:** 14 July 2026 · **Tool:** Claude Code + Higgsfield (via MCP)
**Stage:** Research

### The prompt
Instead of only researching tools on the web (where reviews may be outdated or sponsored), we queried our own Higgsfield account live: first the workflow catalog, then `models_explore` with the actual production need — *"premium cinematic product ad, character consistency across 6-8 shots, spoken dialogue/voice audio"* — then the Marketing Studio preset list.

### What the first output got wrong (for our need)
The workflow catalog offered only `video-explainer` — a narrated, non-photoreal *animated* explainer. Wrong genre for a premium brand ad, and its own docs say "NOT for: product/brand ad (tv-ad)". A naive user would have stopped there and concluded Higgsfield can't do ads.

### The revised approach
Skipped the workflow layer and queried the model layer directly with a specific, constraint-rich query (shot count, consistency, dialogue) instead of "make me an ad."

### What changed
Three real findings that redirect the production plan:
1. **Marketing Studio** — one-click product-ad generation (12–15s segments) with a **TV Spot** preset and a **Before and After** preset — the exact "with us vs. without us" format from our team call. Supports `webproduct` (advertising an app, not a physical item) and `ad_reference` (recreate the scenario of a reference ad).
2. **Seedance 2.0** — reference-driven identity consistency + audio references. Candidate for keeping one protagonist across shots.
3. **Gemini Omni Flash** — a Google video model literally named "Omni" surfaced in the recommendation. Possible resolution of the course brief's mysterious "Omni" tool — flagged for cross-checking against web research before we treat it as fact.

---

## Entry 004 — Human steering: budget reality check
**Date:** 14 July 2026 · **Tool:** Claude Code
**Stage:** Research

### What happened
Mid-research, Yam interjected with two checks: (1) is the process itself being logged, (2) is **Google Flow** actually being researched — "I have 970 credits there."

### Why this entry matters
This is the human steering the orchestra, not the other way around. The 970-credit figure is a *real production constraint* no web research would surface — it converts the tool comparison from abstract ("which tool is best") to operational ("which tool is best **per credit**, and where do we burn our limited Quality generations").

### What changed
- Production budget section added to `00-PRODUCT-BRIEF.md` with an iterate-cheap / finalize-expensive rule.
- Verified in the live workflow journal that the "Google AI video stack" research agent is running (26 Flow/Veo mentions at time of check) — trust but verify, in both directions.

---

## Entry 005 — The research came back: 17 confirmed, 8 refuted
**Date:** 14 July 2026 · **Tool:** Claude Code (106-agent workflow) + WebSearch/WebFetch
**Stage:** Research → Creative

### What happened
The deep-research workflow finished: 5 angles, 24 sources, 120 claims extracted, top 25 verified by 3 adversarial votes each. Full report: [`01-research/research-report.md`](01-research/research-report.md).

### What the output got wrong (and the layer that caught it)
8 of 25 claims were **refuted** by the verification layer — including Higgsfield's own "no post-production needed" marketing claim (0-3) and invented Israel pricing for Google AI tiers (0-3). Without adversarial verification, these would have entered our plan as facts.

### What changed in the plan
1. **Script-first** — the verified Kalshi case shows premium = writing craft, not the generator.
2. **Storyboard-first, image-layer iteration** — 300–400 generations for 15 usable clips is the verified reality; 970 Flow credits can't survive blind re-rolling, so iteration moves to cheap keyframe stills animated via first/last-frame.
3. **"Omni" resolved** — a name collision: Gemini Omni Flash (Google, bundled with Flow) vs Kling's Omni product line. The course brief's "Omni" is ambiguous by nature.

---

## Entry 006 — Direction locked, and a human clarification that reshaped the hook
**Date:** 15 July 2026 · **Tool:** Claude Code + Google Drive (team doc)
**Stage:** Creative

### What happened
Three concept directions were served (see `02-creative/concept-directions.md`). Yam chose **A — "The 6:30 AM Call"**, and clarified what she'd originally meant by "with us vs. without us": a **New Year's resolutions** frame — midnight goal-writing, the embarrassing "so how did it go?", then the year *with* the product.

### What the AI's first output got wrong
Direction B interpreted "with us vs. without us" as a *split-screen format*. Yam's actual intent was a *time-based story frame* (last year vs. this year). Classic ambiguity — the AI picked a visual-format reading of words that meant a narrative structure.

### The revision
Merged her frame into the chosen direction: NYE resolutions as hook + the persona calls as the engine + a one-year-later payoff. Treatment: `02-creative/treatment-this-year.md`.

### What changed
The ad gained a universal, relatable hook (resolutions) without losing the "calls" concept — and the team's brand-voice doc (read from Google Drive) now dictates the exact dialogue lines of the personas, tying the video to the marketing deliverable.

---

## Entry 007 — "Morgan Freeman narrator": adopting the idea, refusing the clone
**Date:** 15 July 2026 · **Tool:** Claude Code
**Stage:** Creative

### What happened
Yam proposed a Morgan-Freeman-style narrator voiceover. Two things came out of it:
1. **An ethics/legal guardrail, set before production:** style-inspired narration (deep, warm, unhurried) — yes; cloning or imitating a real person's voice — no. Voice likeness is protected, Freeman has publicly opposed AI imitations, and in an academic submission this is an integrity issue, not a style choice. The narrator will be an **original generated voice**.
2. **A creative upgrade:** instead of a generic omniscient narrator, the narrator is proposed to be *the EA itself* — the app's devoted assistant narrating its boss's year ("That's my boss…" / "she stops picking up" → "so I started calling"), with the final reveal that the narrator's voice is the voice on her phone. The narration becomes a product demo instead of decoration.

### What changed
Treatment updated with a narrator layer (≤45 words, frame-only, calls untouched). Decision pending: classic omniscient (V1) vs narrator-as-EA (V2).

---

## Entry 009 — Production night: 8 shots, 12 voices, one rough cut
**Date:** overnight 15 July 2026 · **Tools:** Higgsfield MCP (Cinema Studio 3.0, Nano Banana Pro, Seed Audio) + ffmpeg + ImageMagick, orchestrated by Claude Code
**Stage:** Production → Assembly

### What happened
Yam topped up credits twice (→1,100), granted full autonomy, and set the goal: **finished video by morning.**
1. **Engine comparison, then commitment:** Shot 3 was generated on both Seedance 2.0 (fast, 21cr) and Cinema Studio 3.0 (1080p, 60cr) from the same start/end keyframes. Cinema Studio won on cinematic quality → all 8 shots produced on it at 1080p, in waves of 2 (starter-plan video concurrency limit — discovered mid-run).
2. **Every clip QA'd without watching it:** ffmpeg extracted first/middle/last frames from each clip for visual inspection — 8/8 passed on the first take. Zero retakes needed (the keyframe-constrained generation is the reason: start+end frames leave the model little room to fail).
3. **12 voice stems** (Seed Audio, ~0.4cr each): narrator ×5 (Sterling), personas ×4 (Zane/Sloane/Brooks/Elena), friend ×2 (Skye), her line (Maya). Persona calls band-passed 300–3400Hz in ffmpeg = real phone sound.
4. **Cards built locally** (ImageMagick — ffmpeg's drawtext was missing; caught and routed around): "Not this year." turn card + end card on a generated plate, with a [LOGO] slot for Ido.
5. **Assembly** via a reproducible script (`05-final/assemble.sh`): concat → voice mix with per-stem delays + loudnorm → mux. Bold-cut narrator close needed atempo 1.12 to fit its pocket — exactly the timing risk the writers' room predicted.

### Result
**`05-final/NaaS-ThisYear-roughcut-v1.mp4` — 59.0 seconds, 1080p/24, voices placed.** Deliberately left for the human edit: music, ring-motif SFX on the beat, foley (the S6 bag crinkle!), grade, logo.

### Cost of the entire production night
~570 credits total across both nights (balance 1,100 → ~530 remaining): 8×1080p Cinema Studio shots ≈ 490, Seedance pilot 21, 19 images ≈ 40, 12 voice stems ≈ 5.

---

## Entry 010 — Sound design in three rounds: Yam's ear drives the iteration
**Date:** 15 July 2026 (morning) · **Tools:** ffmpeg synthesis → Mixkit (self-found free SFX library) + curl
**Stage:** Post-production

### What happened
Yam watched roughcut-v1 and gave two notes: (1) the silence between voice lines feels empty; (2) in some shots the persona speaks before she picks up the phone — "is that OK because it's an ad?"

### The judgment calls
- **Speak-before-pickup:** kept in the montage shots (voice-over-action is legitimate ad grammar and saves ~2s/shot we don't have) — but **fixed in S6**, where the "I heard the bag" joke requires literal cause-and-effect: crinkle → ring → pickup → line. The stem moved 34.5s → 36.3s.
- **Ambience v2:** with no SFX generator available (Higgsfield audio models are speech-only — verified), a full ambience layer was *synthesized in ffmpeg*: room tone, distant firework thumps, notification buzzes, dual-tone rings, a noise-based crinkle. Bug caught on the way: `amix duration=first` truncated the mix to 5.4s (the first stem's length) — caught by ffprobe duration check, fixed to `duration=longest`.
- **Real SFX v3:** Artlist turned out to be paywalled, so a free alternative was found and scraped autonomously — **Mixkit** (free license, no attribution): marimba ringtone (the film's signature), real firework explosions (lowpassed for through-the-window distance), paper-crumple as the bag crinkle, pen writing (S7), party murmur (S8), footsteps (S4). 10 samples fetched by ID after mapping titles from the page HTML.

### What changed
`NaaS-ThisYear-roughcut-v3.mp4` — 58.9s, real diegetic sound throughout, causality fixed. Still deliberately missing: **music** (taste decision — candidates to be picked with Yam, possibly Suno/Mixkit music) and final beat-locking in the human edit.
**Limitation stated honestly: Claude cannot hear the mixes — levels were set conservatively and Yam is the ears-QA. v1 (clean) and v2 (synth) are both preserved as fallbacks.**

---

## AI Mistakes ledger
_Feeds directly into deliverable #7 (Reflection). At least two real cases required._

| # | What the AI claimed | How I caught it | How I fixed it |
|---|---|---|---|
| 1 | Sources claimed Higgsfield Marketing Studio produces ad-ready output "with no post-production" — the whole 60s ad in one click | 3 independent verification agents were told to refute it; all 3 did (0-3). Higgsfield's own preset docs show 12–15s max per generation | Reclassified Marketing Studio as a *shot generator feeding an edit*, and planned a real edit step (assembly, music, grade) |
| 2 | A fetched source produced specific Israel pricing for Google AI Pro/Ultra (₪74.9/mo, 200 Flow credits, etc.) | Verification 0-3 — the numbers could not be found on any official page | Struck all tier numbers from planning; budget now relies only on Yam's live Flow balance (970 credits) and the official subscriptions page |
| 3 | Higgsfield's workflow catalog implied the only video workflow available is an animated explainer (wrong genre for a brand ad) | Cross-checked the model layer directly with `models_explore` instead of trusting the catalog | Found Marketing Studio, Seedance 2.0 and the `tv_spot` / `before_and_after` presets — which now anchor the production plan |
| 4 | Soul 2.0 silently rewrote every scene prompt into a generic portrait whenever a character reference image was attached (forced `enhance_prompt`) — 9 generations came back as portraits with a drifting identity instead of our scenes; Yam spotted the drift independently in real time | Compared the *returned* job payload prompt against the *sent* prompt (they differed), tried `enhance_prompt: false` — server replied "model does not support this parameter" — confirming a tool limitation, not a prompt problem | Pivoted image engine to **Nano Banana Pro** (Google), which is built for "same person, new scene": 16/16 keyframes correct on the first try each, identity locked to the reference |

---

## Entry 008 — The keyframe factory: a bug, a pivot, and 16 frames
**Date:** overnight 14→15 July 2026 · **Tool:** Claude Code + Higgsfield MCP (Soul 2.0 → Nano Banana Pro)
**Stage:** Production (stills layer)

### The prompt(s)
Character reference first ("The Boss": mid-20s, olive skin, dark curly shoulder-length hair, silver hoops — 2 candidates generated, B chosen for clean frontal geometry), then 16 scene prompts, each: "Using the woman from the reference image (keep her face and hair exactly the same): [scene]" + style tag (cinematic film still, 35mm anamorphic, shallow DOF, film grain).

### What went wrong → how it was fixed
See AI Mistakes #4: Soul 2.0's forced prompt-enhancement destroyed scenes when a reference was attached. Diagnosis: sent-vs-returned prompt diff. Fix: model pivot to Nano Banana Pro (2 credits/frame, 2K).

### What changed
- **16/16 keyframes delivered** to `04-assets/keyframes/` (8 shots × start/end), verified visually: fireworks/teal-gold palette correct, comedy timing readable (chip mid-air, side-eye), on-screen text rendered exactly ("Run a 10K / Finish the portfolio / Save $5,000" and the villain push "Just a friendly reminder: Gym today 💪").
- **Cost of the whole stills layer: ~31 credits** (456 → 424.68), far under the 200-credit night cap.
- Known nit for the edit: the closing frame's phone invented a caller name ("ALEX") — swap/blur in edit or regen once Ido locks the brand name.
- Rate-limit learning: starter plan = max 4 concurrent jobs → generation ran in waves of 4.

---

## Entry 011 — The friend test → v4 (music, labels, voice EQ)
**Date:** 15 July 2026 (night) · **Tools:** Mixkit (scraped), ffmpeg sidechain, ImageMagick
**Stage:** Post-production — feedback round 2

### Context
Yam ran the strongest QA there is: a friend watched the cut with zero context. Verdict: "If you hadn't explained it, I wouldn't have understood what this is." Requests: (1) add music, (2) explain who/what this is. Yam's own viewing notes: the silence is jarring; unclear who or what; can't tell the persona voices apart; "something's missing."

### The decisions (no generation prompts — zero credits spent)
1. **Choosing music without ears:** 6 Mixkit tracks downloaded; energy build measured with ffmpeg volumedetect at 0/22/44s. "The Journey" won (+5.3dB build — mirrors the film's arc). Sidechain compression ducks music under every voice automatically; two alternates rendered for Yam's ear-QA.
2. **Who/what:** persona labels burned into the picture ("HER AI ASSISTANT — PERSONA 01 / THE EGO PUMPER", then 02–04) — the four-persona product structure is now visible, not only audible.
3. **Voice differences:** root-caused instead of regenerated. The cast was already four distinct voices (Zane / Sloane / Brooks / Elena); the narrow 300–3400Hz phone EQ was crushing them into one timbre. New 160–6200Hz curve keeps the "phone" read while preserving character. Free fix.

### What went wrong → how it was fixed
zsh parsed `$mgain[mus]` inside the ffmpeg filtergraph as an array subscript and swallowed the output label — ffmpeg died with "wav muxer does not support more than one stream of type audio". Isolated with a minimal repro, fixed with `${mgain}` braces.

### What changed
`NaaS-ThisYear-roughcut-v4.mp4` (58.9s, mean −18.5dB, peak −1.5dB) + `v4-alt-silentdescent` + `v4-alt-drawingsky`. v1–v3 preserved as fallbacks. Reproducible: `05-final/assemble-v4.sh`.

---

## Entry 012 — Live directing session → v5 (the night before submission)
**Date:** 15 July 2026 (night) · **Tools:** Higgsfield (Cinema Studio 3.0, Seed Audio), ffmpeg, ImageMagick
**Stage:** Post — feedback round 2, Yam directing live

### Context
Yam reviewed v4 and sent five notes in real time — this was the first fully "director → crew" iteration loop:
1. "leaves me on read" is unclear (slang).
2. The scrolling scene should talk about the scrolling (her line pitch: "hi hun… enough with the scrolling").
3. The snack-bag shot: "how is he talking when she hasn't answered yet?" — maybe regenerate.
4. "Okay, I need names" unclear; the list should read as DONE (crossed out).
5. Typography: go CAPS — motivational, Nike, powerful.

### The prompts / decisions (~61 credits)
- **3 new voice stems** (Seed Audio, same cast): narrator "And every February… she swipes me away. Again. And again." (narrates the swipe visual — no slang); pragmatist "Hi hun. Enough with the scrolling. Portfolio — right now." (Yam's line, sleep angle dropped because the shot is daytime); friend "Okay — HOW?!"
- **S6 regenerated** (Cinema Studio 3.0, same keyframe pair, 60cr): prompt staged the pickup inside the first two seconds. QA frames: bite frozen at 1.2s, phone in hand at 2.0s, at ear by ~2.6s. Tough Love line moved 36.3s → 37.0s. Honest note: mid-shot the couch dressing drifts from the start frame (model drift); acceptable in motion, re-roll offered.
- **S8 story hole fixed deterministically:** the video's list close-up showed NO strikethrough (the "she did it all" beat didn't exist on screen). Instead of regenerating AI video (text drifts), a 1.33s ImageMagick Notes-screen insert — all three goals struck through — was cut into S8 exactly where the weak close-up was, landing as the narrator says "Four hundred calls." Zero credits, zero text-drift risk.
- **Nike-caps typography system:** discovered Avenir Next Condensed's default ttc face renders as Heavy — labels, "NOT THIS YEAR." card and end card ("WE'VE GOT YOUR BACK." / gold "CHOOSE WHO CALLS YOU.") all rebuilt in heavy condensed caps.

### What went wrong → how it was fixed
fontTools install failed twice (no pip in sandbox venv) — dead end abandoned; a 1-frame render test revealed the ttc default face was already the Heavy weight. Lesson: test the simple path before building the clever one.

### What changed
`NaaS-ThisYear-roughcut-v5.mp4` + two music alts (58.9s, mean −18.6dB, peak −1.5dB). v1–v4 preserved. Credits: 545 → ~484.

---

## Entry 013 — Root cause found in the storyboard layer → v6
**Date:** 15 July 2026 (night) · **Tools:** Higgsfield (Nano Banana Pro keyframes + Cinema Studio 3.0, Seed Audio), ImageMagick compositing, media_upload
**Stage:** Post — feedback round 3, Yam directing live

### Context
Yam kept directing on v5: (1) the bag shot "changes clothes mid-shot" — grey shirt becomes black at pickup; (2) the show-off shot "doesn't look good enough" and (after watching the first re-roll) "there's no strikethrough — I can't tell she finished"; (3) new comedic narrator pitch for S2 (reminders → couch → nothing); (4) pragmatist wording → "Let's get the portfolio done."; (5) music LOCKED: The Journey ("drawingsky is too sad, I like the rough cut"). She also called the fix layer precisely: "you will have to recreate the storyboard photos."

### The find (hers)
Diagnosis confirmed her instinct: the original S6 END keyframe itself wore a black shirt on a different couch — the start/end pair disagreed, so EVERY video take was forced to morph wardrobe mid-shot. No prompt could fix a broken keyframe pair. Prompt-level continuity locks (tried once, 60cr) failed exactly as she predicted.

### The fix (storyboard layer, as directed)
- New S6 keyframe PAIR via Nano Banana Pro: start (chip mid-air, grey shirt, beige couch) and end (phone at ear, bag closed) — the end frame generated with the NEW start frame as a reference, locking room+wardrobe across the pair. Video re-rolled from the new pair: grey shirt and beige couch hold for all 6 seconds; phone at ear by ~3.0s. Tough Love line landed at 37.2s.
- Show-off keyframe: new triumphant frame (huge grin, phone thrust at friend) — but only "Save $5,000" came out struck. Instead of re-rolling the dice, the two missing strikethroughs were DRAWN onto the keyframe pixels with ImageMagick, uploaded via media_upload, and the video was generated from the corrected image. Result: all three lines visibly struck through the whole usable window. First attempt at pixel-level line placement missed by one text row — caught in a crop QA, corrected.
- New stems: S2 narrator (Yam's comedic pitch; first take 9.9s — too long, restructured wording → 6.09s, silence-trimmed + atempo 1.127 → 5.30s, friend line shifted 11.5→11.75s to fit) and pragmatist v3.

### What went wrong → how it was fixed
Three consecutive curl "network failures" turned out to be a wrong working directory (relative paths after a cd into keyframes/) — exit codes 56/23 misread as CDN flakiness until the write-error code exposed it. Logged as a reminder: read the exit code before blaming the network.

### What changed
`NaaS-ThisYear-roughcut-v6.mp4` — 58.9s, mean −18.6dB, peak −1.5dB. Round cost ≈ 248 credits (2 takes that taught us the lesson + keyframe pair + 2 final takes + 5 stems). Balance: 236. v1–v5 preserved.

---

## Entry 014 — Two lines out, one line in → v7
**Date:** 15 July 2026 (night) · **Tools:** Seed Audio, ffmpeg
**Stage:** Post — feedback round 4 (on v6)

### Context
Yam flagged two lines in v6 as "not connected": the friend's early "How's the 10K? Still… conceptual?" and her final "Someone kept calling." She asked to talk it through first; options were laid out with trade-offs, she confirmed the critique.

### The decisions
- **CUT friend-q1.** Three compounding reasons: "still conceptual" is the same clever-idiom class that failed the friend test twice; it stacked a second joke on the same 5 seconds as the new narrator line; and it was a disembodied voice introduced 35 seconds before the friend appears on screen. The end-of-film "Okay — HOW?!" got STRONGER: the struck-list insert now does its setup.
- **"Someone kept calling." → "You'll see."** The narrator's close ("Four hundred calls… I called back.") already answers HOW; her old line duplicated it while ambiguously addressed. "You'll see." answers the friend directly — then answering the ringing phone IS the product demo. Voice check first: her line is Maya, friend is Skye — no collision.

### What changed
`NaaS-ThisYear-roughcut-v7.mp4` — 58.9s, mean −18.5dB, peak −1.5dB. Voice bus 12 → 11 stems, all mix indices re-mapped (assemble-v7.sh). Cost: 0.4 credits. Balance ~236.

---

## Entry 015 — The logo lands → FINAL
**Date:** 15 July 2026 (late night) · **Tools:** ImageMagick, ffmpeg
**Stage:** Finishing

### Context
Ido's logo arrived — the brand is **WISP** (a wisp flame-drop mark + wordmark) — as JPGs on a white background, minutes after the repo went public. Yam also split the transcript into per-deliverable logs (this project's is now `00-CONVERSATION-LOG-VIDEO.md`).

### The technique
White removal via **corner flood-fill** (`-fuzz 6% -draw "alpha X,Y floodfill"` from all four corners) instead of a global `-transparent white` — the flame's interior contains near-whites that a global pass would have punched holes through. End card recomposed with the WISP lockup replacing the [ LOGO ] placeholder; master re-encoded; v7's audio mix muxed unchanged.

### What changed
**`05-final/NaaS-ThisYear-FINAL.mp4` — 58.9s. The film is complete.** Zero credits (all local). Repo updated: FINAL row in the iterations table, brand assets included, only the final cut ships. Open team decision: the on-screen caller name "ALEX" (a night-one image-model invention) — adopt as WISP's assistant name, or regen the keyframe for 2 credits.

---

## Entry 016 — ALEX becomes WISP (two techniques for one name)
**Date:** 16 July 2026 (past midnight) · **Tools:** ImageMagick (median inpainting), media_upload, Cinema Studio 3.0
**Stage:** Finishing — brand consistency

### Context
With the brand named WISP, the invented caller name "ALEX" on the S8 phone screens became a contradiction. It appeared twice: a full-frame incoming-call close-up, and the window shot (small but legible). Fixing only one would create an inconsistency worse than either.

### The two techniques
1. **Close-up — pixels, not prompts (0 credits):** the shot is rock-steady, so the segment became a 1.13s still insert from an edited frame. Text removal via `-statistic Median 45x45` (thin white strokes dissolve into the screen gradient — a first attempt with a stretched sample strip left a visible seam box and was discarded), then "WISP / Assistant" re-typed in a system font at the original position.
2. **Window shot — regeneration from an edited keyframe (60 credits):** the segment contains acting (growing smile, the answer) so it can't freeze. The tiny tilted "ALEX" was median-erased and "WISP" re-typed at the phone's angle at 16pt; the frame was uploaded and the shot regenerated with staging "watches the ringing phone for four seconds, answers only in the final two." Result: WISP legible throughout, and the pickup lands so that "You'll see." falls mid-lift — addressed to the friend, completed by the answer.

### What went wrong → how it was fixed
The same curl "network failure" from Entry 013 struck again — and was again a wrong working directory. Twice is a pattern: absolute paths from now on.

### What changed
`NaaS-ThisYear-FINAL.mp4` rebuilt (58.9s): WISP on every screen, v7 audio untouched. The film and the brand now agree with each other.

---

## Appendix — Full text of the kickoff prompt (Hebrew, verbatim)

היי קלוד,
אני רוצה לשתף איתך מסמך של מטלה שלי בלימודים. את המטלה אני מבצעת עם צוות של שותפים - מיי, מיה, עידו ואני. כבר ערכנו שיחה בנושא וחילקנו משימות ומי עושה מה.

אני אשתף אותך במסמך, בשיחה בוואטצאפ שמדברת על המוצר ומהותו. התפקיד שלי הוא לייצר סרטון - הכלים שנתונים לנו הם קלוד, chatgpt, codex, perplexity, higgesfield, gemini, flow by google, ואני מנסה לחשוב אם יש עוד משהו.

אתה כבר תקבל את המסמך, ותגלה שכחלק מהמשימה צריכה באופן עקבי לתעד את הפרומטים והתהליך. אז כבר תייצר קובץ log שבו נתעד את השיחה בינינו. כבר מהשיחה הזו..

אני חושבת שנעבוד עם flow, gemini, midjourney אבל אני רוצה שנחקור לפני ולכן אני רוצה שתצא לחקור על יצירת סרטון למוצר שכבר אספר לך עליו. בחקירה תחקור על סגנונות עבודות כמו וחדשנות בתחום:
1. google omni channel
2. storyboards
כחלק מהתהליך אתה תחקור סקילים וסוכנים בתחום. תראיין ותוסיף לצוות אנשים בעלי ידע רלוונטי, כאשר יש אורקסטרייטור שמנהל את הכל.

הנחת היסוד היא שמישהו כבר ביצע את זה קודם לפנינו והמטרה שלנו זה לייצר סרטון בזריזות, אבל בא לי שנייצר סרטון שיווקתי ברמת פפסי ולכן נפתח אותו יחד בפינגפונג. כמו״כ - צור תיקייה יעודית לפרויקט הזה :)
