#!/bin/zsh
# v2: adds synthesized ambience + fixes Tough Love causality (line now starts AFTER pickup)
# All SFX are ffmpeg-synthesized (no external samples). v1 kept untouched as fallback.
set -e
cd "$(dirname "$0")/.."
A=04-assets/audio
S=04-assets/audio/sfx
mkdir -p $S

# ---- synth SFX ----
# classic soft dual-tone ring: 0.9s burst, double
ffmpeg -y -loglevel error -f lavfi -i "sine=frequency=440:duration=0.9" -f lavfi -i "sine=frequency=480:duration=0.9" \
  -filter_complex "[0:a][1:a]amix=inputs=2,afade=t=in:d=0.03,afade=t=out:st=0.82:d=0.08,lowpass=f=3000[r]" -map "[r]" $S/ringburst.wav
ffmpeg -y -loglevel error -i $S/ringburst.wav -f lavfi -t 0.35 -i anullsrc=r=44100:cl=mono \
  -filter_complex "[0:a][1:a][0:a]concat=n=3:v=0:a=1[rr]" -map "[rr]" $S/ring-double.wav
# vibration buzz (notification): 0.45s, 170Hz with tremolo
ffmpeg -y -loglevel error -f lavfi -i "sine=frequency=170:duration=0.45" \
  -af "tremolo=f=28:d=0.9,afade=t=in:d=0.02,afade=t=out:st=0.38:d=0.07,volume=0.9" $S/buzz.wav
# distant firework thump: low sine hit + noise tail
ffmpeg -y -loglevel error -f lavfi -i "sine=frequency=55:duration=0.5" -f lavfi -i "anoisesrc=color=brown:duration=1.1:amplitude=0.35" \
  -filter_complex "[0:a]afade=t=out:st=0.05:d=0.45,volume=1.4[boom];[1:a]lowpass=f=600,afade=t=in:d=0.05,afade=t=out:st=0.3:d=0.8,volume=0.5[tail];[boom][tail]amix=inputs=2:duration=longest[f]" -map "[f]" $S/firework.wav
# bag crinkle: high-passed white noise with fast tremolo
ffmpeg -y -loglevel error -f lavfi -i "anoisesrc=color=white:duration=0.8:amplitude=0.5" \
  -af "highpass=f=2200,tremolo=f=13:d=1,afade=t=in:d=0.05,afade=t=out:st=0.6:d=0.2,volume=0.8" $S/crinkle.wav
# room tone bed: 59s very quiet pink noise
ffmpeg -y -loglevel error -f lavfi -i "anoisesrc=color=pink:duration=59:amplitude=0.5" \
  -af "lowpass=f=4000,volume=0.016" $S/roomtone.wav

# ---- voice + sfx mix (Tough Love moved 34500 -> 36300) ----
ffmpeg -y -loglevel error \
  -i $A/narrator-01-open.wav -i $A/narrator-02-february.wav -i $A/friend-q1-conceptual.wav \
  -i $A/narrator-03-turn.wav -i $A/phone-eq/call-ego-pumper-phoneEQ.wav -i $A/phone-eq/call-pragmatist-phoneEQ.wav \
  -i $A/phone-eq/call-tough-love-phoneEQ.wav -i $A/phone-eq/call-supportive-phoneEQ.wav \
  -i $A/friend-q2-names.wav -i $A/narrator-04-close.wav -i $A/her-final-line.wav -i $A/narrator-05-tagline.wav \
  -i $S/roomtone.wav \
  -i $S/firework.wav -i $S/firework.wav -i $S/firework.wav \
  -i $S/buzz.wav -i $S/buzz.wav -i $S/buzz.wav \
  -i $S/ring-double.wav -i $S/crinkle.wav -i $S/ringburst.wav \
  -i $S/firework.wav -i $S/firework.wav -i $S/ringburst.wav \
  -filter_complex "\
    [0:a]adelay=800:all=1[a0];[1:a]adelay=6500:all=1[a1];[2:a]volume=0.9,adelay=11500:all=1[a2]; \
    [3:a]adelay=14200:all=1[a3];[4:a]adelay=22300:all=1[a4];[5:a]adelay=28500:all=1[a5]; \
    [6:a]adelay=36300:all=1[a6];[7:a]adelay=40500:all=1[a7];[8:a]volume=0.9,adelay=48000:all=1[a8]; \
    [9:a]atempo=1.12,adelay=49600:all=1[a9];[10:a]volume=0.95,adelay=55500:all=1[a10];[11:a]adelay=58000:all=1[a11]; \
    [12:a]adelay=0:all=1[bed]; \
    [13:a]volume=0.30,adelay=600:all=1[f1];[14:a]volume=0.22,adelay=2400:all=1[f2];[15:a]volume=0.26,adelay=4200:all=1[f3]; \
    [16:a]volume=0.5,adelay=7600:all=1[b1];[17:a]volume=0.5,adelay=9200:all=1[b2];[18:a]volume=0.5,adelay=10800:all=1[b3]; \
    [19:a]volume=0.32,adelay=17900:all=1[r1]; \
    [20:a]volume=0.45,adelay=33900:all=1[cr];[21:a]volume=0.30,adelay=34700:all=1[r2]; \
    [22:a]volume=0.24,adelay=47300:all=1[f4];[23:a]volume=0.20,adelay=50000:all=1[f5]; \
    [24:a]volume=0.26,adelay=52300:all=1[r3]; \
    [a0][a1][a2][a3][a4][a5][a6][a7][a8][a9][a10][a11][bed][f1][f2][f3][b1][b2][b3][r1][cr][r2][f4][f5][r3]amix=inputs=25:duration=longest:normalize=0,loudnorm=I=-16:TP=-1.5[aout]" \
  -map "[aout]" -ar 48000 -t 59.0 05-final/voice-mix-v2.wav

# ---- mux onto the existing silent master ----
ffmpeg -y -loglevel error -i 05-final/video-master-silent.mp4 -i 05-final/voice-mix-v2.wav \
  -c:v copy -c:a aac -b:a 192k -shortest 05-final/NaaS-ThisYear-roughcut-v2.mp4
ffprobe -v error -show_entries format=duration -of csv=p=0 05-final/NaaS-ThisYear-roughcut-v2.mp4
echo "V2 DONE"
