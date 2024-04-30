local map = require("utils").map
return {
  {
    "numToStr/Navigator.nvim", -- navigate vim splits in wezterm and tmux
    config = function()
      require("Navigator").setup({})

      map({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
      map({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
      map({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
      map({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
    end,
  },
}
