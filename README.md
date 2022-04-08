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
npm install -g typescript typescript-language-server vscode-langservers-extracted vls @tailwindcss/language-server yaml-language-server @prisma/language-server emmet-ls neovim graphql-language-service-cli graphql-language-service-server

```

### Lua, Pyright and rust-analyzer available in Arch/Manjaro repos

```bash
sudo pacman -S lua-language-server pyright rust-analyzer
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

[autopep8](https://pypi.org/project/autopep8/) for python

```bash
sudo pacman -S autopep8
```

[yamlfmt](https://pypi.org/project/yamlfmt/) for yaml available with pip

```bash
sudo pip install yamlfmt
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
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Language parsing for highlighting and more
- [hoob3rt/lualine.nvim](https://github.com/hoob3rt/lualine.nvim) Status line
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) Icons
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) Auto completions,
  suggestions and imports

  Source completetion included:

  - [ hrsh7th/cmp-cmdline ](https://github.com/hrsh7th/cmp-cmdline) command line
  - [ hrsh7th/cmp-buffer ](https://github.com/hrsh7th/cmp-buffer) buffer completions
  - [ hrsh7th/cmp-nvim-lua ](https://github.com/hrsh7th/cmp-nvim-lua) nvim config completions
  - [ hrsh7th/cmp-nvim-lsp ](https://github.com/hrsh7th/cmp-nvim-lsp) lsp completions
  - [ hrsh7th/cmp-path ](https://github.com/hrsh7th/cmp-path) file path completions
  - [ saadparwaiz1/cmp_luasnip ](https://github.com/saadparwaiz1/cmp_luasnip) snippets completions
  - [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) Snippets

  - [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) Git tools
- [tpope/vim-surround](https://github.com/tpope/vim-surround) Surroundings
  pairs mappings
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim) Vim style
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
- [weilbith/nvim-code-action-menu](https://github.com/ahmedkhalf/weilbith/nvim-code-action-menu) Better code actions
- [delphinus/vim-firestore](https://github.com/delphinus/vim-firestore) Syntax
  highlighting and completion for Firebase rules
- [rmagatti/auto-session](https://github.com/rmagatti/auto-session) Session
  management

## Resources and inspiration

[Nvim Lua guide](https://github.com/nanotee/nvim-lua-guide)

[Ben Frain has a nice setup](https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f)

[Lunar Vim for inspiration](https://github.com/ChristianChiarulli/LunarVim)

[Ui Customization docs](https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter)

[Lua for Programmers](https://ebens.me/post/lua-for-programmers-part-1/)

[LSP config](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

[Awesome list of plugins](https://github.com/rockerBOO/awesome-neovim)

[Plugin Finder](https://neovimcraft.com/)

### Plugins worth a look to add/keep an eye on

[alpha-nvim](https://github.com/goolord/alpha-nvim) for dashboard.
