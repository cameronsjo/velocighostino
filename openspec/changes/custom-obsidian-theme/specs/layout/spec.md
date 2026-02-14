## ADDED Requirements

### Requirement: Content width
The theme SHALL set `--file-line-width` to approximately `43.75rem` (700px) for comfortable reading line length.

#### Scenario: Editor content constrained to readable width
- **WHEN** the editor renders body text
- **THEN** the readable line width SHALL be approximately 43.75rem, preventing excessively long lines

### Requirement: Editor margins
The theme SHALL set `--file-margins` using CSS margin shorthand (e.g., `28px 5%`) to define vertical and horizontal editor margins. Note: Obsidian exposes a single `--file-margins` variable, not separate `-x`/`-y` variants.

#### Scenario: Editor has breathing room
- **WHEN** the editor pane renders
- **THEN** content SHALL have horizontal margins of approximately 5% of the pane width and vertical margins of 28-32px

### Requirement: Layout padding
The theme SHALL use consistent padding (`--vl-layout-padding`) of `8px` between workspace elements (split pane gaps, tab bar padding).

#### Scenario: Split panes have gaps
- **WHEN** the workspace has multiple split panes
- **THEN** an 8px gap SHALL separate adjacent panes

### Requirement: Border radius system
The theme SHALL override Obsidian's built-in radius variables (`--radius-s` default 4px, `--radius-m` default 8px, `--radius-l` default 12px, `--radius-xl` default 16px) and define additional custom radius variables (`--radius-xs` 6px, `--radius-ml` 14px, `--radius-xxl` 22px) for theme-specific elements. Custom variables are not consumed by Obsidian core — they MUST be applied explicitly via selectors.

#### Scenario: Small elements get small radius
- **WHEN** a tag, badge, or small UI element renders
- **THEN** it SHALL use `--radius-xs` or `--radius-s`

#### Scenario: Large containers get larger radius
- **WHEN** a modal, settings panel, or large container renders
- **THEN** it SHALL use `--radius-l` or `--radius-xl`

### Requirement: Tab container radius
The main editor tab container SHALL have rounded corners (`--radius-ml`, approximately 14px) creating a distinct content area. This uses the `corner-shape` CSS property (Obsidian 1.11+ / Chromium 139+) instead of the deprecated `-electron-corner-smoothing`.

#### Scenario: Tab container is rounded
- **WHEN** the workspace renders tab containers
- **THEN** the container edges SHALL have 14px border radius with `corner-shape: squircle` for smooth rounding

### Requirement: Workspace radial gradient background
The workspace area behind tab containers SHALL display the radial gradient background defined by the color system, creating depth behind the content surface.

#### Scenario: Background visible around content
- **WHEN** the workspace has rounded tab containers with gaps
- **THEN** the radial gradient workspace background SHALL be visible in the gaps and around container edges
