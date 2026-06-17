#!/usr/bin/env bash
# Render every carousel slide to a 1080×1350 (4:5) PNG in carousel-export/.
# Edit copy/designs in carousel.html, then run: ./render-carousel.sh
# Requires the local server running (node serve.mjs) on port 3100.
set -e
cd "$(dirname "$0")"

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="http://localhost:3100/carousel.html"
OUT="carousel-export"
SLIDES=8   # cover + 6 designs + CTA

mkdir -p "$OUT"
for n in $(seq 1 $SLIDES); do
  nn=$(printf "%02d" "$n")
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --window-size=1080,1350 --virtual-time-budget=3000 \
    --screenshot="$OUT/slide-$nn.png" "$URL?slide=$n" 2>/dev/null
  echo "✓ slide-$nn.png"
done
echo "Done → $OUT/ (1080×1350, ready to post)"
