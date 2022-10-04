-- Prettier function for formatter
local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--config-precedence",
      "prefer-file",
      -- you can add more global setup here
      "--stdin-filepath",
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = true,
  }
end

require("formatter").setup({
  logging = false,
  filetype = {
    typescriptreact = { prettier },
    javascriptreact = { prettier },
    javascript = { prettier },
    typescript = { prettier },
    json = { prettier },
    jsonc = { prettier },
    html = { prettier },
    css = { prettier },
    scss = { prettier },
    graphql = { prettier },
    markdown = { prettier },
    vue = { prettier },
    astro = { prettier },
    yaml = { prettier },
    go = {
      -- goimport
      function()
        return {
          exe = "gofmt",
          args = { "-w" },
          stdin = false,
        }
      end,
    },
    lua = {
      -- Stylua
      function()
        return {
          exe = "stylua",
          args = {},
          stdin = false,
        }
      end,
    },
    python = {
      -- autopep8
      function()
        return {
          exe = "autopep8",
          args = { "--in-place" },
          stdin = false,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          stdin = true,
        }
      end,
    },
  },
})

-- Runs Formmater on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {
    "*.js",
    "*.mjs",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.css",
    "*.scss",
    "*.md",
    "*.html",
    "*.lua",
    "*.json",
    "*.jsonc",
    "*.vue",
    "*.py",
    "*.gql",
    "*.graphql",
    "*.go",
    "*.rs",
    "*.astro",
  },
  command = "FormatWrite",
})
