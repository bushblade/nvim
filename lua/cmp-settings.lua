local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
-- require("luasnip/loaders/from_vscode").lazy_load() -- needed this to show snippets

-- FIX: not showing html snippets in javascript and javascriptreact
luasnip.snippets = {
  html = {}
}
luasnip.snippets.javascript = luasnip.snippets.html
luasnip.snippets.javascriptreact = luasnip.snippets.html

require("luasnip/loaders/from_vscode").load({include = {"javascript", "javascriptreact"}})
require("luasnip/loaders/from_vscode").lazy_load()

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
      luasnip.lsp_expand(args.body)
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
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t("<C-n>"), "n")
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
        elseif check_back_space() then
          vim.fn.feedkeys(t("<tab>"), "n")
        else
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
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
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
    {name = "nvim_lsp"},
    {name = "path"},
    {name = "vsnip"},
    {name = "luasnip"}
  }
}

-- only enable nvim_lsp in lua files
vim.cmd [[ autocmd FileType lua lua require'cmp'.setup.buffer { sources = { { name = 'buffer' },{ name = 'nvim_lua'},{name = "nvim_lsp"}},} ]]
