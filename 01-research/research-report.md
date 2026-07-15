# Deep Research Report — AI Video Production for the NaaS Ad
_Produced 14 July 2026 by a 106-agent research workflow (run `wf_d96c0fd2-7b5`): 5 search angles → 24 sources fetched → 120 claims extracted → top 25 adversarially verified (3 votes each) → **17 confirmed, 8 refuted, 0 unverified**. Full agent briefs: [agent-briefs.md](agent-briefs.md)._

---

## TL;DR
A broadcast-grade 60-second AI ad on a ~2-day solo timeline is **proven reality** — the Kalshi NBA Finals spot was made primarily with Veo 3 by one person in 2–3 days for <$2,000. But it took **300–400 generations to get 15 usable clips**, and its premium feel came from **human script craft before any generation step**. The validated pipeline: co-write script with an LLM → convert to self-contained shot-by-shot prompts → generate → assemble + score in an editor.

---

## Verified findings

### 1 · Feasibility benchmark — the Kalshi ad (confidence: HIGH, votes 3-0/3-0)
A nationally broadcast AI ad (Kalshi, 2025 NBA Finals) was created primarily with Google Veo 3 by a single creator, advertising veteran P.J. Accetturo, in 2–3 days, AI prompting costs under $2,000.
→ [NPR](https://www.npr.org/2025/06/23/nx-s1-5432712/ai-video-ad-kalshi-advertising-nba-finals) · corroborated by Business Insider, Ad Age, eWeek.
_Caveat: honest timeline is 2–3 days, and he's a 15-year commercial director._

### 2 · The iteration burden (confidence: MEDIUM, 3-0)
**~300–400 generations for 15 usable clips** — a ~20–25× generation-to-keeper ratio. "Just because this was cheap doesn't mean anyone can do it."
→ Self-reported in NPR; treat as a floor for first-timers, though newer models may need fewer.
**Implication for us: 970 Flow credits cannot carry blind re-rolling. Storyboard-first discipline is mandatory.**

### 3 · Premium = writing, not the generator (confidence: HIGH, 3-0/3-0)
Kalshi's workflow was **script-first**: first draft with a professional head writer (ex-Comedy Central), then punch-up rounds with other writers pitching alt lines. Documented chain: **co-write script with Gemini/ChatGPT → Gemini converts script into detailed, self-contained shot-by-shot prompts ("as if the model has no context of the shot before or after") → assemble clips + music in an editor.**
→ [Accetturo's first-person account](https://www.linkedin.com/posts/pj-accetturo-b3b693129_this-may-be-the-best-ai-commercial-weve-activity-7349152388613632000-67OV) + NPR.
_Caveat: "premium = writing" is the creator's own thesis in a self-promotional post._

### 4 · Google's stack, as of July 2026 (confidence: HIGH, 3-0/3-0)
- Consumer model is **Veo 3.1** (not Veo 3, and no Veo 4 exists — verifiers found only SEO-farm rumors). Limited-time **Veo 3.1 Lite** trial on the Pro tier.
- **Google Vids: 10 free Veo 3.1 generations/month** on any personal account — but 720p, max 8s, watermarked → good for testing shots, not final deliverable.
→ [gemini.google/subscriptions](https://gemini.google/subscriptions/) (fetched live) · [Google Workspace blog](https://blog.google/products-and-platforms/products/workspace/google-vids-updates-lyria-veo/)

### 5 · "Omni" mystery — solved: it's a name collision (confidence: MEDIUM, 3-0/2-1)
(a) **Gemini Omni Flash** — Google's multimodal video model bundled with Flow on Pro/Ultra tiers (not a standalone tool); (b) **Kling Omni** — a product line (~Feb 2026): VIDEO 3.0 Omni / IMAGE 3.0 Omni, under Kling 3.0's "first native 4K video model" marketing. ByteDance's OmniHuman also shares the name.
→ [gemini.google/subscriptions](https://gemini.google/subscriptions/) · [DeepMind Gemini Omni page](https://deepmind.google/models/gemini-omni/) · [Kling quickstart](https://kling.ai/quickstart/ai-video-start-end-frames)

### 6 · Midjourney: keyframes yes, video engine no (confidence: HIGH, 3-0×3)
Video clips: 5s start, +4s increments, **hard 21s max**, default 480p / **720p ceiling**, and **zero audio of any kind** — fatal as primary engine for a voice-product ad. Still excellent for **stills/keyframes**, and supports `--end` / `--loop` frames.
→ [Official Midjourney docs](https://docs.midjourney.com/hc/en-us/articles/37460773864589-Video) (updated 11 Jun 2026)

### 7 · The storyboard-to-video pipeline is vendor-documented (confidence: HIGH, 3-0×3)
**Image model → keyframe stills → first/last-frame video generation** is natively supported: Kling's "Start and End Frames" ("upload two images… used as the starting and ending frames to generate a transition video"), and Kling explicitly documents generating similar images first, then animating between them. Midjourney mirrors via `--end`/`--loop`.
→ [Kling quickstart](https://kling.ai/quickstart/ai-video-start-end-frames) · [Midjourney docs](https://docs.midjourney.com/hc/en-us/articles/37460773864589-Video)
**This validates our plan: lock persona/product stills as storyboard frames, then animate between them. Cheap iteration happens at the image layer, not the video layer.**

### 8 · Seedance 2.0 = motion + audio + speech in a single pass (confidence: HIGH, 3-0)
The engine behind Higgsfield Marketing Studio generates **native lip-synced speech together with the video** — no separate TTS/lip-sync step.
→ [Higgsfield](https://higgsfield.ai/marketing-studio-intro) · [Seedance 2.0 arXiv paper](https://arxiv.org/pdf/2604.14148) (phoneme-level lip-sync)
_Caveats: audio toggle costs ~50–100% more credits; multi-person lip-sync and occasional distortion are acknowledged open problems._

### 9 · Higgsfield Marketing Studio spans UGC / CGI / cinematic from one prompt (confidence: MEDIUM, 2-1)
Fastest style-exploration path for a non-developer. **But its "no post-production needed" claim was REFUTED (0-3)** — treat it as a shot/format generator feeding an edit, not an end-to-end 60s ad machine.
→ [higgsfield.ai/marketing-studio-intro](https://higgsfield.ai/marketing-studio-intro) + our live preset check (26 presets, incl. `tv_spot`, `ugc_before_and_after`)

---

## Refuted claims — what the verification layer killed 🛡️
These circulated in sources but failed 3-vote adversarial verification. **Do not cite them in any deliverable.**

| Refuted claim | Vote | Lesson |
|---|---|---|
| Higgsfield Marketing Studio automates the *entire* pipeline "with no post-production" | 0-3 | Vendor marketing ≠ reality; an edit step is always needed |
| Google AI Pro Israel pricing ₪74.9/mo with 200 Flow credits | 0-3 | Pricing numbers in blogs are unreliable; check the live official page |
| Google AI Ultra Israel pricing ₪390–749.9 with 10k/25k credits | 0-3 | Same |
| "Character inconsistency is THE main reason AI video looks cheap" | 0-3 | Plausible-sounding blog thesis, no evidence |
| "Overloaded prompts degrade output; one camera move fixed it" | 1-2 | Anecdote, not verified |
| Ten-platform test: "Kling most natural movement, Veo best cinematic language" | 0-3 | The cited test could not be substantiated |
| "Stylized AI ads avoid uncanny valley and outperform realistic ones" | 0-3 | No credible evidence; premium-vs-cheap remains a taste call |
| "Kalshi ad made in one week" | 1-2 | It was 2–3 days (the correct figure survived separately) |

## Known gaps (be honest about these)
1. **Premium-vs-cheap aesthetics:** every perceptual claim failed verification — the only surviving driver is script craft. This must be settled by taste + our own tests.
2. **Pricing:** no verified tier numbers survived → rely on Yam's live balance (970 Flow credits) and official pages only.
3. **Character-consistency feature comparison** (Kling refs vs Veo ingredients vs Sora cameos vs Higgsfield characters): no claim survived — needs a hands-on test, not more reading.
4. Kalshi's absurdist meme genre is forgiving of AI artifacts; a polished "Pepsi-level" spot is not.
5. All facts time-stamped 2026-07-14; Google says free-tier limits can change anytime.

## Open questions carried into production
1. Which tool best holds our protagonist's identity across 7-8 shots? → settle with a cheap A/B test (Seedance references vs keyframe pairs).
2. Real credit math: what does one Veo 3.1 clip cost in Flow credits on Yam's plan? → check inside Flow before burning anything.
3. Can Seedance/Veo audio do a convincing "AI assistant phone-call voice" per persona — and in what language? → test; fallback is dedicated TTS mixed in post.

## What this changes for our production plan
1. **Script first, like professionals.** Writers-room punch-up rounds on the script before any pixel is generated (we can simulate alt-line pitching with agents).
2. **Storyboard-first, image-layer iteration.** Lock keyframe stills cheaply (Midjourney/Imagen), animate between them with first/last-frame (Kling/Seedance/Veo) — this is how 970 credits survive a 20×+ iteration reality.
3. **Self-contained shot prompts.** Each video prompt written as if the model never saw the other shots.
4. **Free tests first:** Google Vids' 10 free generations + Higgsfield presets for style exploration; Flow Quality credits only for locked shots.
5. **Phone-voice concept advantage confirmed:** no on-screen lip-sync needed; if we ever want an on-camera speaking beat, Seedance 2.0 single-pass is the tool.

## Source list (all 24 fetched sources)
Primary: [gemini.google/subscriptions](https://gemini.google/subscriptions/) · [Google Workspace blog](https://blog.google/products-and-platforms/products/workspace/google-vids-updates-lyria-veo/) · [Midjourney docs](https://docs.midjourney.com/hc/en-us/articles/37460773864589-Video) · [Kling quickstart](https://kling.ai/quickstart/ai-video-start-end-frames) · [Higgsfield Marketing Studio](https://higgsfield.ai/marketing-studio-intro) · [Accetturo LinkedIn](https://www.linkedin.com/posts/pj-accetturo-b3b693129_this-may-be-the-best-ai-commercial-weve-activity-7349152388613632000-67OV)
Secondary: [NPR](https://www.npr.org/2025/06/23/nx-s1-5432712/ai-video-ad-kalshi-advertising-nba-finals) · [DeepMind Gemini Omni](https://deepmind.google/models/gemini-omni/) · [Seedance 2.0 arXiv](https://arxiv.org/pdf/2604.14148)
Blogs (used with caution; several claims from these were refuted): boords.com, medium.com/@creativeaininja, higgsfield.ai/blog (×3), techsy.io, mindstudio.ai (×2), similarlabs.com, lushbinary.com, curionic.net, adlibrary.com, guides.tenfoldmarketing.com, cliprise.app, picsart.com, nerdbot.com (refuted ×3), titandigitaluae.com (refuted)
