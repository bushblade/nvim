local function is_tailwind_project()
  local has_package_dot_json = vim.fn.filereadable(vim.fn.expand("package.json"))
  if has_package_dot_json == 0 then
    return false
  end
  local lines = vim.fn.readfile("package.json")
  for _, line in ipairs(lines) do
    if line:match('"tailwindcss"') then
      return true
    end
  end
  return false
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim", "saghen/blink.cmp" },
    config = function()
      -- Setup neovim lua configuration
      require("neodev").setup()

      -- rounded border
      require("lspconfig.ui.windows").default_options.border = "rounded"

      vim.diagnostic.config({
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
        },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        } or {},
        virtual_text = {
          source = "if_many",
          prefix = "●", -- Could be '●', '▎', 'x'
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- TS/JS
      vim.lsp.config("ts_ls", {
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = capabilities,
      })
      vim.lsp.enable("ts_ls")

      -- EsLint
      vim.lsp.enable("eslint")

      -- Vue JS
      vim.lsp.enable("vue_ls")

      -- Biome
      vim.lsp.enable("biome")

      -- CSS
      local css_settings = {
        validate = true,
        lint = {},
      }

      if is_tailwind_project() then
        css_settings.lint.unknownAtRules = "ignore"
      end

      vim.lsp.config("cssls", {
        capabilities = capabilities,
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
      vim.lsp.enable("cssls")

      -- HTML
      vim.lsp.config("html", {
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
      vim.lsp.enable("html")

      -- JSON

      -- Function to check if biome.json exists in the current working directory
      local function biome_file_exists()
        local cwd = vim.fn.getcwd()
        local biome_file = cwd .. "/biome.json"
        return vim.loop.fs_stat(biome_file) ~= nil
      end

      -- Conditionally set up jsonls if biome.json does not exist
      if not biome_file_exists() then
        vim.lsp.config("jsonls", {
          capabilities = capabilities,
          cmd = { "vscode-json-language-server", "--stdio" },
          filetypes = { "json", "jsonc" },
          init_options = {
            provideFormatter = true,
          },
        })
        vim.lsp.enable("jsonls")
      else
        print("biome.json found, not enabling jsonls")
      end

      -- Tailwind
      if is_tailwind_project() then
        vim.lsp.config("tailwindcss", {
          capabilities = capabilities,
        })
        vim.lsp.enable("tailwindcss")
      end

      -- Emmet
      vim.lsp.config("emmet_ls", {
        capabilities = capabilities,
      })
      vim.lsp.enable("emmet_ls")

      -- Astro
      vim.lsp.config("astro", { capabilities = capabilities })
      vim.lsp.enable("astro")

      -- Markdown
      vim.lsp.enable("marksman")

      -- Prisma
      vim.lsp.enable("prismals")

      -- php
      vim.lsp.enable("intelephense")

      -- Bash
      vim.lsp.enable("bashls")

      -- Python
      vim.lsp.enable("pyright")

      -- Java
      vim.lsp.enable("jdtls")

      -- Yaml
      vim.lsp.enable("yamlls")

      -- Go
      vim.lsp.enable("gopls")

      -- GraphQL
      vim.lsp.enable("graphql")

      -- Rust
      vim.lsp.enable("rust_analyzer")

      -- Lua
      vim.lsp.config("lua_ls", {
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
      vim.lsp.enable("lua_ls")
    end,
  },
}
