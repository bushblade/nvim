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
    winblend = 10,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  show_help = true, -- show help message on the command line when the popup is visible
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
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
    e = { ":Telescope emoji search<cr>", "Find Emoji" },
    b = { ":Telescope buffers<cr>", "Find Buffer" },
    n = { ":TodoTelescope<cr>", "Find Notes" },
    t = { ":Telescope builtin<cr>", "Telescope builtin" },
    s = { ":Telescope live_grep<cr>", "Search In Files" },
    c = { ":Telescope lsp_code_actions<cr>", "Code Actions" },
    r = { ":Telescope lsp_references<cr>", "Find References" },
    w = { ":Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
    D = { ":Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
    m = { ":Telescope marks<CR>", "Marks" },
    k = { ":Telescope keymaps<CR>", "Key mappings" },
    M = { ":Telescope man_pages<CR>", "Man pages" },
    p = { ":Telescope projects<CR>", "Projects" },
  },
  h = {
    name = "Git Gutter",
    p = "Preview Hunk",
    s = "Stage Hunk",
    u = "Undo Changes",
  },
  e = { ":NvimTreeToggle<CR>", "File Tree" },
  -- trouble bindings
  t = {
    name = "Trouble",
    t = { ":TroubleToggle<CR>", "Toggle" },
    l = { ":Trouble loclist<CR>", "List project troubles" }, -- NOTE: not sure what this one does?
    r = { ":Trouble lsp_references<CR>", "References" },
    d = { ":Trouble lsp_definitions<CR>", "Definitions" },
    q = { ":Trouble quickfix<CR>", "Quickfix" },
    T = { ":TodoTrouble<CR>", "Todos" },
    w = { ":Trouble lsp_workspace_diagnostics<CR>", "Workspace Diagnostics" },
    D = { ":Trouble lsp_document_diagnostics<CR>", "Document Diagnostics" },
  },
  T = { ":TodoLocList<CR>", "Todos list" },
  c = { ":CodeActionMenu<CR>", "Code Actions" },
  d = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Line Diagnostics" },
  w = { ":WhichKey<CR>", "WhichKey" },
  s = { ":lua vim.o.spell = not vim.o.spell<cr>", "Toggle spell check" },
  b = { ":BufferLinePick<CR>", "Pick BufferLine" },
  q = { ":BufferLinePickClose<CR>", "Pick Buffer to close" },
  r = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
  S = {
    name = "Spectre - find and replace",
    s = { ":lua require('spectre').open_visual()<CR>", "Open Spectre" },
    w = { ":lua require('spectre').open_visual({select_word=true})<CR>", "Search for word under cursor" },
  },
  p = { ":Telescope projects<CR>", "Projects" },
}, {
  prefix = "<leader>",
})

wk.register({
  name = "Go to",
  d = "Go to definition",
  D = "Go to declaration",
}, { prefix = "g" })
