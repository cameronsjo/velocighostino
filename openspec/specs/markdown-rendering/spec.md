## ADDED Requirements

### Requirement: H1 title treatment
H1 headings SHALL render as a visually distinct "title" heading with light font weight, large size, and a decorative horizontal rule beneath via `::after` pseudo-element.

#### Scenario: H1 has decorative underline
- **WHEN** an H1 heading renders in the editor or preview
- **THEN** it SHALL display at ~2em size, ~330 font weight, with a thin horizontal rule rendered below it via `::after`

#### Scenario: H1 has negative letter-spacing
- **WHEN** an H1 heading renders
- **THEN** it SHALL have `letter-spacing: -0.01em` for a tighter, display-style appearance

### Requirement: Heading alignment correction
Each heading level SHALL have a calibrated `text-indent` to counteract the natural leftward drift caused by larger font sizes, maintaining a pixel-perfect left edge aligned with body text.

#### Scenario: Headings left-align with body
- **WHEN** H1-H6 headings render above body text
- **THEN** their left edges SHALL visually align with the body text left margin

### Requirement: List markers as dashes
Default unordered list bullet points SHALL render as thin horizontal dash markers instead of default disc/circle bullets.

#### Scenario: Bullet lists use dash markers
- **WHEN** an unordered list renders
- **THEN** the list marker SHALL be a thin horizontal dash (—) or a custom CSS-drawn dash, not a disc or circle

### Requirement: Blockquote styling
Blockquotes SHALL have a left border using the accent color with a subtle background fill.

#### Scenario: Blockquote has colored border
- **WHEN** a blockquote renders
- **THEN** it SHALL have a 3-4px left border in the accent color and a very subtle background tint

### Requirement: Callout styling
Callouts SHALL have rounded corners, color-coded left borders matching their type (info=blue, warning=yellow, etc.), and a subtle gradient background.

#### Scenario: Callout has type-appropriate color
- **WHEN** a callout of type `[!info]` renders
- **THEN** it SHALL have a blue-tinted left border and background from `--color-blue`

#### Scenario: Callout corners are rounded
- **WHEN** any callout renders
- **THEN** it SHALL have border-radius matching `--radius-s` (8px)

### Requirement: Code block styling
Fenced code blocks SHALL have a distinct background (`--color-base-10` or similar), rounded corners, and padding. Syntax highlighting colors SHALL be defined for both dark and light modes.

#### Scenario: Code block has distinct background
- **WHEN** a fenced code block renders
- **THEN** it SHALL have a background darker/lighter than the editor background (depending on mode), with `--radius-s` border radius and 12-16px padding

#### Scenario: Inline code has subtle background
- **WHEN** inline code renders within body text
- **THEN** it SHALL have a subtle background tint and small border-radius distinguishing it from surrounding text

### Requirement: Table styling
Tables SHALL have clean borders, alternating row backgrounds (subtle), and header row distinction.

#### Scenario: Table has header distinction
- **WHEN** a markdown table renders
- **THEN** the header row SHALL have a bolder bottom border and/or slightly different background than data rows

### Requirement: Horizontal rule styling
Horizontal rules (`---`) SHALL render as a thin, centered line with generous vertical spacing.

#### Scenario: HR renders as thin line
- **WHEN** a horizontal rule renders
- **THEN** it SHALL be a 1px line using `--text-faint` color with approximately 2em vertical margin above and below

### Requirement: Image and embed styling
Images and embeds SHALL render at full content width by default with rounded corners.

#### Scenario: Images are full width with radius
- **WHEN** an image renders in the editor
- **THEN** it SHALL expand to full content width and have `--radius-s` border radius

### Requirement: Tag styling
Inline tags (`#tag`) SHALL render with a subtle background pill shape using the accent color.

#### Scenario: Tags render as pills
- **WHEN** a `#tag` renders in the editor
- **THEN** it SHALL have a small background pill with rounded corners, using the accent color at low opacity
