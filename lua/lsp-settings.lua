
local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup {
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = function() return vim.loop.cwd() end -- I needed this to work on plain .js files
} 

