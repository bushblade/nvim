return {
  {

    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline", -- command line
      "hrsh7th/cmp-buffer", -- buffer completions
      "hrsh7th/cmp-nvim-lua", -- nvim config completions
      "hrsh7th/cmp-nvim-lsp", -- lsp completions
      "hrsh7th/cmp-path", -- file path completions
      "saadparwaiz1/cmp_luasnip", -- snippets completions
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind-nvim",
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true }, -- tailwind color in suggesions
    },
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")

      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      -- html snippets in javascript and javascriptreact
      luasnip.filetype_extend("javascriptreact", { "html", "jsdoc", "react-es7" })
      luasnip.filetype_extend("typescriptreact", { "html", "tsdoc", "react-ts" })

      luasnip.filetype_extend("javascript", { "jsdoc" })
      luasnip.filetype_extend("typescript", { "tsdoc" })

      local loader = require("luasnip/loaders/from_vscode")
      loader.lazy_load()

      -- load snippets from path/of/your/nvim/config/my-cool-snippets
      loader.lazy_load({ paths = { "./snippets" } })

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            ellipsis_char = "...",
            maxwidth = 50,
            before = function(entry, vim_item)
              vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
              return vim_item
            end,
          }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          -- native_menu = false,
          ghost_text = true,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
      })

      -- only enable nvim_lsp in lua files
      vim.cmd(
        [[ autocmd FileType lua lua require'cmp'.setup.buffer { sources = { { name = 'buffer' },{ name = 'nvim_lua'},{name = "nvim_lsp"}},} ]]
      )

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
