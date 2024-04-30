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
map("n", "<esc>", "<cmd>noh<cr><esc>")
map("n", "Y", "y$")
map("n", "K", vim.lsp.buf.hover)
map("n", "[q", ":cprev<CR>")
map("n", "]q", ":cnext<CR>")
map("n", "[d", function()
  vim.diagnostic.goto_prev(border_options)
end)
map("n", "]d", function()
  vim.diagnostic.goto_next(border_options)
end)
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Defenition" })
map("n", "gr", vim.lsp.buf.references, { desc = "List References" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implemtation" })
map("n", "H", "<cmd>BufferLineCyclePrev<CR>")
map("n", "L", "<cmd>BufferLineCycleNext<CR>")
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
