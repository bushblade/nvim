local languages = require("languages")

return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    init = function()
      -- mason.nvim prepends its bin dir in setup(), but that now runs at
      -- VeryLazy -- after servers are spawned for files opened from the CLI.
      -- Put it on PATH during startup so LSP servers installed by mason
      -- resolve whenever they are first needed.
      local bin = vim.fn.stdpath("data") .. "/mason/bin"
      if not vim.env.PATH:find(bin, 1, true) then
        vim.env.PATH = bin .. ":" .. vim.env.PATH
      end
    end,
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })
      local registry = require("mason-registry")

      -- auto install formatters
      for _, pkg_name in ipairs({ "stylua", "prettierd", "autopep8" }) do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
          if not pkg:is_installed() then
            pkg:install()
          end
        end
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = false,
        ensure_installed = languages.all_servers(),
        automatic_installation = true,
      })
    end,
  },
}
