# .config

Includes **config** for alacritty (used **for Macos**), kitty (used **for Ubuntu**), tmux and neovim. *Not tested for Windows.*

## Get started

Requires: git ... Install with your OS package manager.

1. `cd`
2. git clone as ~/.config
3. tmux and (not neo)vim

	```sh
	ln -s .config/tmux.conf .tmux.conf
	ln -s .config/vimrc .vimrc
	```

## Recommended terminal tools

- fish---shell with modern, usable defaults (and keep an eye on nu shell)
	- [fisher](https://github.com/jorgebucaran/fisher), fish plugin manager
	- [hydro](https://github.com/jorgebucaran/hydro) plugin
- ripgrep
- [fd](https://github.com/sharkdp/fd), find replacement
- [bat](https://github.com/sharkdp/bat), cat replacement
- [nvm](https://github.com/nvm-sh/nvm), and for fish [fish-nvm](https://github.com/FabioAntunes/fish-nvm)
- [fzf](https://github.com/junegunn/fzf)
- [np](https://github.com/sindresorhus/np) for easy NPM package publication

### Tips

Adding global fish config from the shell:

```sh
set -Ux EDITOR "nvim"

alias gs "git status"
funcsave gs
```

## Vim > 8

A simple vimrc that can be used as a boilerplate and/or can be used without packages. It gives no errors on missing packages unless keymaps/commands requiring packages are used. *Requries Vim > version 8 +lua.*

Packages (plugins) are installed/updated with `:PackagerInstall`/`:PackagerUpdate` (package management requires https://github.com/kristijanhusak/vim-packager).

- Uses MUcomplete for simple autocompletion. Alternatives: https://github.com/prabirshrestha/asyncomplete.vim

## Neovim > 0.5

Functional, lightweight and 'native extending' neovim config with a focus on web front-end coding, though it's usable for most text editing.
Uncomplicated config for dummies hacking (author included).

Install neovim  > 0.5, [packer](https://github.com/wbthomason/packer.nvim), ripgrep, fd, bat ... Open nvim, watch error messages, run `:PackerInstall`, restart nvim, repeat.

### Features

- An amount of fitting pluggins, lazy loaded if they can be.
- Keymaps are available by pressing `space` and the plugin Which Key will show available maps. Or browse the [keymaps file](https://github.com/jssteinberg/config/blob/main/nvim/lua/keymaps.lua).
- Respects editorconfig, if non, auto detects indent. Falls back to hard tabs with 2 space width. `:set expandtab` for 2 actual spaces.
- `:TSInstall [...]` treesitter language for syntax, indentation ... via [nvim-treesitter][nts].
- `:LspInstall [...]` for language diagnostics and completion.
- `jk` to leave insert, terminal and visual mode.
- `*`/`#` (x) for searching selected text, via visualstar.vim.
- `f`, `F`, `t`, `T` motion (repeat with `f`) across lines, via [clever-f.vim](https://github.com/rhysd/clever-f.vim).

#### Load on demand

- `ga` for aligning text in normal and visual mode via Easyalign. Load with `:packadd vim-easy-align`.

#### Tips

Sessions:

- `:mksession! ~/vim-session-name.vim`, `:so ~/vim-session-name.vim`/`nvim -S ~/vim-session-name.vim` (`<leader>ss saves session`).

### Plugins to consider

- https://github.com/tommcdo/vim-lion
- https://github.com/sbdchd/neoformat
- [Additional theme (Github theme)](https://github.com/projekt0n/github-nvim-theme)

### Structure

- init.lua should give a glance of what's configured
- files in lua folder should have filenames that explain what they do: options, keymaps, packages ...
- avoid deep folder structure

## Todo

- only comment on why something is set like that, not what it does
- When `gf` fails, should have Telescope guess which file.
- `<leader>ff` in visual-mode should fuzzy file-search selection
- telescope: add native fzf https://github.com/nvim-telescope/telescope-fzf-native.nvim (or wait for it to be plugin core)

## Troubleshooting

UTF-8 fish, tmux, neovim LANG, LC_ALL error. Try adding this to your `~/.config/fish/config.fish`:

```sh
set -gx  LC_ALL en_US.UTF-8
```

Neovim packer errors on launch:

1. `nvim ~/.config/nvim/lua/packages/init.lua`
2. `:luafile %`
3. `:PackerInstall`, `:PackerSync`. Restart neovim, repeat.

Neovim css autocompletion with css-lsp may depend on native non-LSP omnifunc.

Neovim has no lsp for javascript/typescript:

- If you use nvm, also install a system nodejs with your system package manager.

[gl]: https://github.com/junegunn/gv.vim
[gd]: https://github.com/sindrets/diffview.nvim
[nts]: https://github.com/nvim-treesitter/nvim-treesitter
