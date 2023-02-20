return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      local options = { rgb_fn = true, hsl_fn = true, css = true, css_fn = true, names = true }
      require("colorizer").setup({
        "*",
      }, options)
    end,
  },
}
