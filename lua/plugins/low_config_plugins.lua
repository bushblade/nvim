-- NOTE: plugins here require little to no configuration
return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  { "delphinus/vim-firestore", event = "VeryLazy" },
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  -- Useful status updates for LSP
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      notification = {
        window = { border = "rounded", winblend = 0 },
      },
    },
  },

  { "folke/ts-comments.nvim", event = "VeryLazy", opts = {} },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    cmd = { "TodoTrouble", "TodoLocList", "TodoQuickFix" },
    config = function()
      require("todo-comments").setup()
    end,
  },
}
