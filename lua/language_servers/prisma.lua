require("lspconfig").prismals.setup({
  root_dir = function()
    return vim.loop.cwd()
  end,
})
