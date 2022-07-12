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

function! SlashLine() abort
	" let g:hackline_branch_sign = " "
	" let g:hackline_separators = #{ l: "", r: "" }
	" let g:hackline_separators = #{ l: "\uE0BD", r: "\uE0BD" }
	let g:hackline_separators     = #{ l: "/", r: "/" }

	let g:hackline_custom_end = "
				\%( %{&fileformat} %)
				\%( %{hackline#tab#info()} %)
				\ %P/L%L c%c "
	let g:hackline_modified       = "2"
	let g:hackline_label_command  = "/ C"
	let g:hackline_label_insert   = "/ I"
	let g:hackline_label_terminal = "/ T"
	let g:hackline_label_visual   = "/ V"
	let g:hackline_label_select   = "/ S"
	let g:hackline_label_replace  = "/ R"
	let g:hackline_label_modified = "/ +"
endfunction
