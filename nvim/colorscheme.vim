let s:d = "set bg=dark nocursorcolumn | colo somedarkterm1"
let s:l = "set termguicolors bg=light cursorcolumn | colo enfocado"

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
