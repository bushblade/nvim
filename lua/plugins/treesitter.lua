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
      ensure_installed = {
        "bash",
        "help",
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
        "help",
        "vim",
      }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      -- ignore_install = {}, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        -- disable = { "html" }, -- FIX: disabled for now https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
      },

      auto_install = true,
      autotag = { enable = true },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<c-backspace>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- FIX: for nvim-autotag - not actually working
      local ts_utils = require("nvim-treesitter.ts_utils")
      ts_utils.get_node_text = vim.treesitter.query.get_node_text

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
