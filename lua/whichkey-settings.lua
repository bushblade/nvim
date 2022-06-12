local wk = require("which-key")

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		-- winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	show_help = true, -- show help message on the command line when the popup is visible
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^<cmd>", "^ " }, -- hide mapping boilerplate
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

-- register key bindings with <leader> prefix
wk.register({
	f = {
		-- mostly Telescope bindings
		name = "Find with Telescope",
		f = { [[<cmd> lua require"telescope.builtin".find_files({ hidden = true })<CR>]], "Find File" },
		b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
		n = { "<cmd>TodoTelescope<cr>", "Find Notes" },
		t = { "<cmd>Telescope builtin<cr>", "Telescope builtin" },
		s = { "<cmd>Telescope live_grep<cr>", "Search In Files" },
		c = { "<cmd>Telescope lsp_code_actions<cr>", "Code Actions" },
		r = { "<cmd>Telescope lsp_references<cr>", "Find References" },
		d = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
		m = { "<cmd>Telescope marks<CR>", "Marks" },
		k = { "<cmd>Telescope keymaps<CR>", "Key mappings" },
		M = { "<cmd>Telescope man_pages<CR>", "Man pages" },
		a = { "<cmd>Telescope session-lens search_session<CR>", "Search Sessions" },
		h = { "<cmd>Telescope help_tags<CR>", "Search help" },
	},
	h = {
		name = "Git Gutter",
		p = "Preview Hunk",
		s = "Stage Hunk",
		u = "Undo Changes",
	},
	e = { "<cmd>NvimTreeToggle<CR>", "File Tree" },
	u = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", "Undotree" },
	-- trouble bindings
	t = {
		name = "Trouble",
		t = { "<cmd>TroubleToggle<CR>", "Toggle" },
		r = { "<cmd>Trouble lsp_references<CR>", "References" },
		d = { "<cmd>Trouble lsp_definitions<CR>", "Definitions" },
		q = { "<cmd>Trouble quickfix<CR>", "Quickfix" },
		T = { "<cmd>TodoTrouble<CR>", "Todos" },
		w = { "<cmd>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
		D = { "<cmd>Trouble document_diagnostics<CR>", "Document Diagnostics" },
	},
	T = { "<cmd>TodoLocList<CR>", "Todos list" },
	c = { "<cmd>CodeActionMenu<CR>", "Code Actions" },
	d = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Line Diagnostics" },
	w = { "<cmd>WhichKey<CR>", "WhichKey" },
	s = { "<cmd>lua vim.o.spell = not vim.o.spell<cr>", "Toggle spell check" },
	r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	-- Bufferline
	b = {
		name = "Bufferline",
		b = { "<cmd>BufferLinePick<CR>", "Pick" },
		q = { "<cmd>BufferLinePickClose<CR>", "Pick to close" },
		l = { "<cmd>BufferLineCloseRight<CR>", "Close all to right" },
		h = { "<cmd>BufferLineCloseLeft<CR>", "Close all to left" },
		a = {  "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>", "Close all but current"  },
		p = { "<cmd>BufferLineTogglePin<CR>", "Toggle pin" },
	},
	S = {
		name = "Spectre - find and replace",
		s = { "<cmd>lua require('spectre').open_visual()<CR>", "Open Spectre" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search for word under cursor" },
	},
	l = {
		name = "LSP",
		f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format File" },
		d = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Line Diagnostics" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		R = { "<cmd> lua vim.lsp.buf.references()<CR>", "List references" },
		c = { "<cmd>CodeActionMenu<CR>", "Code actions" },
	},
	a = {
		name = "Auto Sessions",
		S = { "<cmd>SaveSession<cr>", "Save session" },
		s = { "<cmd>SearchSession<cr>", "Search sessions" },
		d = { "<cmd>DeleteSession<cr>", "Delete session" },
		r = { "<cmd>RestoreSession<cr>", "Restore session" },
	},
}, {
	prefix = "<leader>",
})

wk.register({
	name = "Go to",
	d = "Definition",
	D = "Declaration",
	r = "References",
}, { prefix = "g" })
