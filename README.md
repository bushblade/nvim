# Leaving the CoC behind.

My config for Nvim using native LSP with some sane defaults and settings, mainly
aimed at web development.

Uses the latest 0.5+ Neovim

Clone the repository into ~/.config/nvim

Install [ Packer ](https://github.com/wbthomason/packer.nvim)

```bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Install language servers

Most available via npm

```bash
npm install -g typescript typescript-language-server vscode-langservers-extracted vls eslint_d @tailwindcss/language-server


```

### eslint config

eslint will fallback to a config file in your home directory if no local config
file is found. So if you don't want to always configure on a per project basis
then create a .eslintrc.json in your home directory.

### Lua and Pyright available in Arch/Manjaro repos

```bash
sudo pacman -S lua-language-server pyright
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

## Launch Nvim

On the first run of nvim be sure to install plugins.

`:PackerInstall`

Then compile loader file.

`:PackerCompile`

## Currently installed plugins

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin
  manager
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy find anything
- [jose-elias-alvarez/nvim-lsp-ts-utils](https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils) TypesCript/Javascript utilities
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) Works with above for eslint integration
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Language parsing for highlighting and more
- [hoob3rt/lualine.nvim](https://github.com/hoob3rt/lualine.nvim) Status line
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) Icons
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) Auto completions,
  suggestions and imports
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) Snippets

  - [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) Git tools
- [tpope/vim-surround](https://github.com/tpope/vim-surround) Surroundings
  pairs mappings
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary) Vim style
  commenting
- [knubie/vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator)
  Move between Nvim and Kitty splits
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) HTML/JSX
  auto tags
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) Auto bracket
  and quote pairs
- [windwp/nvim-spectre](https://github.com/windwp/nvim-spectre) Project wide
  find and replace
- [mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim)
  Formatting
- [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) Git status
  in the sign column
- [leafOfTree/vim-matchtag](https://github.com/leafOfTree/vim-matchtag)
  Highlight matching tag in HTML/JSX
- [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim) Jump anywhwere in
  your code
- [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) File
  tree
- [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) Better commenting based on file type
- [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim) Icons in
  completion
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) Theme
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim) Show the problems
  in your code
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim) Keymap helper
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
  Highlight and search project todos and notes
- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
  Display the colour of your hex/rgb/hsl value
- [kevinoid/vim-jsonc](https://github.com/kevinoid/vim-jsonc) Comments in json
  filetype
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) Buffers
  in tabs

## TODO:

- Emmett [maybe with aca/emmet-ls](https://github.com/aca/emmet-ls) can't get
  this to complete
- Styled components highlighting [related to this issue](https://github.com/nvim-treesitter/nvim-treesitter/issues/1111)

## Resources and inspiration

[Nvim Lua guide](https://github.com/nanotee/nvim-lua-guide)

[This init.lua is super helpful minimal setup](https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f)

[Getting Eslint working](https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c)

[Lunar Vim for inspiration](https://github.com/ChristianChiarulli/LunarVim)

[Ui Customization docs](https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter)

[Lua for Programmers](https://ebens.me/post/lua-for-programmers-part-1/)

[LSP config](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md)

[Awesome list of plugins](https://github.com/rockerBOO/awesome-neovim)

[Plugin Finder](https://neovimcraft.com/)

### Plugins worth a look to add/keep an eye on

[alpha-nvim](https://github.com/goolord/alpha-nvim) for dashboard.
