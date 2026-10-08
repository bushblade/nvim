return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      picker = { enabled = true },
      input = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = {
            "┏┓ ╻ ╻┏━┓╻ ╻┏┓ ╻  ┏━┓╺┳┓┏━╸ ┏┓╻╻ ╻╻┏┳┓",
            "┣┻┓┃ ┃┗━┓┣━┫┣┻┓┃  ┣━┫ ┃┃┣╸  ┃┗┫┃┏┛┃┃┃┃",
            "┗━┛┗━┛┗━┛╹ ╹┗━┛┗━╸╹ ╹╺┻┛┗━╸╹╹ ╹┗┛ ╹╹ ╹",
          },
          keys = {
            { icon = "\u{f15b} ", key = "e", desc = "New file", action = ":ene | startinsert" },
            { icon = "\u{f71d} ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')" },
            {
              icon = "\u{f002} ",
              key = "s",
              desc = "Search In Files",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            { icon = "\u{f0c5} ", key = "r", desc = "Recent", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = "\u{f1e6} ", key = "L", desc = "Manage plugins", action = ":Lazy" },
            { icon = "\u{f659} ", key = "q", desc = "Quit NVIM", action = ":qa" },
          },
        },
      },
    },
  },
}
