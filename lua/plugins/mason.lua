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
      local registry = require("mason-registry")

      -- auto install formatters
      for _, pkg_name in ipairs({ "stylua", "prettier", "autopep8" }) do
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
          "html",
        },
        automatic_installation = true,
      })
    end,
  },
}
