let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightcool_bg='transparent'"
			\." | let g:nightcool_bgs=1"
			\." | colo nightcool"

let s:l = "set bg=light termguicolors t_Co=256"
			\." | colo quiet"
			\." | hi Identifier guifg=blue"
			\." | hi Keyword gui=bold"
			\." | hi Special gui=bold"
			\." | hi Title gui=bold"
			\." | hi Comment guifg=darkblue gui=italic"
			\." | hi! link MiniPickPrompt Normal"
			\." | hi! link MiniPickMatchRanges Pmenu"
			\." | hi! link MiniPickMatchCurrent PmenuSel"
			" \." | hi! link WinSeparator LineNr"
			" \." | hi! link MiniPickMatchCurrent PmenuSel"

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
