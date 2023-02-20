return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules/", "env/" }, -- ignore git
        winblend = 0,
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      -- telescope.load_extension("session-lens")
    end,
  },
}
