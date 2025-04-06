return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
  opts = {},

  config = function()
    require("parrot").setup({
      -- Providers must be explicitly added to make them available.
      providers = {
        anthropic = {
          api_key = os.getenv("ANTHROPIC_API_KEY"),
        },
        gemini = {
          api_key = os.getenv("GEMINI_API_KEY"),
        },
        groq = {
          api_key = os.getenv("GROQ_API_KEY"),
        },
        mistral = {
          api_key = os.getenv("MISTRAL_API_KEY"),
        },
        pplx = {
          api_key = os.getenv("PERPLEXITY_API_KEY"),
        },
        -- provide an empty list to make provider available (no API key required)
        ollama = {},
        openai = {
          api_key = os.getenv("OPENAI_API_KEY"),
        },
        github = {
          api_key = os.getenv("GITHUB_TOKEN"),
        },
        nvidia = {
          api_key = os.getenv("NVIDIA_API_KEY"),
        },
        xai = {
          api_key = os.getenv("XAI_API_KEY"),
        },
      },
    })
  end,

  vim.keymap.set("n", "<leader>p", "", { desc = "Parrot LLM" }),
  vim.keymap.set("n", "<leader>pn", ":PrtChatNew<CR>", { desc = "Parrot Chat: New" }),
  vim.keymap.set("n", "<leader>pf", ":PrtChatFinder<CR>", { desc = "Parrot Chat: Find" }),
  vim.keymap.set("n", "<leader>pr", ":PrtChatResponde", { desc = "Parrot Chat: Respond" }),
  vim.keymap.set("n", "<leader>pi", ":PrtImplement", { desc = "Parrot Implement" }),
  vim.keymap.set("n", "<leader>pa", ":PrtAsk", { desc = "Parrot Ask" }),
  vim.keymap.set("n", "<leader>pp", ":PrtProvider<CR>", { desc = "Parrot Provider" }),
  vim.keymap.set("n", "<leader>pP", ":PrtChatPaste<CR>", { desc = "Parrot Chat: Paste" }),
  vim.keymap.set("n", "<leader>pt", ":PrtChatToggle<CR>", { desc = "Parrot Chat: Toggle" }),
  vim.keymap.set("n", "<leader>pM", ":PrtModel<CR>", { desc = "Parrot Model" }),
  vim.keymap.set("n", "<leader>pw", ":PrtRewrite<CR>", { desc = "Parrot Rewrite" }),
  vim.keymap.set("n", "<leader>pc", ":PrtEdit<CR>", { desc = "Parrot Edit" }),
  vim.keymap.set("n", "<leader>po", ":PrtAppend<CR>", { desc = "Parrot Append" }),
  vim.keymap.set("n", "<leader>pO", ":PrtPrepend<CR>", { desc = "Parrot Prepend" }),
}
