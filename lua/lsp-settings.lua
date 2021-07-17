local nvim_lsp = require("lspconfig")
local configs = require("lspconfig/configs")

-- enable null-ls integration (optional)
require("null-ls").setup {}

nvim_lsp.tsserver.setup {
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
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
      debug = false,
      disable_commands = false,
      enable_import_on_completion = true,
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
      eslint_bin = "eslint_d",
      eslint_config_fallback = nil,
      eslint_enable_diagnostics = true,
      -- formatting
      enable_formatting = false,
      formatter = "prettier",
      formatter_config_fallback = nil,
      -- update imports on file move
      update_imports_on_move = true,
      require_confirmation_on_move = true,
      watch_dir = nil
    }

    -- required to fix code action ranges
    ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    local opts = {silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
  end
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
