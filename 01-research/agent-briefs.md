# Research Team — Agent Briefs
_The "hires" for the video deliverable's research phase. Dispatched 14 July 2026 as a multi-agent deep-research workflow (run `wf_d96c0fd2-7b5`), orchestrated from Claude Code. Each agent searches independently; findings are cross-checked by adversarial verification agents (3 votes per claim) before entering the report._

## Why a team and not one big prompt
One prompt = one perspective. Five narrow briefs surface things a generalist sweep misses, and the verification layer kills plausible-but-wrong claims before they reach the storyboard. This mirrors the course's own framing: every role is a hire.

## The hires

### 1 · Tool Scout
**Brief:** Map the AI video tool landscape as of July 2026 for a 2-day, non-developer production: Flow/Veo 3, Gemini, Midjourney, Higgsfield, Kling, Seedance, Runway, Sora. For each — strengths, access/pricing, character-consistency features, and voice/audio capability (voice calls are the product's core, so native audio matters disproportionately).
**Deliverable:** Which tool wins which shot type.

### 2 · Storyboard Analyst
**Brief:** How AI-native storyboarding actually works: best-practice 60-second ad structure (hook → problem → solution → CTA), image-model-to-video workflows (Midjourney/Imagen keyframes → video), first-frame/last-frame techniques, and how solo creators keep one character consistent across 6-8 shots.
**Deliverable:** A storyboard method we can execute tomorrow.

### 3 · Ad Craft Critic
**Brief:** Deconstruct what makes a 60s brand ad feel "Pepsi-grade" vs. cheap AI slop: pacing, sound design, one-clear-thing discipline, premium visual tells. Find reference ads in the accountability/productivity/wake-up category, including split-screen "with us vs. without us" formats.
**Deliverable:** A quality bar checklist + reference list.

### 4 · Google Stack Researcher
**Brief:** Flow by Google / Veo 3 / Google Vids — real capabilities and limits as of mid-2026. Resolve the "Google omni channel" ambiguity from the kickoff prompt: is "Omni" a distinct AI video tool (as the course brief implies) or omnichannel marketing thinking — or both?
**Deliverable:** What the Google stack can and cannot carry in this production.

### 5 · Agents & Skills Researcher
**Brief:** Existing agent skills, MCP servers and templated workflows that automate ad creation (e.g., Higgsfield marketing workflows, explainer/ad templates), and how solo creators chain tools end-to-end: script → storyboard → shots → edit → sound.
**Deliverable:** Shortcuts worth taking vs. building ourselves.

## Verification layer (the "editor-in-chief")
Every factual claim extracted from sources gets three independent adversarial verifiers instructed to *refute* it; a claim survives only if fewer than 2/3 refute. This is the academic-integrity firewall the course brief demands ("a fabricated source is an academic offense, not an AI mistake").

## Orchestrator
Claude Code (this session) — decomposes the question, dispatches agents, merges verified findings, and writes the final cited report to `01-research/research-report.md`.

## Local capability scouting (done inline by the orchestrator, same day)
- **Higgsfield workflow catalog:** only `video-explainer` (narrated, non-photoreal animated explainer) is exposed in our catalog. Its own routing notes name a `tv-ad` flow for product/brand ads — not available to us. Conclusion: a Higgsfield-based ad would be assembled shot-by-shot via `generate_image` / `generate_video` / `generate_audio`, not via a one-click ad template.
- **Higgsfield model recommendation** for "premium cinematic product ad, character consistency, spoken dialogue": see `01-research/higgsfield-models.md`.
