-- JavaScript and TypeScript -------------------------------

require("lspconfig").tsserver.setup {
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
    -- set up go to definition keybindings
    local opts = {noremap = true, silent = true}
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap("n", "gs", ":TSLspOrganize<CR>", opts)
    buf_set_keymap("n", "qq", ":TSLspFixCurrent<CR>", opts)
    buf_set_keymap("n", "gr", ":TSLspRenameFile<CR>", opts)
    buf_set_keymap("n", "gi", ":TSLspImportAll<CR>", opts)

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
      eslint_config_fallback = vim.loop.os_homedir() .. "/.eslintrc.json",
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
