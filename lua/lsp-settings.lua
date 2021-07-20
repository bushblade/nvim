local nvim_lsp = require("lspconfig")
local configs = require("lspconfig/configs")
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- enable null-ls integration (optional)
require("null-ls").config {}
require("lspconfig")["null-ls"].setup {}

-- JavaScript and TypeScript -------------------------------
nvim_lsp.tsserver.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  cmd = {"typescript-language-server", "--stdio"},
  -- I needed this to work on plain .js files
  root_dir = function()
    return vim.loop.cwd()
  end,
  -- nvim-lsp-ts-utils settings below
  on_attach = function(client, bufnr)
    -- disable tsserver formatting if you plan on formatting via null-ls
    client.resolved_capabilities.document_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup {
      debug = true,
      disable_commands = false,
      enable_import_on_completion = true, -- I don't think this is working
      -- import all
      import_all_timeout = 5000, -- ms
      import_all_priorities = {
        buffers = 4, -- loaded buffer names
        buffer_content = 3, -- loaded buffer content
        local_files = 2, -- git files or files with relative path markers
        same_file = 1 -- add to existing import statement
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,
      -- eslint
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint_d", -- use eslint_d rather than eslint for performance
      eslint_config_fallback = nil,
      eslint_enable_diagnostics = true,
      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil
    }

    -- required to fix code action ranges
    ts_utils.setup_client(client)
  end
}

-- Vue JS --------------------------------------
require "lspconfig".vuels.setup {}

-- CSS -------------------------------------

nvim_lsp.cssls.setup(
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

-- HTML --------------------------------------

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

-- Customization and appearance -----------------------------------------
-- change gutter diagnostic symbols
local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- Show source in diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _)
  local config = {
    -- your config
    underline = true,
    virtual_text = {
      prefix = "🤯",
      spacing = 4
    },
    signs = true,
    update_in_insert = false
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
