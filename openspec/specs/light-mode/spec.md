## ADDED Requirements

### Requirement: Warm paper background
The light mode SHALL use a warm off-white background (approximately `#FAF8F5`) rather than pure white, creating a paper-like reading surface.

#### Scenario: Primary background is warm off-white
- **WHEN** light mode is active
- **THEN** `--background-primary` SHALL resolve to a warm off-white color with subtle yellow undertone (approximately `#FAF8F5`)

#### Scenario: Surface stack maintains warmth
- **WHEN** light mode is active
- **THEN** secondary and tertiary surfaces SHALL be slightly cooler/darker shades of the warm base, maintaining the paper aesthetic

### Requirement: Light mode OKLCH parameters
The light mode SHALL use `--bhue: 45` (warm) with an inverted lightness scale where `--bl-00` is lightest (~100%) and `--bl-100` is darkest (~24%).

#### Scenario: OKLCH engine produces warm light palette
- **WHEN** light mode is active
- **THEN** all base colors SHALL be computed with hue 45 (warm yellow-amber undertone)

### Requirement: Light mode text colors
The light mode SHALL use dark text (approximately `#2C2C2C`) for normal text with appropriate muted/faint variants.

#### Scenario: Text hierarchy in light mode
- **WHEN** light mode is active
- **THEN** `--text-normal` SHALL be approximately `#2C2C2C`, `--text-muted` SHALL be lighter, and `--text-faint` SHALL be substantially lighter — all maintaining WCAG AA contrast against the background

### Requirement: Light mode rainbow colors
The light mode SHALL use higher-saturation, lower-lightness variants of the Ghostty-family colors for adequate contrast on light backgrounds.

#### Scenario: Rainbow colors readable on light background
- **WHEN** light mode is active
- **THEN** all 8 rainbow colors SHALL have sufficient contrast (minimum 3:1) against `--background-primary` for use as tags, highlights, and graph colors

### Requirement: Light mode accent color
The light mode SHALL use a deeper, more saturated variant of the Ghostty Blue for the accent, ensuring visibility on the warm light background.

#### Scenario: Accent contrasts with light background
- **WHEN** light mode is active
- **THEN** `--interactive-accent` SHALL be a darker/more saturated blue (approximately `#4D8BBE` or similar) that meets WCAG AA contrast against the warm off-white background

### Requirement: Light mode radial gradient
The light mode SHALL apply a subtle radial gradient to the workspace — slightly brighter at center, with edges tinted toward the warm hue.

#### Scenario: Workspace has warm radial gradient
- **WHEN** light mode is active
- **THEN** the workspace background SHALL use a radial gradient with warm tones, subtler than the dark mode gradient
