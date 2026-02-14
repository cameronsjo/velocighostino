# Skill: Obsidian theme preflight checklist

## What I Wish I Knew Sooner: Obsidian Theme Development

Building the Velocighostino theme spec surfaced several gotchas that would have cost hours of debugging if caught during implementation instead of during planning. These should become a reusable **preflight checklist skill** that any Obsidian theme project can run before writing CSS.

---

### 1. `@font-face local()` names are not what you think

**The trap:** You write `local("iA Writer Quattro")` and it silently fails on every platform. The font renders in the system fallback and you never notice because it still "looks fine."

**The reality:**
- iA Writer **static** fonts register as `"iA Writer Quattro S"` (the "S" is for Static)
- iA Writer **variable** fonts register as `"iA Writer Quattro V"`
- macOS matches on Full Font Name (ID 4), Windows matches on PostScript Name (ID 6)
- You need BOTH: `local("iA Writer Quattro S Regular"), local("iAWriterQuattroS-Regular")`
- "Atkinson Hyperlegible" was updated in 2024 to "Atkinson Hyperlegible **Next**" — different font family name

**Skill action:** Given a list of target fonts, verify exact `local()` names by checking actual font name tables (fonttools/ttx or system font registry). Output correct `@font-face` declarations.

---

### 2. `--color-base-*` is 12 discrete steps, not 0-100

**The trap:** You assume `--color-base-00` through `--color-base-100` is a continuous scale and generate values for steps that don't exist (15, 45, 55, 75, 80, 85, 90, 95).

**The reality:** Obsidian defines exactly 12 steps: `00, 05, 10, 20, 25, 30, 35, 40, 50, 60, 70, 100`. Extra steps won't break anything but they're dead code.

**Skill action:** Validate that the theme defines all 12 required steps and flags any missing/extra ones.

---

### 3. `--file-margins-x` and `--file-margins-y` don't exist

**The trap:** You split margins into x/y because that's how every other framework works. Obsidian uses a single `--file-margins` shorthand (CSS margin syntax: `28px 5%`).

**Skill action:** Cross-reference all CSS custom properties used in the theme against Obsidian's documented variable list. Flag any that don't exist in the official API.

---

### 4. ~15 semantic variables that Obsidian core actively consumes are easy to miss

**The trap:** You define `--background-primary`, `--text-normal`, `--interactive-accent` and call it done. Then settings inputs have no background, links have no color, text selection is invisible, and bold text is the wrong weight.

**The commonly missed variables:**
- `--background-primary-alt` (file headers, embedded content)
- `--interactive-normal` (button resting state — not the same as accent)
- `--text-accent` / `--text-accent-hover` (link colors)
- `--text-selection` / `--text-highlight-bg` (selection + `==highlight==`)
- `--text-on-accent` / `--text-on-accent-inverted`
- `--text-error` / `--text-warning` / `--text-success`
- `--accent-h` / `--accent-s` / `--accent-l` (HSL breakdown for internal `calc()`)
- `--background-modifier-form-field` (inputs, search boxes)
- `--caret-color`, `--mono-rgb-0`, `--mono-rgb-100`

**Skill action:** Given a theme's CSS output, diff against the full Obsidian semantic variable list and report coverage gaps.

---

### 5. Shadow variables are undocumented but real

**The trap:** You search the Obsidian developer docs for `--shadow-s` / `--shadow-l` and find nothing. You assume they don't exist and skip them. Then modal shadows disappear.

**The reality:** `--shadow-s` and `--shadow-l` are defined in Obsidian's internal `app.css` but not in the developer docs. They're consumed by modal, popover, and suggestion components. Safe to override.

**Skill action:** Maintain a list of known undocumented-but-consumed variables with notes on what breaks if they're missing.

---

### 6. `-electron-corner-smoothing` is deprecated

**The trap:** You copy corner-smoothing from an existing theme and it works today. Obsidian 1.11+ / Chromium 139+ replaced it with the standard `corner-shape` CSS property.

**Skill action:** Scan for deprecated CSS properties and suggest modern equivalents.

---

### 7. Ghostty's foreground is NOT what you see in the terminal

**The trap:** You assume Ghostty's foreground is `#EAEAEA` because that's what body text looks like. Actually `#EAEAEA` is ANSI 15 (bright white). The Config.zig foreground default is `#FFFFFF`. And Tomorrow Night's canonical foreground is `#C5C8C6` (ANSI 7). Three different values for "the text color."

**Skill action:** When building a palette from a terminal emulator, verify values against source code, not visual perception. Distinguish between config defaults, ANSI normal colors, and ANSI bright colors.

---

## Proposed Skill: `obsidian-theme-preflight`

**Trigger:** Run before implementation begins on any Obsidian theme change.

**Inputs:**
- Theme spec/design docs (font choices, color palette source, target variables)
- Target Obsidian version

**Outputs:**
- Verified `@font-face` declarations with correct `local()` names
- CSS variable coverage report (defined vs required vs missing)
- Deprecated property scan
- Palette verification against source (if terminal-derived)

**Labels:** `skill`, `dx`, `obsidian`
