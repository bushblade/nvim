-- Prettier function for formatter
local prettier = function()
  return {
    exe = "prettier",
    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
    stdin = true,
  }
end

-- TODO: add formatter for Python
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
    markdown = { prettier },
    vue = { prettier },
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
          args = {},
          stdin = false,
        }
      end,
    },
  },
})

-- Runs Formmater on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.tsx,*.css,*.scss,*.md,*.html,*.lua,.*.json,*.jsonc,*.vue : FormatWrite
augroup END
]],
  true
)
