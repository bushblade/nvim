return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        silent_restore = false,
        -- Don't probe for telescope during startup: lazy registers a `:Telescope`
        -- command stub, so the probe force-loads telescope. We register the
        -- session-lens extension ourselves once telescope is actually up.
        session_lens = { load_on_setup = false },
      })

      -- auto-session registers its telescope picker in `setup`, but only when
      -- telescope is already loaded. Telescope now loads lazily (VeryLazy), so
      -- register the extension once it's up.
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = function()
          pcall(require("telescope").load_extension, "session-lens")
        end,
      })
    end,
  },
}
