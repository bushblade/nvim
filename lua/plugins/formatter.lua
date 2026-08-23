local languages = require("languages")
local formatter_to_use = require("toolchain").javascript().formatter

if formatter_to_use == "prettierd" then
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      if vim.fn.executable("prettierd") == 1 then
        vim.system({ "prettierd", "stop" })
      end
    end,
  })
end

-- every language marked `web_fts` in lua/languages.lua formats with the Toolchain
local formatters_by_ft = {
  lua = { "stylua" },
  python = { "autopep8" },
}
for _, ft in ipairs(languages.web_filetypes()) do
  formatters_by_ft[ft] = { formatter_to_use }
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = formatters_by_ft,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
