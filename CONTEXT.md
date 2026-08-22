# Domain glossary

Shared vocabulary for this Neovim configuration. Architecture reviews and refactors should use these terms; new modules should be named after concepts here.

## Terms

**Toolchain** — which frontend tools drive formatting and linting for JS/TS in the project you have open: Biome on its own, or the ESLint + jsonls + prettierd stack. Decided once per working directory by `lua/toolchain.lua`, which owns the filesystem probing, caching, and evaluation timing. Consumers (`plugins/lsp.lua`, `plugins/formatter.lua`) ask for the decision; they never probe files themselves.

**Tailwind project** — a project whose root `package.json` declares `tailwindcss`. Detected by `lua/toolchain.lua`; affects CSS lint settings (`unknownAtRules`) and whether the tailwindcss LSP is enabled.

## Layout conventions

- `lua/utils.lua` holds deliberately shallow shared helpers (currently just `map`). Concepts get their own named module instead of accumulating here.
- Plugin specs under `lua/plugins/` stay thin: they wire plugins and consume decisions from named modules.
