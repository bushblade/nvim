return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    name = "BufferLine",
    lazy = false,
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            -- text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        diagnostics = "nvim_lsp",
        max_name_length = 22,
        tab_size = 22,
      },
    },
    keys = {
      { "H", "<cmd>BufferLineCyclePrev<CR>" },
      { "L", "<cmd>BufferLineCycleNext<CR>" },
      { "<leader>bb", "<cmd>BufferLinePick<CR>", desc = "Pick" },
      { "<leader>bq", "<cmd>BufferLinePickClose<CR>", desc = "Pick to close" },
      { "<leader>bl", "<cmd>BufferLineCloseRight<CR>", desc = "Close all to right" },
      { "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", desc = "Close all to left" },
      { "<leader>ba", "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>", desc = "Close all but current" },
    },
  },
}
