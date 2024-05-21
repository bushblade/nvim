local lspconfig = require("lspconfig")
local uv = vim.loop

-- Function to check if biome.json exists in the current working directory
local function biome_file_exists()
  local cwd = vim.fn.getcwd()
  local biome_file = cwd .. "/biome.json"
  return uv.fs_stat(biome_file) ~= nil
end

-- Conditionally set up jsonls if biome.json does not exist
if not biome_file_exists() then
  lspconfig.jsonls.setup({
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    init_options = {
      provideFormatter = true,
    },
  })
else
  print("biome.json found, not enabling jsonls")
end
