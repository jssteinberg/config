# .config

Includes config for alacritty (used for Macos), kitty (used for Ubuntu), tmux and neovim.

## Get started

Requires: git, ... Install with your OS package manager.

1. `cd`
2. git clone as ~/.config
3. `ln -s .config/tmux.conf .tmux.conf`

## Other tools

- ripgrep, ag the silver searcher ...
- [fd](https://github.com/sharkdp/fd), find replacement
- [bat](https://github.com/sharkdp/bat), cat replacement
- fish---shell with modern, usable defaults (and keep an eye on nu shell)
	- [fisher](https://github.com/jorgebucaran/fisher), fish plugin manager
	- [hydro](https://github.com/jorgebucaran/hydro) plugin
- [nvm](https://github.com/nvm-sh/nvm), and for fish [fish-nvm](https://github.com/FabioAntunes/fish-nvm)
- [fzf](https://github.com/junegunn/fzf)
- [np](https://github.com/sindresorhus/np) for easy NPM package publication

## Neovim

Requires neovim v. > 0.5, [packer](https://github.com/wbthomason/packer.nvim), ripgrep, fd, bat ...

Keymaps are available by pressing `<leader>` and the plugin Which Key will show available maps. Or browse the [keymaps file](https://github.com/jssteinberg/config/blob/main/nvim/lua/keymaps.lua).

Extra commands and plugins to know about:

- `:TSInstall [...]` treesitter language for syntax, indentation ... via [nvim-treesitter][nts].
- `:LspInstall [...]` for language diagnostics and completion.
- `[...]S[...]` and `.` for surround and improved repeat (tpope's plugins are still the best).
- `gcc`/`gc` (n/x) for comment toggling through nvim-comments, written in lua.
- `*`/`#` (x) for searching selected text, via visualstar.vim.
- `:G[ ...]` for git via fugitive.vim (still the best git integration for vim).
- `gx` to open URI or search visual selection in browser, via open-browser.vim.
- `:Bdelete` and `:Bwipeout` for preserving window layout through famiu/bufdelete.nvim. And it deletes the buffer if it's open in other windows, and cycle all of them to the next buffer.
- `f`, `F`, `t`, `T` to repeat `f`, `F`, `t`, `T`, via [clever-f.vim](https://github.com/rhysd/clever-f.vim).
- `ga` for aligning text in normal and visual mode, through Easyalign. Load with `:packadd vim-easy-align`.

### Config philosophy

- **Functionality** (actually) needed for todays programming---with a focus on web front-end.
- **Light**. Lazy load everything possible. Utilize the command line tools with vim, unless certain functionality is practical to have available inside vim. Avoid plugins that does unnecessary things (no statusline plugin). Generally avoid bloat.
- **Lua** for config and plugins is used as far as possible unless certain functionality requires otherwise.
- **Vim** default keymaps, commands and 'the vim way' is utilized and extended. Avoid plugins that tries to make vim resemble another 'worse' editor.
- **Readable** and uncomplicated config. For dummies (author included).

*This neovim config tries to be as functional as needed for modern web development (I currently develop mostly using Svelte), but as lightweight and 'vim way' as possible.*

### Plugins to consider

- https://github.com/lambdalisue/suda.vim
- https://github.com/sbdchd/neoformat

### Structure

- init.lua should give a glance of what's configured
- files in lua folder should have filenames that explain what they do: options, keymaps, packages ...
- avoid deep folder structure

## Troubleshooting

Neovim packer errors on launch:

1. `nvim ~/.config/nvim/lua/packages/init.lua`
2. `:luafile %`
3. `:PackerSync`

Neovim, no LSP for Javascript/Typescript:

- install nodejs with both nvm and system package manager

[gl]: https://github.com/junegunn/gv.vim
[gd]: https://github.com/sindrets/diffview.nvim
[nts]: https://github.com/nvim-treesitter/nvim-treesitter
