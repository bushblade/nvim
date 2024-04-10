return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag", -- auto close and rename tags
    },
    opts = {
      context_commentstring = {
        enable = true,
      },
      ignore_install = { "help" },
      ensure_installed = {
        "bash",
        "comment",
        "fish",
        "vimdoc",
        "html",
        "javascript",
        "typescript",
        "graphql",
        "tsx",
        "json",
        "lua",
        "astro",
        "svelte",
        "vue",
        "markdown",
        "markdown_inline",
        "python",
        "prisma",
        "query",
        "regex",
        "vim",
        "yaml",
        "toml",
        "go",
        "python",
        "rust",
        "vim",
        "css",
        "scss",
        "gitignore",
        "gitcommit",
        "jsdoc",
        "clojure",
        "http",
        "php",
        "xml",
      }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      -- ignore_install = {}, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = function(lang, bufnr) -- Disable in large typescript buffers i.e. type definitions
          return lang == "typescript" and vim.api.nvim_buf_line_count(bufnr) > 5000
        end,
      },
      auto_install = true,
      autotag = {
        enable = true,
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "markdown",
          "astro",
        },
      },
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
