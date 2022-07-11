lua << EOF
	-- Avoid loading some native vim packages
	require'options'.to_not_load()
EOF

" Source config

source $HOME/.config/nvim/options.vim
source $HOME/.config/nvim/keymaps.vim
source $HOME/.config/nvim/colorscheme.vim

call SetColoOpts()

lua << EOF
	vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('packages').install()]]
	vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('packages').update()]]
	vim.cmd [[command! PackerSync packadd packer.nvim | lua require('packages').sync()]]
	vim.cmd [[command! PackerClean packadd packer.nvim | lua require('packages').clean()]]
	vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('packages').compile()]]

	require'packages'
EOF

function! PowerLine() abort
	let g:hackline_separators = #{ l: "", r: "" }
	" let g:hackline_separators = #{ l: "\uE0BD", r: "\uE0BD" }
	let g:hackline_big_separators = #{
				\l: "",
				\lr: "\uE0B0",
				\r: "",
				\rl: "\uE0B2" }
	" let g:hackline_big_separators = #{
	" 			\l: "\uE0BA",
	" 			\r: "",
	" 			\rl: "\uE0BA" }
				" \r: "\uE0B8",
	let g:hackline_branch_sign = " "
endfunction
