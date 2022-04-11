require("nvim-treesitter.configs").setup({
  context_commentstring = {
    enable = true,
  },
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "html" }, -- FIX: disabled for now https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
  },
  autotag = { enable = true },
  indent = {
    enable = true,
  },
})
