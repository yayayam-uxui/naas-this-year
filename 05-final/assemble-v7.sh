#!/bin/zsh
# v7: Yam's v6 notes — two lines that felt disconnected:
#   - friend-q1 ("How's the 10K? Still… conceptual?") CUT: idiom + redundant with the new narrator
#     comedy line + a disembodied voice we only meet 35s later. Narrator + buzzes now own S2.
#   - her line: "Someone kept calling." -> "You'll see." (narrator's close already answers HOW;
#     "You'll see." answers the friend directly, then the pickup demos the product.)
# Voice bus is now 11 stems; SFX/music indices shifted by -1. Music: The Journey (locked).
# Video master: video-master-labeled-v3.mp4 (unchanged from v6).
set -e
cd "$(dirname "$0")/.."
A=04-assets/audio
S=04-assets/audio/sfx
P=04-assets/audio/sfx/prepared
M=04-assets/audio/music

G=""
G+="[0:a]adelay=800:all=1[a0];[1:a]adelay=6300:all=1[a1];"
G+="[2:a]adelay=14200:all=1[a2];[3:a]adelay=22300:all=1[a3];[4:a]adelay=28500:all=1[a4];"
G+="[5:a]adelay=37200:all=1[a5];[6:a]adelay=40500:all=1[a6];[7:a]volume=0.9,adelay=48000:all=1[a7];"
G+="[8:a]atempo=1.12,adelay=49600:all=1[a8];[9:a]volume=0.95,adelay=55500:all=1[a9];[10:a]adelay=58000:all=1[a10];"
G+="[a0][a1][a2][a3][a4][a5][a6][a7][a8][a9][a10]amix=inputs=11:duration=longest:normalize=0[voxraw];"
G+="[voxraw]asplit[vox][voxkey];"
G+="[11:a]anull[bed];"
G+="[12:a]volume=0.35,adelay=400:all=1[f1];[13:a]volume=0.25,adelay=2600:all=1[f2];[14:a]volume=0.30,adelay=4300:all=1[f3];"
G+="[15:a]volume=0.5,adelay=7600:all=1[b1];[16:a]volume=0.5,adelay=9200:all=1[b2];[17:a]volume=0.5,adelay=10800:all=1[b3];"
G+="[18:a]volume=0.45,adelay=17900:all=1[r1];"
G+="[19:a]volume=0.7,adelay=33800:all=1[cr];[20:a]volume=0.40,adelay=34800:all=1[r2];"
G+="[21:a]volume=0.22,adelay=47200:all=1[f4];[22:a]volume=0.18,adelay=50500:all=1[f5];"
G+="[23:a]volume=0.35,adelay=52300:all=1[r3];"
G+="[24:a]volume=0.22,adelay=22200:all=1[st];[25:a]volume=0.35,adelay=43500:all=1[pn];[26:a]volume=0.14,adelay=46800:all=1[pt];"
G+="[bed][f1][f2][f3][b1][b2][b3][r1][cr][r2][f4][f5][r3][st][pn][pt]amix=inputs=16:duration=longest:normalize=0[sfx];"
G+="[27:a]atrim=0:59,afade=t=in:d=0.8,afade=t=out:st=55.5:d=3.5,volume=0.28[mus];"
G+="[mus][voxkey]sidechaincompress=threshold=0.05:ratio=3:attack=20:release=650[musd];"
G+="[vox][sfx][musd]amix=inputs=3:duration=longest:normalize=0,loudnorm=I=-16:TP=-1.5[aout]"

ffmpeg -y -loglevel error \
  -i $A/narrator-01-open.wav -i $A/narrator-02-reminders-fit.wav \
  -i $A/narrator-03-turn.wav -i $A/phone-eq2/call-ego-pumper-phoneEQ2.wav -i $A/phone-eq2/call-pragmatist-v3-phoneEQ2.wav \
  -i $A/phone-eq2/call-tough-love-phoneEQ2.wav -i $A/phone-eq2/call-supportive-phoneEQ2.wav \
  -i $A/friend-q2-names-v2.wav -i $A/narrator-04-close.wav -i $A/her-youll-see.wav -i $A/narrator-05-tagline.wav \
  -i $S/roomtone.wav \
  -i $P/fw-a.wav -i $P/fw-b.wav -i $P/fw-c.wav \
  -i $S/buzz.wav -i $S/buzz.wav -i $S/buzz.wav \
  -i $P/ring-s3.wav -i $P/crinkle.wav -i $P/ring-s6.wav \
  -i $P/fw-b.wav -i $P/fw-a.wav -i $P/ring-s8.wav \
  -i $P/steps.wav -i $P/pen.wav -i $P/party.wav \
  -i $M/mixkit-79.mp3 \
  -filter_complex "$G" \
  -map "[aout]" -ar 48000 -t 59.0 05-final/voice-mix-roughcut-v7.wav
ffmpeg -y -loglevel error -i 05-final/video-master-labeled-v3.mp4 -i 05-final/voice-mix-roughcut-v7.wav \
  -c:v copy -c:a aac -b:a 192k -shortest 05-final/NaaS-ThisYear-roughcut-v7.mp4
ffprobe -v error -show_entries format=duration -of csv=p=0 05-final/NaaS-ThisYear-roughcut-v7.mp4
echo "V7 DONE"
