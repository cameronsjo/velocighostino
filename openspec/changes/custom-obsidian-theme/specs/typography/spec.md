## ADDED Requirements

### Requirement: Body text font
The theme SHALL set `--font-text-theme` to `"iA Writer Quattro"` with fallback chain `"Inter", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`.

#### Scenario: iA Writer Quattro installed
- **WHEN** the user has iA Writer Quattro installed locally
- **THEN** the editor body text SHALL render in iA Writer Quattro

#### Scenario: iA Writer Quattro not installed
- **WHEN** the user does not have iA Writer Quattro installed
- **THEN** the editor body text SHALL fall back to Inter, then to system sans-serif fonts

### Requirement: Interface font
The theme SHALL set `--font-interface-theme` to `"Atkinson Hyperlegible"` with fallback chain `"Inter", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif`.

#### Scenario: UI elements use Atkinson Hyperlegible
- **WHEN** any UI element (tabs, sidebar, settings, menus, status bar) renders text
- **THEN** it SHALL use the interface font stack headed by Atkinson Hyperlegible

### Requirement: Monospace font for code
The theme SHALL set `--font-monospace-theme` to `"iA Writer Mono"` with fallback chain `"SF Mono", "Fira Code", "Cascadia Code", ui-monospace, monospace`.

#### Scenario: Code blocks use monospace font
- **WHEN** a fenced code block or inline code element renders
- **THEN** it SHALL use the monospace font stack headed by iA Writer Mono

### Requirement: Heading typography scale
The theme SHALL define a heading scale where H1 is visually distinct as a "title" heading (large, light weight) and H2-H6 decrease progressively in size.

#### Scenario: H1 renders as title heading
- **WHEN** an H1 heading renders in the editor
- **THEN** it SHALL display at approximately 2em font size with a light font weight (~330) and negative letter-spacing (-0.01em)

#### Scenario: H2-H6 progressive scale
- **WHEN** H2 through H6 headings render
- **THEN** they SHALL decrease in size from ~1.5em (H2) to ~1em (H6) with medium-to-semibold weights (520-670)

### Requirement: Line height and paragraph spacing
The theme SHALL set `--line-height-normal` to `1.6` and define consistent paragraph spacing via `--p-spacing`.

#### Scenario: Body text line height
- **WHEN** body text renders in the editor
- **THEN** line height SHALL be 1.6

#### Scenario: Paragraphs have vertical spacing
- **WHEN** consecutive paragraphs render
- **THEN** they SHALL be separated by `--p-spacing` (approximately 1em)

### Requirement: Font feature settings
The theme SHALL enable appropriate OpenType features for each font.

#### Scenario: OpenType features active
- **WHEN** body text renders in iA Writer Quattro
- **THEN** `font-feature-settings` SHALL enable contextual alternates and other available features appropriate for the font
