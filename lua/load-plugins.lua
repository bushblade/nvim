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

    -- TS utils
    use {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      requires = {{"jose-elias-alvarez/null-ls.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    -- Theme
    use "folke/tokyonight.nvim"

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
    use "hrsh7th/nvim-compe"

    -- tpope
    use "tpope/vim-fugitive"
    use "tpope/vim-surround"
    use "tpope/vim-commentary"

    use "knubie/vim-kitty-navigator"
    use "alvan/vim-closetag"
    use "jiangmiao/auto-pairs"
    use "mhartington/formatter.nvim"
    use "airblade/vim-gitgutter"

    use {
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
      end
    }

    -- snippets
    use {
      "SirVer/ultisnips",
      requires = {{"honza/vim-snippets"}}
    }

    -- file tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    use "JoosepAlviste/nvim-ts-context-commentstring"
  end
)
