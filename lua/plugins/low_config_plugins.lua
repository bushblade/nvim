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
  { "windwp/nvim-spectre", event = "VeryLazy" }, -- Spectre for find and replace
  "delphinus/vim-firestore",
  "nvim-tree/nvim-web-devicons",
  -- Useful status updates for LSP
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = { border = "rounded", winblend = 0 },
      },
    },
  },

  { "JoosepAlviste/nvim-ts-context-commentstring", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "leafOfTree/vim-matchtag",
  },
}
