require("lspconfig").emmet_ls.setup({
  filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue" },
  root_dir = function()
    return vim.loop.cwd()
  end,
})
