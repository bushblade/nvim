vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

--require("nvim-web-devicons").setup()

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  },
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
  renderer = {
    icons = {
      show = {
        folder_arrow = false,
      },
    },
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
  actions = {
    change_dir = {
      enable = false,
    },
    open_file = {
      quit_on_open = false,
    },
  },
})
