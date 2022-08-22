let s:d = "set termguicolors t_Co=256 bg=dark nocursorcolumn"
			\." | colo somedarkterm1"

function! SetColoOpts()
	exe(s:d)
endfunction

function! CycleColo()
	if &bg == 'dark'
		let g:catppuccin_flavour = "latte" " latte, frappe, macchiato, mocha
		lua require("catppuccin").setup()
		set termguicolors t_Co=256 cursorcolumn
		colorscheme catppuccin
	else
		exe(s:d)
	endif
endfunction
