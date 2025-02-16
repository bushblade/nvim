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
    keymap = { preset = "default" },
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
