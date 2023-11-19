return {
  {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    -- latest commit breaks formatting
    commit = "8b62563",
    opts = {
      result_split_in_place = true,
    },
  },
}
