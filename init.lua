-- basic settings and options
require("options")

-- load all the plugins
-- require("load-plugins")

-- set up language servers
-- require("ls")

-- set up treesitter
-- require("treesitter-settings")

-- configure plugins
-- require("cmp-settings")
-- require("luaLine-settings")
-- require("formatter-settings")
-- require("telescope-settings")
-- require("whichkey-settings")
-- require("lspkind-settings")
-- require("nvim-tree-settings")
-- require("theme-settings")
-- require("matchtag-settings")
-- require("colorizer-settings")
-- require("bufferline-settings")
-- require("spectre-settings")
-- require("autopairs-settings")
-- require("Comment-settings")
-- require("presence-settings")
-- require("dashboard-settings")
-- require("undo-tree-settings")

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- keymappings
require("keymappings")
