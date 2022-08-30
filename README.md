# .config

<img width="1205" alt="normal" src="https://user-images.githubusercontent.com/729055/174159129-26121552-2c49-4f43-bb63-1fb0ff722bf7.png">

Includes **config** for alacritty (used **for Macos**), kitty (used **for Ubuntu**), tmux and neovim. *Not tested for Windows.*

## Get started

Requires: git ... Install with your OS package manager.

1. `cd`
2. git clone as ~/.config
3. tmux and (not neo)vim

	```bash
	ln -s .config/tmux.conf .tmux.conf
	ln -s .config/vimrc .vimrc
	```

## Recommended terminal tools

- fish---shell with modern, usable defaults (and keep an eye on nu shell).
	- [fisher](https://github.com/jorgebucaran/fisher), fish plugin manager.
- ripgrep.
- [fd](https://github.com/sharkdp/fd), find replacement.
- [bat](https://github.com/sharkdp/bat), cat replacement.
- [fzf](https://github.com/junegunn/fzf).
	- and for fish: https://github.com/PatrickF1/fzf.fish or https://github.com/jethrokuan/fzf
- [np](https://github.com/sindresorhus/np) for easy NPM package publication.
- [fnm](https://github.com/Schniz/fnm) for fast Node.js version managing. *Previously used [nvm](https://github.com/nvm-sh/nvm), and for fish [fish-nvm](https://github.com/FabioAntunes/fish-nvm).*
- exa, `ls` replacement.

### Tips

Adding global fish config from the shell:

```fish
set -Ux EDITOR "nvim"
alias gt "git checkout --track"
funcsave gt
```

## Vim 8 +lua

A simple Vim config in a single vimrc. It can be used as a boilerplate and works without plugins. It gives no errors on missing plugins unless keymaps/commands requiring plugins are used. *Requries Vim >= version 8 +lua.*

Plugins are installed/updated with `:PackUpdate`. Requires:
[minpac](https://github.com/k-takata/minpac).

## Neovim >= 0.7

Functional, lightweight and 'native extending' neovim config with a focus on web front-end coding, though it's usable for most text editing. Uncomplicated config for dummies hacking (author included).

Install neovim >= 0.7, [packer](https://github.com/wbthomason/packer.nvim), ripgrep, fd, bat, [prettierd](https://github.com/fsouza/prettierd) ... Open nvim and get warning/error messages, run `:PackerSync`, restart nvim, repeat. Then:

- `:TSInstall all`/`:TSUpdate`
- `:LspInstallInfo` and `i`/`U`

### Plugins to consider

...

## Troubleshooting

- UTF-8 fish, tmux, neovim LANG, LC_ALL error. Try adding this to your `~/.config/fish/config.fish`:

	```bash
	set -gx  LC_ALL en_US.UTF-8
	```

- Neovim packer errors on launch:

	1. (Re)launch Neovim, `nvim`
	2. `:PackerSync`.
	3. Restart neovim, repeat.

- Neovim Treesitter "missing xcrun" for Macos: `xcode-select --install`

- Neovim Treesitter "error executing Lua": https://github.com/nvim-treesitter/nvim-treesitter/issues/3092

- Neovim css autocompletion with css-lsp may depend on native non-LSP omnifunc.


[gl]: https://github.com/junegunn/gv.vim
[gd]: https://github.com/sindrets/diffview.nvim
[nts]: https://github.com/nvim-treesitter/nvim-treesitter
