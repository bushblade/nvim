local M = {}

---Map a keybinding to a function or command in Neovim
---@param mode string|table The mode where the keybinding is active ('n' for normal, 'i' for insert, etc.)
---@param lhs string The left-hand side of the keybinding (the key combination)
---@param rhs string|function The right-hand side of the keybinding (the command or Lua function to execute)
---@param opts table? Optional settings for the keybinding (e.g., { silent = true })
function M.map(mode, lhs, rhs, opts)
  local options = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, options)
end

--Detect if we are in a project using TailwindCSS by checking for "tailwindcss"
--in package.json
function M.is_tailwind_project()
  local has_package_dot_json = vim.fn.filereadable(vim.fn.expand("package.json"))
  if has_package_dot_json == 0 then
    return false
  end
  local lines = vim.fn.readfile("package.json")
  for _, line in ipairs(lines) do
    if line:match('"tailwindcss"') then
      return true
    end
  end
  return false
end

--Detect the presence of a biome config file in the project directory
function M.biome_file_exists()
  local cwd = vim.fn.getcwd()
  local json = cwd .. "/biome.json"
  local jsonc = cwd .. "/biome.jsonc"
  ---@diagnostic disable-next-line: undefined-field
  return vim.uv.fs_stat(json) ~= nil or vim.uv.fs_stat(jsonc) ~= nil
end

---Finds the path for @vue/typescript-plugin.
---Prioritizes the local project's node_modules and falls back to the global installation.
---@return string|nil The path to the plugin, or nil if not found.
function M.find_vue_plugin_path()
  -- 1. Check for a local installation first
  local root_pattern = require("lspconfig.util").root_pattern("package.json")
  local project_root = root_pattern(vim.api.nvim_buf_get_name(0))

  if project_root then
    local local_path = project_root .. "/node_modules/@vue/typescript-plugin"
    if vim.fn.isdirectory(local_path) == 1 then
      return local_path
    end
  end

  -- 2. If not found locally, fall back to the global installation
  local npm_global_root = vim.fn.trim(vim.fn.system("npm root -g"))
  if vim.v.shell_error == 0 then
    local global_path = npm_global_root .. "/@vue/typescript-plugin"
    if vim.fn.isdirectory(global_path) == 1 then
      return global_path
    end
  end

  -- 3. If not found anywhere, return nil
  return nil
end

return M
