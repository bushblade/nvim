return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = function()
    local function is_biome()
      return vim.fn.filereadable("biome.json") or vim.fn.filereadable("biome.jsonc")
    end

    local formatters_by_ft = {
      lua = { "stylua" },
      python = { "autopep8" },
      typescriptreact = is_biome() and { "biome" } or { "prettierd" },
      javascriptreact = is_biome() and { "biome" } or { "prettierd" },
      javascript = is_biome() and { "biome" } or { "prettierd" },
      typescript = is_biome() and { "biome" } or { "prettierd" },
      json = is_biome() and { "biome" } or { "prettierd" },
      jsonc = is_biome() and { "biome" } or { "prettierd" },
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
