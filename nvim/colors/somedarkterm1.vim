" somedarkterm1.vim
"
" # Colors: somedarkterm1.
"
" Handcrafted syntax highlight for some dark terminal first, then you can
" change from dark to light. Not opposite.
"
" bg #121118
" fg #e6e5ed
"
" black#0    #1a1636 black#8    #342c6d black_bg #05040b
" red#1      #bc685c red#9      #d6a19a red_bg #6d342c
" green#2    #5cbca4 green#10   #9ad6c9
" yellow#3   #b1bc5c yellow#11  #ced69a yellow_bg #656d2c
" blue#4     #9ab3d6 blue#12    #9d9ad6 blue_bg #2c486d
" magenta#5  #685cbc magenta#13 #a19ad6
" cyan#6     #5cb1bc cyan#14    #9aced6
" white#7    #e5f2e0 white#15   #ffffff
"
" gray #7d78a1 gray_bright #aeabc4
" pink #985cbc pink_bright #bf9ad6
"
" Design: purple blueish theme with cyan, yellow and whiteish primaries, based
" on a certain profile pic---neon spaceish. Comments should be readable (no
" grey but dimmed down color variant), not all syntax is important and some
" secondary syntax can have dimmed down color variant.
" Function: base 16 when notermguicolors; extended color details when
" termguicolors.
" Supports: gitsigns, vim-matchup, WinBar, Telescope
" Util:
" - Error: red#1
" - Warning/orange: red#9/magenta#5
"
" Turn to gui only:
" :%s/\v cterm[^ ]*//g | %s/\vsomedarkterm1(['|.])/somedarkterm1_gui\1/g

hi clear
let g:colors_name = 'somedarkterm1'

" hi Normal guibg=#121118 guifg=#e6e5ed

" GROUP NAMES (:h group-name)

" Comment
hi Comment cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#985cbc

" *Constant String Character Number Boolean Float
hi Constant ctermfg=3 guifg=#b1bc5c
hi! link String Constant
" hi String ctermfg=14 guifg=#9aced6

" *Identifier Function
hi Identifier cterm=NONE ctermfg=12 gui=NONE guifg=#9d9ad6
" hi Function cterm=NONE gui=NONE ctermfg=4 guifg=#9ab3d6
hi Function cterm=NONE gui=NONE ctermfg=14 guifg=#9aced6

" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement cterm=NONE gui=NONE ctermfg=2 guifg=#5cbca4
hi Keyword cterm=NONE ctermfg=13 gui=NONE guifg=#a19ad6

" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=12 guifg=#9d9ad6

" *Type StorageClass Structure Typedef
hi Type cterm=NONE ctermfg=14 gui=NONE guifg=#9aced6
hi Structure ctermfg=5 guifg=#685cbc
hi! link TSProperty Type

" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special cterm=NONE ctermfg=14 gui=NONE guifg=#9aced6 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9d9ad6
hi Delimiter ctermfg=4 guifg=#9ab3d6
hi! link TSPunctBrack Delimiter
hi! link TSTag Tag
hi! link javascriptTSTag Tag

" *Underlined
hi Underlined cterm=NONE gui=NONE ctermfg=4 guifg=#9ab3d6

" *Ignore

" *Error

" *Todo
hi Todo cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=9 guifg=#bf9ad6

" OTHER SYNTAX

hi Title cterm=NONE gui=NONE ctermfg=11 guifg=#ced69a
hi markdownUrl ctermfg=5 guifg=#685cbc
hi! link markdown_inlineTSURI markdownUrl

" UI

hi ColorColumn ctermbg=8 guibg=#05040b
hi Conceal ctermbg=8 guifg=#e5f2e0 guibg=#342c6d
hi Cursor cterm=NONE ctermbg=7 ctermfg=0 guibg=#e6e5ed guifg=#121118 gui=NONE
hi CursorColumn cterm=bold gui=bold ctermbg=0 guibg=#1a1636
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 " bg should have slightly better contrast
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=13 guifg=#a19ad6
hi Directory cterm=bold gui=bold ctermfg=5 guifg=#685cbc
hi LineNr ctermfg=5 guifg=#7d78a1
hi MatchParen cterm=italic gui=italic ctermbg=8 guibg=#342c6d guifg=#a19ad6
hi MatchParenCur cterm=NONE gui=NONE ctermbg=8 guibg=#342c6d
hi MatchWord cterm=italic gui=italic ctermbg=8 guibg=#342c6d
hi NonText gui=NONE ctermfg=8 guifg=#342c6d
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bc685c guibg=#bc685c
hi Pmenu      ctermbg=0 guibg=#05040b ctermfg=5 guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb ctermbg=8 guibg=#342c6d " Pmenu affects some floating windows
hi SignColumn ctermbg=NONE guibg=NONE guifg=#9aced6
hi StatusLine cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=13 guifg=#a19ad6
hi StatusLineNC cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=5 guifg=#685cbc
hi TabLineSel cterm=underline gui=underline ctermfg=5 guifg=#7d78a1
hi Visual cterm=bold gui=NONE ctermbg=8 guibg=#6d342c " also affects TelescopePreviewLine
hi WarningMsg ctermfg=9 guifg=#d6a19a
hi WinBar cterm=bold gui=bold ctermfg=5 guifg=#7d78a1
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=8 guifg=#342c6d

