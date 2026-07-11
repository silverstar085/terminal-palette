# Terminal Palette

Twenty color themes for macOS Terminal.app — twelve dark, eight light, and
five of them backed by real textures (paper, linen, canvas, charcoal, denim).

Every ANSI color in every theme is contrast-checked against its background
(WCAG), so directory listings, comments, selections, and git output stay
readable in all of them — nothing disappears, not even ANSI black on dark or
yellow on cream. For the textured themes, colors are validated against the
texture's brightest *and* darkest pixels, so text stays crisp on the grain.

**Preview everything first:** open [`index.html`](index.html) in a browser
for a live specimen sheet of all 20 themes with color swatches.

## Install

### Everything at once

```sh
bash install.sh
```

Imports all 20 profiles into Terminal.app and wires the five textured themes
to their background images (copied to `~/Pictures/Terminal Textures`).

### Just one theme

Double-click any `.terminal` file in `themes/` — it opens a window in that
theme and adds it to your profiles automatically.

For the five textured themes (Rag Paper, Irish Linen, Raw Canvas, Charcoal
Sketch, Indigo Denim), attach the texture after importing:

1. Terminal ▸ Settings (⌘,) ▸ Profiles ▸ select the theme.
2. Under Background, click **Color & Effects** ▸ choose **Image** ▸ pick the
   matching PNG from `textures/` (or `~/Pictures/Terminal Textures` if you
   ran `install.sh`).

Pairings: Rag Paper → `rag-paper.png` · Irish Linen → `irish-linen.png` ·
Raw Canvas → `raw-canvas.png` · Charcoal Sketch → `charcoal-sketch.png` ·
Indigo Denim → `indigo-denim.png`

### Set a default

Terminal ▸ Settings (⌘,) ▸ Profiles ▸ select the theme ▸ click **Default**.
Any imported theme stays in your profiles list; open a one-off window in any
theme via Shell ▸ New Window ▸ (theme name).

## The themes

### Dark

| Theme | |
|---|---|
| Midnight Harbor | Deep navy with cool cyan light — a harbor at night. |
| Ember | Warm charcoal and firelight orange; cozy, low glare. |
| Nordfjord | Cool blue-grey calm in the Scandinavian tradition. |
| Evergreen | Deep forest floor with moss, fern, and amber light. |
| Velvet | Plush deep purple with soft jewel tones. |
| Graphite | Disciplined monochrome with a single amber signal. |
| Espresso | Roasted browns and crema — a café at closing time. |
| Neon Dusk | Synthwave, restrained: dusk violet with electric accents. |
| Abyss | True-black OLED depth with high-clarity signals. |
| Slate Rose | Warm grey slate with dusty rose and sage. |
| Charcoal Sketch † | Toothy charcoal paper; soft pastel-pencil accents. |
| Indigo Denim † | Worn indigo twill with contrast-stitch gold. |

### Light

| Theme | |
|---|---|
| Paper | Warm cream and iron-gall ink; a fine notebook. |
| Morning Fog | Cool grey-blue light through an early window. |
| Sakura | Soft blossom pink with grounded, inky accents. |
| Mint Condition | Fresh mint white with botanical greens. |
| Linen | Neutral gallery white; quiet, exact, timeless. |
| Rag Paper † | Warm cotton-rag paper with visible grain; ink-well accents. |
| Irish Linen † | Cool natural linen weave; sea-glass and slate accents. |
| Raw Canvas † | Ecru artist's canvas, coarse weave; earth-pigment accents. |

† textured — background is a real 2880×1800 texture rendered at the theme's
exact background color.

## How it works

A `.terminal` file is a macOS property list containing a full Terminal.app
profile: background, text, cursor, and selection colors plus all 16 ANSI
colors, each stored as an archived `NSColor`. Double-clicking one imports it
as a profile.

The textured themes additionally reference a background image via the
profile's `BackgroundImagePath` key. Because that key stores an absolute
path, `install.sh` copies the PNGs to a stable location
(`~/Pictures/Terminal Textures`) and rewrites the path with `plutil` before
importing — keep the PNGs in place afterwards, since Terminal references
them by path. Texture amplitude is deliberately low so the grain reads as
material, not noise.

`index.html` is a self-contained specimen sheet: each card reproduces its
theme from the same 16-color palette the `.terminal` file defines, and the
textured previews use the actual texture files from `textures/`.

## Repository layout

```
terminal-palette/
├── index.html      # live preview gallery for all 20 themes
├── install.sh      # one-command installer
├── themes/         # the 20 .terminal profiles
└── textures/       # background PNGs for the five textured themes
```

## License

[MIT](LICENSE)
