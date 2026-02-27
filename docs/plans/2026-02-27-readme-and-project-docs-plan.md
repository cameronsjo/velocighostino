# Project Documentation Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add foundational project documentation — README, LICENSE, CLAUDE.md, CONTRIBUTING.md, and CHANGELOG.md

**Architecture:** Five static files at project root. No code changes. GPL-3.0 license to respect Velocity's copyleft. README includes source attribution with pinned versions/commits.

**Tech Stack:** Markdown, GPL-3.0 license text

---

### Task 1: Add GPL-3.0 LICENSE file

**Files:**

- Create: `LICENSE`

**Step 1: Create LICENSE file**

Write the standard GPL-3.0 license text with copyright header:

```
Velocighostino - An Obsidian theme
Copyright (C) 2026 Cameron Sjo

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
```

Followed by the full GPL-3.0 text from https://www.gnu.org/licenses/gpl-3.0.txt

**Step 2: Commit**

```bash
git add LICENSE
git commit -m "docs: add GPL-3.0 license"
```

---

### Task 2: Create README.md

**Files:**

- Create: `README.md`

**Step 1: Write README.md**

Structure (in order):

1. **Title + tagline:** `# Velocighostino` + "Ghostty's palette meets Obsidian's canvas"
2. **One-paragraph description:** Combines Velocity's OKLCH color engine, Cupertino's layout polish, Ghostty's Tomorrow Night palette. Pure CSS, no plugins required
3. **Features section** (brief bullet list):
   - Dark mode anchored to Ghostty's exact ANSI palette (`#282C34` background, muted warm pastels)
   - Light mode with warm paper tones (`#FAF8F5`), not clinical white
   - OKLCH parametric color engine — perceptually uniform, coherent palette shifts
   - Glass/frosted effects on modals, sidebars, buttons
   - iA Writer Quattro (editor) + Atkinson Hyperlegible Next (UI) typography
   - Hover-reveal sidebars, focus mode, active line indicator
4. **Installation section:**
   - Obsidian community themes (when listed): Settings → Appearance → Themes → Search "Velocighostino"
   - BRAT beta: Add `cameronsjo/velocighostino` via BRAT plugin
5. **Recommended Fonts section:**
   - iA Writer Quattro and iA Writer Mono: link to https://github.com/iaolo/iA-Fonts
   - Atkinson Hyperlegible Next: link to https://www.brailleinstitute.org/freefont/
   - Note: theme degrades gracefully to Inter → system sans-serif if fonts aren't installed
6. **Build from Source section:**
   ```bash
   pnpm install
   pnpm build    # Compiles src/theme.scss → theme.css + theme-beta.css
   pnpm dev      # Watch mode
   ```
