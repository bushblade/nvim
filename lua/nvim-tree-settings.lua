-- vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "*.d.ts" }
vim.g.nvim_tree_indent_markers = 1
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
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    custom = { ".git" },
  },
})
