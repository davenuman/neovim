return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
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
      },
    },
    ui = { enable = false },
    notes_subdir = "Notes",
    daily_notes = {
      folder = "Journal",
      date_format = "%Y-%m-%d-%a",
      alias_format = "%A %B %-d, %Y",
      default_tags = { "journal" },
      template = nil,
    },
    templates = {
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    link = { style = "wiki" },

    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },

    legacy_commands = false,
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.md",
      callback = function()
        vim.keymap.set("n", "<leader>ch", function()
          return require("obsidian").util.toggle_checkbox()
        end, { buffer = true })
      end,
    })
  end,
  vim.keymap.set("n", "<leader>n", "", { desc = "Note system" }),
  vim.keymap.set("n", "<leader>nb", ":Obsidian backlinks<CR>", { desc = "Show Backlinks" }),
  vim.keymap.set("n", "<leader>nd", ":Obsidian dailies<CR>", { desc = "Daily Notes" }),
  vim.keymap.set("n", "<leader>nn", ":Obsidian new", { desc = "Obsidian New" }),
  vim.keymap.set("n", "<leader>no", ":Obsidian open<CR>", { desc = "Open in Obsidian" }),
  vim.keymap.set("n", "<leader>nq", ":Obsidian quick_switch<CR>", { desc = "Obsidian Quick Switch" }),
  vim.keymap.set("n", "<leader>ns", ":Obsidian search<CR>", { desc = "Obsidian Search" }),
  vim.keymap.set("n", "<leader>nt", ":Obsidian tags<CR>", { desc = "Obsidian Tags" }),
  vim.keymap.set("n", "<leader>ngs", ":Obsidian follow_link hsplit<CR>", { desc = "Follow Link split" }),
  vim.keymap.set("n", "<leader>ngv", ":Obsidian follow_link vsplit<CR>", { desc = "Follow Link vsplit" }),
  vim.keymap.set("v", "<leader>o", ":Obsidian extract_note<CR>", { desc = "Extract Note" }),
}
