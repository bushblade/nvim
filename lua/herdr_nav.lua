-- Navigate from Neovim into Herdr App panes.
--
-- Herdr App terminals are herdr-core terminals (HC_TERMINAL_ID), not the herdr
-- TUI's panes (HERDR_PANE_ID), so the TUI plugin's `herdr pane focus` cannot
-- move them. The App's equivalent is `herdr-app do pane.go`, which acts on the
-- App's focused pane -- the one Neovim is running in when this executes.

local M = {}

local function herdr_app()
  local bin = vim.fn.exepath("herdr-app")
  if bin ~= "" then
    return bin
  end
  local fallback = vim.fn.expand("~/.local/bin/herdr-app")
  return vim.fn.executable(fallback) == 1 and fallback or nil
end

local function nav(wincmd, direction)
  local previous = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() ~= previous then
    return -- moved within Neovim
  end

  -- At a split edge: cross into the surrounding Herdr App pane.
  local bin = herdr_app()
  if not bin then
    vim.notify("herdr-app not found; cannot move to the neighbouring Herdr pane", vim.log.levels.WARN)
    return
  end

  vim.fn.system({ bin, "do", "pane.go", "--direction", direction })
  if vim.v.shell_error ~= 0 then
    vim.notify("herdr-app pane.go failed (exit " .. vim.v.shell_error .. ")", vim.log.levels.WARN)
  end
end

function M.setup()
  local keys = {
    ["<C-h>"] = { "h", "left" },
    ["<C-j>"] = { "j", "down" },
    ["<C-k>"] = { "k", "up" },
    ["<C-l>"] = { "l", "right" },
  }

  for lhs, spec in pairs(keys) do
    vim.keymap.set("n", lhs, function()
      nav(spec[1], spec[2])
    end, { silent = true, noremap = true, desc = "Navigate " .. spec[2] .. " (vim/herdr)" })
  end
end

return M
