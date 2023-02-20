return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Tmux navigator
    -- use("christoomey/vim-tmux-navigator")

    -- lsp
    use("neovim/nvim-lspconfig")

    -- ** separate config
    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    -- Treesitter Text Object selection
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- LuaLine
    use({
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- *** separate config
    -- Autocomplete
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-cmdline", -- command line
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-nvim-lua", -- nvim config completions
        "hrsh7th/cmp-nvim-lsp", -- lsp completions
        "hrsh7th/cmp-path", -- file path completions
        "saadparwaiz1/cmp_luasnip", -- snippets completions
      },
    })

    -- snippets
    use({
      "L3MON4D3/LuaSnip",
      requires = {
        "rafamadriz/friendly-snippets",
      },
    })

    -- tpope
    use("tpope/vim-fugitive")
    use("tpope/vim-surround")

    -- ** spearate config
    -- commenting
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use({ "numToStr/Comment.nvim", tag = "v0.6" })

    -- move between kitty windows
    use("knubie/vim-kitty-navigator")

    -- windwp
    use("windwp/nvim-ts-autotag") -- auto close and rename tags

    -- ** speparate config
    use("windwp/nvim-autopairs")

    -- ** separate config
    use("windwp/nvim-spectre") -- Spectre for find and replace

    -- ** separate config
    -- Formatting
    use("mhartington/formatter.nvim")

    use("airblade/vim-gitgutter")

    -- ** separate config
    -- hightlight matching tag in html,jsx etc.
    use("leafOfTree/vim-matchtag")

    use({
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      end,
    })

    -- Undotree
    use("mbbill/undotree")

    -- ** speparate config
    -- file tree
    use("kyazdani42/nvim-tree.lua")

    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- separate config
    -- icons in completion
    use("onsails/lspkind-nvim")

    -- Folke plugins
    -- Theme
    use("folke/tokyonight.nvim")

    -- Trouble
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup({})
      end,
    })

    -- ** separate config
    -- WhichKey
    use("folke/which-key.nvim")

    -- Todo comments
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup({})
      end,
    })

    -- ** separate config
    -- Colorizer
    use("norcalli/nvim-colorizer.lua")

    -- jsonc file type for json - comments in json
    use("kevinoid/vim-jsonc")

    -- ** separate config
    -- bufferline for buffers in 'tabs'
    use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })

    -- better code action menu
    use({
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
    })

    -- firebase rules
    use("delphinus/vim-firestore")

    -- sessions
    use({
      "rmagatti/auto-session",
      config = function()
        require("auto-session").setup({
          log_level = "error",
          auto_session_suppress_dirs = { "~/", "~/Projects" },
        })
      end,
    })

    use({
      "rmagatti/session-lens",
      config = function()
        require("session-lens").setup({--[[your custom config--]]
        })
      end,
    })

    -- Rich presence in Discord
    use("andweeb/presence.nvim")

    -- Dashboard
    use("goolord/alpha-nvim")
  end,
})
