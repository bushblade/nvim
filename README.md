# Leaving the CoC behind.

My config up for Nvim using native LSP with some sane defaults and settings.

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

```bash
npm i -g prettier lua-fmt
```

## Launch Nvim

On the first run of nvim be sure to install plugins.

`:PackerInstall`

Then compile loader file.

`:PackerCompile`

## TODO:

- Emmett [maybe with aca/emmet-ls](https://github.com/aca/emmet-ls) can't get
  this to complete
- Styled components highlighting [related to this issue](https://github.com/nvim-treesitter/nvim-treesitter/issues/1111)
- Add full list of plugins
- Keep an eye on [coq_nvim](https://github.com/ms-jpq/coq_nvim) for completion.

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
