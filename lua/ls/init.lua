-- require all language server modules
require("ls.typescript")
require("ls.eslint")
require("ls.vue")
require("ls.css")
require("ls.html")
require("ls.luals")
require("ls.python")
require("ls.json")
require("ls.tailwind")
require("ls.yaml")
require("ls.prisma")

-- Customization and appearance -----------------------------------------
-- change gutter diagnostic symbols
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = " ",
    spacing = 2,
    source = "always", -- Or "if_many"
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})
