lua << EOF
	-- Avoid loading some native vim packages
	require'options'.to_not_load()
EOF

" Source config
runtime options.vim
runtime keymaps.vim
runtime colorscheme.vim

" Set colorscheme
call InitColo()

" Init plugins
lua << EOF
	vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('packages').install()]]
	vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('packages').update()]]
	vim.cmd [[command! PackerSync packadd packer.nvim | lua require('packages').sync()]]
	vim.cmd [[command! PackerClean packadd packer.nvim | lua require('packages').clean()]]
	vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('packages').compile()]]

	require'packages'
EOF
