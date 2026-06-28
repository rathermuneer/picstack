# Picstack

A free, offline-capable web app for stacking, enhancing, and compressing photos. No account, no uploads, no server — everything runs locally in your browser. Your images never leave your device.

## Features
- Stack images vertically or horizontally — drop photos, drag to reorder
- EXIF auto-rotation — portrait photos corrected automatically
- Per-image enhance — brightness, contrast, saturation, sharpen per photo
- Auto enhance preset — tuned for mobile photos
- Crop — 8-handle drag crop with live dimension readout
- Rotate per image — 90° left/right, baked into export
- Undo — per-image undo stack for crop and rotate
- Max size export — auto-compress to under 2MB / 1MB / 500KB
- Smart compress — smaller files, no visible quality loss
- Export as Image — JPG or PNG at Lo / Med / Hi resolution
- Export as PDF — single page or one image per page
- IndexedDB persistence — images survive page refresh
- PWA — installs as a desktop app, works fully offline
- HEIC support — iPhone photos accepted on Safari and Chrome

## Try it online

**[https://rathermuneer.github.io/picstack/](https://rathermuneer.github.io/picstack/)**

No install needed — open in any modern browser.

## Run locally

### Step 1 — Download

Click **Code → Download ZIP** at the top of this repo, then unzip the folder.

### Step 2 — Run

**Mac / Linux** — double-click `start.sh` in Finder  
(first time on Mac: right-click → Open if macOS asks for confirmation)

**Windows** — double-click `start.bat`

The app opens automatically at `http://localhost:8080`.

> Requires Python 3 — pre-installed on macOS. Windows: download from [python.org](https://python.org).

## Install as a desktop app (PWA)
1. Open the app in Chrome or Edge
2. Click the install icon (⊕) in the address bar
3. Works fully offline from that point on

## How to use

| Action | How |
|---|---|
| Add images | Click **+ Add images** or drag files onto the canvas |
| Reorder | Drag images up or down (or left/right in horizontal mode) |
| Select an image | Click it — controls appear in the sidebar |
| Rotate | Select → use ↺ / ↻ buttons |
| Crop | Select → click **⬚ Crop** |
| Undo | Select → click **↩ Undo** |
| Enhance | Select → move sliders, or click **✦ Auto enhance** |
| Replace an image | Drop a new file directly onto the existing one |
| Remove an image | Hover → click × |
| Direction | Layout section → ↕ V (vertical) or ↔ H (horizontal) |
| Gap / Width | Layout section sliders |
| Background | Swatches or custom colour picker |
| Max size | Export section → Off / 2MB / 1MB / 500K |
| Export image | Choose quality + format → **↓ Image** |
| Export PDF | Choose Single or Per image → **↓ PDF** |

## Export quality guide

| Setting | Output width | Best for |
|---|---|---|
| Lo | 1× stack width | Sharing on chat / social |
| Med | 2× stack width | General use, email |
| Hi | 3× stack width | Printing, archiving |

## File structure
```
picstack/
├── index.html      — full app (HTML + CSS + JS, self-contained)
├── manifest.json   — PWA manifest (name, icon, display mode)
├── sw.js           — service worker (offline caching)
├── icon.svg        — app icon
├── start.sh        — launcher for Mac / Linux
├── start.bat       — launcher for Windows
└── README.md       — this file
```

## Tech notes
- Zero dependencies — no frameworks, no build tools, no npm
- Image processing via Canvas API and `ctx.filter`
- Sharpening uses a 3×3 unsharp mask convolution applied per-pixel
- EXIF orientation parsed directly from raw `ArrayBuffer` before image decode
- Max size export uses binary search over JPEG quality (floor 0.60) to hit target
- IndexedDB for image persistence; localStorage for settings
- PDF `@page` sized to exact canvas pixel dimensions — zero scaling, no quality loss

## License
MIT
