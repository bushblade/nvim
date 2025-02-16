return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  opts = {
    completion = {
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" } },
    },
    signature = { enabled = true, window = { border = "rounded" } },
    keymap = {
      preset = "default",
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = { "select_next", "show_documentation", "fallback" },
      ["<S-Tab>"] = { "select_prev", "show_signature", "fallback" },
      ["<C-l>"] = { "show_signature", "hide_signature", "fallback" },
    },
    -- cmdline = {
    -- keymap = {
    --   -- preset = "enter",
    --   ["<CR>"] = { "fallback" },
    -- },
    -- },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
  opts_extend = { "sources.default" },
}
