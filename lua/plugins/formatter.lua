return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "autopep8" },
      typescriptreact = { "biome" },
      javascriptreact = { "biome" },
      javascript = { "biome" },
      typescript = { "biome" },
      json = { "biome" },
      jsonc = { "biome" },
      html = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      graphql = { "prettierd" },
      markdown = { "prettierd" },
      vue = { "prettierd" },
      astro = { "prettierd" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
