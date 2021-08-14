require "nvim-treesitter.configs".setup {
  context_commentstring = {
    enable = true
  },
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  -- nvim-ts-rainbow
  rainbow = {
    enable = true
  }
}
