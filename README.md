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
- ripgrep
- [fd](https://github.com/sharkdp/fd), find replacement
- [bat](https://github.com/sharkdp/bat), cat replacement
- [nvm](https://github.com/nvm-sh/nvm), and for fish [fish-nvm](https://github.com/FabioAntunes/fish-nvm)
- [fzf](https://github.com/junegunn/fzf)
	- and for fish: https://github.com/PatrickF1/fzf.fish or https://github.com/jethrokuan/fzf
- [np](https://github.com/sindresorhus/np) for easy NPM package publication

### Tips

Adding global fish config from the shell:

```sh
set -Ux EDITOR "nvim"

alias gs "git status"
funcsave gs
```

For NVM, to update npm at the same time add the `--latest-npm` flag, like this:

```sh
nvm install 'lts/*' --reinstall-packages-from=default --latest-npm
```

## Vim >= 8

A simple Vim config in a single vimrc. It can be used as a boilerplate and works without packages/plugins. It gives no errors on missing packages unless keymaps/commands requiring packages are used. *Requries Vim >= version 8 +lua.*

Packages are installed/updated with `:JetpackSync`. Requires:
[vim-jetpack](https://github.com/tani/vim-jetpack).

## Neovim >= 0.7

Functional, lightweight and 'native extending' neovim config with a focus on web front-end coding, though it's usable for most text editing. Uncomplicated config for dummies hacking (author included).

Install neovim >= 0.7, [packer](https://github.com/wbthomason/packer.nvim), ripgrep, fd, bat ... Open nvim, watch error messages, run `:PackerInstall`, restart nvim, repeat.

- `:TSInstall [...]` treesitter language for syntax, indentation ... via [nvim-treesitter][nts].
- `:LspInstall [...]` for language diagnostics and completion.
- `jk` to ESC insert and terminal mode.

### Plugins to consider

- https://github.com/dyng/ctrlsf.vim

## Todo

- When `gf` fails, should have Telescope guess which file.
- `<leader>ff` in visual-mode should fuzzy file-search selection

## Troubleshooting

- UTF-8 fish, tmux, neovim LANG, LC_ALL error. Try adding this to your `~/.config/fish/config.fish`:

	```sh
	set -gx  LC_ALL en_US.UTF-8
	```

- Neovim packer errors on launch:

	1. `nvim ~/.config/nvim/lua/packages/init.lua`
	2. `:luafile %`
	3. `:PackerInstall`, `:PackerSync`. Restart neovim, repeat.

- Neovim Treesitter "missing xcrun" for Macos: `xcode-select --install`

- Neovim css autocompletion with css-lsp may depend on native non-LSP omnifunc.

- Neovim has no lsp for javascript/typescript: If you use nvm, also install a system nodejs with your system package manager.


[gl]: https://github.com/junegunn/gv.vim
[gd]: https://github.com/sindrets/diffview.nvim
[nts]: https://github.com/nvim-treesitter/nvim-treesitter
