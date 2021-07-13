-- borrowed from https://github.com/ChristianChiarulli/LunarVim/blob/rolling/lua/keymappings.lua
local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

local mappings = {
  i = { -- Insert mode
    { "kk", "<ESC>" },
    { "jj", "<ESC>" },

    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
  },
  n = { -- Normal mode
    -- Better window movement
    { "<C-h>", "<C-w>h", { silent = true } },
    { "<C-j>", "<C-w>j", { silent = true } },
    { "<C-k>", "<C-w>k", { silent = true } },
    { "<C-l>", "<C-w>l", { silent = true } },

    -- Resize with arrows
    { "<C-Up>", ":resize -2<CR>", { silent = true } },
    { "<C-Down>", ":resize +2<CR>", { silent = true } },
    { "<C-Left>", ":vertical resize -2<CR>", { silent = true } },
    { "<C-Right>", ":vertical resize +2<CR>", { silent = true } },

    -- Telescope
    -- Ctrl + p fuzzy files
    { "<C-p>", ":Telescope find_files<cr>" },
    { "<leader>ff", ":Telescope find_files<cr>" },
    { "<leader>fb", ":Telescope buffers<cr>" },
    { "<leader>b", ":Telescope buffers<cr>" },
    { "<leader>fs", ":Telescope live_grep<cr>" },
    { "<leader>s", ":Telescope live_grep<cr>" },
    { "<leader>e", ":Telescope file_browser<cr>" },

  },
  t = { -- Terminal mode
    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
  },
  v = { -- Visual/Select mode
    -- Better indenting
    { "<", "<gv" },
    { ">", ">gv" },

  },
  x = { -- Visual mode

  }
}


register_mappings(mappings, { silent = true, noremap = true })

vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'

    -- S for search and replace in buffer

--nnoremap S :%s//gi<Left><Left><Left>
