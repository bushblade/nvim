-- basic settings and options
require("options")

-- load all the plugins
require("load-plugins")

-- set up language servers
require("ls")

-- set up treesitter
require("treesitter-settings")

-- configure plugins
require("cmp-settings")
require("luaLine-settings")
require("formatter-settings")
require("telescope-settings")
require("whichkey-settings")
require("lspkind-settings")
require("nvim-tree-settings")
require("theme-settings")
require("matchtag-settings")
require("colorizer-settings")
require("bufferline-settings")
require("spectre-settings")
require("autopairs-settings")
require("Comment-settings")
require("presence-settings")
require("dashboard-settings")
require("undo-tree-settings")

-- keymappings
require("keymappings")
