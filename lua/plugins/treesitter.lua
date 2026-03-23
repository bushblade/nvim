return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function(_, opts)
      local ts = require("nvim-treesitter")
      ts.setup(opts)

      local langs = {
        "astro",
        "bash",
        "comment",
        "css",
        "fish",
        "gitcommit",
        "gitignore",
        "go",
        "graphql",
        "html",
        "http",
        "javascript",
        "json",
        "jsdoc",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "php",
        "prisma",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "svelte",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      }

      ts.install(langs)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = langs,
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
