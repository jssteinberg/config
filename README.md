# .config

## Get started

Install zsh if needed.

Requires: git, kitty (or alacritty and tmux) ... Install with your OS package manager.

1. `cd`
2. git clone as ~/.config
3. `ln -s .config/zshrc .zshrc`
4. `ln -s .config/tmux.conf .tmux.conf`

## Other complementing tools

- [fzf](https://github.com/junegunn/fzf) for fuzzy finding from the shell (in nvim Telescope is used)
- ag the silver searcher
- [exa](https://github.com/ogham/exa), `ls` replacement

## Neovim

Requires neovim v. > 0.5 and [packer](https://github.com/wbthomason/packer.nvim) (though there is a file for plugins through [paq](https://github.com/savq/paq-nvim) as well), ripgrep is optional...

### Config philosophy

- **Functionality** as needed for programming 'the vim way'.
- **Light**. Utilize the shell together with vim, unless certain functionality is more practical to add to vim. Generally avoid bloat. Avoid plugins that replaces what vim already does, or that does unnecessary things (there's no statusline plugin).
- **Lua** for config and plugins is used as far as possible unless certain functionality requires otherwise.
- **Vim** default keymappings, commands and 'the vim way' are utilized and built upon. Not a new Mnemonic keymapping system for instance---avoid implementing to many mappings. Commands for rarer use cases don't need to be mapped (native commands are good to know). Prioritize plugins that extends, improve and/or ease learning the vim way somehow. Avoid plugins that tries to make vim resemble another 'worse' editor.
- **Readable** and as uncomplicated config as possible, for dummies (author included).

*This neovim config tries to be as functional as needed for modern web development (I currently develop mostly using Svelte), but as lightweight and 'vim way' as possible.*

### Plugins

- `:TSInstall [...]`---Treesitter for syntax, auto pair and ... Install language specifics with `:TSInstall [...]`.
- `:LspInstall [...]` for language diagnostics and completion.
- Show mappings after 500 ms with Which key plugin.
- `<leader>f[...]`---find [d]irectory content, [f]iles, [g]it [...], [o]ld files, [w]ord---through Telescope.
- `:set bg=[light/dark]`---Colorscheme of the year that supports light and dark mode.
- `S` and `.` for surround and improved repeat (tpope's plugins are still the best).
- `gcc`, and `gc` in x-mode, for comment toggling through nvim-comments, written in lua.
- `*`/`#` for searching visual text, by visualstar.vim.
- `:G` for git status, `<leader>gl` for git log, `<leader>gd` for git diff, through plugins fugitive.vim, [gv.vim][gl] and [Diffview][gd].
- `gx` to open URI or searching visual, through open-browser.vim.
- `ga` for aligning text in normal and visual mode, through Easyalign.

### Structure

- init.lua should give a glance of what's configured
- files in lua folder should have filenames that explain what they do: options, keymaps, plugins ...
- avoid deep folder structure

[gl]: https://github.com/junegunn/gv.vim
[gd]: https://github.com/sindrets/diffview.nvim
