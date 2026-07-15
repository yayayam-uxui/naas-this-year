#!/bin/zsh
# v3: real Mixkit SFX (free license, no attribution required) replace the synthesized ring/fireworks/crinkle;
# adds pen-writing (S7), party murmur (S8), running footsteps (S4). Synth buzz + room tone kept from v2.
# Tough Love causality fix (36.3s) kept.
set -e
cd "$(dirname "$0")/.."
A=04-assets/audio
S=04-assets/audio/sfx
R=$S/real
P=$S/prepared
mkdir -p $P

# ---- preprocess real samples (trim / distance-EQ) ----
ffmpeg -y -loglevel error -i $R/mixkit-1359.mp3 -t 2.6 -af "afade=t=out:st=2.3:d=0.3" $P/ring-s3.wav
ffmpeg -y -loglevel error -i $R/mixkit-1359.mp3 -t 1.4 -af "afade=t=out:st=1.1:d=0.3" $P/ring-s6.wav
ffmpeg -y -loglevel error -i $R/mixkit-1359.mp3 -t 1.7 -af "afade=t=out:st=1.4:d=0.3" $P/ring-s8.wav
ffmpeg -y -loglevel error -i $R/mixkit-2993.mp3 -af "lowpass=f=1100,afade=t=in:d=0.05" $P/fw-a.wav
ffmpeg -y -loglevel error -i $R/mixkit-2994.mp3 -af "lowpass=f=1100,afade=t=in:d=0.05" $P/fw-b.wav
ffmpeg -y -loglevel error -i $R/mixkit-1689.mp3 -af "lowpass=f=1100,afade=t=in:d=0.05" $P/fw-c.wav
ffmpeg -y -loglevel error -i $R/mixkit-2996.mp3 -t 1.0 $P/crinkle.wav
ffmpeg -y -loglevel error -i $R/mixkit-3194.mp3 $P/pen.wav
ffmpeg -y -loglevel error -i $R/mixkit-444.mp3 -t 10 -af "lowpass=f=3000,afade=t=in:d=0.6,afade=t=out:st=9:d=1" $P/party.wav
ffmpeg -y -loglevel error -i $R/mixkit-535.mp3 -t 5.5 -af "afade=t=in:d=0.4,afade=t=out:st=4.8:d=0.7,highpass=f=200" $P/steps.wav

# ---- full mix ----
ffmpeg -y -loglevel error \
  -i $A/narrator-01-open.wav -i $A/narrator-02-february.wav -i $A/friend-q1-conceptual.wav \
  -i $A/narrator-03-turn.wav -i $A/phone-eq/call-ego-pumper-phoneEQ.wav -i $A/phone-eq/call-pragmatist-phoneEQ.wav \
  -i $A/phone-eq/call-tough-love-phoneEQ.wav -i $A/phone-eq/call-supportive-phoneEQ.wav \
  -i $A/friend-q2-names.wav -i $A/narrator-04-close.wav -i $A/her-final-line.wav -i $A/narrator-05-tagline.wav \
  -i $S/roomtone.wav \
  -i $P/fw-a.wav -i $P/fw-b.wav -i $P/fw-c.wav \
  -i $S/buzz.wav -i $S/buzz.wav -i $S/buzz.wav \
  -i $P/ring-s3.wav -i $P/crinkle.wav -i $P/ring-s6.wav \
  -i $P/fw-b.wav -i $P/fw-a.wav -i $P/ring-s8.wav \
  -i $P/steps.wav -i $P/pen.wav -i $P/party.wav \
  -filter_complex "\
    [0:a]adelay=800:all=1[a0];[1:a]adelay=6500:all=1[a1];[2:a]volume=0.9,adelay=11500:all=1[a2]; \
    [3:a]adelay=14200:all=1[a3];[4:a]adelay=22300:all=1[a4];[5:a]adelay=28500:all=1[a5]; \
    [6:a]adelay=36300:all=1[a6];[7:a]adelay=40500:all=1[a7];[8:a]volume=0.9,adelay=48000:all=1[a8]; \
    [9:a]atempo=1.12,adelay=49600:all=1[a9];[10:a]volume=0.95,adelay=55500:all=1[a10];[11:a]adelay=58000:all=1[a11]; \
    [12:a]anull[bed]; \
    [13:a]volume=0.35,adelay=400:all=1[f1];[14:a]volume=0.25,adelay=2600:all=1[f2];[15:a]volume=0.30,adelay=4300:all=1[f3]; \
    [16:a]volume=0.5,adelay=7600:all=1[b1];[17:a]volume=0.5,adelay=9200:all=1[b2];[18:a]volume=0.5,adelay=10800:all=1[b3]; \
    [19:a]volume=0.45,adelay=17900:all=1[r1]; \
    [20:a]volume=0.7,adelay=33800:all=1[cr];[21:a]volume=0.40,adelay=34800:all=1[r2]; \
    [22:a]volume=0.22,adelay=47200:all=1[f4];[23:a]volume=0.18,adelay=50500:all=1[f5]; \
    [24:a]volume=0.35,adelay=52300:all=1[r3]; \
    [25:a]volume=0.22,adelay=22200:all=1[st];[26:a]volume=0.35,adelay=43500:all=1[pn];[27:a]volume=0.14,adelay=46800:all=1[pt]; \
    [a0][a1][a2][a3][a4][a5][a6][a7][a8][a9][a10][a11][bed][f1][f2][f3][b1][b2][b3][r1][cr][r2][f4][f5][r3][st][pn][pt]amix=inputs=28:duration=longest:normalize=0,loudnorm=I=-16:TP=-1.5[aout]" \
  -map "[aout]" -ar 48000 -t 59.0 05-final/voice-mix-v3.wav

ffmpeg -y -loglevel error -i 05-final/video-master-silent.mp4 -i 05-final/voice-mix-v3.wav \
  -c:v copy -c:a aac -b:a 192k -shortest 05-final/NaaS-ThisYear-roughcut-v3.mp4
ffprobe -v error -show_entries format=duration -of csv=p=0 05-final/NaaS-ThisYear-roughcut-v3.mp4
echo "V3 DONE"
