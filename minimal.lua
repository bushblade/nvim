require("packer").startup(function(use)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
end)

local load_config = function()
  require("nvim-treesitter.configs").setup({
    context_commentstring = {
      enable = true,
    },
    ensure_installed = "maintained",
    highlight = {
      enable = true,
    },
  })
end

require("packer").sync()
load_config()
