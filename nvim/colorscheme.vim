let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightcool_bg=''"
			\." | colo nightcool"
			\." | hi CursorColumn ctermbg=0 guibg=#0c0a19"

let s:l = "set bg=light termguicolors t_Co=256"
			\." | colo lunaperche"
			\." | hi! link VertSplit TabLineSel"
			\." | hi! link StatusLine TabLine"

function! InitColo()
	exe(s:d)
endfunction

function! NowColo()
	if &bg == 'dark'
		exe(s:l)
		" set listchars=tab:\│\
	else
		exe(s:d)
		set listchars+=tab:\·\
	endif
endfunction