hi DiagnosticHint ctermfg=4 guifg=#9d9ad6
hi DiagnosticError ctermfg=1 guifg=#bc685c
hi DiagnosticInfo ctermfg=5 guifg=#685cbc
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#bc685c
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#685cbc
hi DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#9d9ad6
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#342c6d

hi Error ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#bc685c gui=underline
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#ced69a guifg=#121118
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#9ad6c9 guifg=#121118
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d6a19a guifg=#121118
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#9ab3d6
hi SpellRare      ctermbg=5 ctermfg=15 gui=undercurl guisp=#685cbc
hi SpellLocal     ctermbg=6 ctermfg=15 gui=undercurl guisp=#5cb1bc

" Diffs
hi DiffAdd    cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=7 guifg=#e5f2e0
hi DiffDelete cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc685c
hi DiffChange cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=5 guifg=#685cbc
hi DiffText   cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=7 guifg=#e5f2e0

" Search
hi IncSearch cterm=reverse gui=NONE ctermbg=NONE guibg=#656d2c ctermfg=11 guifg=#ffffff
hi Search cterm=NONE gui=NONE ctermbg=3 guibg=#2c486d ctermfg=0 guifg=NONE

" UI LINKED

hi! link lCursor Cursor
hi! link DiagnosticWarn WarningMsg
hi! link ErrorMsg Error
hi! link MoreMsg Type
hi! link PmenuSel CursorLine " Pmenu affects some floating windows
hi! link PmenuSbar Pmenu " Pmenu affects some floating windows
hi! link Question Type
hi! link QuickFixLine CursorLine
hi! link SpellBad ErrorMsg
hi! link TabLine LineNr
hi! link TabLineFill LineNr
hi! link WinBarNC LineNr
hi! link WildMenu Pmenu

" Folds
hi! link Folded Comment
hi! link FoldColumn Folded

" PLUGINS

" clever-f
hi! link CleverFDefaultLabel IncSearch

" illuminate.vim
hi IlluminatedWordText cterm=NONE gui=NONE ctermbg=8 guibg=#342c6d
hi! link IlluminatedWordRead IlluminatedWordText
hi! link IlluminatedWordWrite IlluminatedWordText

" leap.nvim
hi! link LeapLabelPrimary IncSearch

" Neo-tree
hi! link NeoTreeDimText LineNr
hi! link NeoTreeDotfile NeoTreeDimText
hi! link NeoTreeExpander NeoTreeDirectoryIcon
hi! link NeoTreeGitConflict WarningMsg
hi! link NeoTreeGitConflict WarningMsg
hi! link NeoTreeGitUntracked Structure
hi! link NeoTreeIndentMarker WinSeparator
hi! link NeoTreeRootName Title
hi! link NeoTreeTitleBar StatusLine
" NeoTreeNormal             |hl-Normal| override in Neo-tree window.
" NeoTreeNormalNC           |hl-NormalNC| override in Neo-tree window.
" NeoTreeSignColumn         |hl-SignColumn| override in Neo-tree window.
" NeoTreeStatusLine         |hl-StatusLine| override in Neo-tree window.
" NeoTreeStatusLineNC       |hl-StatusLineNC| override in Neo-tree window.
" NeoTreeVertSplit          |hl-VertSplit| override in Neo-tree window.
" NeoTreeWinSeparator       |hl-WinSeparator| override in Neo-tree window.
" NeoTreeEndOfBuffer        |hl-EndOfBuffer| override in Neo-tree window.
" NeoTreeRootName           The name of the root node.
" NeoTreeSymbolicLinkTarget Symbolic link target.
" NeoTreeWindowsHidden      Used for icons and names that are hidden on Windows.


" Telescope
hi! link TelescopePromptCounter Comment

if &bg == "light"
	hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#1a1636
	hi CursorLine ctermbg=NONE guibg=NONE
endif
