let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightcoolwc_bg='black'"
			\." | let g:nightcoolwc_statusline='bold'"
			\." | colo nightcoolwc"

let s:l = "set bg=light termguicolors t_Co=256"
			\." | colo lushwhitecool"

function! InitColo()
	exe(s:d)
endfunction

function! CycleColo()
	if &bg == 'dark'
		exe(s:l)
	else
		exe(s:d)
	endif
endfunction
