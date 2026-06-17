# FlowBuild — Website & Social Assets

The FlowBuild marketing site plus the social-carousel tooling, all in one place.

**Live site:** https://flowbuild-site.netlify.app

## Project structure

| Path | What it is |
|------|------------|
| `index.html` | The FlowBuild website (single file, all styles inline) |
| `screenshots/` | Client site screenshots used in the portfolio + carousels |
| `serve.mjs` | Tiny static dev server → http://localhost:3100 |
| `netlify.toml` | Netlify deploy config (publishes the `publish/` folder) |
| `deploy.sh` | Sync `index.html` + `screenshots/` into `publish/` and deploy to Netlify |
| `carousel.html` | Portfolio carousel (cover + 6 designs + CTA), 4:5 |
| `carousel-48hr.html` | "48-hour process" carousel, 4:5 |
| `render-carousel.sh` / `render-carousel-48hr.sh` | Render each carousel slide to a 1080×1350 PNG |
| `carousel-export/` / `carousel-48hr-export/` | Exported, post-ready carousel images |

## Local development

```bash
node serve.mjs          # serves the project root at http://localhost:3100
```

## Deploy

```bash
./deploy.sh             # builds publish/ and pushes a production deploy to Netlify
```

## Re-render carousels

Edit the copy/designs in `carousel.html` or `carousel-48hr.html`, then:

```bash
./render-carousel.sh        # → carousel-export/*.png
./render-carousel-48hr.sh   # → carousel-48hr-export/*.png
```

Requires the dev server running and Google Chrome installed (used headless for screenshots).
