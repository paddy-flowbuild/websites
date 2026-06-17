#!/usr/bin/env bash
# Sync the website files into the clean publish/ folder and deploy to Netlify.
# Usage: ./deploy.sh
set -e
cd "$(dirname "$0")"

echo "→ Syncing files into publish/"
rm -rf publish
mkdir -p publish
cp index.html publish/index.html
cp -R screenshots publish/screenshots
rm -f publish/screenshots/current-page.png   # unused asset

echo "→ Deploying to Netlify (production)"
npx --no-install netlify deploy --prod --dir=publish

echo "✓ Done → https://flowbuild-site.netlify.app"
