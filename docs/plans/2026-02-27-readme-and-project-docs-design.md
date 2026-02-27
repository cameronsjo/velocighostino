# Design: README, CLAUDE.md, and Project Documentation

**Date:** 2026-02-27
**Status:** Approved

## Context

Velocighostino is a pure-CSS Obsidian community theme combining three sources.
The project has working code, release automation, and BRAT beta support, but lacks
foundational project documentation: no README, no license, no CLAUDE.md, no
CONTRIBUTING guide, no CHANGELOG.

## Deliverables

### 1. README.md

**Structure:**

- **Hero:** Theme name + one-liner tagline
- **Features:** Dark mode (Ghostty palette), light mode (warm paper), OKLCH
  parametric color engine, glass/frosted effects, iA Writer Quattro + Atkinson
  Hyperlegible typography
- **Installation:** Obsidian community themes (when listed) + BRAT beta instructions
- **Recommended fonts:** Download links for iA Writer Quattro, Atkinson Hyperlegible
  Next, iA Writer Mono. Note graceful fallback to Inter/system fonts
- **Build from source:** `pnpm install && pnpm build`
- **Attribution:** Table with source repos, pinned versions/commits, licenses
- **License:** GPL-3.0 badge and link

**No screenshots** — text-only for now; screenshots in a future PR.

### 2. LICENSE

GPL-3.0 full text. Required by Velocity's copyleft license since Velocighostino
draws from its OKLCH engine concepts and SCSS architecture patterns.

### 3. CLAUDE.md (project root)

Theme-development focused instructions for Claude Code sessions:

- Project description and one-liner
- Build commands (`pnpm install`, `pnpm build`, `pnpm dev`)
- SCSS layer system: `00_foundations/` → `10_colors/` → `20_editor/` →
  `30_chrome/` → `40_features/`
- Obsidian's 12-step `--color-base-*` scale (00, 05, 10, 20, 25, 30, 35, 40,
  50, 60, 70, 100 — not continuous)
- OKLCH parametric variables: `--bhue`, `--bsat-*`, `--bl-*`
- `@font-face local()` naming gotchas (iA Writer "S" suffix for static fonts,
  "V" for variable, dual `local()` for cross-platform)
- Ghostty palette source of truth: ANSI values from `color.zig`
- Phase 1 vs Phase 2 boundary (no Style Settings, no platform-adaptive, no
  mobile overrides)
- Release workflow: release-please with `theme.css` + `manifest.json` assets

### 4. CONTRIBUTING.md

Brief contributor guide:

- Prerequisites (pnpm, sass)
- Build and dev workflow
- SCSS conventions (layer numbering, partial naming)
- PR requirements (conventional commits, one feature per PR)
- Link to design docs

### 5. CHANGELOG.md

Initial changelog tracking v0.1.0 (current release).
Note: release-please will manage this file going forward.

## Source Attribution (Pinned Versions)

| Source | Repo | Version | Tag/SHA | License |
|--------|------|--------:|---------|---------|
| Velocity | `Gonzalo-D-Sales/obsidian-velocity` | v2.1.0 | `d4b913c` | GPL-3.0 |
| Cupertino | `aaaaalexis/obsidian-cupertino` | 3.2.1.0 | `1472c11` | MIT |
| Ghostty | `ghostty-org/ghostty` | main | palette from `src/terminal/color.zig` | MIT |

Design work began 2026-02-14. These were the latest releases at that time.

## License Decision

**GPL-3.0** — Velocity is GPL-3.0 (copyleft). Since Velocighostino reimplements
concepts from Velocity's OKLCH engine and mirrors its SCSS architecture, GPL-3.0
is the appropriate license. Cupertino (MIT) and Ghostty (MIT) are upward-compatible
with GPL-3.0.
