return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      dependencies = { "rafamadriz/friendly-snippets" },
      event = "InsertEnter",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
          include = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            -- "html",
            -- "css",
            "json",
            "react",
          },
        })
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
      end,
    },
    "moyiz/blink-emoji.nvim",
  },
  version = "*",
  opts = {
    snippets = { preset = "luasnip" },
    completion = {
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", gap = 1, "kind" },
          },
        },
      },
      ghost_text = { enabled = false },
      documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
    },
    signature = { enabled = false, window = { border = "rounded" } },
    keymap = {
      preset = "default",
      -- ["<CR>"] = { "select_and_accept", "fallback" },
      -- ["<Tab>"] = { "select_next", "fallback" },
      -- ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-K>"] = { "show_documentation", "hide_documentation", "fallback" },
      -- ["<C-K>"] = { "show_signature", "hide_signature", "fallback" },
    },
    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "emoji", "lsp", "path", "snippets", "buffer" },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
          -- should_show_items = function()
          --   return vim.tbl_contains(
          --     -- Enable emoji completion only for git commits and markdown.
          --     -- By default, enabled for all file-types.
          --     { "gitcommit", "markdown" },
          --     vim.o.filetype
          --   )
          -- end,
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
