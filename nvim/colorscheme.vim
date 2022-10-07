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
		hi StatusLine cterm=NONE gui=NONE ctermbg=16 guibg=#121118 ctermfg=13 guifg=#a39bd6
		hi StatusLineNC cterm=NONE gui=NONE ctermbg=16 guibg=#121118 ctermfg=5 guifg=#685cbc
		try
			set cmdheight=0
		catch | endtry
	else
		exe(s:d)
	endif
endfunction
