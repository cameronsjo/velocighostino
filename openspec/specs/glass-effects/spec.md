## ADDED Requirements

### Requirement: Button glass bevel
Buttons and toggles SHALL have an inset shadow system that creates a subtle 3D bevel effect — lighter highlight on the top-left edge, shadow on the bottom-right edge.

#### Scenario: Interactive button has glass effect
- **WHEN** a button (e.g., mod-cta, clickable-icon) renders
- **THEN** it SHALL display `inset` box-shadows creating a highlight/shadow bevel using accent-tinted colors via `oklab()` or `oklch()` relative color syntax

#### Scenario: Glass effect visible in both modes
- **WHEN** a button renders in dark mode or light mode
- **THEN** the glass bevel SHALL be visible in both modes with appropriate opacity adjustments (stronger in dark mode, subtler in light mode)

### Requirement: Modal backdrop blur
Modals and dialogs SHALL use `backdrop-filter: blur()` with a semi-transparent background to create a frosted glass layering effect.

#### Scenario: Modal appears with frosted background
- **WHEN** a modal opens (settings, community plugins, quick switcher)
- **THEN** the modal background SHALL use `backdrop-filter` with blur radius 4-8px and a semi-transparent fill color, making the content behind it visible but defocused

### Requirement: Sidebar surface treatment
Sidebars SHALL have a subtle surface treatment combining edge shadows and optional backdrop blur to establish visual hierarchy.

#### Scenario: Sidebar has depth
- **WHEN** a sidebar is visible
- **THEN** it SHALL have edge shadows (1px borders or box-shadows) that separate it from the main editor content area

### Requirement: Shadow scale system
The theme SHALL define a shadow scale (`--shadow-xs`, `--shadow-s`, `--shadow-l`) for consistent depth across UI elements.

#### Scenario: Small elements get small shadows
- **WHEN** a tooltip or small popup renders
- **THEN** it SHALL use `--shadow-xs` (minimal shadow)

#### Scenario: Modals get large shadows
- **WHEN** a modal or large overlay renders
- **THEN** it SHALL use `--shadow-l` (pronounced shadow with wider spread)

### Requirement: Glass base effect
The theme SHALL define a `--glass-base` variable with layered inset shadows that simulate a glossy/reflective surface on containers.

#### Scenario: Glass base applied to elevated surfaces
- **WHEN** an elevated container (e.g., tab container, prompt) renders
- **THEN** it MAY apply `--glass-base` for a subtle inner glow effect using white-tinted inset shadows
