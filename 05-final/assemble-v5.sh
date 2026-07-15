#!/bin/zsh
# v5: the "friend test" round 2 — clarity pass on Yam's live notes (15/7 night):
#   - narrator 02: "leaves me on read" -> "she swipes me away. Again. And again." (matches the swiping visual; atempo 1.08)
#   - pragmatist: Yam's line direction -> "Hi hun. Enough with the scrolling. Portfolio — right now."
#   - friend q2: "I need names" -> "Okay — HOW?!" (universal, no slang)
#   - Tough Love moved 36.3 -> 37.0 (new S6 take: phone reaches her ear ~36.6-37.0)
#   - video master v2: s6-cinema-v2 (fast pickup), S8 struck-list insert, Nike-caps cards+labels
# Filtergraph on ONE line per stage; ${mgain} braces required (zsh subscript gotcha, see v4).
set -e
cd "$(dirname "$0")/.."
A=04-assets/audio
S=04-assets/audio/sfx
P=04-assets/audio/sfx/prepared
M=04-assets/audio/music

build_mix() {
  local music=$1 mgain=$2 out=$3
  local G=""
  G+="[0:a]adelay=800:all=1[a0];[1:a]adelay=6500:all=1[a1];[2:a]volume=0.9,adelay=11500:all=1[a2];"
  G+="[3:a]adelay=14200:all=1[a3];[4:a]adelay=22300:all=1[a4];[5:a]adelay=28500:all=1[a5];"
  G+="[6:a]adelay=37000:all=1[a6];[7:a]adelay=40500:all=1[a7];[8:a]volume=0.9,adelay=48000:all=1[a8];"
  G+="[9:a]atempo=1.12,adelay=49600:all=1[a9];[10:a]volume=0.95,adelay=55500:all=1[a10];[11:a]adelay=58000:all=1[a11];"
  G+="[a0][a1][a2][a3][a4][a5][a6][a7][a8][a9][a10][a11]amix=inputs=12:duration=longest:normalize=0[voxraw];"
  G+="[voxraw]asplit[vox][voxkey];"
  G+="[12:a]anull[bed];"
  G+="[13:a]volume=0.35,adelay=400:all=1[f1];[14:a]volume=0.25,adelay=2600:all=1[f2];[15:a]volume=0.30,adelay=4300:all=1[f3];"
  G+="[16:a]volume=0.5,adelay=7600:all=1[b1];[17:a]volume=0.5,adelay=9200:all=1[b2];[18:a]volume=0.5,adelay=10800:all=1[b3];"
  G+="[19:a]volume=0.45,adelay=17900:all=1[r1];"
  G+="[20:a]volume=0.7,adelay=33800:all=1[cr];[21:a]volume=0.40,adelay=34800:all=1[r2];"
  G+="[22:a]volume=0.22,adelay=47200:all=1[f4];[23:a]volume=0.18,adelay=50500:all=1[f5];"
  G+="[24:a]volume=0.35,adelay=52300:all=1[r3];"
  G+="[25:a]volume=0.22,adelay=22200:all=1[st];[26:a]volume=0.35,adelay=43500:all=1[pn];[27:a]volume=0.14,adelay=46800:all=1[pt];"
  G+="[bed][f1][f2][f3][b1][b2][b3][r1][cr][r2][f4][f5][r3][st][pn][pt]amix=inputs=16:duration=longest:normalize=0[sfx];"
  G+="[28:a]atrim=0:59,afade=t=in:d=0.8,afade=t=out:st=55.5:d=3.5,volume=${mgain}[mus];"
  G+="[mus][voxkey]sidechaincompress=threshold=0.05:ratio=3:attack=20:release=650[musd];"
  G+="[vox][sfx][musd]amix=inputs=3:duration=longest:normalize=0,loudnorm=I=-16:TP=-1.5[aout]"

  ffmpeg -y -loglevel error \
    -i $A/narrator-01-open.wav -i $A/narrator-02-february-v2-fit.wav -i $A/friend-q1-conceptual.wav \
    -i $A/narrator-03-turn.wav -i $A/phone-eq2/call-ego-pumper-phoneEQ2.wav -i $A/phone-eq2/call-pragmatist-v2-phoneEQ2.wav \
    -i $A/phone-eq2/call-tough-love-phoneEQ2.wav -i $A/phone-eq2/call-supportive-phoneEQ2.wav \
    -i $A/friend-q2-names-v2.wav -i $A/narrator-04-close.wav -i $A/her-final-line.wav -i $A/narrator-05-tagline.wav \
    -i $S/roomtone.wav \
    -i $P/fw-a.wav -i $P/fw-b.wav -i $P/fw-c.wav \
    -i $S/buzz.wav -i $S/buzz.wav -i $S/buzz.wav \
    -i $P/ring-s3.wav -i $P/crinkle.wav -i $P/ring-s6.wav \
    -i $P/fw-b.wav -i $P/fw-a.wav -i $P/ring-s8.wav \
    -i $P/steps.wav -i $P/pen.wav -i $P/party.wav \
    -i $music \
    -filter_complex "$G" \
    -map "[aout]" -ar 48000 -t 59.0 05-final/voice-mix-$out.wav
  ffmpeg -y -loglevel error -i 05-final/video-master-labeled-v2.mp4 -i 05-final/voice-mix-$out.wav \
    -c:v copy -c:a aac -b:a 192k -shortest 05-final/NaaS-ThisYear-$out.mp4
}

build_mix $M/mixkit-79.mp3  0.28 roughcut-v5                 # The Journey — main pick
build_mix $M/mixkit-614.mp3 0.40 v5-alt-silentdescent
build_mix $M/mixkit-606.mp3 0.30 v5-alt-drawingsky

for f in roughcut-v5 v5-alt-silentdescent v5-alt-drawingsky; do
  d=$(ffprobe -v error -show_entries format=duration -of csv=p=0 05-final/NaaS-ThisYear-$f.mp4)
  echo "$f: ${d}s"
done
echo "V5 DONE"
