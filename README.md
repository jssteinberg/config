# .config

Includes **config** for alacritty (used **for Macos**), kitty (used **for Ubuntu**), tmux and neovim. *Not tested for Windows.*

## Get started

Requires: git, ... Install with your OS package manager.

1. `cd`
2. git clone as ~/.config
3. `ln -s .config/tmux.conf .tmux.conf`

## Recommended CLI related tools

- fish---shell with modern, usable defaults (and keep an eye on nu shell)
	- [fisher](https://github.com/jorgebucaran/fisher), fish plugin manager
	- [hydro](https://github.com/jorgebucaran/hydro) plugin
- ripgrep
- [fd](https://github.com/sharkdp/fd), find replacement
- [bat](https://github.com/sharkdp/bat), cat replacement
- [nvm](https://github.com/nvm-sh/nvm), and for fish [fish-nvm](https://github.com/FabioAntunes/fish-nvm)
- [fzf](https://github.com/junegunn/fzf)
- [np](https://github.com/sindresorhus/np) for easy NPM package publication

### Usage tips

Adding global fish config from the shell:

```sh
set -Ux EDITOR "nvim"

alias gs "git status"
funcsave gs
```

## Neovim

Functional, lightweight and vim-way neovim config with a focus on web front-end coding, but should be quite usable for everything.

---

Requires neovim v. > 0.5, [packer](https://github.com/wbthomason/packer.nvim), ripgrep, fd, bat ...

Keymaps are available by pressing `space` and the plugin Which Key will show available maps. Or browse the [keymaps file](https://github.com/jssteinberg/config/blob/main/nvim/lua/keymaps.lua).

### Functions

- `qq` to leave insert, terminal and visual mode (I'm addicted).
- `s`/`S` related motions, and `.` for surround and improved repeat (tpope's plugins are still the best).
- `*`/`#` (x) for searching selected text, via visualstar.vim.
- `gcc`/`gc` (n/x) for comment toggling via nvim-comments.
- `:G[ ...]` for git via fugitive.vim (still the best git integration for vim).
- `:TSInstall [...]` treesitter language for syntax, indentation ... via [nvim-treesitter][nts].
- `:LspInstall [...]` for language diagnostics and completion.
- `f`, `F`, `t`, `T` motion (repeat with `f`) across lines, via [clever-f.vim](https://github.com/rhysd/clever-f.vim).
- `,` for entering command mode (`:`), since comma is free from above.
- `<leader><enter>`, `<leader>1`, `<leader>2`, `<leader>3` to open consistent terminals via [harpoon](https://github.com/ThePrimeagen/harpoon).
- `<leader>h` for more harpoon options.

#### Load on demand:

- `ga` for aligning text in normal and visual mode via Easyalign. Load with `:packadd vim-easy-align`.

### Config philosophy

- **Functional** for todays programming---with a focus on web front-end.
- **Light**. Lazy load everything possible. Avoid plugins that does unnecessary things (no statusline plugin). Generally avoid bloat.
- **Lua** for config and plugins is used as far as possible unless certain functionality requires otherwise.
- **Vim** default keymaps, commands and 'the vim way' is utilized and extended. Avoid plugins that tries to make vim resemble another 'worse' editor.
- **Friendly** and uncomplicated config for dummies hacking (author included).

### Plugins to consider

- https://github.com/sbdchd/neoformat
- [Additional theme (Github theme)](https://github.com/projekt0n/github-nvim-theme)

### Structure

- init.lua should give a glance of what's configured
- files in lua folder should have filenames that explain what they do: options, keymaps, packages ...
- avoid deep folder structure

## Todo

- <leader>ff in visual-mode should
fuzzy file-search selection
- telescope: add native fzf 
https://github.com/nvim-telescope/telescope-fzf-native.nvim

## Troubleshooting

Neovim packer errors on launch:

1. `nvim ~/.config/nvim/lua/packages/init.lua`
2. `:luafile %`
3. `:PackerSync`

Neovim, autocompleting CSS depends on native 
non-LSP omnifunc. `:LspInstall cssls`, but do 
not install other LSPs that attaches to 
CSS/SCSS/Less filetypes---currently that would 
set `omnifunc` to LSP's, which gives no 
completion.

Neovim, no LSP for Javascript/Typescript:
install nodejs with both nvm and system package manager

[gl]: https://github.com/junegunn/gv.vim
[gd]: https://github.com/sindrets/diffview.nvim
[nts]: https://github.com/nvim-treesitter/nvim-treesitter
