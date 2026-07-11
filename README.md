# Terminal Palette

Fifteen color themes for macOS Terminal.app — ten dark, five light.

Every ANSI color in every theme is contrast-checked against its background
(WCAG), so directory listings, comments, selections, and git output stay
readable in all of them — nothing disappears, not even ANSI black on dark or
yellow on cream.

**[Browse the live demo →](https://silverstar085.github.io/terminal-palette/)**
— a specimen sheet of all 15 themes with color swatches (or open
[`index.html`](index.html) locally).

## Install

### Everything at once

```sh
bash install.sh
```

Imports all 15 profiles into Terminal.app. Safe to re-run;
already-installed profiles are skipped.

### Just one theme

Double-click any `.terminal` file in `themes/` — it opens a window in that
theme and adds it to your profiles automatically.

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

### Light

| Theme | |
|---|---|
| Paper | Warm cream and iron-gall ink; a fine notebook. |
| Morning Fog | Cool grey-blue light through an early window. |
| Sakura | Soft blossom pink with grounded, inky accents. |
| Mint Condition | Fresh mint white with botanical greens. |
| Linen | Neutral gallery white; quiet, exact, timeless. |

## How it works

A `.terminal` file is a macOS property list containing a full Terminal.app
profile: background, text, cursor, and selection colors plus all 16 ANSI
colors, each stored as an archived `NSColor`. Double-clicking one imports it
as a profile. `install.sh` just automates that for all fifteen, skipping any
profile you already have.

[`index.html`](index.html) is a self-contained specimen sheet: each card
reproduces its theme from the same 16-color palette the `.terminal` file
defines.

## Repository layout

```
terminal-palette/
├── index.html      # live preview gallery for all 15 themes
├── install.sh      # one-command installer
└── themes/         # the 15 .terminal profiles
```

## License

[MIT](LICENSE)
