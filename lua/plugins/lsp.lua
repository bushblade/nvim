local languages = require("languages")
local toolchain = require("toolchain")

return {
  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    dependencies = { "folke/lazydev.nvim", "saghen/blink.cmp" },
    config = function()
      -- Setup neovim lua configuration
      require("lazydev").setup()

      -- rounded border
      require("lspconfig.ui.windows").default_options.border = "rounded"

      vim.diagnostic.config({
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
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

      -- Global defaults for every language server, including those enabled
      -- straight from languages.enabled_servers() with no per-server config.
      vim.lsp.config("*", {
        capabilities = capabilities,
        workspace = {
          fileOperations = { didRename = true, willRename = true },
        },
      })

      -- Servers needing custom configuration are registered below.
      -- Everything else is enabled straight from lua/languages.lua.

      -- TS/JS

      -- managed to get vue-language-server working with vtsls following https://github.com/vuejs/language-tools/wiki/Neovim
      local vue_language_server_path = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      }
      local vtsls_config = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      }

      local vue_ls_config = {
        on_init = function(client)
          client.handlers["tsserver/request"] = function(_, result, context)
            local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
            if #clients == 0 then
              vim.notify("Could not found `vtsls` lsp client, vue_lsp would not work without it.", vim.log.levels.ERROR)
              return
            end
            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
              title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
              command = "typescript.tsserverRequest",
              arguments = {
                command,
                payload,
              },
            }, { bufnr = context.bufnr }, function(_, r)
              local response_data = { { id, r.body } }
              ---@diagnostic disable-next-line: param-type-mismatch
              client:notify("tsserver/response", response_data)
            end)
          end
        end,
      }
      -- nvim 0.11 or above
      vim.lsp.config("vtsls", vtsls_config)
      vim.lsp.config("vue_ls", vue_ls_config)

      -- CSS
      local css_settings = {
        validate = true,
        lint = {},
      }

      -- Turn of unknownAtRules if in a Tailwind project
      if toolchain.tailwind() then
        css_settings.lint.unknownAtRules = "ignore"
      end

      vim.lsp.config("cssls", {
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
      vim.lsp.config("html", {
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

      -- JSON + linting: when a project uses Biome it replaces jsonls and EsLint
      if toolchain.javascript().linter == "eslint" then
        vim.lsp.config("jsonls", {
          cmd = { "vscode-json-language-server", "--stdio" },
          filetypes = { "json", "jsonc" },
          init_options = {
            provideFormatter = true,
          },
        })
      else
        -- Biome: linting (diagnostics) + formatting only. Exclude it from
        -- go-to-definition so it doesn't report a second, identical location
        -- alongside vtsls on .ts/.tsx (which made gd open the quickfix).
        local biome_capabilities = vim.deepcopy(capabilities)
        biome_capabilities.textDocument = biome_capabilities.textDocument or {}
        biome_capabilities.textDocument.definition = biome_capabilities.textDocument.definition or {}
        biome_capabilities.textDocument.definition.dynamicRegistration = false
        vim.lsp.config("biome", {
          capabilities = biome_capabilities,
          on_init = function(client)
            client.server_capabilities.definitionProvider = nil
          end,
        })
      end

      -- Lua
      vim.lsp.config("lua_ls", {
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
              library = {
                vim.env.VIMRUNTIME .. "/lua", -- core Neovim API
                vim.env.VIMRUNTIME .. "/lua/vim/lsp", -- lspconfig / diagnostics
                vim.fn.stdpath("config") .. "/lua", -- my config
              },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Enable every server the languages table asks for
      for _, server in ipairs(languages.enabled_servers()) do
        vim.lsp.enable(server)
      end

      -- Per-project servers: chosen by the Toolchain, not by the table
      if toolchain.javascript().linter == "eslint" then
        vim.lsp.enable({ "jsonls", "eslint" })
      else
        print("biome.json found, not enabling jsonls or eslint")
        vim.lsp.enable("biome")
      end

      -- Tailwind
      if toolchain.tailwind() then
        vim.lsp.enable("tailwindcss")
      end
    end,
  },
}
