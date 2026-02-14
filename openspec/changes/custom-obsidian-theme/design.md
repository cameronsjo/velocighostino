## Context

Velocighostino is a greenfield Obsidian community theme combining three sources:
- **Velocity** (v2.1): OKLCH parametric color engine, glass/skeuomorphic UI, SCSS architecture
- **Cupertino** (v3.2): Apple HIG polish, clean writing surface, platform-adaptive layout
- **Ghostty** (default): Tomorrow Night dark palette (`#282C34` bg, muted warm pastels)

The theme targets Obsidian 1.11+ which supports modern CSS: OKLCH, `color-mix()`, `oklch(from ...)` relative color syntax, container queries, and `backdrop-filter`. No plugin JS is involved — this is pure CSS.

User preferences: iA Writer Quattro for body text, Atkinson Hyperlegible for UI. Style Settings integration deferred to Phase 2.

## Goals / Non-Goals

**Goals:**
- Ship a complete, opinionated dark+light Obsidian theme with zero dependencies
- Dark mode anchored to Ghostty's exact palette values, extended via OKLCH for Obsidian's full semantic color range
- Light mode that feels like a natural companion — warm paper, not clinical white
- Typography that prioritizes sustained reading (Quattro) and UI clarity (Atkinson Hyperlegible)
- Glass/frosted effects that add depth without distraction
- Clean SCSS source architecture that supports future Phase 2 extensibility

**Non-Goals:**
- Style Settings plugin support (Phase 2)
- Multiple color schemes / paint schemes (Phase 2)
- Platform-adaptive styling per OS (Phase 2 — Phase 1 targets a single unified look)
- Custom bundled fonts via base64 embedding (fonts referenced via `@font-face` with local/download fallback)
- Mobile-specific overrides (Phase 2)
- Plugin-specific integrations like Calendar, Dataview, Canvas (Phase 2)

## Decisions

### 1. Color architecture: OKLCH parametric system (from Velocity)

**Choice**: Derive all base colors from `--bhue`, `--bsat-*`, and `--bl-*` lightness scale using `oklch()`.

**Why over raw hex**: A parametric system means the entire palette shifts coherently when any base parameter changes. This is essential for Phase 2 paint schemes and makes the dark↔light relationship mathematically defined rather than hand-tuned. Velocity proved this approach works at scale (7 dark schemes, 6 light schemes from the same engine).

**Why over HSL**: OKLCH is perceptually uniform — equal lightness steps produce equal visual contrast. HSL's lightness is not perceptually linear, leading to muddy greens and hot yellows at the same "lightness."

**Alternative considered**: Cupertino's approach (hardcoded hex per platform). Rejected because it doesn't scale to paint schemes and requires manual tuning for every new palette.

### 2. Dark mode: Ghostty palette mapped into OKLCH engine

**Choice**: Use Ghostty's exact hex values (verified against `src/terminal/color.zig` and `src/config/Config.zig`) for the 8 rainbow colors (`--color-red` through `--color-pink`) and derive the grayscale/background stack via OKLCH with `--bhue: 220` (matching `#282C34`'s blue-gray undertone).

**Why**: The Ghostty palette is the identity of this theme. The rainbow colors should be recognizable to anyone who uses Ghostty. But the background/surface/border stack needs more than 16 colors — OKLCH fills the gaps perceptually.

