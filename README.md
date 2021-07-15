# Leaving the CoC behind.

A minimal set up for Nvim using native LSP with some sane defaults and settings.

Uses the latest >=0.5 Neovim

Clone the repository into ~/.config/nvim

Install [ Packer ](https://github.com/wbthomason/packer.nvim)

```bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Install language servers

typescript for ts, js, jsx, tsx available from npm

```bash
npm install -g typescript typescript-language-server
```

Lua available in Arch/Manjaro repos

```bash
sudo pacman -S lua-language-server
```

## Install formatters

Prettier for html, css, JavaScript etc

```bash
npm i -g prettier
```

lua-fmt

```bash
npm i -g lua-fmt
```
