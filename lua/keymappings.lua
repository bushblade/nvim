local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

-- NOTE: <leader> prefixed mappings are in whichkey-settings.lua

local mappings = {
  i = {
    -- Insert mode
    {"kk", "<ESC>"},
    {"jj", "<ESC>"},
    {"jk", "<ESC>"},
    -- Terminal window navigation
    {"<C-h>", "<C-\\><C-N><C-w>h"},
    {"<C-j>", "<C-\\><C-N><C-w>j"},
    {"<C-k>", "<C-\\><C-N><C-w>k"},
    {"<C-l>", "<C-\\><C-N><C-w>l"},
    -- moving text
    {"<C-j>", "<esc>:m .+1<CR>=="},
    {"<C-k>", "<esc>:m .-2<CR>=="}
  },
  n = {
    -- Normal mode
    -- Better window movement
    {"<C-h>", "<C-w>h", {silent = true}},
    {"<C-j>", "<C-w>j", {silent = true}},
    {"<C-k>", "<C-w>k", {silent = true}},
    {"<C-l>", "<C-w>l", {silent = true}},
    -- Resize with arrows
    {"<C-Up>", ":resize -2<CR>", {silent = true}},
    {"<C-Down>", ":resize +2<CR>", {silent = true}},
    {"<C-Left>", ":vertical resize -2<CR>", {silent = true}},
    {"<C-Right>", ":vertical resize +2<CR>", {silent = true}},
    -- Ctrl + p fuzzy files
    {"<C-p>", [[<cmd> lua require"telescope.builtin".find_files({ hidden = true })<CR>]]},
    -- escape clears highlighting
    {"<esc>", ":noh<cr><esc>"},
    -- hop words
    {"f", ":HopWord<cr>"},
    {"F", ":HopLine<cr>"},
    -- yank to end of line on Y
    {"Y", "y$"},
    -- lsp mappings
    {"K", "<Cmd>lua vim.lsp.buf.hover()<CR>"},
    {"<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>"},
    {"[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>"},
    {"]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>"},
    {"gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>"},
    {"gd", "<Cmd>lua vim.lsp.buf.definition()<CR>"},
    {"gR", "<Cmd>lua vim.lsp.buf.references()<CR>"}
  },
  t = {
    -- Terminal mode
    -- Terminal window navigation
    {"<C-h>", "<C-\\><C-N><C-w>h"},
    {"<C-j>", "<C-\\><C-N><C-w>j"},
    {"<C-k>", "<C-\\><C-N><C-w>k"},
    {"<C-l>", "<C-\\><C-N><C-w>l"},
    -- map escape to normal mode in terminal
    {"<Esc>", [[ <C-\><C-n> ]]},
    {"jj", [[ <C-\><C-n> ]]}
  },
  v = {
    -- Visual/Select mode
    -- Better indenting
    {"<", "<gv"},
    {">", ">gv"},
    -- hop words
    {"f", "<cmd>lua require'hop'.hint_words()<cr>"},
    -- moving text
    {"J", ":m '>+1<CR>gv=gv"},
    {"K", ":m '<-2<CR>gv=gv"}
  },
  x = {}
}

register_mappings(mappings, {silent = true, noremap = true})

-- S for search and replace in buffer
vim.cmd "nnoremap S :%s//gi<Left><Left><Left>"
