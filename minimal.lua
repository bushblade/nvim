local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({

  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    context_commentstring = {
      enable = true,
    },
    ignore_install = { "help" },
    ensure_installed = {
      "astro",
      "html",
      "javascript",
      "lua",
      "tsx",
      "typescript",
    },
    auto_install = true,
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    -- Detect astro files and set filetype
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.astro" },
      callback = function()
        vim.cmd([[ set filetype=astro ]])
      end,
    })
    -- Detect jsx files and set filetype to javascript
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.jsx" },
      callback = function()
        vim.cmd([[set filetype=javascript]])
      end,
    })
  end,
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "emmet_ls", "ts_ls" },
        automatic_installation = true,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      local root_pattern = require("lspconfig").util.root_pattern

      lspconfig.emmet_ls.setup({
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue", "php" },
        capabilities = capabilities,
      })

      lspconfig.ts_ls.setup({
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        cmd = { "typescript-language-server", "--stdio" },
        root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", "index.js", "app.js"),
        capabilities = capabilities,
      })
    end,
  },
})
