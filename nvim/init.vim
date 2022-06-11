lua << EOF
	-- Avoid loading some native vim packages
	require'options'.to_not_load()
EOF

" Source config

source $HOME/.config/nvim/options.vim
source $HOME/.config/nvim/keymaps.vim

lua << EOF
	require'packages'
	require'packages.colors'.set_colo()
EOF
