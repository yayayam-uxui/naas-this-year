#!/bin/zsh
# NaaS "This Year" — rough cut assembly (BOLD CUT)
# Built overnight 15/7/2026 by Claude Code. Reproducible: run from project root.
# Video: 8 Cinema Studio 3.0 shots + turn card + end card, 1920x1080 @24fps
# Audio: 12 generated stems; persona calls are phone-EQ'd (300-3400Hz bandpass);
#        narrator stems dry; ring SFX + music intentionally left for the human edit.
set -e
cd "$(dirname "$0")/.."
V=04-assets/video
A=04-assets/audio

# ---- 1. concat video (re-encode for uniformity) ----
ffmpeg -y -loglevel error \
  -i $V/s1-cinema.mp4 -i $V/s2-cinema.mp4 -i $V/card-turn.mp4 -i $V/s3-cinema.mp4 \
  -i $V/s4-cinema.mp4 -i $V/s5-cinema.mp4 -i $V/s6-cinema.mp4 -i $V/s7-cinema.mp4 \
  -i $V/s8-cinema.mp4 -i $V/card-end.mp4 \
  -filter_complex "[0:v][1:v][2:v][3:v][4:v][5:v][6:v][7:v][8:v][9:v]concat=n=10:v=1:a=0,format=yuv420p[v]" \
  -map "[v]" -c:v libx264 -crf 18 -preset medium -r 24 05-final/video-master-silent.mp4

# ---- 2. audio mix (delays in ms, tuned to the timeline) ----
ffmpeg -y -loglevel error \
  -i $A/narrator-01-open.wav \
  -i $A/narrator-02-february.wav \
  -i $A/friend-q1-conceptual.wav \
  -i $A/narrator-03-turn.wav \
  -i $A/phone-eq/call-ego-pumper-phoneEQ.wav \
  -i $A/phone-eq/call-pragmatist-phoneEQ.wav \
  -i $A/phone-eq/call-tough-love-phoneEQ.wav \
  -i $A/phone-eq/call-supportive-phoneEQ.wav \
  -i $A/friend-q2-names.wav \
  -i $A/narrator-04-close.wav \
  -i $A/her-final-line.wav \
  -i $A/narrator-05-tagline.wav \
  -filter_complex "\
    [0:a]adelay=800:all=1[a0]; \
    [1:a]adelay=6500:all=1[a1]; \
    [2:a]volume=0.9,adelay=11500:all=1[a2]; \
    [3:a]adelay=14200:all=1[a3]; \
    [4:a]adelay=22300:all=1[a4]; \
    [5:a]adelay=28500:all=1[a5]; \
    [6:a]adelay=34500:all=1[a6]; \
    [7:a]adelay=40500:all=1[a7]; \
    [8:a]volume=0.9,adelay=48000:all=1[a8]; \
    [9:a]atempo=1.12,adelay=49600:all=1[a9]; \
    [10:a]volume=0.95,adelay=55500:all=1[a10]; \
    [11:a]adelay=58000:all=1[a11]; \
    [a0][a1][a2][a3][a4][a5][a6][a7][a8][a9][a10][a11]amix=inputs=12:duration=longest:normalize=0,loudnorm=I=-16:TP=-1.5[aout]" \
  -map "[aout]" -ar 48000 05-final/voice-mix.wav

# ---- 3. mux ----
ffmpeg -y -loglevel error -i 05-final/video-master-silent.mp4 -i 05-final/voice-mix.wav \
  -c:v copy -c:a aac -b:a 192k -shortest 05-final/NaaS-ThisYear-roughcut-v1.mp4

ffprobe -v error -show_entries format=duration -of csv=p=0 05-final/NaaS-ThisYear-roughcut-v1.mp4
echo "ROUGH CUT DONE"
