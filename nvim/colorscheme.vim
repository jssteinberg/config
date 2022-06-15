function! SetColoOpts()
	try
		colo iceberg | set bg=dark hlsearch termguicolors
		hi Normal guibg=none
		hi LineNr guibg=none
		hi SignColumn guibg=none
	catch
		colo default | set notermguicolors t_Co=16 nohlsearch nocursorcolumn
	endtry
endfunction
