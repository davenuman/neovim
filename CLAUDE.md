# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration built on [LazyVim](https://lazyvim.github.io/) with lazy.nvim for plugin management. The config lives at `~/.config/nvim`.

## Formatting

Lua files are formatted with **StyLua** (`stylua.toml`: 2-space indent, 120 column width). Run `stylua .` from the repo root to format all Lua files.

## Architecture

- `init.lua` — Entry point, loads `config.lazy`
- `lua/config/lazy.lua` — lazy.nvim bootstrap and plugin spec aggregation. Imports LazyVim core, PHP/Helm language extras, and all files under `lua/plugins/`
- `lua/config/options.lua` — Editor defaults (2-space tabs, 160 textwidth, no wrap) and Neovide GUI settings
- `lua/config/keymaps.lua` — Keymap deletions: removes `<leader>n` (repurposed for Obsidian) and `S-h`/`S-l` buffer nav
- `lua/config/autocmds.lua` — Copilot disabled on startup, trailing whitespace stripped on save, per-filetype tab settings
- `lua/plugins/` — Each file returns a lazy.nvim plugin spec table (or list of specs)
- `lazyvim.json` — LazyVim extras registry (enabled extras for AI, languages, editor features)

## Key Design Decisions

- **Copilot is installed but disabled by default** via `vim.cmd("silent! Copilot disable")` in autocmds
- **PHP uses Drupal coding standards**: phpcs/phpcbf use `--standard=Drupal` and expect project-local `vendor/bin/` binaries (not Mason-installed)
- **Formatting on save** via conform.nvim: prettier for JS/TS/HTML/JSON, phpcbf for PHP
- **Parrot plugin is disabled** (early-returns `{}`)
- **`<leader>n`** is reserved for the Obsidian note system, not the LazyVim default
- **Colorscheme**: Catppuccin
- **AI assistants**: Avante (Gemini provider), CodeCompanion (`<leader>cc` prefix)

## LazyVim Extras Enabled

Language extras (via `lazyvim.json`): Angular, Ansible, Astro, Docker, Go, JSON, Svelte, Tailwind, Terraform, YAML. PHP and Helm are imported directly in `lazy.lua`.

## Adding a Plugin

Create a new file in `lua/plugins/` returning a lazy.nvim spec table. LazyVim auto-imports everything in that directory. Keymaps for plugins are typically defined inline in the spec file (see `obsidian.lua`, `codecompanion.lua` for examples).
