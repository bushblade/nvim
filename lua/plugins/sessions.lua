return {
  {
    "rmagatti/auto-session",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("auto-session").setup({ silent_restore = false })
    end,
  },
}
