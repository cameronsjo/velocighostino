# Velocighostino

Obsidian community theme — CSS only, no JS/plugins.
Fuses Velocity's OKLCH engine, Cupertino's layout polish, Ghostty's Tomorrow Night palette.

## Quick Reference

- Build: `pnpm build` (sass compiles src/theme.scss -> theme.css, copies to theme-beta.css)
- Dev: `pnpm dev` (watch mode)
- Entry point: `src/theme.scss`

## SCSS Architecture

Layer system with numbered directories — imports flow top to bottom:

- `00_foundations/` — CSS custom properties (`_variables.scss`), `@font-face` declarations with base64-embedded woff2 (`_fonts.scss`), reset/scrollbars/animations (`_base.scss`)
- `10_colors/` — Dark (`.theme-dark`) and light (`.theme-light`) mode palettes
- `20_editor/` — Markdown rendering: typography, lists, blockquotes, callouts, code, tables, embeds, formatting
- `30_chrome/` — UI shell: layout, tabs, sidebar, status bar, modals, nav
- `40_features/` — Optional behaviors: focus mode, active line, hover-reveal sidebars

Convention: all partials use `_name.scss` prefix, imported via `@use` in `theme.scss`. One concern per partial. `_fonts.scss` is imported LAST because its ~580KB of base64 data should come after all rule blocks.

## OKLCH Color System

- Base parameters: `--bhue` (hue angle), `--bsat-*` (4 saturation tiers), `--bl-*` (lightness scale)
- Dark mode: `--bhue: 220` (blue-gray, matching Ghostty's `#282C34`)
- Light mode: `--bhue: 45` (warm amber)
- Surface colors: `oklch(var(--bl-XX) var(--bsat-YY) var(--bhue))`
- All semantic colors derive from these parameters — changing `--bhue` shifts the entire palette

## Obsidian CSS Conventions

### Variable Scoping (body vs :root)

Obsidian resolves CSS variables from specific selectors. Using the wrong one causes silent failures:

- **`body { }`** — Font stacks (`--font-*-theme`) and shared cross-mode variables MUST go here. `:root` does NOT reliably cascade to all UI elements (file explorer, sidebar, etc.)
- **`.theme-dark { }` / `.theme-light { }`** — Mode-specific overrides (colors, shadows, glass effects)
- **`:root { }`** — Use with caution. Obsidian docs recommend `body` instead. Safe for internal/custom variables (e.g., `--vl-*`, `--bhue`) but NOT for Obsidian's own `--font-*-theme` variables
- Do NOT try to bridge `--font-interface` / `--font-text` / `--font-monospace` (Obsidian's built-in variables) — set the `-theme` variants on `body` and Obsidian handles the rest

### Other Conventions

- `--color-base-*` has exactly 12 steps: 00, 05, 10, 20, 25, 30, 35, 40, 50, 60, 70, 100
- Do NOT create intermediate steps (15, 45, 55, etc.) — they are dead code
- Theme scoping: `.theme-dark { }` and `.theme-light { }`
- Accent colors need HSL components: `--accent-h`, `--accent-s`, `--accent-l` alongside `--interactive-accent`
- Target: Obsidian 1.11+ (Chromium 120+) — OKLCH, `color-mix()`, `oklch(from ...)`, container queries, `backdrop-filter` all supported natively

## Font Gotchas

Critical `local()` naming rules:

- iA Writer **static** fonts register as `"iA Writer Quattro S"` (S = Static), NOT `"iA Writer Quattro"`
- iA Writer **variable** fonts use `"V"` suffix: `"iA Writer Quattro V"`
- Need dual `local()` for cross-platform: Full Name (macOS) + PostScript Name (Windows)
- Example: `local("iA Writer Quattro S Regular"), local("iAWriterQuattroS-Regular")`
- Updated font is `"Atkinson Hyperlegible Next"` (not `"Atkinson Hyperlegible"`)
- `local("iA Writer Quattro")` will silently fail on every platform

## Ghostty Palette

Source of truth: Ghostty's `src/terminal/color.zig` ANSI values.

- Rainbow: exact ANSI values (Red `#CC6666`, Green `#B5BD68`, Yellow `#F0C674`, Blue `#81A2BE`, Purple `#B294BB`, Cyan `#8ABEB7`, Orange `#D54E53`, Pink `#C397D8`)
- Foreground: ANSI 15 `#EAEAEA` for `--text-normal` (not Config foreground `#FFFFFF` — softer for reading)
- Muted text: ANSI 7 `#C5C8C6` (Tomorrow Night canonical foreground)
- Accent: `#81A2BE` (Ghostty blue, ANSI 4)

## Phase Boundaries

- **Phase 1 (current):** Opinionated single-look theme, no external dependencies, no configuration UI
- **Phase 2 (future):** Style Settings plugin integration, multiple paint schemes, platform-adaptive styling, mobile overrides, plugin-specific integrations (Calendar, Dataview, Canvas)
- Do NOT add Style Settings variables, platform detection (`navigator.platform`), or mobile-specific CSS in Phase 1

## Release

- release-please manages versions via `release-please-config.json`
- GitHub Release workflow uploads `theme.css` + `manifest.json` as assets
- `theme-beta.css` is an exact copy of `theme.css` (required for BRAT beta theme support)
- Version bumps in: `manifest.json`, `package.json` (both managed by release-please extra-files)
