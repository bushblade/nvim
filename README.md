# My Neovim config

![Screenshot](https://res.cloudinary.com/bushblade/image/upload/w_1000/catppuccin.webp)
[Alacritty terminal](https://github.com/alacritty/alacritty) with [Catppuccin](https://github.com/catppuccin/nvim) terminal theme and [Victor Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/VictorMono) nerd font.

**My config for Nvim using native LSP with some sane defaults and settings**, mainly
aimed at web development but ready to go with Python, Rust, Golang, Deno and Lua.

## Clone the repository into ~/.config/nvim

```bash
git clone https://github.com/bushblade/nvim.git ~/.config/nvim
```

> TIP: [No sudo on global npm install](https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md)

## Launch Nvim

Lazy will install all plugins, you may then need to quit and restart to get
everything running correctly.
Mason will install language servers and formatters.

## Adding custom Snippets

The config uses [ luasnip ](https://github.com/saadparwaiz1/cmp_luasnip) paired
with [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) for VS Code style snippets.
You can add your own snippets to the config [ snippets directory ](./snippets).
You'll also need to edit the [snippets/package.json](./snippets/package.json) to
be able to load your snippets in the correct file type.
One test snippet is included as an example.

## Currently installed plugins

1. [/lazy/lazy.nvim](https://github.com/folke/lazy.nvim.git) - Plugin manager
2. [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP
3. [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy find anything
4. [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Language parsing for highlighting and more
5. [hoob3rt/lualine.nvim](https://github.com/hoob3rt/lualine.nvim) Status line
6. [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) Icons
7. [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) Auto completions, suggestions and imports

   Source completion includes:

   1. [ hrsh7th/cmp-cmdline ](https://github.com/hrsh7th/cmp-cmdline) command line
   2. [ hrsh7th/cmp-buffer ](https://github.com/hrsh7th/cmp-buffer) buffer completions
   3. [ hrsh7th/cmp-nvim-lua ](https://github.com/hrsh7th/cmp-nvim-lua) nvim config completions
   4. [ hrsh7th/cmp-nvim-lsp ](https://github.com/hrsh7th/cmp-nvim-lsp) lsp completions
   5. [ hrsh7th/cmp-path ](https://github.com/hrsh7th/cmp-path) file path completions
   6. [ saadparwaiz1/cmp_luasnip ](https://github.com/saadparwaiz1/cmp_luasnip) snippets completions
   7. [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) Snippets
   8. [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

8. [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) Surroundings
   pairs mappings
9. [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) Vim style
   commenting
10. ~~[knubie/vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator)
    Move between Nvim and Kitty splits~~
11. [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) HTML/JSX
    auto tags
12. [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) Auto bracket
    and quote pairs
13. [windwp/nvim-spectre](https://github.com/windwp/nvim-spectre) Project wide
    find and replace
14. [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
    Formatting
15. [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) Git status
    in the sign column
16. [leafOfTree/vim-matchtag](https://github.com/leafOfTree/vim-matchtag)
    Highlight matching tag in HTML/JSX
17. [folke/flash.nvim](https://github.com/folke/flash.nvim) navigate with search labels, enhanced character motions, and Treesitter integration.
    your code
18. [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) File
    tree
19. [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) Better commenting based on file type
20. [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) Icons in
    completion
21. [catppuccin/nvim](https://github.com/catppuccin/nvim) Theme
22. [folke/trouble.nvim](https://github.com/folke/trouble.nvim) Show the problems
    in your code
23. [folke/which-key.nvim](https://github.com/folke/which-key.nvim) Keymap helper
24. [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
    Highlight and search project todos and notes
25. [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)
    Display the colour of your hex/rgb/hsl value
26. [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) Buffers
    in tabs
27. [aznhe21/actions-preview.nvim](https://github.com/aznhe21/actions-preview.nvim) Better code action previews
28. [delphinus/vim-firestore](https://github.com/delphinus/vim-firestore) Syntax
    highlighting and completion for Firebase rules
29. [rmagatti/auto-session](https://github.com/rmagatti/auto-session) Session
    management
30. [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) Dashboard
31. [mbbill/undotree](https://github.com/mbbill/undotree) Undotree
32. [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim,) UI for lsp
    progress
33. [numToStr/Navigator.nvim](https://github.com/numToStr/Navigator.nvim)
    Navigate between Wezterm splits
34. [Mason](https://github.com/williamboman/mason.nvim) for installing language
    servers.

## Resources and inspiration

[Nvim Lua guide](https://github.com/nanotee/nvim-lua-guide)

[Ben Frain has a nice setup](https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f)

[Kick start your Nvim config](https://github.com/nvim-lua/kickstart.nvim)

[Ui Customization docs](https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter)

[Lua for Programmers](https://ebens.me/post/lua-for-programmers-part-1/)

[LSP config](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

[Awesome list of plugins](https://github.com/rockerBOO/awesome-neovim)

[Plugin Finder](https://neovimcraft.com/)
