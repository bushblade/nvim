return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim", "saghen/blink.cmp" },
    config = function()
      -- Setup neovim lua configuration
      require("neodev").setup()

      -- rounded border on :LspInfo
      require("lspconfig.ui.windows").default_options.border = "rounded"

      -- Customization and appearance -----------------------------------------
      -- change gutter diagnostic symbols
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = {
          source = "if_many",
          prefix = "●", -- Could be '●', '▎', 'x'
        },
        float = {
          source = true,
        },
        severity_sort = true,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local root_pattern = require("lspconfig").util.root_pattern
      local lspconfig = require("lspconfig")

      -- TS/JS
      lspconfig.ts_ls.setup({
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", "index.js", "app.js"),
        capabilities = capabilities,
      })

      -- EsLint
      require("lspconfig").eslint.setup({
        root_dir = root_pattern(
          -- "package.json",
          ".eslintrc",
          ".eslintrc.json",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          ".eslintrc.js",
          ".eslintrc.cjs",
          "eslint.config.js",
          "eslint.config.mjs"
        ),
      })

      -- Vue JS
      require("lspconfig").volar.setup({})

      -- Biome
      require("lspconfig").biome.setup({})

      -- CSS
      local css_settings = {
        validate = true,
        lint = {},
      }

      local is_tailwind = vim.fn.filereadable(vim.fn.expand("tailwind.config.*"))
      if is_tailwind == 1 then
        css_settings.lint.unknownAtRules = "ignore"
      end

      require("lspconfig").cssls.setup({
        capabilities = capabilities,
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        settings = {
          css = css_settings,
          less = {
            validate = true,
          },
          scss = {
            validate = true,
          },
        },
      })

      -- HTML
      require("lspconfig").html.setup({
        capabilities = capabilities,
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "php" },
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
        },
      })

      -- JSON

      -- Function to check if biome.json exists in the current working directory
      local function biome_file_exists()
        local cwd = vim.fn.getcwd()
        local biome_file = cwd .. "/biome.json"
        return vim.loop.fs_stat(biome_file) ~= nil
      end

      -- Conditionally set up jsonls if biome.json does not exist
      if not biome_file_exists() then
        lspconfig.jsonls.setup({
          cmd = { "vscode-json-language-server", "--stdio" },
          filetypes = { "json", "jsonc" },
          init_options = {
            provideFormatter = true,
          },
        })
      else
        print("biome.json found, not enabling jsonls")
      end

      -- Tailwind
      require("lspconfig").tailwindcss.setup({
        capabilities = capabilities,
        root_dir = root_pattern(
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.mjs",
          "postcss.config.ts",
          "tailwind.config.cjs"
        ),
      })

      -- Emmet
      require("lspconfig").emmet_ls.setup({
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue", "php" },
        capabilities = capabilities,
      })

      -- Astro
      require("lspconfig").astro.setup({ capabilities = capabilities })

      -- Markdown
      require("lspconfig").marksman.setup({})

      -- Prisma
      require("lspconfig").prismals.setup({
        root_dir = function()
          return vim.loop.cwd()
        end,
      })

      -- php
      require("lspconfig").intelephense.setup({
        root_dir = root_pattern("composer.json", ".git", "*.php"),
      })

      -- Bash
      require("lspconfig").bashls.setup({})

      -- Python
      require("lspconfig").pyright.setup({})

      -- Java
      require("lspconfig").jdtls.setup({})

      -- Yaml
      require("lspconfig").yamlls.setup({
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      })

      -- Go
      require("lspconfig").gopls.setup({})

      -- GraphQL
      require("lspconfig").graphql.setup({})

      -- Rust
      require("lspconfig").rust_analyzer.setup({})

      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,
  },
}
