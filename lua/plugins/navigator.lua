-- Only relevant when running inside herdr or tmux; the underlying plugin's
-- mappings hand focus off to the surrounding multiplexer.
local function env_set(name)
  return (vim.env[name] or "") ~= ""
end

if not (env_set("HERDR_ENV") or env_set("TMUX")) then
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
      -- When the herdr script is present it owns <C-h/j/k/l>; otherwise let
      -- vim-tmux-navigator install its own mappings instead of leaving none.
      vim.g.tmux_navigator_no_mappings = herdr_nav_file() and 1 or 0
    end,
    config = function()
      local nav_file = herdr_nav_file()
      if nav_file then
        dofile(nav_file)
      end
    end,
  },
}
