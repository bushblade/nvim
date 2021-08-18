local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

local mappings = {
  i = {
    -- Insert mode
    {"kk", "<ESC>"},
    {"jj", "<ESC>"},
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
    -- Telescope
    -- Ctrl + p fuzzy files
    {"<C-p>", [[<cmd> lua require"telescope.builtin".find_files({ hidden = true })<CR>]]},
    {"<leader>ff", ":Telescope find_files<cr>"},
    {"<leader>fe", ":Telescope file_browser<cr>"},
    {"<leader>fb", ":Telescope buffers<cr>"},
    {"<leader>b", ":Telescope buffers<cr>"},
    {"<leader>fs", ":Telescope live_grep<cr>"},
    {"<leader>s", ":Telescope live_grep<cr>"},
    {"<leader>fc", ":Telescope lsp_code_actions<cr>"},
    {"<leader>ft", ":Telescope<cr>"},
    {"<leader>fy", ":Telescope neoclip<cr>"},
    {"<leader>fe", ":Telescope emoji search<cr>"},
    -- Escape clears highlight after search
    {"<esc>", ":noh<cr><esc>"},
    -- hop words
    {"f", ":HopWord<cr>"},
    {"F", ":HopLine<cr>"},
    -- NvimTree
    {"<leader>e", ":NvimTreeToggle<CR>"},
    -- yank to end of line on Y
    {"Y", "y$"},
    -- moving text
    {"<leader>k", ":m .-2<CR>=="},
    {"<leader>j", ":m .+1<CR>=="},
    -- Toggle Trouble view
    {"<leader>t", ":TroubleToggle<CR>"},
    -- Launch WhichKey
    {"<leader>w", ":WhichKey<CR>"},
    -- show code actions,
    {"<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>"}
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
