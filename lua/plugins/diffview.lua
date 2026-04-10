return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview Open" },
    { "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview File History" },
    { "<leader>gF", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview Branch History" },
  },
  config = function(_, opts)
    require("diffview").setup(opts)

    -- Add q and Esc to close the commit log floating panel
    vim.api.nvim_create_autocmd("BufWinEnter", {
      callback = function(ev)
        if vim.bo[ev.buf].filetype ~= "git" then
          return
        end
        local win = vim.fn.bufwinid(ev.buf)
        if win == -1 or vim.api.nvim_win_get_config(win).relative == "" then
          return
        end
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = ev.buf, desc = "Close commit log" })
        vim.keymap.set("n", "<esc>", "<cmd>close<cr>", { buffer = ev.buf, desc = "Close commit log" })
      end,
    })
  end,
}
