-- CSS -------------------------------------

require("lspconfig").cssls.setup(
  {
    capabilities = capabilities,
    cmd = {"vscode-css-language-server", "--stdio"},
    filetypes = {"css", "scss", "less"},
    settings = {
      css = {
        validate = true
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
