-- JavaScript and TypeScript -------------------------------

require("lspconfig").tsserver.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
  -- I needed this to work on plain .js files
  root_dir = function()
    return vim.loop.cwd()
  end,
})
