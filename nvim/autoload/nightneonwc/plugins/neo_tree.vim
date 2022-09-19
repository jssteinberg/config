function nightneonwc#plugins#neo_tree#highlights() abort
	hi NeoTreeDimText cterm=italic gui=italic ctermfg=5 guifg=#7d78a1
	hi NeoTreeIndentMarker ctermfg=8 guifg=#342c6d
	hi NeoTreeSymbolicLinkTarget ctermfg=6 guifg=#5cb1bc
	hi! link NeoTreeDotfile NeoTreeDimText
	hi! link NeoTreeExpander NeoTreeDirectoryIcon
	hi! link NeoTreeGitConflict WarningMsg
	hi! link NeoTreeGitDeleted WarningMsg
	hi! link NeoTreeGitUntracked Structure
	hi! link NeoTreeRootName NeoTreeDirectoryName
	hi! link NeoTreeTitleBar StatusLine
endfunction
