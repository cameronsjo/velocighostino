## Why

There is no Obsidian theme that combines a developer-terminal aesthetic with a refined writing experience. Velocity nails modern CSS color engineering (OKLCH, parametric palettes) and skeuomorphic glass UI. Cupertino nails Apple-grade polish, clean typography, and a distraction-free writing surface. But neither ships with a terminal-native dark mode or prioritizes hyperlegible writing fonts. Ghostty's default palette (Tomorrow Night) is warm, muted, and beloved by developers — it deserves to live in the place where developers write prose too.

Velocighostino fuses all three: Velocity's color engine and glass effects, Cupertino's layout discipline and writing focus, and Ghostty's dark palette as the foundation — with iA Writer Quattro for editor text and Atkinson Hyperlegible for UI.

## What Changes

- New Obsidian community theme: **Velocighostino**
- Dark mode built on Ghostty's Tomorrow Night palette (`#282C34` background, muted warm pastels)
- Light mode designed as a complementary counterpart — warm paper tones with the same accent family
- OKLCH-based parametric color system (from Velocity) for maintainable, perceptually uniform colors
- Typography system: iA Writer Quattro (editor/body text), Atkinson Hyperlegible (UI/interface)
- Glass/frosted UI effects on modals, sidebars, and buttons (blending Velocity's skeuomorphic glass with Cupertino's backdrop-filter blur)
- Cupertino-inspired layout: clean heading scale, active line indicator, full-width media, focus mode, hover-reveal sidebars
- Velocity-inspired touches: radial gradient workspace background, pixel-perfect heading alignment, H1 as title heading with decorative rule, dash-style list markers
- Phase 1 ships a polished, opinionated theme with no external dependencies
- Phase 2 (future) adds Style Settings plugin integration for configurability (paint schemes, font choices, spacing, toggle features)

## Capabilities

### New Capabilities
- `color-system`: OKLCH parametric color engine with Ghostty-derived dark palette and complementary light palette. All semantic colors (backgrounds, text, accents, rainbow) derived from base hue/saturation/lightness parameters.
- `typography`: Font stack system using iA Writer Quattro for body/editor text and Atkinson Hyperlegible for UI. Heading scale, weights, line height, and spacing definitions.
- `dark-mode`: Complete dark theme rooted in Ghostty's Tomorrow Night colors — background `#282C34`, foreground `#EAEAEA`, with all 8 ANSI colors mapped to Obsidian's semantic color slots.
- `light-mode`: Complementary light theme with warm paper tones, higher contrast text, and adjusted accent/rainbow colors for readability on light backgrounds.
- `glass-effects`: Layered shadow and backdrop-filter system for modals, sidebars, buttons, and prompts — combining Velocity's inset glass bevels with Cupertino's frosted blur.
- `layout`: Workspace layout including file margins, content width, spacing rhythm, radial gradient backgrounds, heading alignment corrections, and responsive behavior.
- `ui-chrome`: Interface styling for tabs, sidebars, status bar, file explorer, nav header, and modals. Includes hover-reveal sidebars, focus mode, active line indicator, and centered tab option.
- `markdown-rendering`: Editor and preview styling for headings (H1 title treatment), lists (dash markers), blockquotes, callouts, code blocks, tables, embeds, and horizontal rules.

### Modified Capabilities
<!-- No existing capabilities to modify — this is a greenfield theme. -->

## Impact

- **New files**: `theme.css` (compiled output), `manifest.json` (Obsidian theme manifest), SCSS source tree under `src/`
- **Fonts**: iA Writer Quattro and Atkinson Hyperlegible referenced via `@font-face` (bundled or CDN — to be decided in design)
- **Dependencies**: None for Phase 1 (no Style Settings plugin required)
- **Obsidian API surface**: CSS custom properties only — no plugin code, no JS
- **Compatibility target**: Obsidian 1.11+ (modern CSS support: OKLCH, color-mix, container queries, backdrop-filter)
