return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  vim.keymap.set({ "n", "v" }, "<leader>cc", "", { desc = "CodeCompanion" }),
  vim.keymap.set(
    { "n", "v" },
    "<leader>cca",
    "<cmd>CodeCompanionActions<CR>",
    { desc = "CodeCompanion Actions", noremap = true, silent = true }
  ),
  vim.keymap.set(
    { "n", "v" },
    "<leader>ccc",
    "<cmd>CodeCompanionChat<CR>",
    { desc = "CodeCompanion Chat", noremap = true, silent = true }
  ),
  vim.keymap.set(
    { "n", "v" },
    "<leader>ccn",
    "<cmd>CodeCompanionChat Add<CR>",
    { desc = "CodeCompanion New", noremap = true, silent = true }
  ),
  vim.keymap.set(
    { "n", "v" },
    "<leader>cct",
    "<cmd>CodeCompanionChat Toggle<CR>",
    { desc = "CodeCompanion Toggle", noremap = true, silent = true }
  ),
  vim.keymap.set(
    { "n", "v" },
    "<leader>ccp",
    "<cmd>CodeCompanion<CR>",
    { desc = "CodeCompanion Prompt", noremap = true, silent = true }
  ),
  -- Expand 'cc' into 'CodeCompanion' in the command line
  vim.cmd([[cab cc CodeCompanion]]),
}
