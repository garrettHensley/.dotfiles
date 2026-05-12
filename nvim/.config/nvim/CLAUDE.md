# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a minimal Neovim configuration using Neovim's built-in package manager (`vim.pack`, available since Neovim 0.10+) — no lazy.nvim or packer.

## Architecture

`init.lua` loads four modules in order:

```
plugins → lsp → keybinds → preferences
```

All plugin setup happens eagerly (no lazy-loading). Each module is self-contained:

- `lua/plugins.lua` — plugin declarations and `.setup()` calls via `vim.pack.add()`
- `lua/lsp.lua` — native Neovim LSP configuration
- `lua/keybinds.lua` — all keymaps (leader = Space)
- `lua/preferences.lua` — editor options, colorscheme, autocmds

## Plugin Management

Plugins are added with `vim.pack.add("owner/repo")` and pinned via `nvim-pack-lock.json`. To add a plugin, call `vim.pack.add()` in `plugins.lua` and run `:packadd` or restart Neovim. To update/lock versions, update the lock file.

## Current Plugins

- **oil.nvim** — file explorer (`<leader>e`)
- **fzf-lua** — fuzzy finder (`<leader>f`)
- **nvim-treesitter** — syntax/highlighting (explicitly enabled for C# via autocmd)
- **lualine.nvim** — statusline
- **nvim-web-devicons** — file icons
- **render-markdown.nvim** — in-buffer markdown rendering

## LSP

Uses Neovim's native LSP (no nvim-lspconfig required for basic setup). Completion uses the built-in `vim.lsp.completion` with `completeopt+=noselect`. TypeScript LSP (`ts_ls`) config exists but is commented out.
