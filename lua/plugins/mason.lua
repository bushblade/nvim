return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "volar",
          "tailwindcss",
          "cssls",
          "yamlls",
          "prismals",
          "emmet_ls",
          "graphql",
          "astro",
          "lua_ls",
          "pyright",
          "denols",
          "rust_analyzer",
          "gopls",
          "jdtls",
          "eslint",
          "jsonls",
          "marksman",
        },
        automatic_installation = true,
      })
    end,
  },
}
