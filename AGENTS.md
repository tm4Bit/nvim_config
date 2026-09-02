# Repository Guidelines

## Project Structure & Module Organization

`init.lua` is the entry point. It handles the VS Code integration path, sets global defaults, loads the main modules in `lua/`, and applies the selected colorscheme. Core editor behavior lives in files such as `lua/options.lua`, `lua/keymaps.lua`, and `lua/autocommands.lua`. Plugin specifications belong in `lua/plugins/`; keep one focused plugin or closely related group per file. Shared helpers and LSP configuration live under `lua/utils/`, especially `lua/utils/lsp/configs/`. Filetype-specific overrides and Tree-sitter queries are under `after/ftplugin/` and `after/queries/`. `lazy-lock.json` pins plugin versions and should be committed when dependency changes are intentional.

## Development and Validation Commands

- `nvim` starts the configuration normally and installs missing plugins through `lazy.nvim`.
- `nvim --headless '+qa'` performs a quick startup smoke test without opening the UI.
- `nvim --headless '+Lazy! sync' '+qa'` synchronizes plugins and updates the lockfile; review resulting changes carefully.
- `luacheck .` checks Lua files using the repository's `.luacheckrc` globals and exclusions.
- `stylua --check .` verifies Lua formatting; run `stylua .` to apply formatting when StyLua is installed.

## Coding Style & Naming Conventions

Use two-space indentation, spaces instead of tabs, and idiomatic Lua module boundaries. Follow the existing plugin-spec pattern: assign a table to `M`, define configuration functions, and `return M`. Use lowercase, descriptive filenames, with hyphens where an upstream plugin name uses them (for example, `todo-comments.lua`). Keep keymap descriptions concise and user-facing. Prefer `snake_case` for local variables and configuration keys. Formatting on save is managed by `conform.nvim`; Lua uses StyLua.

## Testing Guidelines

There is no dedicated automated test suite. For every change, run the headless startup check and `luacheck .`. Then open Neovim and exercise the affected command, keymap, filetype, or plugin. For LSP changes, test with a representative file and inspect `:checkhealth` plus `:LspInfo`.

## Commit & Pull Request Guidelines

Recent history favors short, imperative subjects such as `add opencode.nvim` and optional Conventional Commit prefixes such as `refactor:` or `feat:`. Keep each commit focused and include `lazy-lock.json` only when plugin resolution changed. Pull requests should explain the user-visible behavior, list manual validation performed, and note any new external tools or language servers. Include screenshots only for visual UI, theme, or layout changes.
