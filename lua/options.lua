vim.opt.relativenumber = true
vim.opt.cursorline = true -- show the cursor line
vim.opt.hidden = true
vim.opt.cursorcolumn = true -- show the cursor column
vim.opt.mouse = "a" -- enable mouse
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.smartcase = true -- ignores case for search unless a capital is used in search
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.number = true
vim.opt.wrap = true
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.scrolloff = 10
vim.opt.incsearch = true
vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.numberwidth = 5 -- wider gutter
vim.opt.linebreak = true -- don't break words on wrap
vim.opt.spelllang = "en"
vim.opt.smartindent = true
vim.opt.completeopt = "menuone,noselect" -- nvim-cmp
-- vim.opt.completeopt = {"menuone", "longest", "preview"}
vim.opt.signcolumn = "yes" -- always show the signcolumn
vim.opt.termguicolors = true
-- vim.opt.title = true
-- spelling
-- vim.opt.spell = true
vim.opt.spelllang = "en_gb"
vim.opt.mousemodel = "popup"
-- timeout for whichkey
vim.opt.timeoutlen = 500

-- vim.opt.foldmethod = "indent"
-- vim.opt.foldlevelstart = 2
-- vim.opt.foldnestmax = 2

-- Neovide settings
vim.o.guifont = "Victor Mono Nerd Font:h11"
-- vim.opt.guifontsize = 11
vim.g.neovide_transparency = 0.9
vim.g.neovide_fullscreen = true

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.g.mapleader = " "

vim.cmd([[set inccommand=nosplit]])

-- highlight on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

-- Vertically center document when entering insert mode
vim.cmd([[autocmd InsertEnter * norm zz]])

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
}

-- Support persistent undo
vim.cmd([[
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
]])
