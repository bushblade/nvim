local languages = require("languages")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      local ts = require("nvim-treesitter")
      ts.setup(opts)

      ts.install(languages.parsers())
      vim.treesitter.language.register("javascript", "javascriptreact")
      vim.treesitter.language.register("tsx", "typescriptreact")

      vim.filetype.add({
        extension = {
          jsx = "javascriptreact",
          tsx = "typescriptreact",
        },
      })

      local ft_pattern = vim.list_extend({}, languages.parsers())
      vim.list_extend(ft_pattern, { "javascriptreact", "typescriptreact" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = ft_pattern,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
