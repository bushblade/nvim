local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup(
  {
    capabilities = capabilities,
    cmd = {"vscode-css-language-server", "--stdio"},
    filetypes = {"css", "scss", "less"},
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore"
        }
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }
  }
)
