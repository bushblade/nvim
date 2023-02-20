return {
  {
    "phaazon/hop.nvim",
    opts = {
      as = "hop",
      keys = "etovxqpdygfblzhckisuran",
    },
    config = function(_, opts)
      require("hop").setup(opts)
    end,
  },
}
