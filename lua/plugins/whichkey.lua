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
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>b", group = "BufferLine" },
          { "<leader>f", group = "Telescope" },
          { "<leader>l", group = "LSP" },
          { "<leader>S", group = "Spectre" },
          { "<leader>a", group = "Sessions" },
          -- { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
          -- { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
          { "z", group = "fold" },
        },
      },
    },
  },
}
