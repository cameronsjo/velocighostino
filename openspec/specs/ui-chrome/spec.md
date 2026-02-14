## ADDED Requirements

### Requirement: Tab styling
Tabs SHALL have a clean appearance with the active tab visually distinguished from inactive tabs via background color and/or subtle shadow.

#### Scenario: Active tab distinguished
- **WHEN** multiple tabs are open
- **THEN** the active tab SHALL have a distinct background (matching `--background-primary`) and inactive tabs SHALL have a muted/transparent background

### Requirement: Sidebar styling
The sidebar (file explorer, search, etc.) SHALL use `--background-secondary` with clear visual separation from the editor pane.

#### Scenario: Sidebar visually distinct from editor
- **WHEN** the sidebar is open
- **THEN** it SHALL have a different background shade than the editor and be separated by an edge shadow or border

### Requirement: Hover-reveal sidebars
When configured, sidebars SHALL automatically hide when the window width drops below 800px and reveal on hover.

#### Scenario: Sidebar auto-hides on narrow window
- **WHEN** the window width is below 800px
- **THEN** the sidebar SHALL collapse and slide in on hover with a smooth transition

### Requirement: Status bar styling
The status bar SHALL be compact and unobtrusive, using `--text-faint` for text and blending with the workspace background.

#### Scenario: Status bar is subtle
- **WHEN** the status bar renders
- **THEN** it SHALL use faint text color and minimal height, not drawing attention from the editor content

### Requirement: File explorer styling
The file explorer tree SHALL have clean indentation, subtle hover states, and active file highlighting using the accent color.

#### Scenario: Active file highlighted
- **WHEN** a file is selected in the file explorer
- **THEN** it SHALL have a background highlight using the accent color at low opacity

#### Scenario: Hover state on files
- **WHEN** the user hovers over a file in the explorer
- **THEN** a subtle background highlight SHALL appear

### Requirement: Nav header and titlebar
The navigation header SHALL integrate cleanly with the tab bar and sidebar, using consistent padding and icon sizing.

#### Scenario: Nav header consistent with chrome
- **WHEN** the nav header renders
- **THEN** its padding, font, and icon sizes SHALL match the overall UI chrome styling

### Requirement: Focus mode
When sidebars are collapsed, the theme SHALL optionally hide the tab bar and title bar, maximizing the writing surface.

#### Scenario: Focus mode activates
- **WHEN** both sidebars are collapsed
- **THEN** the tab bar and titlebar area SHALL reduce or hide, giving more vertical space to the editor

### Requirement: Active line indicator
The editor SHALL display a subtle left-border indicator on the currently active line.

#### Scenario: Active line has left border
- **WHEN** the cursor is on a line in the editor
- **THEN** that line SHALL have a subtle left-edge indicator (2-3px border) using the accent color at reduced opacity

### Requirement: Scrollbar styling
Scrollbars SHALL be thin and unobtrusive, appearing on hover and using the base color scale for the thumb.

#### Scenario: Scrollbar appears on hover
- **WHEN** the user hovers over a scrollable area
- **THEN** a thin scrollbar thumb SHALL appear with a muted color from the base scale
