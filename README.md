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

This neovim config tries to be as lightweight as possible, but as functional as needed for modern web development (I currently develop mostly using Svelte). Lua for config and plugins is used as far as possible unless certain functionality requires otherwise.

### Plugins 

- Treesitter for syntax and ... Install language specifics with `:TSInstall [...]`.
- Colorscheme of the quarter that supports light and dark, `:set bg=[light/dark]`.
- The usual surround using `S` and `.` repeat (non is better than tpope's plugins for now---Lua options are too buggy).
- nvim-comments, written in lua for `gcc`, and `gc` in x-mode, comment toggle motion.
- (opt) Telescope for fuzzy searching. **It's optional**: load with `:pacadd telescope`.
- (opt) Easyalign for aligning in visual with `ga`. **It's optional**.
