## 1. Project Scaffolding

- [ ] 1.1 Create `manifest.json` with theme metadata (id: `velocighostino`, name, author, version, minAppVersion: `1.11.0`)
- [ ] 1.2 Create SCSS source directory structure (`src/` with subdirectories: `00_foundations`, `10_colors`, `20_editor`, `30_chrome`, `40_features`)
- [ ] 1.3 Create `src/theme.scss` entry point with all imports ordered by dependency
- [ ] 1.4 Add build script (npm scripts or Makefile) to compile `sass src/theme.scss theme.css --no-source-map --style compressed`

## 2. Foundations

- [ ] 2.1 Create `src/00_foundations/_variables.scss` — define OKLCH parameters (`--bhue`, `--bsat-*`, `--bl-*`), radius scale, spacing variables, animation timing, and font stacks
- [ ] 2.2 Create `src/00_foundations/_fonts.scss` — `@font-face` declarations for iA Writer Quattro, iA Writer Mono, and Atkinson Hyperlegible with `local()` source and fallback stacks
- [ ] 2.3 Create `src/00_foundations/_base.scss` — CSS reset/normalization for Obsidian, scrollbar styling, base animation keyframes

## 3. Color System

- [ ] 3.1 Create `src/10_colors/_dark.scss` — dark mode palette: `--bhue: 220`, Ghostty background/foreground, Ghostty rainbow colors mapped to Obsidian slots, accent `#81A2BE`, transparent color scale, radial gradient workspace background
- [ ] 3.2 Create `src/10_colors/_light.scss` — light mode palette: `--bhue: 45`, warm paper background `#FAF8F5`, high-contrast rainbow variants, deeper accent blue, warm radial gradient, text hierarchy
- [ ] 3.3 Map parametric base colors to all Obsidian semantic variables (`--background-primary`, `--background-secondary`, `--text-normal`, `--text-muted`, `--text-faint`, `--interactive-accent`, `--interactive-hover`, etc.)
- [ ] 3.4 Define accent color derivative system (`--color-accent-1` through `--color-accent-4`) using `color-mix(in oklab, ...)`

## 4. Typography

- [ ] 4.1 Set `--font-text-theme` (iA Writer Quattro), `--font-interface-theme` (Atkinson Hyperlegible), `--font-monospace-theme` (iA Writer Mono) in root variables
- [ ] 4.2 Define heading scale in `src/20_editor/_typography.scss` — H1 title treatment (2em, weight 330, letter-spacing -0.01em, `::after` decorative rule), H2-H6 progressive scale
- [ ] 4.3 Implement heading alignment corrections (`text-indent` per heading level)
- [ ] 4.4 Set line height (1.6), paragraph spacing, and font feature settings

## 5. Editor / Markdown Rendering

- [ ] 5.1 Create `src/20_editor/_lists.scss` — dash-style list markers replacing default bullets
- [ ] 5.2 Create `src/20_editor/_blockquotes.scss` — accent-colored left border with subtle background tint
- [ ] 5.3 Create `src/20_editor/_code.scss` — code block styling (distinct background, rounded corners, padding) + inline code treatment + syntax highlighting colors for both modes
- [ ] 5.4 Create `src/20_editor/_tables.scss` — clean table borders, header distinction, subtle alternating row backgrounds
- [ ] 5.5 Create `src/20_editor/_formatting.scss` — horizontal rule (thin line, generous spacing), highlights, strikethrough, tag pills
- [ ] 5.6 Create `src/20_editor/_embeds.scss` — full-width images/embeds with rounded corners
- [ ] 5.7 Create `src/20_editor/_callouts.scss` — rounded callouts with type-appropriate color coding, gradient backgrounds

## 6. UI Chrome

- [ ] 6.1 Create `src/30_chrome/_layout.scss` — workspace layout, file margins (5% horizontal, 28-32px vertical), content width (43.75rem), split pane gaps (8px), radial gradient background behind tab containers, tab container border-radius (14px)
- [ ] 6.2 Create `src/30_chrome/_tabs.scss` — tab styling with active/inactive distinction, clean appearance
- [ ] 6.3 Create `src/30_chrome/_sidebar.scss` — sidebar background, file explorer tree styling, active file highlighting, hover states
- [ ] 6.4 Create `src/30_chrome/_statusbar.scss` — compact, unobtrusive status bar with faint text
- [ ] 6.5 Create `src/30_chrome/_modals.scss` — modal backdrop blur, frosted glass background, shadow-l, rounded corners
- [ ] 6.6 Create `src/30_chrome/_nav.scss` — nav header and titlebar integration

## 7. Glass Effects

- [ ] 7.1 Define `--glass-base`, `--glass-button` inset shadow variables in foundations
- [ ] 7.2 Apply glass bevel to buttons and toggles (mod-cta, clickable-icon)
- [ ] 7.3 Apply backdrop-filter blur to modals and prompts
- [ ] 7.4 Define shadow scale system (`--shadow-xs`, `--shadow-s`, `--shadow-l`) with mode-appropriate values

## 8. Features

- [ ] 8.1 Create `src/40_features/_active-line.scss` — active line left-border indicator (2-3px, accent color at reduced opacity)
- [ ] 8.2 Create `src/40_features/_focus-mode.scss` — hide tab bar and titlebar when both sidebars are collapsed
- [ ] 8.3 Create `src/40_features/_hover-sidebar.scss` — auto-hide sidebars below 800px width, reveal on hover with smooth transition

## 9. Build and Validate

- [ ] 9.1 Compile theme.css and verify output is under 50KB
- [ ] 9.2 Validate all Obsidian semantic variables are defined (no missing fallbacks)
- [ ] 9.3 Test dark mode: verify Ghostty palette colors render correctly
- [ ] 9.4 Test light mode: verify warm paper tones and contrast ratios
- [ ] 9.5 Verify font fallback chain works when primary fonts are not installed
