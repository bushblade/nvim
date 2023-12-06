local root_pattern = require("lspconfig").util.root_pattern

require("lspconfig").intelephense.setup({
  root_dir = root_pattern("composer.json", ".git", "*.php"),
})
