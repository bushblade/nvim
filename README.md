# Leaving the CoC behind.

A minimal set up for Nvim using native LSP with some sane defaults and settings.

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
npm install -g typescript typescript-language-server vscode-langservers-extracted vls eslint_d

```

Lua available in Arch/Manjaro repos

```bash
sudo pacman -S lua-language-server
```

## Install formatters

```bash
npm i -g prettier lua-fmt
```

## TODO

- Emmett [maybe with aca/emmet-ls](https://github.com/aca/emmet-ls)
- Auto imports - compe should be able to do this but not working?
- Show documentation - lspsaga?
- spelling
- Styled components highlighting [related to this issue](https://github.com/nvim-treesitter/nvim-treesitter/issues/1111)
- cleanup lsp-settings.lua, sub modules
- Syntax highlighting on fish files not working

## Some useful links to help me get this working

[Nvim Lua guide](https://github.com/nanotee/nvim-lua-guide)

[This init.lua is super helpful minmal setup](https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f)

[Getting Eslint working](https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c)

[Lunar Vim for inspiration](https://github.com/ChristianChiarulli/LunarVim)

[Ui Customization docs](https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter)

[Nvim Lua guide](https://github.com/nanotee/nvim-lua-guide/)

[Lua for Programmers](https://ebens.me/post/lua-for-programmers-part-1/)

[LSP config](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver)
