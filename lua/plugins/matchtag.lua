return {
  {
    "leafOfTree/vim-matchtag",
    config = function()
      vim.g.vim_matchtag_enable_by_default = 1
      vim.g.vim_matchtag_files = "*.astro,*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp,*.tsx"
      vim.g.vim_matchtag_highlight_cursor_on = 1
    end,
  },
}
