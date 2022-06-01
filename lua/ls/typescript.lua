-- JavaScript and TypeScript -------------------------------
local root_pattern = require("lspconfig").util.root_pattern

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
  root_dir = function()
    if root_pattern("deno.json", "deno.jsonc, denon.json") then
      return false
    else
      -- I needed this to work on plain .js files
      return vim.loop.cwd()
    end
  end,
})
