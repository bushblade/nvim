--lualine settings
require "lualine".setup {
  options = {
    icons_enabled = true,
    component_separators = {"", ""},
    section_separators = {"", ""},
    disabled_filetypes = {},
    theme = "tokyonight"
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {"fugitive", "nvim-tree"}
}
