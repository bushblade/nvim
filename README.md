# Leaving the CoC behind.

![Screenshot](https://res.cloudinary.com/bushblade/image/upload/v1650398285/nvim-screenshot.webp)
[kitty terminal](https://sw.kovidgoyal.net/kitty/) with [TokyoNight](https://sw.kovidgoyal.net/kitty/) terminal theme and [Victor Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/VictorMono) nerd font.

**My config for Nvim using native LSP with some sane defaults and settings**, mainly
aimed at web development but ready to go with Python, Rust, Golang, Deno and Lua.

Uses the latest 0.7+ Neovim

## Clone the repository into ~/.config/nvim

```bash
git clone https://github.com/bushblade/nvim.git ~/.config/nvim
```

## Install Packer

[ Packer Neovim plugin manager ](https://github.com/wbthomason/packer.nvim)

```bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Install language servers

Most available via npm

```bash
npm install -g typescript typescript-language-server vscode-langservers-extracted vls @tailwindcss/language-server yaml-language-server @prisma/language-server emmet-ls neovim graphql-language-service-cli graphql-language-service-server @astrojs/language-server

```

> TIP: [No sudo on global npm install](https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md)

### Lua, Pyright, Deno, Gopls and rust-analyzer available in Arch/Manjaro repos

Check your package manager for availability if not on an Arch based distro -
_brew, apt_ etc.

```bash
sudo pacman -S lua-language-server pyright deno rust-analyzer gopls
```

## Install formatters

prettier with npm

```bash
npm i -g prettier
```

[ stylua ](https://github.com/JohnnyMorganz/StyLua) is in the AUR

```bash
pamac install stylua
```

Check your package manager for availability if not on an Arch based distro -
_brew, apt_ etc.

[autopep8](https://pypi.org/project/autopep8/) for python is in Manjaro/Arch
repos

```bash
sudo pacman -S autopep8
```

Check your package manager for availability if not on an Arch based distro -
_brew, apt_ etc.

[yamlfmt](https://pypi.org/project/yamlfmt/) for yaml available with pip

```bash
sudo pip install yamlfmt
```

## Launch Nvim

On the first run of nvim be sure to install plugins.

`:PackerInstall`

Then compile loader file.

`:PackerCompile`

## Note: Installing Firenvim

Run this command in nvim to install FireNvim in your browser.

```
:call firenvim#install(0)
```

or install the [FireFox extension](https://addons.mozilla.org/en-GB/firefox/addon/firenvim/)
or the [Chrome extension](https://chrome.google.com/webstore/detail/firenvim/egpjdkipkomnmjhjmdamaniclmdlobbo?hl=en)

## Adding custom Snippets

The conifg uses [ luasnip ](https://github.com/saadparwaiz1/cmp_luasnip) paired
with [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) for VS Code style snippets.
You can add your own snippets to the config [ snippets directory ](./snippets).
You'll also need to edit the [snippets/package.json](./snippets/package.json) to
be able to load your snippets in the correct filetype.
One test snippet is included as an example.

## Currently installed plugins

1. [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin manager
2. [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP
3. [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy find anything
4. [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Language parsing for highlighting and more
5. [hoob3rt/lualine.nvim](https://github.com/hoob3rt/lualine.nvim) Status line
6. [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) Icons
7. [glacambre/firenvim](https://github.com/glacambre/firenvim) Embed nvim in firefox or chrome
8. [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) Auto completions, suggestions and imports

   Source completion includes:

   1. [ hrsh7th/cmp-cmdline ](https://github.com/hrsh7th/cmp-cmdline) command line
   2. [ hrsh7th/cmp-buffer ](https://github.com/hrsh7th/cmp-buffer) buffer completions
   3. [ hrsh7th/cmp-nvim-lua ](https://github.com/hrsh7th/cmp-nvim-lua) nvim config completions
   4. [ hrsh7th/cmp-nvim-lsp ](https://github.com/hrsh7th/cmp-nvim-lsp) lsp completions
   5. [ hrsh7th/cmp-path ](https://github.com/hrsh7th/cmp-path) file path completions
   6. [ saadparwaiz1/cmp_luasnip ](https://github.com/saadparwaiz1/cmp_luasnip) snippets completions
   7. [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) Snippets
   8. [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

9. [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) Git tools
10. [tpope/vim-surround](https://github.com/tpope/vim-surround) Surroundings
    pairs mappings
11. [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) Vim style
    commenting
12. [knubie/vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator)
    Move between Nvim and Kitty splits
13. [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) HTML/JSX
    auto tags
14. [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) Auto bracket
    and quote pairs
15. [windwp/nvim-spectre](https://github.com/windwp/nvim-spectre) Project wide
    find and replace
16. [mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim)
    Formatting
17. [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) Git status
    in the sign column
18. [leafOfTree/vim-matchtag](https://github.com/leafOfTree/vim-matchtag)
    Highlight matching tag in HTML/JSX
19. [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim) Jump anywhwere in
    your code
20. [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) File
    tree
21. [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) Better commenting based on file type
22. [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) Icons in
    completion
23. [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) Theme
24. [folke/trouble.nvim](https://github.com/folke/trouble.nvim) Show the problems
    in your code
25. [folke/which-key.nvim](https://github.com/folke/which-key.nvim) Keymap helper
26. [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
    Highlight and search project todos and notes
27. [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
    Display the colour of your hex/rgb/hsl value
28. [kevinoid/vim-jsonc](https://github.com/kevinoid/vim-jsonc) Comments in json
    filetype
29. [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) Buffers
    in tabs
30. [weilbith/nvim-code-action-menu](https://github.com/ahmedkhalf/weilbith/nvim-code-action-menu) Better code actions
31. [delphinus/vim-firestore](https://github.com/delphinus/vim-firestore) Syntax
    highlighting and completion for Firebase rules
32. [rmagatti/auto-session](https://github.com/rmagatti/auto-session) Session
    management
33. [andweeb/presence.nvim](https://github.com/andweeb/presence.nvim) Rich
    presence in Discord
34. [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) Dashboard
35. [mbbill/undotree](https://github.com/mbbill/undotree) Undotree

## Resources and inspiration

[Nvim Lua guide](https://github.com/nanotee/nvim-lua-guide)

[Ben Frain has a nice setup](https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f)

[Lunar Vim for inspiration](https://github.com/ChristianChiarulli/LunarVim)

[Ui Customization docs](https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter)

[Lua for Programmers](https://ebens.me/post/lua-for-programmers-part-1/)

[LSP config](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

[Awesome list of plugins](https://github.com/rockerBOO/awesome-neovim)

[Plugin Finder](https://neovimcraft.com/)
