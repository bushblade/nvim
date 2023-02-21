return {
  -- NOTE: plugins here require little to no configuratin
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  -- NOTE: disabled for now as not working with nvim window bindings
  -- "knubie/vim-kitty-navigator",
  "windwp/nvim-autopairs",
  "windwp/nvim-spectre", -- Spectre for find and replace
  "mhartington/formatter.nvim",
  "delphinus/vim-firestore",
  "goolord/alpha-nvim",
  "andweeb/presence.nvim",
  "kyazdani42/nvim-web-devicons",
  { "numToStr/Comment.nvim", opts = {} },
  "rmagatti/auto-session",
  "airblade/vim-gitgutter",
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
}
