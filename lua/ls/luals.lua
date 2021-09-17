local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- By default, lua-language-server doesn't have a cmd set. This is because nvim-lspconfig does not
-- make assumptions about your path. You must add the following to your init.vim or init.lua to set
-- cmd to the absolute path ($HOME and ~ are not expanded) of your unzipped and compiled lua-language-server.
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua

require("lspconfig").sumneko_lua.setup({
	cmd = { "/usr/bin/lua-language-server", "-E", "/usr/bin/lua-language-server/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
