return {
  {
    "rmagatti/session-lens",
    dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("auto-session").setup({ silent_restore = false })
    end,
  },
}
