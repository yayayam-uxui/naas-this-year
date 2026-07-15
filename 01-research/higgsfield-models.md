# Higgsfield — Local Capability Scan
_What our own Higgsfield account can actually generate, checked live on 14 July 2026 via the MCP connection (not from marketing pages). Query: "premium cinematic product ad, character consistency across 6-8 shots, spoken dialogue/voice audio"._

## Top recommendations returned

### 1 · Marketing Studio (`marketing_studio_video`) — Higgsfield
- **What:** One-click product ads, TikTok/Reels-ready. 12–15s clips, up to 1080p, native audio.
- **Killer features for us:** `ad_reference_id` — recreates the *scenario* of an existing reference ad (scene composition, pacing, hook, narration). Avatar support (max 1), product images, hook/setting building blocks for UGC-style presets.
- **Limit:** 12–15 seconds per generation → a 60s ad = stitched segments or use it only for specific beats.
- **App support:** a `webproduct` entity type exists specifically for advertising an app/site as a whole (App Store listings included) — NaaS is an app, so this fits directly.

### Marketing Studio presets (checked live — 26 total, the relevant ones)
| Preset | Why it matters for NaaS |
|---|---|
| **TV Spot** | "Authentic stories, amplified" — closest to a Pepsi-grade brand beat |
| **Before and After** | Literally the "with us vs. without us" format Yam proposed on the team call |
| **Selfie Testimonial / Direct-to-Camera** | The moment a user *receives the call* — UGC realism |
| **Product Showcase** | App UI beats |
| **Wild Card** | Custom ideas that fit no template |

Full preset list: UGC, This Gadget Saved Me, Giant Figure, Unboxing (4 variants), Virtual Try-On (3), Couple Sharing At Home, Secret Hack Reveal, Crush Test, Hyper Motion, Camera POV, Classic Meets Modern, Mess to Fresh, Mystery Box, Reboxing, TV Spot, UGC Addiction, Before and After, Tutorial, Product Showcase, Selfie Testimonial, Direct-to-Camera, Wild Card.

### 2 · Seedance 2.0 — Bytedance
- Reference-driven video: image/video/**audio** reference inputs, **consistent identity** across generations, 4–15s, up to 4K.
- Strongest candidate for keeping our protagonist consistent across shots — feed the same character reference images into every shot.

### 3 · Gemini Omni Flash (`gemini_omni`) — Google ⚠️ naming finding
- Reference-driven video with **native audio**, image/video references, 4–10s, 720p only, 16:9 / 9:16.
- **This may be what the course brief calls "Omni."** The kickoff note said "google omni channel" — there is literally a Google video model named *Omni* exposed through Higgsfield. To be cross-checked against the web-research findings before we state it as fact.

### 4 · Kling v3.0
- **Multi-shot** generation, **audio sync**, motion transfer, 3–15s, up to 4K. Cinematic tag. Good for dialogue-timed shots.

### 5 · Grok Video (xAI)
- Versatile text/image-to-video with audio, 1–15s. Backup option.

## Workflow catalog finding
Only `video-explainer` (narrated, **non-photoreal animated** explainer) is exposed in our workflow catalog. Its routing notes explicitly say "NOT for: product/brand ad (**tv-ad**)" — i.e., Higgsfield has a tv-ad flow concept that is *not available to us*. A photoreal ad therefore gets assembled shot-by-shot (`generate_image` → `generate_video` → `generate_audio`), or via Marketing Studio segments.

## Implication for the production plan (draft, pre-research-report)
- **Character consistency:** Seedance 2.0 (reference identity) or Midjourney/Imagen keyframes → image-to-video.
- **Voice-call audio (core of the product!):** models with native audio (Seedance audio references, Kling audio sync, Gemini Omni) or generate voice separately (`generate_audio` / ElevenLabs-style) and cut in edit.
- **Fast beats / UGC moments:** Marketing Studio with ad_reference.
- Final tool mix decided after the deep-research report lands.
