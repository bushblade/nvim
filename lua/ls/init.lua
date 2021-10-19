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

-- Customization and appearance -----------------------------------------
-- change gutter diagnostic symbols
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Show source in diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _)
  local config = {
    -- your config
    -- see :h on_publish_diagnostics
    underline = true,
    virtual_text = {
      prefix = " ",
      spacing = 2,
    },
    signs = true,
    update_in_insert = false,
  }
  local uri = params.uri
  local bufnr = vim.uri_to_bufnr(uri)

  if not bufnr then
    return
  end

  local diagnostics = params.diagnostics

  for i, v in ipairs(diagnostics) do
    diagnostics[i].message = string.format("%s: %s", v.source, v.message)
  end

  vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)

  if not vim.api.nvim_buf_is_loaded(bufnr) then
    return
  end

  vim.lsp.diagnostic.display(diagnostics, bufnr, client_id, config)
end

-- Show diagnostics automatically in hover window
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
