## ADDED Requirements

### Requirement: Ghostty-derived background
The dark mode SHALL use `#282C34` as the primary background anchor, with the OKLCH engine generating the surface stack from `--bhue: 220` (blue-gray undertone matching Ghostty's background).

#### Scenario: Primary background matches Ghostty
- **WHEN** dark mode is active
- **THEN** `--background-primary` SHALL resolve to a color visually equivalent to `#282C34`

#### Scenario: Surface stack generated from OKLCH
- **WHEN** dark mode is active
- **THEN** `--color-base-00` (deepest) through `--color-base-25` (elevated surfaces) SHALL form a coherent blue-gray surface stack with hue 220

### Requirement: Ghostty rainbow colors in dark mode
The dark mode SHALL use Ghostty's exact ANSI color values for the 8 rainbow slots.

#### Scenario: Rainbow colors match Ghostty palette
- **WHEN** dark mode is active
- **THEN** the following mappings SHALL apply:
  - `--color-red-rgb`: `204, 102, 102` (Ghostty Red `#CC6666`)
  - `--color-orange-rgb`: `213, 78, 83` (Ghostty Bright Red `#D54E53`)
  - `--color-yellow-rgb`: `240, 198, 116` (Ghostty Yellow `#F0C674`)
  - `--color-green-rgb`: `181, 189, 104` (Ghostty Green `#B5BD68`)
  - `--color-cyan-rgb`: `138, 190, 183` (Ghostty Cyan `#8ABEB7`)
  - `--color-blue-rgb`: `129, 162, 190` (Ghostty Blue `#81A2BE`)
  - `--color-purple-rgb`: `178, 148, 187` (Ghostty Magenta `#B294BB`)
  - `--color-pink-rgb`: `195, 151, 216` (Ghostty Bright Magenta `#C397D8`)

### Requirement: Dark mode accent color
The dark mode SHALL use Ghostty Blue (`#81A2BE`) as the accent color (`--interactive-accent`).

#### Scenario: Accent color is Ghostty Blue
- **WHEN** dark mode is active
- **THEN** `--interactive-accent` SHALL resolve to `#81A2BE` or its OKLCH equivalent

### Requirement: Dark mode text colors
The dark mode SHALL use Ghostty ANSI 15 / Bright White (`#EAEAEA`) for `--text-normal` — deliberately chosen over Ghostty's Config.zig foreground (`#FFFFFF`) for reduced glare during long writing sessions. Ghostty ANSI 7 / White (`#C5C8C6`, Tomorrow Night's canonical foreground) SHALL be used for `--text-muted`. Ghostty ANSI 8 / Bright Black (`#666666`) SHALL inform `--text-faint`.

#### Scenario: Text hierarchy in dark mode
- **WHEN** dark mode is active
- **THEN** `--text-normal` SHALL resolve to approximately `#EAEAEA` (ANSI 15), `--text-muted` SHALL resolve to approximately `#C5C8C6` (ANSI 7), and `--text-faint` SHALL be substantially dimmer informed by `#666666` (ANSI 8) — all maintaining readability

### Requirement: Radial gradient workspace background
The dark mode SHALL apply a subtle radial gradient to the workspace background, lighter at center and darker at edges, creating depth.

#### Scenario: Workspace has radial gradient
- **WHEN** dark mode is active
- **THEN** the workspace background SHALL use `radial-gradient(at 50% 50%, var(--bg-main-inner) 0%, var(--bg-main-outer) 200%)` or equivalent
