return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = true,
        border = "rounded",
        padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      },
    },
  },
}
