-- basic settings and options
require("options")

-- load all the plugins
require("load-plugins")

-- set up language servers
require("ls")

-- set up treesitter
require("treesitter-settings")

-- configure plugins
require("compe-settings")
require("luaLine-settings")
require("formatter-settings")
require("telescope-settings")
require("whichkey-settings")
require("lspkind-settings")
require("nvim-tree-settings")
require("theme-settings")
require("matchtag-settings")
require("neoscroll-settings")
require("colorizer-settings")

-- keymappings
require("keymappings")
