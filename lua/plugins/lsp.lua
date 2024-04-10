return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim" },
    config = function()
      -- Setup neovim lua configuration
      require("neodev").setup()
      -- require all language server modules
      require("language_servers.typescript")
      require("language_servers.eslint")
      require("language_servers.vue")
      require("language_servers.css")
      require("language_servers.html")
      require("language_servers.luals")
      require("language_servers.python")
      require("language_servers.json")
      require("language_servers.tailwind")
      require("language_servers.yaml")
      require("language_servers.prisma")
      require("language_servers.emmet")
      require("language_servers.gql")
      require("language_servers.rust")
      require("language_servers.go")
      require("language_servers.deno")
      require("language_servers.astro")
      require("language_servers.java")
      require("language_servers.markdown")
      require("language_servers.bash")
      require("language_servers.php")
      require("language_servers.htmx")

      -- rounded border on :LspInfo
      require("lspconfig.ui.windows").default_options.border = "rounded"

      -- Customization and appearance -----------------------------------------
      -- change gutter diagnostic symbols
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = {
          source = "if_many",
          prefix = " ", -- Could be '●', '▎', 'x'
        },
        float = {
          source = "always",
        },
        severity_sort = true,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
    end,
  },
}
