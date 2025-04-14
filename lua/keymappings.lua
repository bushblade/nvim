local map = require("utils").map

-- Options for specific commands
local border_options = { float = { border = "rounded" } }

-- Insert mode mappings
map("i", "kk", "<ESC>")
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
map("i", "<C-'>", "``<esc>i")

-- Normal mode mappings
map("n", "<C-Up>", "<cmd>resize -2<CR>")
map("n", "<C-Down>", "<cmd>resize +2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
map("n", "<esc>", "<cmd>noh<cr><esc>") -- remove highlight on <esc>
map("n", "Y", "y$")
map("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded" })
end)
map("n", "[q", ":cprev<CR>")
map("n", "]q", ":cnext<CR>")
map("n", "[d", function()
  vim.diagnostic.goto_prev(border_options)
end, { desc = "Prev diagnostic" })
map("n", "]d", function()
  vim.diagnostic.goto_next(border_options)
end, { desc = "Next diagnostic" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "List References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true })
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true })
map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')

-- Terminal mode mappings
map("t", "<Esc>", [[ <C-\><C-n> ]])
map("t", "jj", [[ <C-\><C-n> ]])

-- Visual mode mappings
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "J", "<cmd>m '>+1<CR>gv=gv")
map("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- Visual block mode mappings
map("x", "<leader>p", '"_dP')

-- function to toggle quick fix list
local function qf_toggle()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end

-- Leader key mappings
map("n", "<leader>q", qf_toggle, { desc = "Toggle Quickfix list" })
map("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File Tree" })
map("n", "<leader>u", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", { desc = "Toggle Undotree" })
map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>c", require("actions-preview").code_actions, { desc = "Code Actions" })
map("n", "<leader>d", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Line Diagnostics" })
map("n", "<leader>w", "<cmd>WhichKey<CR>", { desc = "WhichKey" })
map("n", "<leader>s", function()
  vim.o.spell = not vim.o.spell
end, { desc = "Toggle spell check" })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "LSP Rename" })

-- Telescope mappings
local telescope_builtin = require("telescope.builtin")
local session_lens = require("session-lens")

map("n", "<leader>ff", function()
  telescope_builtin.find_files({ hidden = true })
end, { desc = "Find File" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffer" })
map("n", "<leader>fn", "<cmd>TodoTelescope<cr>", { desc = "Find Notes" })
map("n", "<leader>ft", "<cmd>Telescope builtin<cr>", { desc = "Telescope builtin" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Search In Files" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "Find References" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Document Diagnostics" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Marks" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Key mappings" })
map("n", "<leader>fM", "<cmd>Telescope man_pages<CR>", { desc = "Man pages" })
map("n", "<leader>fa", session_lens.search_session, { desc = "Search Sessions" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Search help" })
map("n", "<leader>fT", "<cmd>TodoTelescope<CR>", { desc = "Search Todos" })
map("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", { desc = "Browse Files" })
map("n", "<leader>fg", "<cmd>Telescope git_status<CR>", { desc = "Git Status" })

-- LSP mappings
map("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format File" })
map("n", "<leader>ld", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Line Diagnostics" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>lR", vim.lsp.buf.references, { desc = "List references" })
map("n", "<leader>lc", require("actions-preview").code_actions, { desc = "Code actions" })

-- Spectre mappings
map("n", "<leader>Ss", require("spectre").open_visual, { desc = "Open Spectre" })
map("n", "<leader>Sw", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Search for word under cursor" })

-- Auto Sessions mappings
map("n", "<leader>aS", "<cmd>SaveSession<cr>", { desc = "Save session" })
map("n", "<leader>as", "<cmd>SearchSession<cr>", { desc = "Search sessions" })
map("n", "<leader>ad", "<cmd>SessionDelete<cr>", { desc = "Delete session" })
map("n", "<leader>ar", "<cmd>SessionRestore<cr>", { desc = "Restore session" })

-- Bufferline and other mappings
map("n", "<leader>b", "", { desc = "Bufferline" })
map("n", "<leader>t", "", { desc = "Trouble" })
map("n", "<leader>h", "", { desc = "GitSigns" })
