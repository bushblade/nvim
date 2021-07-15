return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- lsp
    use "neovim/nvim-lspconfig"

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
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
    use "tpope/vim-surround" -- has some issues?
    use "tpope/vim-commentary"

    --use 'justinmk/vim-sneak' -- maybe try hop instead?
    use "knubie/vim-kitty-navigator"
    use "alvan/vim-closetag"
    use "jiangmiao/auto-pairs"
    use "mhartington/formatter.nvim"
    use "airblade/vim-gitgutter"
  end
)
