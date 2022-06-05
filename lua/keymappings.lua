local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.keymap.set, mode, prefix, cmd, options)
    end
  end
end

local function telescope_find_files()
  require("telescope.builtin").find_files({ hidden = true })
end

local border_options = { float = { border = "rounded" } }

-- NOTE<cmd> <leader> prefixed mappings are in whichkey-settings.lua

local mappings = {
  i = {
    -- Insert mode
    { "kk", "<ESC>" },
    { "jj", "<ESC>" },
    { "jk", "<ESC>" },
    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
    -- moving text
    { "<C-j>", "<esc><cmd>m .+1<CR>==" },
    { "<C-k>", "<esc><cmd>m .-2<CR>==" },
  },
  n = {
    -- Normal mode
    -- Better window movement
    { "<C-h>", "<C-w>h", { silent = true } },
    { "<C-j>", "<C-w>j", { silent = true } },
    { "<C-k>", "<C-w>k", { silent = true } },
    { "<C-l>", "<C-w>l", { silent = true } },
    -- Resize with arrows
    { "<C-Up>", "<cmd>resize -2<CR>", { silent = true } },
    { "<C-Down>", "<cmd>resize +2<CR>", { silent = true } },
    { "<C-Left>", "<cmd>vertical resize -2<CR>", { silent = true } },
    { "<C-Right>", "<cmd>vertical resize +2<CR>", { silent = true } },
    -- Ctrl + p fuzzy files
    { "<C-p>", telescope_find_files },
    -- escape clears highlighting
    { "<esc>", "<cmd>noh<cr><esc>" },
    -- hop words
    { "f", "<cmd>HopWord<cr>" },
    { "F", "<cmd>HopLine<cr>" },
    -- yank to end of line on Y
    { "Y", "y$" },
    -- lsp mappings
    { "K", vim.lsp.buf.hover },
    { "<C-k>", vim.lsp.buf.signature_help },
    {
      "[d",
      function()
        vim.diagnostic.goto_prev(border_options)
      end,
    },
    {
      "]d",
      function()
        vim.diagnostic.goto_next(border_options)
      end,
    },
    { "gD", vim.lsp.buf.declaration },
    { "gd", vim.lsp.buf.definition },
    { "gr", vim.lsp.buf.references },
    { "gi", vim.lsp.buf.implementation },
    -- bufferline
    { "H", "<cmd>BufferLineCyclePrev<CR>" },
    { "L", "<cmd>BufferLineCycleNext<CR>" },
  },
  t = {
    -- Terminal mode
    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
    -- map escape to normal mode in terminal
    { "<Esc>", [[ <C-\><C-n> ]] },
    { "jj", [[ <C-\><C-n> ]] },
  },
  v = {
    -- Visual/Select mode
    -- Better indenting
    { "<", "<gv" },
    { ">", ">gv" },
    -- hop words
    { "f", require("hop").hint_words },
    -- moving text
    { "J", "<cmd>m '>+1<CR>gv=gv" },
    { "K", "<cmd>m '<-2<CR>gv=gv" },
  },
  x = {},
}

register_mappings(mappings, { silent = true, noremap = true })

-- S for search and replace in buffer
vim.cmd("nnoremap S :%s/")

-- hop in motion
local actions = { "d", "c", "<", ">", "y" }
for _, a in ipairs(actions) do
  vim.keymap.set("n", a .. "f", a .. "<cmd>lua require'hop'.hint_char1()<cr>")
end
