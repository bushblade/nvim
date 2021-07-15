local nvim_lsp = require("lspconfig")
local configs = require("lspconfig/configs")

nvim_lsp.tsserver.setup {
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
  root_dir = function()
    return vim.loop.cwd()
  end -- I needed this to work on plain .js files
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.cssls.setup(
  {
    capabilities = capabilities,
    cmd = {"vscode-css-language-server", "--stdio"},
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

nvim_lsp.html.setup {
  capabilities = capabilities,
  cmd = {"vscode-html-language-server", "--stdio"},
  filetypes = {"html"},
  init_options = {
    configurationSection = {"html", "css", "javascript"},
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  }
}

-- configs.emmet_ls = {
--   default_config = {
--     cmd = {"emmet-ls", "--stdio"},
--     filetypes = {"html", "css"},
--     root_dir = function(fname)
--       return vim.loop.cwd()
--     end,
--     settings = {}
--   }
-- }

-- configs.emmet_ls.setup {
--   capabilities = capabilities
-- }
