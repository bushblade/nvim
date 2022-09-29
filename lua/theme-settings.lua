local colors = require("tokyonight.colors").setup({})

require("tokyonight").setup({
  style = "night",
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})

-- vim.cmd("highlight WinSeparator guifg=" .. colors.blue)
vim.cmd("highlight WinSeparator guifg=" .. colors.bg_highlight)
vim.cmd([[colorscheme tokyonight]])
