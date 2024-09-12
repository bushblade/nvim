vim.opt.relativenumber = true
vim.opt.cursorline = true -- show the cursor line
vim.opt.cursorcolumn = true -- show the cursor column
vim.opt.mouse = "a" -- enable mouse
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.smartcase = true -- ignores case for search unless a capital is used in search
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.number = true
vim.opt.textwidth = 80
vim.opt.scrolloff = 10
-- vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.numberwidth = 5 -- wider gutter
vim.opt.linebreak = true -- don't break words on wrap
vim.opt.smartindent = true
vim.opt.completeopt = "menuone,noselect" -- nvim-cmp
-- vim.opt.completeopt = {"menuone", "longest", "preview"}
vim.opt.signcolumn = "yes" -- always show the signcolumn
vim.opt.termguicolors = true
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- spelling
vim.opt.spelllang = "en_gb,en_us"
vim.opt.mousemodel = "popup"
-- timeout for whichkey
vim.opt.timeoutlen = 500

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.g.have_nerd_font = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show folds
vim.opt.foldcolumn = "1"

-- Give me some fenced codeblock goodness
vim.g.markdown_fenced_languages = {
  "html",
  "javascript",
  "javascriptreact",
  "typescript",
  "json",
  "css",
  "scss",
  "lua",
  "vim",
  "bash",
  "ts=typescript",
  "js=javascript",
}

-- highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Vertically center document when entering insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  command = "norm zz",
})

-- detect mdx file and set file type to markdown
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.mdx",
  command = "set filetype=markdown.mdx",
})

-- detect .env.local and set filetype to 'sh'
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".env.local",
  command = "set filetype=sh",
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
