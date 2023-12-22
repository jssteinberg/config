let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightcool_bg=''"
			\." | let g:nightcool_statusline='default'"
			\." | colo nightcool"

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
	else
		exe(s:d)
	endif
endfunction
