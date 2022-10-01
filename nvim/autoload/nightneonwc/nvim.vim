function nightneonwc#nvim#highlights() abort
	" illuminate.vim
	hi IlluminatedWordText cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d
	hi! link IlluminatedWordRead IlluminatedWordText
	hi! link IlluminatedWordWrite IlluminatedWordText

	" markid
	hi markid1 guifg=#cae138 " yellow_id color
	hi markid2 guifg=#38cce1 " cyan_id color
	hi markid3 guifg=#77e138 " green_id color
	hi markid4 guifg=#3877e1 " blue color
	hi markid5 guifg=#e1a138 " orange_id color

	" mini.nvim
	hi! link MiniIndentscopePrefix NonText
	hi! link MiniIndentscopeSymbol NonText

	" Telescope
	hi! link TelescopeNormal Normal
	hi! link TelescopePromptCounter Comment

	" Treesitter context
	hi TreesitterContext guibg=NONE
	hi! link TreesitterContextLineNumber StatusLine
endfunction
