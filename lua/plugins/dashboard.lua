return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Vertical padding to center content
      local padding = { type = "padding", val = 15 }

      -- Set header
      dashboard.section.header.val = {
        "┏┓ ╻ ╻┏━┓╻ ╻┏┓ ╻  ┏━┓╺┳┓┏━╸ ┏┓╻╻ ╻╻┏┳┓",
        "┣┻┓┃ ┃┗━┓┣━┫┣┻┓┃  ┣━┫ ┃┃┣╸  ┃┗┫┃┏┛┃┃┃┃",
        "┗━┛┗━┛┗━┛╹ ╹┗━┛┗━╸╹ ╹╺┻┛┗━╸╹╹ ╹┗┛ ╹╹ ╹",
      }

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  > Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("s", "  > Search In Files", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("r", "  > Recent", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("L", "  > Manage plugins", "<cmd>Lazy<CR>"),
        dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
      }

      -- Send config to alpha
      alpha.setup({
        layout = {
          padding,
          dashboard.section.header,
          dashboard.section.buttons,
        },
        opts = dashboard.opts,
      })

      -- Disable folding on alpha buffer
      vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
    end,
  },
}
