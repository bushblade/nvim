return {
  {
    "folke/tokyonight.nvim",
    -- lazy = true,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts) -- opts here are passed from above
      local colors = require("tokyonight.colors").setup({})
      vim.cmd("highlight WinSeparator guifg=" .. colors.bg_highlight)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
