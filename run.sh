#!/usr/bin/env bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SAVE_DIR="$SCRIPT_DIR"
TS=$(date +%Y%m%d_%H%M%S)"

cvlc v4l2:///dev/video4 :v4l2-width=640 :v4l2-height=480 :v4l2-fps=30 \
     --live-caching=100 \
     --sout "#transcode{vcodec=h264,vb=8000,scale=1,threads=2}:duplicate{dst=standard{access=file,mux=mp4,dst=${SAVE_DIR}/SEND_${TS}.mp4},dst=rtp{mux=ts,dst=192.168.2.99,port=4004}}" \
     --sout-keep &
TX_PID=$!

vlc rtp://192.168.3.20:4004 \
    --sout "#duplicate{dst=file{dst=${SAVE_DIR}/RECV_${TS}.mp4,mux=mp4},dst=display}" \
    --sout-keep &
RX_PID=$!

inet -u Cmdenv -f telesim.ini

sleep 1
kill $TX_PID $RX_PID 2>/dev/null || true
wait

