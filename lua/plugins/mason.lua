return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
      local registry = require("mason-registry")

      -- auto install formatters
      for _, pkg_name in ipairs({ "stylua", "prettierd", "autopep8" }) do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
          if not pkg:is_installed() then
            pkg:install()
          end
        end
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = false,
        ensure_installed = {
          "ts_ls",
          "vue_ls",
          "vtsls",
          "tailwindcss",
          "cssls",
          "yamlls",
          "prismals",
          "emmet_ls",
          "graphql",
          "astro",
          "lua_ls",
          "pyright",
          "rust_analyzer",
          "gopls",
          "jdtls",
          "eslint",
          "biome",
          "jsonls",
          "marksman",
          "html",
          "bashls",
          "intelephense",
        },
        automatic_installation = true,
      })
    end,
  },
}
