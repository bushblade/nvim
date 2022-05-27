vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1

require("nvim-tree").setup({
  diagnostics = {
    enable = true,
    icons = {
      hint = " ",
      info = " ",
      warning = " ",
      error = " ",
    },
  },
  -- filters = {
  --   custom = { ".git" },
  -- },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
})
