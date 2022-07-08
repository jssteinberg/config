let s:d = "set bg=dark | colo somedarkterm1"
let s:l = "set termguicolors bg=light | colo enfocado"

function! SetColoOpts()
	exe(s:d)

	" try
	" 	colo iceberg | set bg=dark hlsearch termguicolors
	" 	hi Normal guibg=none
	" 	hi LineNr guibg=none
	" 	hi SignColumn guibg=none
	" 	hi! link Visual PmenuSel
	" catch
	" 	colo default | set notermguicolors t_Co=16 nohlsearch nocursorcolumn
	" endtry
endfunction

function! CycleColo()
	if &bg == 'dark'
		exe(s:l)
	else
		exe(s:d)
	endif
endfunction
