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
        "fish",
        "vimdoc",
        "html",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "lua",
        "astro",
        "vue",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "yaml",
        "go",
        "python",
        "rust",
        "vim",
        "css",
        "scss",
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
          -- NOTE: not working in astro
          -- https://github.com/windwp/nvim-ts-autotag/pull/89
          "astro",
        },
      },
      indent = {
        enable = true,
      },
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = "<CR>",
      --     node_incremental = "<TAB>",
      --     scope_incremental = "<CR>",
      --     node_decremental = "<S-TAB>",
      --   },
      -- },
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      --     keymaps = {
      --       -- You can use the capture groups defined in textobjects.scm
      --       ["aa"] = "@parameter.outer",
      --       ["ia"] = "@parameter.inner",
      --       ["af"] = "@function.outer",
      --       ["if"] = "@function.inner",
      --       ["ac"] = "@class.outer",
      --       ["ic"] = "@class.inner",
      --     },
      --   },
      --   move = {
      --     enable = true,
      --     set_jumps = true, -- whether to set jumps in the jumplist
      --     goto_next_start = {
      --       ["]m"] = "@function.outer",
      --       ["]]"] = "@class.outer",
      --     },
      --     goto_next_end = {
      --       ["]M"] = "@function.outer",
      --       ["]["] = "@class.outer",
      --     },
      --     goto_previous_start = {
      --       ["[m"] = "@function.outer",
      --       ["[["] = "@class.outer",
      --     },
      --     goto_previous_end = {
      --       ["[M"] = "@function.outer",
      --       ["[]"] = "@class.outer",
      --     },
      --   },
      -- },
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
    end,
  },
}
