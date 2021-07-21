require("load-plugins")
require("compe-settings")
require("options")
require("luaLine-settings")
require("treesitter-settings")
require("keymappings")
require("language-servers")
require("formatter-settings")
require("telescope-settings")

-- run some vim script from lua
vim.cmd([[command! Hello lua print('Hello')]])
