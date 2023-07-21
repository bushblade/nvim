-- Define the highlight group for flash.treesitter visual selection
local mocha_palette = require("catppuccin.palettes").get_palette("mocha")

-- Define the highlight group attributes as a Lua table
local highlight = {
  fg = mocha_palette.base,
  bg = mocha_palette.red,
  bold = true,
}

-- Set the highlight group using vim.api.nvim_set_hl()
vim.api.nvim_set_hl(0, "FlashTreesitterSelection", highlight)

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
