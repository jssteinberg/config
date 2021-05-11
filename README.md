# .config

Use a package manager (e.g. homebrew). Install zsh if needed. Install: git, alacritty, tmux...

Install:

1. `cd`
2. git clone as ~/.config
3. `ln -s .config/zshrc .zshrc`
4. `ln -s .config/tmux.conf .tmux.conf`

## Neovim

Install: neovim v. > 0.5, [paq](https://github.com/savq/paq-nvim), ripgrep...

Neovim config requires version > 0.5 for Lua and uses paq for managing plugins.

---

This neovim config tries to be as lightweight as possible, but as functional as needed for modern web development (I currently develop mostly using Svelte).

- Lua for config and plugins is used as far as possible unless certain functionality requires otherwise.
- Native vim keymappings are utilized and built upon (not a new Mnemonic keymapping system), and avoid implementing to many mappings. Native commands for rare use cases are not mapped---learn native commands!
- Plugins that extends and/or improve the vim way somehow---avoid plugins that tries to make vim resemble another, 'worse' editor.
- Generally avoid bloat. No statusline plugin (what n00bs needs to see the mode their in?)...

### Plugins

- `:TSInstall [...]`---Treesitter for syntax, auto pair and ... Install language specifics with `:TSInstall [...]`.
- `:set bg=[light/dark]`---Colorscheme of the quarter that supports light and dark, `:set bg=[light/dark]`.
- `S` and `.` for the usual surround and improved repeat (tpope's plugins are still the best).
- `gcc`, and `gc` in x-mode, for comment toggling through nvim-comments, written in lua.
- `*`/`#` for searching visual text, by visualstar.vim.
- Telescope for fuzzy searching: `<leader>ff`, `<leader>fs`.
- Git plugins: Fugitive (`<leader>gs`), [gv.vim][gv] for log (`<leader>gl`), [Diffview](https://github.com/sindrets/diffview.nvim) (`<leader>gd`)
- Easyalign for aligning in visual with `ga`.

[gv]: https://github.com/junegunn/gv.vim
