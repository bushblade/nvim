-- Only relevant when running inside herdr (TUI or desktop app) or tmux; the
-- underlying plugin's mappings hand focus off to the surrounding multiplexer.
local function env_set(name)
  return (vim.env[name] or "") ~= ""
end

local in_tui = env_set("HERDR_ENV") or env_set("HERDR_PANE_ID")
-- Herdr App terminals are herdr-core terminals, not herdr TUI panes.
local in_app = env_set("HC_TERMINAL_ID") and not in_tui

if not (in_tui or in_app or env_set("TMUX")) then
  return {}
end

local function herdr_nav_file()
  local path = vim.fn.expand("~/.config/herdr/plugins/vim-herdr-navigation/editor/nvim.lua")
  return vim.fn.filereadable(path) == 1 and path or nil
end

return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      -- When our navigation owns <C-h/j/k/l>; otherwise let
      -- vim-tmux-navigator install its own mappings instead of leaving none.
      vim.g.tmux_navigator_no_mappings = (in_app or herdr_nav_file()) and 1 or 0
    end,
    config = function()
      if in_app then
        require("herdr_nav").setup()
        return
      end

      local nav_file = herdr_nav_file()
      if nav_file then
        dofile(nav_file)
      end
    end,
  },
}
