local M = {}

---Map a keybinding to a function or command in Neovim
---@param mode string The mode where the keybinding is active ('n' for normal, 'i' for insert, etc.)
---@param lhs string The left-hand side of the keybinding (the key combination)
---@param rhs string|function The right-hand side of the keybinding (the command or Lua function to execute)
---@param opts table? Optional settings for the keybinding (e.g., { silent = true })
function M.map(mode, lhs, rhs, opts)
  local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, options)
end

return M
