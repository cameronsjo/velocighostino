## ADDED Requirements

### Requirement: Content width
The theme SHALL set `--file-line-width` to approximately `43.75rem` (700px) for comfortable reading line length.

#### Scenario: Editor content constrained to readable width
- **WHEN** the editor renders body text
- **THEN** the readable line width SHALL be approximately 43.75rem, preventing excessively long lines

### Requirement: Editor margins
The theme SHALL set horizontal editor margins (`--file-margins-x`) to `5%` (percentage-based, responsive to panel width) and vertical margins (`--file-margins-y`) to `28-32px`.

#### Scenario: Editor has breathing room
- **WHEN** the editor pane renders
- **THEN** content SHALL have horizontal margins of approximately 5% of the pane width and vertical margins of 28-32px

### Requirement: Layout padding
The theme SHALL use consistent padding (`--vl-layout-padding`) of `8px` between workspace elements (split pane gaps, tab bar padding).

#### Scenario: Split panes have gaps
- **WHEN** the workspace has multiple split panes
- **THEN** an 8px gap SHALL separate adjacent panes

### Requirement: Border radius system
The theme SHALL define a radius scale from `--radius-xs` (6px) through `--radius-xxl` (22px) for consistent rounding across UI elements.

#### Scenario: Small elements get small radius
- **WHEN** a tag, badge, or small UI element renders
- **THEN** it SHALL use `--radius-xs` or `--radius-s`

#### Scenario: Large containers get larger radius
- **WHEN** a modal, settings panel, or large container renders
- **THEN** it SHALL use `--radius-l` or larger

### Requirement: Tab container radius
The main editor tab container SHALL have rounded corners (`--radius-ml`, approximately 14px) creating a distinct content area.

#### Scenario: Tab container is rounded
- **WHEN** the workspace renders tab containers
- **THEN** the container edges SHALL have 14px border radius with corner smoothing applied

### Requirement: Workspace radial gradient background
The workspace area behind tab containers SHALL display the radial gradient background defined by the color system, creating depth behind the content surface.

#### Scenario: Background visible around content
- **WHEN** the workspace has rounded tab containers with gaps
- **THEN** the radial gradient workspace background SHALL be visible in the gaps and around container edges
