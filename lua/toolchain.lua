-- Answers which JS/TS toolchain the project in the current working directory uses,
-- and whether it uses TailwindCSS. Probes the filesystem once per working directory
-- and caches the result, so every consumer sees the same answer no matter when it asks.
local M = {}

local cache = {}

local function probe()
  local cwd = vim.fn.getcwd()

  local cached = cache[cwd]
  if cached then
    return cached
  end

  local has_biome_config = vim.uv.fs_stat(cwd .. "/biome.json") ~= nil or vim.uv.fs_stat(cwd .. "/biome.jsonc") ~= nil

  local uses_tailwind = false
  if vim.fn.filereadable("package.json") == 1 then
    for _, line in ipairs(vim.fn.readfile("package.json")) do
      if line:match('"tailwindcss"') then
        uses_tailwind = true
        break
      end
    end
  end

  local profile = {
    javascript = {
      formatter = has_biome_config and "biome" or "prettierd",
      linter = has_biome_config and "biome" or "eslint",
      needs_jsonls = not has_biome_config,
    },
    tailwind = uses_tailwind,
  }

  cache[cwd] = profile
  return profile
end

---Which formatter and linter should drive JS/TS in this project.
---`needs_jsonls` is true when JSON support must come from jsonls (i.e. Biome isn't handling it).
---@return { formatter: string, linter: string, needs_jsonls: boolean }
function M.javascript()
  return probe().javascript
end

---Whether this project uses TailwindCSS (declared in package.json).
---@return boolean
function M.tailwind()
  return probe().tailwind
end

return M
