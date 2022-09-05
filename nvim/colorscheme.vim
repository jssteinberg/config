let s:d = "set bg=dark termguicolors t_Co=256"
			\." | colo somedarkterminal1"

function! SetColoOpts()
	exe(s:d)
endfunction

function! CycleColo()
	if &bg == 'dark'
		set termguicolors t_Co=256
		colo makeudarkness1white

		" let g:catppuccin_flavour = "latte" " latte, frappe, macchiato, mocha
		" lua require("catppuccin").setup()
		" set termguicolors t_Co=256
		" colorscheme catppuccin
	else
		" set bg=dark termguicolors t_Co=256
		" colo makeuplush
		exe(s:d)
	endif
endfunction
