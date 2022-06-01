local root_pattern = require("lspconfig").util.root_pattern

require("lspconfig").denols.setup({
  filetypes = {
    "typescript",
  },
  root_dir = root_pattern("deno.json", "deno.jsonc", "denon.json"),
})
