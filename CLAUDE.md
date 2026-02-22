# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration focused on JavaScript/TypeScript web development and Rust. Uses **lazy.nvim** as the plugin manager with a modular file-per-plugin architecture.

## Architecture

**Entry point**: `init.lua` loads core modules first, then bootstraps lazy.nvim which auto-discovers plugin specs from `lua/plugins/`.

```
init.lua
  → core/options.lua    (vim options: relative lines, 2-space indent, no wrap, no mouse)
  → core/keymaps.lua    (global keymaps, leader = <Space>)
  → core/snippets.lua   (diagnostic config, yank highlight, semantic token priority)
  → lazy.nvim bootstrap
    → plugins/*.lua     (each file returns a lazy.nvim plugin spec table)
```

**Plugin files** (`lua/plugins/`): Each file returns a lazy.nvim spec `{ "author/plugin", config = ..., opts = ... }`. Adding a new plugin means creating a new file or appending to `misc.lua` for small plugins.

## Key Plugin Stack

- **LSP**: `nvim-lspconfig` + `mason.nvim` + `mason-lspconfig` + `mason-tool-installer` — servers configured in `lsp.lua`
  - Rust: `rust_analyzer` with `checkOnSave` (`cargo check` on save for diagnostics), formatting via rustfmt
  - JS/TS: `ts_ls`, `eslint`
  - Web: `html`, `cssls`, `tailwindcss`
  - Other: `dockerls`, `sqlls`, `jsonls`, `yamlls`, `lua_ls`
- **Completion**: `nvim-cmp` + `LuaSnip` + `friendly-snippets`
- **Formatting/Linting**: `none-ls.nvim` (Prettier, Stylua, Shfmt, Ruff, ESLint, Checkmake) — auto-formats on save. Rust formatting is handled by `rust_analyzer` (rustfmt) directly, not via none-ls
- **Fuzzy finder**: `telescope.nvim`
- **File tree**: `neo-tree.nvim`
- **Syntax**: `nvim-treesitter`
- **Theme**: Nord (`nordtheme/vim`)

## Conventions

- **Indentation**: 2 spaces for Lua (enforced by `.stylua.toml` — column width 160)
- **Plugin spec style**: One plugin per file in `lua/plugins/`, small utilities go in `misc.lua`
- **Keymap style**: Defined with `vim.keymap.set` using `desc` field for discoverability; LSP-specific keymaps are buffer-local in `lsp.lua`'s `LspAttach` autocmd
- **Formatting**: Stylua for Lua files (runs on save via none-ls)

## Known Quirks

- **Rust diagnostics refresh on save**: `rust_analyzer` runs `cargo check` on save to update diagnostics. If diagnostics get stuck, `:LspRestart` resolves it.

## Useful Commands

```bash
# Format Lua files manually
stylua lua/

# Check lazy.nvim plugin status (from within Neovim)
:Lazy

# Update plugins
:Lazy update

# Check LSP server status
:LspInfo

# Install/manage LSP servers and tools
:Mason
```
