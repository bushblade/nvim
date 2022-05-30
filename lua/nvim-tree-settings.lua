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
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- filters = {
  --   custom = { ".git" },
  -- },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "all",
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
