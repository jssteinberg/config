# .config

Install a package manager (e.g. homebrew) and zsh if needed, git, alacritty, tmux...

1. git clone to ~/.config
2. ln -s ~/.config/zshrc ~/.zshrc
3. ln -s ~/.config/tmux.conf ~/.tmux.conf

## Neovim

Install neovim v. > 0.5, [paq](https://github.com/savq/paq-nvim), ripgrep...

- Neovim config requires version > 0.5 for Lua.
- Neovim config uses paq for managing plugins.

---

Neovim config tries to be as lightweight as possible, but as functional as needed for modern web development (I currently develop mostly using Svelte). Lua is used as far as possible unless certain functionality requires otherwise.

### Plugins 

- Telescope for fuzzy searching. It's optional: load with `:pacadd telescope`.
