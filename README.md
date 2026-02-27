# Velocighostino

**Ghostty's palette meets Obsidian's canvas**

An opinionated Obsidian theme combining Velocity's OKLCH parametric color engine, Cupertino's layout polish, and Ghostty's Tomorrow Night palette. Dark mode is anchored to Ghostty's exact ANSI colors. Light mode uses warm paper tones. Pure CSS -- no plugins required.

## Features

- Dark mode built on Ghostty's Tomorrow Night ANSI palette (`#282C34` background, muted warm pastels)
- Complementary light mode with warm paper tones (`#FAF8F5`), not clinical white
- OKLCH parametric color engine for perceptually uniform, coherent palette shifts
- Glass/frosted effects on modals, sidebars, and interactive elements
- iA Writer Quattro (editor) + Atkinson Hyperlegible Next (UI) + iA Writer Mono (code) typography
- Hover-reveal sidebars, focus mode, active line indicator

## Installation

### Community themes

Settings > Appearance > Themes > Search "Velocighostino" > Install and activate.

> Not yet listed -- coming soon.

### BRAT (beta testing)

Install the [BRAT plugin](https://github.com/TfTHacker/obsidian42-brat), go to BRAT settings > Add Beta Theme > Enter `cameronsjo/velocighostino`.

## Recommended Fonts

The theme works without these fonts (degrades gracefully to Inter > system sans-serif), but for the full experience:

- **iA Writer Quattro** and **iA Writer Mono**: [iA Fonts on GitHub](https://github.com/iaolo/iA-Fonts) -- SIL OFL 1.1
- **Atkinson Hyperlegible Next**: [Braille Institute](https://www.brailleinstitute.org/freefont/) -- SIL OFL 1.1

## Build from Source

```bash
pnpm install
pnpm build    # Compiles src/theme.scss -> theme.css + theme-beta.css
pnpm dev      # Watch mode for development
```

## Attribution

| Source | What we drew from | Version | License |
|--------|-------------------|---------|---------|
| [Velocity](https://github.com/Gonzalo-D-Sales/obsidian-velocity) | OKLCH parametric color engine, glass effects, SCSS architecture | [v2.1.0](https://github.com/Gonzalo-D-Sales/obsidian-velocity/releases/tag/v2.1.0) (`d4b913c`) | GPL-3.0 |
| [Cupertino](https://github.com/aaaaalexis/obsidian-cupertino) | Layout discipline, clean writing surface, Apple HIG polish | [3.2.1.0](https://github.com/aaaaalexis/obsidian-cupertino/releases/tag/3.2.1.0) (`1472c11`) | MIT |
| [Ghostty](https://github.com/ghostty-org/ghostty) | Tomorrow Night dark palette (ANSI colors from `src/terminal/color.zig`) | main | MIT |

Design work began 2026-02-14. Versions listed were the latest releases at that time.

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).

GPL-3.0 to respect Velocity's copyleft license. Cupertino (MIT) and Ghostty (MIT) are compatible.
