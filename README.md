# My Neovim config

![Screenshot](https://res.cloudinary.com/bushblade/image/upload/w_1000/nvim-tokyo-night_t62g3p.webp)
[Ghostty Terminal](https://ghostty.org/) with [Tokyonight](https://github.com/folke/tokyonight.nvim) terminal theme and [Victor Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/VictorMono) nerd font.

**My config for Nvim using native LSP with some sane defaults and settings**, mainly
aimed at web development with Python and Lua ready to go. Go, Rust and PHP
servers are installed but switched off — see
[Adding or toggling languages](#adding-or-toggling-languages).

## Clone the repository into ~/.config/nvim

```bash
git clone https://github.com/bushblade/nvim.git ~/.config/nvim
```

## Launch Nvim

Lazy will install all plugins, you may then need to quit and restart to get
everything running correctly.
Mason will install language servers and formatters.

## Adding or toggling languages

Everything about which languages your setup supports lives in one place:
[lua/languages.lua](./lua/languages.lua). Edit that file and restart Nvim — Mason
installs any newly added servers automatically.

- **Turn a language server on/off** — each entry has `lsp = "server_name"`.
  Add `enabled = false` to keep it installed but not enabled (like `gopls`
  today); delete the line to switch it back on.
- **Add a new language** — add an entry, e.g.
  `elixir = { lsp = "elixirls", parsers = { "elixir" } }`.
- **Treesitter highlighting** — list parser names in `parsers`. Parsers that
  aren't tied to a language (`comment`, `regex`, …) live in `support_parsers`
  in the same file.
- **Formatting** — filetypes listed in `web_fts` are formatted by your project
  Toolchain (Biome, or prettierd — decided per project by
  [lua/toolchain.lua](./lua/toolchain.lua)). Lua formats with stylua and Python
  with autopep8 regardless.
- A few servers only run in some projects (biome, eslint, jsonls, tailwindcss).
  Those are listed in `project_servers`: always installed, enabled per project.

## Adding custom Snippets

The config uses [LuaSnip](https://github.com/L3MON4D3/LuaSnip) paired
with [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) for VS Code style snippets,
loaded by [blink.cmp](https://cmp.saghen.dev/).
You can add your own snippets to the config [ snippets directory ](./snippets).
You'll also need to edit the [snippets/package.json](./snippets/package.json) to
be able to load your snippets in the correct file type.
One test snippet is included as an example.

## Currently installed plugins

1. [/lazy/lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
2. [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP
   1. [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) - Lua LSP goodies for editing this config
3. [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy find anything
4. [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Language parsing for highlighting and more
   1. [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - Text objects based on syntax
5. [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Status line
6. [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Icons
7. [Saghen/blink.cmp](https://cmp.saghen.dev/) - Auto completions, suggestions and imports
   1. [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
   2. [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
   3. [moyiz/blink-emoji.nvim](https://github.com/moyiz/blink-emoji.nvim) - Emoji completions
8. [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) - Surround pairs mappings
9. [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) - Vim style commenting
10. [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - HTML/JSX auto tags
11. [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto bracket and quote pairs
12. [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Formatting
13. [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git status in the sign column
14. [leafOfTree/vim-matchtag](https://github.com/leafOfTree/vim-matchtag) - Highlight matching tag in HTML/JSX
15. [folke/flash.nvim](https://github.com/folke/flash.nvim) - Navigate with search labels, enhanced character motions, and Treesitter integration
16. [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File tree
17. [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - Comment strings that adapt to the code context (JSX, Vue templates)
18. [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Theme
19. [folke/trouble.nvim](https://github.com/folke/trouble.nvim) - Show the problems in your code
20. [folke/which-key.nvim](https://github.com/folke/which-key.nvim) - Keymap helper
21. [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Highlight and search project todos and notes
22. [catgoose/nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua) - Display the colour of your hex/rgb/hsl value
23. [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Buffers in tabs
24. [delphinus/vim-firestore](https://github.com/delphinus/vim-firestore) - Syntax highlighting and completion for Firebase rules
25. [rmagatti/auto-session](https://github.com/rmagatti/auto-session) - Session management
26. [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) - Dashboard
27. [mbbill/undotree](https://github.com/mbbill/undotree) - Undo tree
28. [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim) - UI for lsp progress
29. [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Navigate between splits; wired up to use Herdr panes instead of Tmux
30. [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Installing language servers and formatters

## Resources and inspiration

[Nvim Lua guide](https://github.com/nanotee/nvim-lua-guide)

[Ben Frain has a nice setup](https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f)

[Kick start your Nvim config](https://github.com/nvim-lua/kickstart.nvim)

[Ui Customization docs](https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter)

[Lua for Programmers](https://ebens.me/post/lua-for-programmers-part-1/)

[LSP config](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

[Awesome list of plugins](https://github.com/rockerBOO/awesome-neovim)

[Plugin Finder](https://neovimcraft.com/)
