vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "*.d.ts" }
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_gitignore = 1

-- icons
vim.g.nvim_tree_icons = {
	lsp = {
		hint = " ",
		info = " ",
		warning = " ",
		error = " ",
	},
}
