-- run minimal conifg with nvim -nu minimal.lua
vim.cmd([[set runtimepath=$VIMRUNTIME]])
vim.cmd([[set packpath=/tmp/nvim/site]])

local package_root = "/tmp/nvim/site/pack"
local install_path = package_root .. "/packer/start/packer.nvim"

local function load_plugins()
	require("packer").startup({
		{
			"wbthomason/packer.nvim",
			"neovim/nvim-lspconfig",
			{
				"hrsh7th/nvim-cmp",
				requires = {
					"hrsh7th/cmp-nvim-lsp", -- lsp completions
				},
			},
		},
		config = {
			package_root = package_root,
			compile_path = install_path .. "/plugin/packer_compiled.lua",
			display = { non_interactive = true },
		},
	})
end

_G.load_config = function()
	require("lspconfig").tsserver.setup({
		filetypes = {
			"javascript",
			"javascriptreact",
		},
		cmd = { "typescript-language-server", "--stdio" },
		root_dir = function()
			return vim.loop.cwd()
		end,
	})
	require("cmp").setup({
		sources = {
			{ name = "nvim_lsp" },
		},
	})
end

if vim.fn.isdirectory(install_path) == 0 then
	vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/wbthomason/packer.nvim", install_path })
end

load_plugins()
require("packer").sync()
vim.cmd([[autocmd User PackerComplete ++once echo "Ready!" | lua load_config()]])
