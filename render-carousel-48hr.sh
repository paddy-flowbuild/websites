#!/usr/bin/env bash
# Render the 48-hour-process carousel to 1080×1350 (4:5) PNGs.
# Edit copy in carousel-48hr.html, then run: ./render-carousel-48hr.sh
# Requires the local server running (node serve.mjs) on port 3100.
set -e
cd "$(dirname "$0")"

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="http://localhost:3100/carousel-48hr.html"
OUT="carousel-48hr-export"
SLIDES=8   # cover + contrast + 4 process steps + proof + CTA

mkdir -p "$OUT"
for n in $(seq 1 $SLIDES); do
  nn=$(printf "%02d" "$n")
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --window-size=1080,1350 --virtual-time-budget=3000 \
    --screenshot="$OUT/slide-$nn.png" "$URL?slide=$n" 2>/dev/null
  echo "✓ slide-$nn.png"
done
echo "Done → $OUT/ (1080×1350, ready to post)"
