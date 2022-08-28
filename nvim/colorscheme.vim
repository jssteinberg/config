let s:d = "set termguicolors t_Co=256 bg=dark"
			\." | colo makeup_dark_terminal"

function! SetColoOpts()
	exe(s:d)
endfunction

function! CycleColo()
	if &bg == 'dark'
		let g:catppuccin_flavour = "latte" " latte, frappe, macchiato, mocha
		lua require("catppuccin").setup()
		set termguicolors t_Co=256
		colorscheme catppuccin
	else
		exe(s:d)
	endif
endfunction
