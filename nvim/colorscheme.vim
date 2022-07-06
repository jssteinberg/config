function! SetColoOpts()
	colo somedarkterm1 | set bg=dark hlsearch
	return

	try
		colo iceberg | set bg=dark hlsearch termguicolors
		hi Normal guibg=none
		hi LineNr guibg=none
		hi SignColumn guibg=none
		hi! link Visual PmenuSel
	catch
		colo default | set notermguicolors t_Co=16 nohlsearch nocursorcolumn
	endtry
endfunction
