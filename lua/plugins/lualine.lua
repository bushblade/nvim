return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        -- components_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        component_separators = "|",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", file_status = true, path = 1 } },
        -- lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "nvim-tree", "trouble" },
    },
  },
}
