# Collage Maker

A lightweight, offline-capable web app for stacking, enhancing, and exporting
images. No account, no upload, no server — runs locally in your browser.

## Features
- Stack images vertically — drop photos, drag to reorder
- EXIF auto-rotation — portrait photos corrected automatically
- Per-image enhance — brightness, contrast, saturation, sharpen per photo
- Auto enhance preset — tuned for mobile photos
- Rotate per image — 90° left/right, baked into export
- Export as Image — JPG or PNG at Lo / Med / Hi resolution
- Export as PDF — combined (one page) or one image per page
- Session persistence — survives page refresh via localStorage
- PWA — installs as a desktop app, works fully offline

## Quick start

### Step 1 — Download

Click **Code → Download ZIP** at the top of this repo, then unzip the folder.

### Step 2 — Run

**Mac / Linux** — double-click `start.sh` in Finder  
(first time on Mac: right-click → Open if macOS asks for confirmation)

**Windows** — double-click `start.bat`

The app opens automatically at `http://localhost:8080`.

> Requires Python 3 — pre-installed on macOS. Windows: download from [python.org](https://python.org).

## Install as a desktop app (PWA)
1. Run the app in Chrome or Edge
2. Click the install icon (⊕) in the address bar
3. Works offline from that point on

## Sharing
Clone the repo → run `start.sh` or `start.bat` → optionally install as PWA.
No npm, no build step, no dependencies beyond Python 3.

## How to use

| Action | How |
|---|---|
| Add images | Click **+ Add images** or drag files onto the canvas |
| Reorder | Drag images up or down |
| Select an image | Click it — controls appear in the sidebar |
| Rotate | Select → use ↺ / ↻ buttons |
| Enhance | Select → move sliders, or click **✦ Auto enhance** |
| Replace an image | Drop a new file directly onto the existing one |
| Remove an image | Hover → click × |
| Gap / Width | Layout section sliders |
| Background | Swatches or custom colour picker |
| Export image | Choose quality (Lo/Med/Hi) + format (JPG/PNG) → **↓ Image** |
| Export PDF | Choose combined ⊟ or per-page ≡ → **↓ PDF** |

## Export quality guide

| Setting | Output width | Best for |
|---|---|---|
| Lo | 1× stack width | Sharing on chat / social |
| Med | 2× stack width | General use, email |
| Hi | 3× stack width | Printing, archiving |

## File structure
```
collage-maker/
├── index.html      — full app (HTML + CSS + JS, self-contained)
├── manifest.json   — PWA manifest (name, icon, display mode)
├── sw.js           — service worker (offline caching)
├── icon.svg        — app icon
├── start.sh        — launcher for Mac / Linux
├── start.bat       — launcher for Windows
└── README.md       — this file
```

## Tech notes
- Zero dependencies — no frameworks, no build tools
- Image processing via Canvas API and `ctx.filter`
- Sharpening uses a 3×3 unsharp mask convolution applied per-pixel
- EXIF orientation parsed directly from raw `ArrayBuffer` before image decode
- localStorage for persistence; quota exceeded → settings still saved, dot turns orange
- PDF `@page` sized to exact canvas pixel dimensions — zero scaling, no quality loss

## License
MIT
