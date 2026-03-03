-- ============================================================
-- Team formatting config for Neovim
-- ============================================================

-- ── Plugins (lazy.nvim) ──────────────────────────────────────
return {

  -- ── Mason: tool installer ───────────────────────────────────
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },

  -- Bridges mason-installed servers into lspconfig automatically
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "ts_ls", -- JS / TS
        "intelephense", -- PHP
        "jsonls", -- JSON
      },
      automatic_installation = true,
    },
  },

  -- Bridges mason-installed tools into conform / nvim-lint
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "prettier", -- JS, TS, HTML formatter
        -- phpcs and phpcbf are project-local (vendor/bin), so not installed via Mason
      },
    },
  },

  -- ── LSP ─────────────────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lsp = require("lspconfig")

      -- TypeScript / JavaScript
      lsp.ts_ls.setup({})

      -- PHP (Intelephense)
      lsp.intelephense.setup({
        settings = {
          intelephense = {
            format = { enable = true },
          },
        },
      })

      -- JSON
      lsp.jsonls.setup({
        settings = {
          json = { validate = { enable = true } },
        },
      })
    end,
  },

  -- ── Formatting (conform.nvim) ────────────────────────────────
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        php = { "phpcbf" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
      formatters = {
        -- printWidth comes from the repo's .prettierrc — no args needed here
        prettier = {},
        -- Use the project-local phpcbf with the Drupal standard
        phpcbf = {
          command = "vendor/bin/phpcbf",
          args = { "--standard=Drupal", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },

  -- ── Linting (nvim-lint) ──────────────────────────────────────
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        php = { "phpcs" },
      }

      -- Override to use the project-local binary and Drupal standard
      lint.linters.phpcs.cmd = "vendor/bin/phpcs"
      lint.linters.phpcs.args = {
        "--standard=Drupal",
        "--report=json",
        "-",
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
