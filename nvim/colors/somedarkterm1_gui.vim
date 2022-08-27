" somedarkterm1_gui.vim
"
" # Colors: somedarkterm1_gui.
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
" :%s/\v ]*//g | %s/\vsomedarkterm1(['|.])/somedarkterm1_gui\1/g

hi clear
let g:colors_name = 'somedarkterm1_gui'

" hi Normal guibg=#121118 guifg=#e6e5ed

" GROUP NAMES (:h group-name)

" Comment
hi Comment gui=NONE guibg=NONE guifg=#985cbc

" *Constant String Character Number Boolean Float
hi Constant guifg=#b1bc5c
hi! link String Constant
" hi String guifg=#9aced6

" *Identifier Function
hi Identifier gui=NONE guifg=#9d9ad6
" hi Function gui=NONE guifg=#9ab3d6
hi Function gui=NONE guifg=#9aced6

" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement gui=NONE guifg=#5cbca4
hi Keyword gui=NONE guifg=#a19ad6

" *PreProc Include Define Macro PreCondit
hi PreProc guifg=#9d9ad6

" *Type StorageClass Structure Typedef
hi Type gui=NONE guifg=#9aced6
hi Structure guifg=#685cbc
hi! link TSProperty Type

" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special gui=NONE guifg=#9aced6 " also links to TelescopeMatch
hi SpecialKey guifg=#9d9ad6
hi Delimiter guifg=#9ab3d6
hi! link TSPunctBrack Delimiter
hi! link TSTag Tag
hi! link javascriptTSTag Tag

" *Underlined
hi Underlined gui=NONE guifg=#9ab3d6

" *Ignore

" *Error

" *Todo
hi Todo gui=NONE guibg=NONE guifg=#bf9ad6

" OTHER SYNTAX

hi Title gui=NONE guifg=#ced69a
hi markdownUrl guifg=#685cbc
hi! link markdown_inlineTSURI markdownUrl

" UI

hi ColorColumn guibg=#05040b
hi Conceal guifg=#e5f2e0 guibg=#342c6d
hi Cursor guibg=#e6e5ed guifg=#121118 gui=NONE
hi CursorColumn gui=bold guibg=#1a1636
hi CursorLine gui=NONE guibg=#1a1636 " bg should have slightly better contrast
hi CursorLineNr gui=NONE guibg=#1a1636 guifg=#a19ad6
hi Directory gui=bold guifg=#685cbc
hi LineNr guifg=#7d78a1
hi MatchParen gui=italic guibg=#342c6d guifg=#a19ad6
hi MatchParenCur gui=NONE guibg=#342c6d
hi MatchWord gui=italic guibg=#342c6d
hi NonText gui=NONE guifg=#342c6d
hi NvimInternalError guifg=#bc685c guibg=#bc685c
hi Pmenu      guibg=#05040b guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb guibg=#342c6d " Pmenu affects some floating windows
hi SignColumn guibg=NONE guifg=#9aced6
hi StatusLine gui=NONE guibg=#342c6d guifg=#a19ad6
hi StatusLineNC gui=NONE guibg=#342c6d guifg=#685cbc
hi TabLineSel gui=underline guifg=#7d78a1
hi Visual gui=NONE guibg=#6d342c " also affects TelescopePreviewLine
hi WarningMsg guifg=#d6a19a
hi WinBar gui=bold guifg=#7d78a1
hi WinSeparator guibg=NONE guifg=#342c6d

hi DiagnosticHint guifg=#9d9ad6
hi DiagnosticError guifg=#bc685c
hi DiagnosticInfo guifg=#685cbc
hi DiagnosticUnderlineError gui=underline guisp=#bc685c
hi DiagnosticUnderlineWarn gui=underline guisp=#685cbc
hi DiagnosticUnderlineInfo gui=underline guisp=#9d9ad6
hi DiagnosticUnderlineHint gui=underline guisp=#342c6d

hi Error guibg=NONE guifg=#bc685c gui=underline
hi RedrawDebugClear     guibg=#ced69a guifg=#121118
hi RedrawDebugComposed  guibg=#9ad6c9 guifg=#121118
hi RedrawDebugRecompose  guibg=#d6a19a guifg=#121118
hi SpellCap       gui=undercurl guisp=#9ab3d6
hi SpellRare      gui=undercurl guisp=#685cbc
hi SpellLocal     gui=undercurl guisp=#5cb1bc

" Diffs
hi DiffAdd    gui=bold guibg=NONE guifg=#e5f2e0
hi DiffDelete gui=bold guibg=NONE guifg=#bc685c
hi DiffChange gui=bold guibg=NONE guifg=#685cbc
hi DiffText   gui=bold guibg=NONE guifg=#e5f2e0

" Search
hi IncSearch gui=NONE guibg=#656d2c guifg=#ffffff
hi Search gui=NONE guibg=#2c486d guifg=NONE

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
hi IlluminatedWordText gui=NONE guibg=#342c6d
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
	hi Normal guibg=#ffffff guifg=#1a1636
	hi CursorLine guibg=NONE
endif
