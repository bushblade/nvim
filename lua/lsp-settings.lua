
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end
-- Mappings.
local opts = { noremap=true, silent=true }

buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --...
end

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach
} 
