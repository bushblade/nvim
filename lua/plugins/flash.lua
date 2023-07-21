-- Define the highlight group for flash.treesitter visual selection
local mocha_palette = require("catppuccin.palettes").get_palette("mocha")
local highlight_fg = mocha_palette.base
local highlight_bg = mocha_palette.red

-- Set the highlight group with the chosen colors
vim.cmd("highlight FlashTreesitterSelection guifg=" .. highlight_fg .. " guibg=" .. highlight_bg .. " gui=bold")

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    highlight = {
      -- Change the label highlight group to your desired color
      groups = {
        label = "FlashTreesitterSelection",
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        -- default options: exact mode, multi window, all directions, with a backdrop
        require("flash").jump({
          search = {
            mode = function(str)
              return "\\<" .. str
            end,
          },
        })
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

        if filetype ~= "qf" then
          -- only call flash.treesitter if not in a quickfix buffer
          require("flash").treesitter()
        end
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
  },
}
