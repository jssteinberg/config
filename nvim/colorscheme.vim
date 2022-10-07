let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightcoolwc_bg=0"
			\." | let g:nightcoolwc_statusline='underline'"
			\." | colo nightcoolwc"

let s:l = "set bg=light termguicolors t_Co=256"
			\." | colo lushwhitecool"

function! InitColo()
	exe(s:d)
endfunction

function! CycleColo()
	if &bg == 'dark'
		set termguicolors t_Co=256 bg=light
		colo lushwhitecool
	else
		exe(s:d)
	endif
endfunction
