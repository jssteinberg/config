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

" Set colorscheme
call InitColo()

" Init plugins
lua << EOF
	require'options'.add_filetypes()

	vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('packages').install()]]
	vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('packages').update()]]
	vim.cmd [[command! PackerSync packadd packer.nvim | lua require('packages').sync()]]
	vim.cmd [[command! PackerClean packadd packer.nvim | lua require('packages').clean()]]
	vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('packages').compile()]]

	require'packages'
EOF
