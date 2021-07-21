require "lspconfig".jsonls.setup {
  cmd = {"vscode-json-language-server", "--stdio"},
  filetypes = {"json"},
  init_options = {
    provideFormatter = false
  },
  root_dir = function()
    return vim.loop.cwd()
  end
}
