local cmp = require("cmp")
local lspkind = require("lspkind")

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

cmp.setup {
  completion = {
    completeopt = "menu,menuone,noinsert"
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      -- You must install `vim-vsnip` if you use the following as-is.
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  -- You must set mapping if you want.
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm(
      {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      }
    ),
    ["<tab>"] = cmp.mapping(
      function(fallback)
        print "tab pressed"
        print(vim.fn["vsnip#jumpable"](-1))
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t("<C-n>"), "n") -- this works
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          print "jumpable"
          vim.fn.feedkeys(t("<Plug>vsnip-expand-or-jump"), "") -- this doesn't work
        elseif check_back_space() then
          vim.fn.feedkeys(t("<tab>"), "n")
        else
          print "fallback" -- this always runs
          fallback()
        end
      end,
      {
        "i",
        "s"
      }
    ),
    ["<S-tab>"] = cmp.mapping(
      function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t("<C-p>"), "n")
        elseif vim.fn["vsnip#jumpable"](-1) then
          vim.fn.feedkeys(t("<Plug>vsnip-jump-prev"), "")
        else
          fallback()
        end
      end,
      {
        "i",
        "s"
      }
    )
  },
  -- You should specify your *installed* sources.
  sources = {
    {name = "buffer"},
    -- {name = "ultisnips"},
    {name = "nvim_lsp"},
    {name = "path"},
    {name = "vsnip"}
  }
}

-- only enable nvim_lsp in lua files
vim.cmd [[ autocmd FileType lua lua require'cmp'.setup.buffer { sources = { { name = 'buffer' },{ name = 'nvim_lua'},{name = "nvim_lsp"}},} ]]
