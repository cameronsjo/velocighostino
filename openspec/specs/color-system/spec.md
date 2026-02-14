## ADDED Requirements

### Requirement: Parametric base color generation
The theme SHALL generate Obsidian's 12 discrete base surface colors (`--color-base-00`, `-05`, `-10`, `-20`, `-25`, `-30`, `-35`, `-40`, `-50`, `-60`, `-70`, `-100`) using the OKLCH color function from three parameters: `--bhue` (hue angle), `--bsat-*` (saturation tiers), and `--bl-*` (lightness scale steps). Note: the scale is NOT continuous 0-100 — Obsidian defines exactly these 12 steps.

#### Scenario: Dark mode base colors derived from OKLCH
- **WHEN** the theme is in dark mode
- **THEN** the 12 `--color-base-*` steps SHALL be computed via `oklch(var(--bl-XX) var(--bsat-*) var(--bhue))` with lightness increasing from ~23% (darkest surface at `-00`) to ~93% (lightest text at `-100`)

#### Scenario: Light mode base colors derived from OKLCH
- **WHEN** the theme is in light mode
- **THEN** the 12 `--color-base-*` steps SHALL be computed via `oklch()` with lightness inverted — `--bl-00` at ~100% (lightest surface) decreasing to `--bl-100` at ~24% (darkest text)

### Requirement: Semantic color mapping
The theme SHALL map ALL of Obsidian's semantic color variables to the parametric base color scale. This includes the core set (`--background-primary`, `--background-secondary`, `--text-normal`, `--text-muted`, `--text-faint`, `--interactive-accent`) AND the extended set that Obsidian's internal components consume:
- `--background-primary-alt` (file headers, embedded content)
- `--background-modifier-form-field` (inputs, search)
- `--background-modifier-active-hover` (nav items)
- `--interactive-normal` (button resting state)
- `--text-accent`, `--text-accent-hover` (links)
- `--text-on-accent`, `--text-on-accent-inverted`
- `--text-error`, `--text-warning`, `--text-success`
- `--text-selection`, `--text-highlight-bg` (selection + `==highlight==`)
- `--accent-h`, `--accent-s`, `--accent-l` (HSL components for `calc()` usage)
- `--caret-color` (editor cursor)
- `--mono-rgb-0`, `--mono-rgb-100` (pure black/white triplets)

#### Scenario: Background variables resolve to base colors
- **WHEN** Obsidian reads `--background-primary`
- **THEN** it SHALL resolve to a value derived from the `--color-base-*` scale (e.g., `--color-base-05` in dark mode)

#### Scenario: Text variables resolve to appropriate contrast
- **WHEN** Obsidian reads `--text-normal`
- **THEN** it SHALL resolve to a base color with sufficient contrast (WCAG AA minimum 4.5:1) against `--background-primary`

#### Scenario: Extended semantic variables all defined
- **WHEN** Obsidian reads any semantic variable listed above
- **THEN** it SHALL resolve to a meaningful color derived from the parametric system (no undefined/fallback gaps)

### Requirement: Rainbow color palette
The theme SHALL define 8 rainbow colors (`--color-red`, `--color-orange`, `--color-yellow`, `--color-green`, `--color-cyan`, `--color-blue`, `--color-purple`, `--color-pink`) with both solid and RGB-triplet (`--color-*-rgb`) variants for each mode.

#### Scenario: Rainbow colors available in both formats
- **WHEN** any component references `--color-blue`
- **THEN** it SHALL resolve to a solid `rgb()` value
- **WHEN** any component references `--color-blue-rgb`
- **THEN** it SHALL resolve to a comma-separated RGB triplet (e.g., `129, 162, 190`)

### Requirement: Accent color derivation
The theme SHALL derive accent color variants (`--color-accent-1` lighter, `--color-accent-2` semi-transparent, `--color-accent-3` faded) from `--interactive-accent` using `color-mix()` in the OKLAB color space.

#### Scenario: Accent variants computed from base accent
- **WHEN** `--interactive-accent` is set to the theme's accent color
- **THEN** `--color-accent-1` SHALL be a lighter tint, `--color-accent-2` SHALL be semi-transparent, and `--color-accent-3` SHALL be a faded variant, all computed via `color-mix(in oklab, ...)`

### Requirement: Transparent color scale
The theme SHALL provide transparent overlay colors (`--trans-faint-*`, `--trans-strong-*`) using OKLCH with alpha channels for use in borders, hover states, and overlays.

#### Scenario: Transparent colors maintain hue consistency
- **WHEN** a UI element uses `--trans-faint-30`
- **THEN** the color SHALL be a semi-transparent white/neutral tinted with `--bhue` to maintain color harmony with the base palette
