let s:d = "set bg=dark termguicolors t_Co=256"
			\." | let g:nightcool_bg='transparent'"
			\." | let g:nightcool_comments='bright'"
			\." | colo nightcool"

let s:l = "set bg=light termguicolors t_Co=256"
			\." | colo quiet"
			\." | hi Comment guifg=purple gui=NONE"
			\." | hi! link DiagnosticInfo Comment"
			\." | hi! link DiagnosticHint Comment"
			\." | hi Identifier guifg=darkblue"
			\." | hi Type guifg=darkblue"
			\." | hi! link String Type"
			\." | hi Keyword gui=bold"
			\." | hi Special gui=bold"
			\." | hi Title gui=bold"
			\." | hi TabLineSel guibg=NONE guifg=NONE"
			\." | hi! link MiniPickPrompt Normal"
			\." | hi! link MiniPickNormal Normal"
			\." | hi! link MiniPickMatchRanges Pmenu"
			\." | hi! link MiniPickMatchCurrent PmenuSel"

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
