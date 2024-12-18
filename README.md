# .config

Config for Wezterm, Fish, Neovim, Vim and Ripgrep. *Not tested for Windows.*

## Get started

Requires: git

1. `cd`
2. git clone as ~/.config

```sh
ln -s .config/vimrc .vimrc
set -Ux RIPGREP_CONFIG_PATH ~/.config/ripgreprc
ln -s .config/viebrc .viebrc
```

## Terminal tools

- [homebrew](https://brew.sh/) for Macos
- fish---shell with modern usable defaults (and keep an eye on nu shell).
	- [fisher](https://github.com/jorgebucaran/fisher), fish plugin manager.
- ripgrep.
- [fd](https://github.com/sharkdp/fd), find replacement.
- [bat](https://github.com/sharkdp/bat), cat replacement.
- [fzf](https://github.com/junegunn/fzf).
	- and for fish: https://github.com/jethrokuan/fzf or https://github.com/PatrickF1/fzf.fish 
- [np](https://github.com/sindresorhus/np) for easy NPM package publication.
- [fnm](https://github.com/Schniz/fnm) for fast Node.js version managing. *Previously used [nvm](https://github.com/nvm-sh/nvm), and for fish [fish-nvm](https://github.com/FabioAntunes/fish-nvm).*
- multiplexer: zellij, tmux, (keep an eye on [tab-rs](https://github.com/austinjones/tab-rs)).
- exa, `ls` replacement.
- neovim GUI: [goneovim](//github.com/akiyosi/goneovim) or [neovide](//neovide.dev).

### *Tips*

More global fish config from the shell:

```sh
set -Ux FZF_DEFAULT_COMMAND rg --files --hidden --follow
set -Ux EDITOR "vim"

# create and save alias
alias ip "curl ifcfg.me"
funcsave ip

# to remove
functions --erase ls
funcsave ls
```

*For PATH fish has `fish_add_path`.*

*You can also use file: .config/fish/config.fish*

## Neovim

Functional, lightweight and 'native extending' neovim config with a focus on web front-end coding, though it's usable for most text editing. Uncomplicated config for dummies hacking (author included).

Install Neovim >= 0.8.0 (needs to be built with LuaJIT), fzf, ripgrep, fd, bat, delta, [prettierd](https://github.com/fsouza/prettierd). `nvim` and [Lazy.nvim](//github.com/folke/lazy.nvim) installs. Then:

- `:TSInstall all`/`:TSUpdate`
- `:Mason` to install LSPs

### TODO

- format files async on save, but not if their too big, or min...

### Resources

- [Vim Script for the JavaScripter](//w0rp.com/blog/post/vim-script-for-the-javascripter)

## Vim 8 +lua

A Vim config that works without plugins. It gives no errors on missing plugins unless keymaps/commands requiring plugins are used. Requires:

- Vim >= version 8 +lua
- Package managing with [minpac](//github.com/k-takata/minpac)
- Plugins require Git, Rust

## Maintenance

Terminal:

```fish
brew update && brew upgrade
fisher update
npm -g update
npm -g outdate
npm -g i …@latest
```

Explicitly install outdated global NPM packages not automatically updated.

Neovim:

```
:Lazy<cr>
S
:TSUpdate<cr>
:Mason<cr>
U
```

## Troubleshooting

- UTF-8 fish, tmux, neovim LANG, LC_ALL error. Try adding this to `~/.config/fish/config.fish`:

	```bash
	set -gx  LC_ALL en_US.UTF-8
	```

- Neovim: restart, see Maintenance. `:checkhealth<cr>`

- Neovim Treesitter "missing xcrun" for Macos: `xcode-select --install`

- Neovim Treesitter "error executing Lua": https://github.com/nvim-treesitter/nvim-treesitter/issues/3092

- Neovim css autocompletion with css-lsp may depend on native non-LSP omnifunc.


[gl]: https://github.com/junegunn/gv.vim
[gd]: https://github.com/sindrets/diffview.nvim
[nts]: https://github.com/nvim-treesitter/nvim-treesitter
