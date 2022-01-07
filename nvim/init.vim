" Options
source $HOME/.config/nvim/options.vim

" Keymaps
source $HOME/.config/nvim/keymaps.vim

lua << EOF

-- Netrw
require'packages.netrw'.config()

-- Extra packages/plugins
require'packages'

-- Set colorscheme
require'packages.colors'.set_colo()

EOF
