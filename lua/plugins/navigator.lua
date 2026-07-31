local map = require("utils").map
return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    config = function()
      dofile(vim.fn.expand("~/.config/herdr/plugins/vim-herdr-navigation/editor/nvim.lua"))
    end,
  },
}
