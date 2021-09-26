vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "*.d.ts" }
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
-- vim.g.nvim_tree_gitignore = 1

-- projects.nvim needs this setting
vim.g.nvim_tree_respect_buf_cwd = 1

-- icons
vim.g.nvim_tree_icons = {
  lsp = {
    hint = " ",
    info = " ",
    warning = " ",
    error = " ",
  },
}

require("nvim-tree").setup({
  auto_close = true,
  lsp_diagnostics = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
