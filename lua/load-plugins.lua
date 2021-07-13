
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

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

end)
