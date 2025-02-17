return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  opts = {
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
      ghost_text = { enabled = true },
      documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },
    },
    signature = { enabled = true, window = { border = "rounded" } },
    keymap = {
      preset = "default",
      ["<CR>"] = { "select_and_accept", "fallback" },
      -- ["<Tab>"] = { "select_next", "fallback" },
      -- ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-K>"] = { "show_documentation", "hide_documentation", "fallback" },
      -- ["<C-K>"] = { "show_signature", "hide_signature", "fallback" },
    },
    cmdline = {
      keymap = {
        preset = "enter",
        ["<CR>"] = { "fallback" },
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        cmdline = {
          min_keyword_length = 2,
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
