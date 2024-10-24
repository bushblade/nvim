return {
  -- NOTE: plugins here require little to no configuration
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- NOTE: disabled for now as not working with nvim window bindings
  -- "knubie/vim-kitty-navigator",
  { "windwp/nvim-spectre", event = "VeryLazy" }, -- Spectre for find and replace
  "delphinus/vim-firestore",
  "kyazdani42/nvim-web-devicons",
  -- Better code action previews
  {
    "aznhe21/actions-preview.nvim",
    event = "VeryLazy",
  },
  -- Useful status updates for LSP
  { "j-hui/fidget.nvim", opts = { window = { border = "rounded", blend = 0 } }, tag = "legacy" },

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
