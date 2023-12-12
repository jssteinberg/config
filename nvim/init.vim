" Avoid loading some native vim packages
lua << EOF
	require'options'.to_not_load()
EOF

" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '

" Source config
runtime some.vim
runtime options.vim
runtime keymaps.vim
runtime colorscheme.vim
" runtime statusline.vim

if exists("g:neovide")
	runtime neovide.vim
endif

" Set colorscheme
call InitColo()

lua << EOF
	require'options'.add_filetypes()
	require'packages'
EOF