**Foreground note**: Ghostty's Config.zig foreground is `#FFFFFF` (pure white). We deliberately use ANSI 15 / bright white (`#EAEAEA`) for `--text-normal` — it's softer, reduces glare for long writing sessions, and is what users actually see most in the terminal. ANSI 7 (`#C5C8C6`, Tomorrow Night's canonical foreground) serves as `--text-muted`.

**Mapping** (all verified against `color.zig`):
| Ghostty ANSI     | Hex       | Obsidian slot        |
|------------------|-----------|----------------------|
| 1 Red            | `#CC6666` | `--color-red`        |
| 2 Green          | `#B5BD68` | `--color-green`      |
| 3 Yellow         | `#F0C674` | `--color-yellow`     |
| 4 Blue           | `#81A2BE` | `--color-blue`       |
| 5 Magenta        | `#B294BB` | `--color-purple`     |
| 6 Cyan           | `#8ABEB7` | `--color-cyan`       |
| 9 Bright Red     | `#D54E53` | `--color-orange`     |
| 13 Bright Magenta| `#C397D8` | `--color-pink`       |
| 7 White          | `#C5C8C6` | `--text-muted`       |
| 15 Bright White  | `#EAEAEA` | `--text-normal`      |
| 0 Black          | `#1D1F21` | deepest surface ref  |
| 8 Bright Black   | `#666666` | `--text-faint` ref   |

Full unused bright colors available for Phase 2:
10 Bright Green `#B9CA4A`, 11 Bright Yellow `#E7C547`, 12 Bright Blue `#7AA6DA`, 14 Bright Cyan `#70C0B1`.

Accent color: `#81A2BE` (Ghostty blue) — muted, warm, distinctive.

### 3. Light mode: Warm paper, not clinical

**Choice**: Background `#FAF8F5` (warm off-white with subtle yellow undertone), `--bhue: 45` (warm), text `#2C2C2C`. Rainbow colors shifted to higher saturation/lower lightness for contrast on light backgrounds.

**Why over pure white**: Pure white (`#FFF`) is fatiguing for long writing sessions. A warm paper tone matches the "developer writing prose" use case and pairs naturally with the warm Ghostty dark palette.

**Alternative considered**: Cupertino's `#F2F2F7` (iOS gray). Rejected — too cool/clinical for this theme's warm personality.

### 4. Typography: iA Writer Quattro (body) + Atkinson Hyperlegible (UI)

**Choice**: Two-font system with clear separation.

| Context           | Font                    | Rationale |
|--------------------|-------------------------|-----------|
| Editor body text   | iA Writer Quattro       | Proportional spacing with monospace rhythm — ideal for long-form writing. Distinctive character. |
| UI (menus, tabs, sidebar, settings) | Atkinson Hyperlegible Next | 2024 update: 7 weights, improved kerning, 150+ languages. Designed for maximum legibility at small sizes. |
| Code blocks        | iA Writer Mono          | Matches Quattro's design language for inline/block code. Falls back to system monospace. |
| Headings           | iA Writer Quattro       | Same as body for cohesion, weight/size differentiation only. |

**Critical `local()` naming gotcha** (verified via fonttools against actual TTF name tables):
- iA Writer static fonts register with an **"S" suffix**: `iA Writer Quattro S`, `iA Writer Mono S`
- Variable font files use **"V"**: `iA Writer Quattro V`, `iA Writer Mono V`
- `local("iA Writer Quattro")` will **silently fail** — must use `local("iA Writer Quattro S Regular")` + `local("iAWriterQuattroS-Regular")` (Full Name for macOS, PostScript for Windows)
- The updated font is **"Atkinson Hyperlegible Next"** (not "Atkinson Hyperlegible")
- All three fonts are SIL OFL 1.1 — safe for open-source theme

**Font loading**: `@font-face` declarations with dual `local()` (Full Name + PostScript Name for cross-platform matching). No base64 embedding — keeps `theme.css` under 50KB.

**Fallback stack**: `"iA Writer Quattro", "Inter", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif`

### 5. Glass effects: Hybrid Velocity + Cupertino approach

**Choice**: Use Velocity's `inset` shadow bevel system for buttons/toggles and Cupertino's `backdrop-filter: blur()` for modals/sidebars.

**Why hybrid**: Velocity's glass creates tactile depth on small elements (buttons feel "pressable"). Cupertino's blur creates spatial layering on large surfaces (modals feel "floating above content"). Using both at their natural scale creates a cohesive depth language.

**Performance**: `backdrop-filter` is GPU-accelerated on all modern Electron/Chromium builds. No performance concern for Obsidian's desktop target.

### 6. SCSS architecture

**Choice**: Modular SCSS matching Velocity's proven structure:

```
src/
  theme.scss                  # Entry point, imports only
  00_foundations/
    _variables.scss           # All CSS custom properties
    _fonts.scss               # @font-face declarations
    _base.scss                # Reset, scrollbars, animations
  10_colors/
    _dark.scss                # Dark mode palette
    _light.scss               # Light mode palette
  20_editor/
    _typography.scss           # Body text, headings, spacing
    _lists.scss               # List markers
    _blockquotes.scss         # Blockquotes + callouts
    _code.scss                # Code blocks + inline code
    _tables.scss              # Table styling
    _embeds.scss              # Embeds + media
    _formatting.scss          # HR, highlights, strikethrough
  30_chrome/
    _layout.scss              # Workspace, margins, backgrounds
    _tabs.scss                # Tab bar
    _sidebar.scss             # Sidebar + file explorer
    _statusbar.scss           # Status bar
    _modals.scss              # Modals + prompts
    _nav.scss                 # Nav header + titlebar
  40_features/
    _focus-mode.scss          # Focus mode
    _active-line.scss         # Active line indicator
    _hover-sidebar.scss       # Hover-reveal sidebars
```

Build via `sass src/theme.scss theme.css --no-source-map --style compressed`.

### 7. No font bundling — `@font-face` with graceful degradation

**Choice**: Reference fonts via `local()` names. Users who want the full experience install iA Writer Quattro and Atkinson Hyperlegible. The theme degrades gracefully to Inter → system sans-serif.

**Why not bundle**: Obsidian community theme guidelines discourage large CSS files. Base64-embedding fonts (like Velocity does with Raveo) inflates `theme.css` to 600KB+. The theme should be <50KB compiled.

**Why not CDN**: Obsidian is a local-first app — CDN font loading would fail offline and introduce a network dependency.

## Risks / Trade-offs

**[Users may not have iA Writer Quattro installed]** → Mitigation: Graceful fallback chain (Inter → system sans-serif). The theme still looks good without the primary fonts — they enhance rather than gate the experience. README will include font download links.

**[OKLCH browser support]** → Mitigation: Obsidian 1.11+ uses Chromium 120+ which fully supports OKLCH, `color-mix()`, and relative color syntax. No polyfill needed.

**[No Style Settings in Phase 1 limits customization]** → Mitigation: The theme is designed to be opinionated. CSS custom properties in `:root` are documented so power users can override via snippets. Phase 2 adds proper Style Settings UI.

**[Glass effects may feel heavy to some users]** → Mitigation: Effects are subtle (low blur radius, low opacity shadows). Phase 2 can add a "reduce effects" toggle via Style Settings.

**[Single unified look vs platform-adaptive]** → Mitigation: Cupertino's strength is OS-adaptive design, but Phase 1 deliberately ships one cohesive aesthetic. Trying to support macOS/Windows/Linux variants in Phase 1 would triple the scope. Phase 2 can add platform detection.
