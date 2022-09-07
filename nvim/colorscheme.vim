let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:somedarkterminal1_bg=0"
			\." | colo somedarkterminal1"

function! SetColoOpts()
	exe(s:d)
endfunction

function! CycleColo()
	if &bg == 'dark'
		set termguicolors t_Co=256
		colo makeudarkness1white

		try
			set cmdheight=0
			" let g:somedarkterminal1_statusline_bg = "none"
		catch | endtry
	else
		" set bg=dark termguicolors t_Co=256
		" colo makeuplush
		exe(s:d)
		try
			set cmdheight=1
		catch | endtry
	endif
endfunction
