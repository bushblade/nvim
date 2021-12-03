require("lspconfig").emmet_ls.setup({
  root_dir = function()
    return vim.loop.cwd()
  end,
})
