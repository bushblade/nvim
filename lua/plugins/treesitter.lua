return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      context_commentstring = {
        enable = true,
      },
      ignore_install = { "help" },
      ensure_installed = {
        "astro",
        "bash",
        "clojure",
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
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      -- ignore_install = {}, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = function(lang, bufnr) -- Disable in large typescript buffers i.e. type definitions
          return lang == "typescript" and vim.api.nvim_buf_line_count(bufnr) > 5000
        end,
      },
      auto_install = true,
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<TAB>",
          scope_incremental = "<CR>",
          node_decremental = "<S-TAB>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- Detect astro files and set filetype
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.astro" },
        callback = function()
          vim.cmd([[ set filetype=astro ]])
        end,
      })
      -- Detect jsx files and set filetype to javascript
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.jsx" },
        callback = function()
          vim.cmd([[set filetype=javascript]])
        end,
      })
    end,
  },
}
