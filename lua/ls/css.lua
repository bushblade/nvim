local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local css_settings = {
  validate = true,
  lint = {},
}

local is_tailwind = vim.fn.filereadable("tailwind.config.js")
if is_tailwind == 1 then
  css_settings.lint.unknownAtRules = "ignore"
end

require("lspconfig").cssls.setup({
  capabilities = capabilities,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  settings = {
    css = css_settings,
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
})
