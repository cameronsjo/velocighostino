## ADDED Requirements

### Requirement: Body text font
The theme SHALL set `--font-text-theme` to `"iA Writer Quattro"` with fallback chain `"Inter", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`. The theme SHALL declare `@font-face` rules with dual `local()` entries covering both static ("S") and variable ("V") font installations: `local("iA Writer Quattro S Regular"), local("iAWriterQuattroS-Regular")` (and equivalent for Bold, Italic, Bold Italic, and the "V" variants).

#### Scenario: iA Writer Quattro static fonts installed
- **WHEN** the user has iA Writer Quattro static fonts installed locally (registered as "iA Writer Quattro S")
- **THEN** the `@font-face` rule SHALL match via `local("iA Writer Quattro S Regular")` or `local("iAWriterQuattroS-Regular")` and the editor body text SHALL render in iA Writer Quattro

#### Scenario: iA Writer Quattro variable font installed
- **WHEN** the user has iA Writer Quattro variable font installed locally (registered as "iA Writer Quattro V")
- **THEN** the `@font-face` rule SHALL match via `local("iA Writer Quattro V")` or `local("iAWriterQuattroV-Regular")` and the editor body text SHALL render in iA Writer Quattro

#### Scenario: iA Writer Quattro not installed
- **WHEN** the user does not have iA Writer Quattro installed
- **THEN** the editor body text SHALL fall back to Inter, then to system sans-serif fonts

### Requirement: Interface font
The theme SHALL set `--font-interface-theme` to `"Atkinson Hyperlegible Next"` with fallback chain `"Atkinson Hyperlegible", "Inter", ui-sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif`. The theme SHALL declare `@font-face` rules with `local("Atkinson Hyperlegible Next Regular"), local("AtkinsonHyperlegibleNext-Regular")` (and equivalent for Bold, Italic, Bold Italic).

#### Scenario: UI elements use Atkinson Hyperlegible Next
- **WHEN** any UI element (tabs, sidebar, settings, menus, status bar) renders text
- **THEN** it SHALL use the interface font stack headed by Atkinson Hyperlegible Next

#### Scenario: Falls back to original Atkinson Hyperlegible
- **WHEN** the user has the original "Atkinson Hyperlegible" (2020) but not "Atkinson Hyperlegible Next" (2024)
- **THEN** the fallback chain SHALL pick up the original font

### Requirement: Monospace font for code
The theme SHALL set `--font-monospace-theme` to `"iA Writer Mono"` with fallback chain `"SF Mono", "Fira Code", "Cascadia Code", ui-monospace, monospace`. The theme SHALL declare `@font-face` rules with dual `local()` entries for both "S" (static) and "V" (variable) variants: `local("iA Writer Mono S Regular"), local("iAWriterMonoS-Regular")`.

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
