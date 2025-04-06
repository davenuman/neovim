return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "~/Obsidian/Knowledge",
        -- strict = false,
      },
    },
    ui = { enable = false },
    notes_subdir = "Notes",
    daily_notes = {
      folder = "Journal",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d-%a",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%A %B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "journal" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
    },
    templates = {
      -- folder = "Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    -- Either 'wiki' or 'markdown'.
    preferred_link_style = "wiki",

    -- picker = {
    --   name = "telescope.nvim",
    -- },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Enables completion using nvim_cmp
      nvim_cmp = false,
      -- Enables completion using blink.cmp
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- -- Smart action depending on context, either follow link or toggle checkbox.
      -- ["<cr>"] = {
      --   action = function()
      --     return require("obsidian").util.smart_action()
      --   end,
      --   opts = { buffer = true, expr = true },
      -- }
    },

    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "qutebrowser", url })
    end,
  },
  -- vim.keymap.del("n", "<leader>n"),
  vim.keymap.set("n", "<leader>n", "", { desc = "Note system" }),
  vim.keymap.set("n", "<leader>nb", ":ObsidianBacklinks<CR>", { desc = "Show Backlinks" }),
  vim.keymap.set("n", "<leader>nd", ":ObsidianDailies<CR>", { desc = "Daily Notes" }),
  vim.keymap.set("n", "<leader>nn", ":ObsidianNew", { desc = "Obsidian New" }),
  vim.keymap.set("n", "<leader>no", ":ObsidianOpen<CR>", { desc = "Open in Obsidian" }),
  vim.keymap.set("n", "<leader>ns", ":ObsidianSearch<CR>", { desc = "Obsidian Search" }),
  vim.keymap.set("n", "<leader>nt", ":ObsidianTags<CR>", { desc = "Obsidian Tags" }),
  vim.keymap.set("n", "<leader>ngs", ":ObsidianFollowLink hsplit<CR>", { desc = "Follow Link split" }),
  vim.keymap.set("n", "<leader>ngv", ":ObsidianFollowLink vsplit<CR>", { desc = "Follow Link vsplit" }),
  vim.keymap.set("v", "<leader>o", ":ObsidianExtractNote<CR>", { desc = "Extract Note" }),
}
