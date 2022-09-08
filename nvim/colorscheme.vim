let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightneonwc_bg=0"
			\." | colo nightneonwc"

function! SetColoOpts()
	exe(s:d)
endfunction

function! CycleColo()
	if &bg == 'dark'
		set termguicolors t_Co=256
		colo makeudarkness1white
	else
		exe(s:d)
	endif
endfunction
