local function qf_toggle()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end

return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      local wk = require("which-key")
      wk.setup({
        window = {
          border = "single", -- none, single, double, shadow
          position = "bottom", -- bottom, top
          margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          -- winblend = 0,
        },
        triggers_blacklist = {
          -- list of mode / prefixes that should never be hooked by WhichKey
          -- this is mostly relevant for key maps that start with a native binding
          -- most people should not need to change this
          i = { "j", "k" },
          v = { "j", "k" },
        },
      })
      -- register key bindings with <leader> prefix
      wk.register({
        -- R = { "<cmd>Rest run<CR>", "Run with Rest" },
        q = { qf_toggle, "Toggle Quickfix list" },
        M = { "<cmd>Mason<CR>", "Mason" },
        f = {
          -- mostly Telescope bindings
          name = "Find with Telescope",
          f = {
            function()
              require("telescope.builtin").find_files({ hidden = true })
            end,
            "Find File",
          },
          b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
          n = { "<cmd>TodoTelescope<cr>", "Find Notes" },
          t = { "<cmd>Telescope builtin<cr>", "Telescope builtin" },
          s = { "<cmd>Telescope live_grep<cr>", "Search In Files" },
          r = { "<cmd>Telescope lsp_references<cr>", "Find References" },
          d = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
          m = { "<cmd>Telescope marks<CR>", "Marks" },
          k = { "<cmd>Telescope keymaps<CR>", "Key mappings" },
          M = { "<cmd>Telescope man_pages<CR>", "Man pages" },
          a = { require("session-lens").search_session, "Search Sessions" },
          h = { "<cmd>Telescope help_tags<CR>", "Search help" },
          T = { "<cmd>TodoTelescope<CR>", "Search Todos" },
          e = { "<cmd>Telescope file_browser<CR>", "Browse Files" },
          g = { "<cmd>Telescope git_status<CR>", "Git Status" },
        },
        e = { "<cmd>NvimTreeToggle<CR>", "File Tree" },
        u = { "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", "Undotree" },
        L = { "<cmd>Lazy<CR>", "Lazy" },
        c = { require("actions-preview").code_actions, "Code Actions" },
        d = {
          function()
            vim.diagnostic.open_float({ border = "rounded" })
          end,
          "Line Diagnostics",
        },
        w = { "<cmd>WhichKey<CR>", "WhichKey" },
        s = {
          function()
            vim.o.spell = not vim.o.spell
          end,
          "Toggle spell check",
        },
        r = { vim.lsp.buf.rename, "Rename" },
        -- Bufferline
        b = {
          name = "Bufferline",
        },
        S = {
          name = "Spectre - find and replace",
          s = { require("spectre").open_visual, "Open Spectre" },
          w = {
            function()
              require("spectre").open_visual({ select_word = true })
            end,
            "Search for word under cursor",
          },
        },
        l = {
          name = "LSP",
          f = {
            function()
              vim.lsp.buf.format({ async = true })
            end,
            "Format File",
          },
          d = {
            function()
              vim.diagnostic.open_float({ border = "rounded" })
            end,
            "Line Diagnostics",
          },
          r = { vim.lsp.buf.rename, "Rename" },
          R = { vim.lsp.buf.references, "List references" },
          c = { require("actions-preview").code_actions, "Code actions" },
        },
        a = {
          name = "Auto Sessions",
          S = { "<cmd>SaveSession<cr>", "Save session" },
          s = { "<cmd>SearchSession<cr>", "Search sessions" },
          d = { "<cmd>SessionDelete<cr>", "Delete session" },
          r = { "<cmd>SessionRestore<cr>", "Restore session" },
        },
        t = { name = "Trouble" },
        h = { name = "GitSigns" },
      }, {
        prefix = "<leader>",
      })
    end,
  },
}
