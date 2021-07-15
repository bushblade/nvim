
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- lsp stuff
  use 'neovim/nvim-lspconfig'
  
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- theme
  use 'folke/tokyonight.nvim'

  use { 
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Autocomplete
  use 'hrsh7th/nvim-compe'

end)
