return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = function()
    local function use_biome()
      return vim.fn.glob("biome.json") ~= "" or vim.fn.glob("biome.jsonc") ~= ""
    end

    local formatters_by_ft = {
      lua = { "stylua" },
      python = { "autopep8" },
      typescriptreact = use_biome() and { "biome" } or { "prettierd" },
      javascriptreact = use_biome() and { "biome" } or { "prettierd" },
      javascript = use_biome() and { "biome" } or { "prettierd" },
      typescript = use_biome() and { "biome" } or { "prettierd" },
      json = use_biome() and { "biome" } or { "prettierd" },
      jsonc = use_biome() and { "biome" } or { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      graphql = { "prettierd" },
      markdown = { "prettierd" },
      vue = { "prettierd" },
      astro = { "prettierd" },
    }

    return {
      formatters_by_ft = formatters_by_ft,
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }
  end,
}
