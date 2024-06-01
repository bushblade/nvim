return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
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
    },
  },
}
