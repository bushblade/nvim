return require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- lsp
    use "neovim/nvim-lspconfig"

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    -- Telescope extensions
    -- Emoji
    use "xiyaowong/telescope-emoji.nvim"

    -- TS utils
    use {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      requires = {{"jose-elias-alvarez/null-ls.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    -- LuaLine
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    -- Autocomplete
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip"
      }
    }

    -- snippets
    use {
      "L3MON4D3/LuaSnip",
      requires = {
        "rafamadriz/friendly-snippets"
      }
    }

    -- tpope
    use "tpope/vim-fugitive"
    use "tpope/vim-surround"
    use "tpope/vim-commentary"

    use "knubie/vim-kitty-navigator"
    use "windwp/nvim-ts-autotag"
    use "jiangmiao/auto-pairs" -- NOTE: try steelsojka/pears.nvim for lua alternative
    use "mhartington/formatter.nvim"
    use "airblade/vim-gitgutter"
    use "leafOfTree/vim-matchtag"

    use {
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
      end
    }

    -- file tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- icons in completion
    use "onsails/lspkind-nvim"

    -- Folke plugins
    -- Theme
    use "folke/tokyonight.nvim"

    -- Trouble
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }

    -- WhichKey
    use "folke/which-key.nvim"

    -- Todo comments
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }

    -- Colorizer
    use "norcalli/nvim-colorizer.lua"
  end
)
