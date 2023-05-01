return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "rmagatti/session-lens",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    lazy = false,
    opts = {
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules/", "env/" }, -- ignore git
        winblend = 0,
      },
    },
    keys = {
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find Files (root dir)",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      require("session-lens").setup({})

      telescope.load_extension("session-lens")
      telescope.load_extension("file_browser")
    end,
  },
}
