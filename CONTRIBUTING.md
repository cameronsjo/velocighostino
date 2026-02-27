# Contributing to Velocighostino

## Prerequisites

- [Node.js](https://nodejs.org/) (managed via [mise](https://mise.jdx.dev/))
- [pnpm](https://pnpm.io/)

## Getting Started

```bash
git clone https://github.com/cameronsjo/velocighostino.git
cd velocighostino
pnpm install
pnpm dev    # Watch mode — edit SCSS, compiled output updates automatically
```

## Testing Changes

To see changes in Obsidian:

- Copy or symlink `theme.css` to your vault's `.obsidian/themes/Velocighostino/theme.css`
- With `pnpm dev` running, changes to SCSS files recompile automatically
- Reload Obsidian (Ctrl/Cmd+R) to pick up CSS changes

## SCSS Conventions

- Layer numbering: `00_foundations/` → `10_colors/` → `20_editor/` → `30_chrome/` → `40_features/`
- One concern per partial (e.g., `_tables.scss` handles only tables)
- Use existing CSS custom properties from `_variables.scss` — don't hardcode color or spacing values
- Partials named with underscore prefix: `_name.scss`
- New partials must be added to `src/theme.scss` via `@use`

## Pull Requests

- Use [Conventional Commits](https://www.conventionalcommits.org/): `feat(scope):`, `fix(scope):`, `docs:`, etc.
- One feature or fix per PR
- Run `pnpm build` before submitting — compiled `theme.css` and `theme-beta.css` must be included
- Describe what changed and why in the PR description

## License

By contributing, you agree that your contributions will be licensed under the project's GPL-3.0 license.
