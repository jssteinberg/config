let s:d = "set termguicolors t_Co=256 bg=dark nocursorcolumn"
			\." | colo somedarkterm1"
let s:l = "set termguicolors t_Co=256 bg=light cursorcolumn"
			\." | colo enfocado"
			\." | hi Search gui=none"

function! SetColoOpts()
	exe(s:d)
endfunction

function! CycleColo()
	if &bg == 'dark'
		exe(s:l)
	else
		exe(s:d)
	endif
endfunction
