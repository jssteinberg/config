lua << EOF
	-- Avoid loading some
	require'options'
EOF

" Source/require config

source $HOME/.config/nvim/options.vim
source $HOME/.config/nvim/keymaps.vim

lua << EOF
	-- Netrw
	-- require'packages.netrw'.config()

	-- Extra packages/plugins
	require'packages'

	-- Set colorscheme
	require'packages.colors'.set_colo()
EOF
