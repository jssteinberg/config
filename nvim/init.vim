" Not load netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

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

let g:color_theme = 'dark'

function! CycleColo()
	if g:color_theme == 'dark'
		let g:color_theme = 'light'
		lua require('packages.colors').set_colo('light')
	else
		let g:color_theme = 'dark'
		lua require('packages.colors').set_colo('dark')
	endif
endfunction

nnoremap <leader>cc :call CycleColo()<cr>
