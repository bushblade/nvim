local root_pattern = require("lspconfig").util.root_pattern

require("lspconfig").eslint.setup({
  root_dir = root_pattern(
    "package.json",
    ".eslintrc",
    ".eslintrc.json",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.js",
    ".eslintrc.cjs"
  ),
})
