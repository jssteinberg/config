let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightcool_bg=v:false"
			\." | colo nightcool"

let s:l = "set bg=light termguicolors t_Co=256"
			\." | colo lushwhitecool"

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
