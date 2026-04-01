return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview Open" },
    { "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview File History" },
    { "<leader>gF", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview Branch History" },
  },
  opts = {},
}
