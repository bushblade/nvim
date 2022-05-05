local root_pattern = require("lspconfig").util.root_pattern

require("lspconfig").tailwindcss.setup({
  root_dir = root_pattern(
    "tailwind.config.js",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.ts",
    "tailwind.config.cjs"
  ),
})
