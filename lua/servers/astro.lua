require("lspconfig").astro.setup({
  init_options = {
    typescript = {
      -- needs to be installed in ~ by using `pnpm i typescript`. NOTE: do not use -g flag!
      serverPath = os.getenv("HOME") .. "/.npm-packages/lib/node_modules/typescript/lib/typescript.js",
    },
  },
})
