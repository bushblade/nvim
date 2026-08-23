# Domain glossary

Shared vocabulary for this Neovim configuration. Architecture reviews and refactors should use these terms; new modules should be named after concepts here.

## Terms

**Toolchain** — which frontend tools drive formatting and linting for JS/TS in the project you have open: Biome on its own, or the ESLint + jsonls + prettierd stack. Decided once per working directory by `lua/toolchain.lua`, which owns the filesystem probing, caching, and evaluation timing. Consumers (`plugins/lsp.lua`, `plugins/formatter.lua`) ask for the decision; they never probe files themselves.

**Language** — a language this config supports, described once in `lua/languages.lua`: its LSP servers (`lsp`, with `enabled = false` for installed-but-off), treesitter parsers, and the filetypes its Toolchain formats (`web_fts`). Adding or toggling a language happens there and nowhere else; `project_servers` in the same file holds servers that are always installed but only enabled per project (biome/eslint/jsonls/tailwindcss).

**Tailwind project** — a project whose root `package.json` declares `tailwindcss`. Detected by `lua/toolchain.lua`; affects CSS lint settings (`unknownAtRules`) and whether the tailwindcss LSP is enabled.

## Layout conventions

- `lua/utils.lua` holds deliberately shallow shared helpers (currently just `map`). Concepts get their own named module instead of accumulating here.
- Plugin specs under `lua/plugins/` stay thin: they wire plugins and consume decisions from named modules. `lua/languages.lua` is data-as-interface: mason, lsp, treesitter, and formatter specs all derive from it.
- Duplicate leader-namespace keymap aliases (e.g. `<leader>r` and `<leader>lr`) are deliberate muscle-memory affordances — do not deduplicate keymaps that differ only by prefix.
