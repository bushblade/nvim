-- JavaScript and TypeScript -------------------------------
local root_pattern = require("lspconfig").util.root_pattern

require("lspconfig").ts_ls.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", "index.js", "app.js"),
})
