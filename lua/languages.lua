-- ── Languages ─────────────────────────────────────────────────────────────────
-- One entry per language you work in. This single table decides:
--   plugins/mason.lua      → which language servers are installed
--   plugins/lsp.lua        → which language servers are enabled
--   plugins/treesitter.lua → which treesitter parsers are installed
--   plugins/formatter.lua  → which filetypes get formatted by your Toolchain
--
-- Fields (all optional):
--   lsp     = "server"          installed AND enabled at startup
--           = { "a", "b" }      several servers for one language
--           = "server", enabled = false
--                               installed but NOT enabled — to turn it on later,
--                               just delete the `enabled = false` line
--   parsers = { "parser", ... } treesitter parsers for this language
--   web_fts = { "ft", ... }     filetypes formatted by your project Toolchain
--                               (Biome or prettierd, see lua/toolchain.lua)
--
-- Examples:
--   Turn Go's LSP on:    delete `enabled = false` from the go entry below.
--   Add a new language:  elixir = { lsp = "elixirls", parsers = { "elixir" } }
--   Servers that only run in some projects (biome, eslint, jsonls,
--   tailwindcss) live in `project_servers` further down.
local M = {}

local languages = {
  astro = { lsp = "astro", parsers = { "astro" }, web_fts = { "astro" } },
  bash = { lsp = "bashls", parsers = { "bash" } },
  css = { lsp = "cssls", parsers = { "css", "scss" }, web_fts = { "css", "scss" } },
  emmet = { lsp = "emmet_ls" }, -- tag expansion inside HTML/CSS/JS buffers
  go = { lsp = "gopls", enabled = false, parsers = { "go" } },
  graphql = { lsp = "graphql", enabled = false, parsers = { "graphql" }, web_fts = { "graphql" } },
  html = { lsp = "html", parsers = { "html" }, web_fts = { "html" } },
  java = { lsp = "jdtls" },
  javascript = {
    lsp = { "vtsls", "vue_ls" }, -- vue_ls forwards tsserver requests to vtsls (Vue SFC support)
    parsers = { "javascript", "typescript", "tsx", "jsdoc", "vue" },
    web_fts = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  },
  json = { parsers = { "json" }, web_fts = { "json", "jsonc" } }, -- server handled per Toolchain, see project_servers
  lua = { lsp = "lua_ls", parsers = { "luadoc" } }, -- add "lua" to parsers if you want lua highlighting
  markdown = { lsp = "marksman", parsers = { "markdown_inline" }, web_fts = { "markdown" } },
  php = { lsp = "intelephense", enabled = false, parsers = { "php" } },
  prisma = { lsp = "prismals", parsers = { "prisma" } },
  python = { lsp = "pyright", parsers = { "python" } },
  rust = { lsp = "rust_analyzer", enabled = false, parsers = { "rust" } },
  yaml = { lsp = "yamlls", parsers = { "yaml" } },

  -- parser-only entries: highlighting without a language server
  fish = { parsers = { "fish" } },
  git = { parsers = { "gitcommit", "gitignore" } },
  svelte = { parsers = { "svelte" } },
  tmux = { parsers = { "tmux" } },
  toml = { parsers = { "toml" } },
  xml = { parsers = { "xml" } },
}

-- Installed everywhere, enabled only when the current project needs them:
--   biome / eslint / jsonls — picked by your Toolchain (lua/toolchain.lua)
--   tailwindcss             — only in Tailwind projects
local project_servers = { "biome", "eslint", "jsonls", "tailwindcss" }

-- Parsers that aren't languages: infrastructure for other highlighting
local support_parsers = { "comment", "http", "query", "regex" }

local function flatten(t)
  local out = {}
  for _, v in ipairs(t) do
    if type(v) == "string" then
      table.insert(out, v)
    else
      for _, s in ipairs(v) do
        table.insert(out, s)
      end
    end
  end
  return out
end

---Every Mason LSP package this config keeps installed, enabled or not.
---@return string[]
function M.all_servers()
  local names = {}
  for _, entry in pairs(languages) do
    if entry.lsp then
      table.insert(names, entry.lsp)
    end
  end
  return vim.list_extend(flatten(names), project_servers)
end

---Language servers to enable at startup (excludes install-only and per-project ones).
---@return string[]
function M.enabled_servers()
  local names = {}
  for _, entry in pairs(languages) do
    if entry.lsp and entry.enabled ~= false then
      table.insert(names, entry.lsp)
    end
  end
  return flatten(names)
end

---Treesitter parsers to install: language parsers plus support parsers.
---@return string[]
function M.parsers()
  local names = {}
  for _, entry in pairs(languages) do
    if entry.parsers then
      vim.list_extend(names, entry.parsers)
    end
  end
  return vim.list_extend(names, support_parsers)
end

---Filetypes formatted by the project Toolchain (Biome or prettierd).
---@return string[]
function M.web_filetypes()
  local fts = {}
  for _, entry in pairs(languages) do
    if entry.web_fts then
      vim.list_extend(fts, entry.web_fts)
    end
  end
  return fts
end

return M
