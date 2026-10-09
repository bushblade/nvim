local map = require("utils").map

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
map("n", "[q", ":cprev<CR>")
map("n", "]q", ":cnext<CR>")
map("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev diagnostic" })
map("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
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
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Explorer" })
map("n", "<leader>u", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", { desc = "Toggle Undotree" })
map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>d", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Line Diagnostics" })
map("n", "<leader>w", "<cmd>WhichKey<CR>", { desc = "WhichKey" })
map("n", "<leader>s", function()
  vim.o.spell = not vim.o.spell
end, { desc = "Toggle spell check" })

-- Snacks picker mappings
map("n", "<leader>ff", function()
  Snacks.picker.files({ hidden = true })
end, { desc = "Find File" })
map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Find Buffer" })
map("n", "<leader>fn", function()
  Snacks.picker.todo_comments()
end, { desc = "Find Notes" })
map("n", "<leader>ft", function()
  Snacks.picker.pickers()
end, { desc = "Picker list" })
map("n", "<leader>fs", function()
  Snacks.picker.grep()
end, { desc = "Search In Files" })
map("n", "<leader>fr", function()
  Snacks.picker.lsp_references()
end, { desc = "Find References" })
map("n", "<leader>fd", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Document Diagnostics" })
map("n", "<leader>fm", function()
  Snacks.picker.marks()
end, { desc = "Marks" })
map("n", "<leader>fk", function()
  Snacks.picker.keymaps()
end, { desc = "Key mappings" })
map("n", "<leader>fM", function()
  Snacks.picker.man()
end, { desc = "Man pages" })
map("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Search help" })
map("n", "<leader>fe", function()
  Snacks.picker.files()
end, { desc = "Browse Files" })
map("n", "<leader>fg", function()
  Snacks.picker.git_status()
end, { desc = "Git Status" })

-- Diagnostics mappings
map("n", "<leader>ld", function()
  vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Line Diagnostics" })