7. **Attribution section** — table:

   | Source | What we drew from | Version | License |
   |--------|-------------------|---------|---------|
   | [Velocity](https://github.com/Gonzalo-D-Sales/obsidian-velocity) | OKLCH parametric color engine, glass effects, SCSS architecture | [v2.1.0](https://github.com/Gonzalo-D-Sales/obsidian-velocity/releases/tag/v2.1.0) (`d4b913c`) | GPL-3.0 |
   | [Cupertino](https://github.com/aaaaalexis/obsidian-cupertino) | Layout discipline, clean writing surface, Apple HIG polish | [3.2.1.0](https://github.com/aaaaalexis/obsidian-cupertino/releases/tag/3.2.1.0) (`1472c11`) | MIT |
   | [Ghostty](https://github.com/ghostty-org/ghostty) | Tomorrow Night dark palette (ANSI colors from `src/terminal/color.zig`) | main | MIT |

   Note below table: "Design work began 2026-02-14. Versions listed were the latest releases at that time."

8. **License section:** "GPL-3.0 — see [LICENSE](LICENSE)" with brief note about why

**Step 2: Commit**

```bash
git add README.md
git commit -m "docs: add README with features, installation, and attribution"
```

---

### Task 3: Create CLAUDE.md

**Files:**

- Create: `CLAUDE.md`

**Step 1: Write CLAUDE.md**

Structure:

1. **Project header:** Velocighostino — Obsidian community theme (CSS only, no JS/plugins)
2. **Quick reference:**
   - Build: `pnpm build` (sass → theme.css + theme-beta.css copy)
   - Dev: `pnpm dev` (watch mode)
   - Entry point: `src/theme.scss`
3. **SCSS Architecture:** Layer system with numbered directories:
   - `00_foundations/` — CSS custom properties, `@font-face`, reset/scrollbars
   - `10_colors/` — Dark and light mode palettes (`.theme-dark`, `.theme-light`)
   - `20_editor/` — Markdown rendering (typography, lists, code, tables, etc.)
   - `30_chrome/` — UI shell (tabs, sidebar, status bar, modals, nav)
   - `40_features/` — Optional behaviors (focus mode, active line, hover sidebar)
   - Convention: all partials use `_name.scss`, imported via `@use` in `theme.scss`
4. **OKLCH Color System:**
   - Base parameters: `--bhue` (hue angle), `--bsat-*` (saturation tiers), `--bl-*` (lightness scale)
   - Dark mode: `--bhue: 220` (blue-gray, matches `#282C34`)
   - Light mode: `--bhue: 45` (warm amber)
   - Surface colors derived via `oklch(var(--bl-XX) var(--bsat-YY) var(--bhue))`
5. **Obsidian CSS Conventions:**
   - `--color-base-*` has exactly 12 steps: 00, 05, 10, 20, 25, 30, 35, 40, 50, 60, 70, 100. Do NOT create intermediate steps — they're dead code
   - Theme classes: `.theme-dark` and `.theme-light`
   - Accent colors need `--accent-h`, `--accent-s`, `--accent-l` (HSL) alongside `--interactive-accent`
6. **Font Gotchas:**
   - iA Writer static fonts register as `"iA Writer Quattro S"` (S = Static), NOT `"iA Writer Quattro"`
   - Variable fonts use `"V"` suffix: `"iA Writer Quattro V"`
   - Need dual `local()`: Full Name for macOS + PostScript Name for Windows
   - Example: `local("iA Writer Quattro S Regular"), local("iAWriterQuattroS-Regular")`
   - Updated font is `"Atkinson Hyperlegible Next"` (not `"Atkinson Hyperlegible"`)
7. **Ghostty Palette Source of Truth:**
   - Rainbow colors: exact ANSI values from Ghostty's `src/terminal/color.zig`
   - Foreground: use ANSI 15 (`#EAEAEA`) not Config foreground (`#FFFFFF`)
   - Accent: `#81A2BE` (Ghostty blue, ANSI 4)
8. **Phase Boundaries:**
   - Phase 1 (current): Opinionated single-look theme, no external dependencies
   - Phase 2 (future): Style Settings plugin, multiple paint schemes, platform-adaptive, mobile overrides
   - Do NOT add Style Settings integration, platform detection, or mobile-specific CSS in Phase 1
9. **Release:**
   - release-please manages versions via `release-please-config.json`
   - GitHub Release uploads `theme.css` + `manifest.json`
   - `theme-beta.css` = exact copy of `theme.css` (required for BRAT beta support)

**Step 2: Commit**

```bash
git add CLAUDE.md
git commit -m "docs: add CLAUDE.md with theme development conventions"
```

---

### Task 4: Create CONTRIBUTING.md

**Files:**

- Create: `CONTRIBUTING.md`

**Step 1: Write CONTRIBUTING.md**

Structure:

1. **Prerequisites:** Node.js (via mise), pnpm
2. **Setup:**
   ```bash
   pnpm install
   pnpm dev    # Watch mode — edit SCSS, see compiled output
   ```
3. **Testing changes:** Copy `theme.css` to your Obsidian vault's `.obsidian/themes/Velocighostino/` directory, or symlink it
4. **SCSS conventions:**
   - Layer numbering: 00 foundations → 10 colors → 20 editor → 30 chrome → 40 features
   - One concern per partial (e.g., `_tables.scss` handles only tables)
   - Use existing CSS custom properties from `_variables.scss` — don't hardcode values
5. **Pull requests:**
   - Conventional commits: `feat(scope):`, `fix(scope):`, `docs:`, etc.
   - One feature/fix per PR
   - Run `pnpm build` before submitting — compiled `theme.css` must be included

**Step 2: Commit**

```bash
git add CONTRIBUTING.md
git commit -m "docs: add CONTRIBUTING.md with development setup and conventions"
```

---

### Task 5: Create CHANGELOG.md

**Files:**

- Create: `CHANGELOG.md`

**Step 1: Write CHANGELOG.md**

Initial changelog. release-please will manage this file going forward.

```markdown
# Changelog

## 0.1.0 (2026-02-14)

### Features

- Initial theme implementation (40/40 tasks)
- Dark mode anchored to Ghostty's Tomorrow Night ANSI palette
- Light mode with warm paper tones
- OKLCH parametric color engine
- Glass/frosted effects on modals, sidebars, buttons
- iA Writer Quattro + Atkinson Hyperlegible Next typography
- Hover-reveal sidebars, focus mode, active line indicator
- BRAT beta support via theme-beta.css
- release-please automated releases
```

**Step 2: Commit**

```bash
git add CHANGELOG.md
git commit -m "docs: add CHANGELOG.md with initial v0.1.0 entry"
```

---

### Task 6: Update GitHub repo description

**Step 1: Set repo description and topics**

```bash
gh repo edit --description "An Obsidian theme fusing Ghostty's palette, Velocity's OKLCH engine, and Cupertino's polish"
gh repo edit --add-topic obsidian-theme --add-topic obsidian-md --add-topic css-theme --add-topic oklch --add-topic ghostty
```

**Step 2: Verify**

```bash
gh repo view --json description,repositoryTopics
```

---

### Task 7: Clean up stale file

**Step 1: Remove ISSUE-obsidian-theme-preflight.md**

This file is a draft GitHub issue that was never filed. It should either be filed as an actual issue or removed. Confirm with user before deleting.

**Step 2: Remove .gitkeep**

No longer needed — the repo has actual files now.

**Step 3: Commit**

```bash
git rm .gitkeep ISSUE-obsidian-theme-preflight.md
git commit -m "chore: remove stale gitkeep and unfiled issue draft"
```
