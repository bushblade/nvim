local map = require("utils").map

return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      preview_config = { border = "rounded" },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Next hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Prev hunk" })

        -- Actions
        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
        map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
        map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })
        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end)
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis("~")
        end, { desc = "Diff vs last commit" })

        -- Quickfix lists of hunks
        map("n", "<leader>hq", gitsigns.setqflist, { desc = "Hunk Quickfix (file)" })
        map("n", "<leader>hQ", function()
          gitsigns.setqflist("all")
        end, { desc = "Hunk Quickfix (all)" })

        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Line Blame" })
        map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Hunk text object" })
      end,
    })
  end,
}
