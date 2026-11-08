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

      -- Native indent files don't indent inside an opening tag whose attributes
      -- span lines (`o` after `<Component` lands at column 0). Treesitter does.
      local treesitter_indent_fts = {
        "astro",
        "html",
        "javascriptreact",
        "svelte",
        "typescriptreact",
        "vue",
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = ft_pattern,
        callback = function()
          pcall(vim.treesitter.start)

          local ft = vim.bo.filetype
          if not vim.tbl_contains(treesitter_indent_fts, ft) then
            return
          end

          local lang = vim.treesitter.language.get_lang(ft) or ft
          if vim.treesitter.query.get(lang, "indents") then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
