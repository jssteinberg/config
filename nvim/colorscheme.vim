let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightcool_bg='transparent'"
			\." | let g:nightcool_bgs=1"
			\." | colo nightcool"

let s:l = "set bg=light termguicolors t_Co=256"
			\." | colo lunaperche"
			\." | hi! link MiniPickMatchCurrent PmenuSel"
			\." | hi! link WinSeparator LineNr"

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
