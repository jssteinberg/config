" somedarkterminal1.vim

" neoncitywc...
" Handcrafted syntax highlight for some dark terminals first (defaults to
" background NONE to use terminal background), with good contrasts.
"
" bg #121118 fg #e5f2e0
" black#0    #1a1636 black#8    #7d78a1 black_2 #342c6d black_bg #05040b
" red#1      #bc675c red#9      #d6a39b
" green#2    #80bc5c green#10   #a9d69b
" yellow#3   #bc985c yellow#11  #ced69b yellow_bg #646d2c
" blue#4     #5c80bc blue#12    #9bb2d6 blue_bg #2c446d
" magenta#5  #685cbc magenta#13 #a39bd6
" cyan#6     #5cb1bc cyan#14    #9bcfd6
" white#7    #afacc5 white#15   #ffffff
"
" gray/dim #7d78a1
" violet #985cbc violet_bright #bf9ad6 violet_bg #552c6d
"
" Options:
" - g:somedarkterminal1_bg = 0 or 1. 0 for NONE, 1 for background.
" - g:somedarkterminal1_statusline_bg = 'none' or 'black'
" Design: Colorscheme of blue tones with cyan and light green foregrounds.
" Based on a neon illuminated city-park WC... `Comments` should be readable
" (no dimmed grey).
" Supports: telescope, fugitive, neo-tree, gitsigns, vim-illuminate, vim-matchup, winbar
" Util:
" - Error: red#1
" - Info: violet*/magenta#5
" - Warning: yellow#3
" - Selection (bg): violet_bg
"
" Make gui only:
" :%s/\v cterm[^ ]*//g | %s/\vsomedarkterminal1(['|.])/somedarkterminal1_gui\1/g

hi clear

let g:colors_name = 'somedarkterminal1'

if &bg == 'light' | set bg=dark | endif

if get(g:, 'somedarkterminal1_bg', '0')
	hi Normal guibg=#121118 guifg=#e5f2e0
else
	hi Normal guifg=#e5f2e0
endif

" GROUP NAMES (:h group-name)

" Comment
hi Comment cterm=italic gui=NONE ctermbg=NONE guibg=NONE ctermfg=5 guifg=#985cbc
" *Constant String Character Number Boolean Float
hi Constant ctermfg=3 guifg=#bc985c
hi String ctermfg=11 guifg=#ced69b
" *Identifier Function
hi Identifier cterm=NONE ctermfg=12 gui=NONE guifg=#9bb2d6
hi Function cterm=NONE gui=NONE ctermfg=14 guifg=#9bcfd6
" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement cterm=NONE gui=NONE ctermfg=4 guifg=#5c80bc
hi Keyword cterm=NONE gui=NONE ctermfg=12 guifg=#9bb2d6
hi! link Label Keyword
" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=13 guifg=#a39bd6
" *Type StorageClass Structure Typedef
hi Type cterm=NONE gui=NONE ctermfg=10 guifg=#a9d69b " Have good constrast from String
hi Structure ctermfg=5 guifg=#685cbc
" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special cterm=NONE ctermfg=14 gui=NONE guifg=#9bcfd6 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9bb2d6 " Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
hi Delimiter ctermfg=4 guifg=#5c80bc
" *Underlined
hi Underlined cterm=NONE gui=NONE ctermfg=12 guifg=#9bb2d6
" *Ignore
" *Error
" *Todo
hi Todo cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=9 guifg=#bf9ad6
" Other syntax
hi Bold cterm=bold gui=bold
hi Italic cterm=italic gui=italic
hi Title cterm=NONE gui=NONE ctermfg=11 guifg=#ced69b
hi TooLong cterm=underline gui=underline ctermfg=3 guifg=#bc985c
hi TSTagAttribute ctermfg=2 guifg=#80bc5c
" green#2    #80bc5c green#10   #a9d69b
hi markdownCode ctermfg=10 guifg=#a9d69b
hi markdownUrl ctermfg=5 guifg=#685cbc
" Linked syntax
hi! link htmlArg TSTagAttribute
hi! link htmlEndTag htmlTag
hi! link htmlTag Delimiter
hi! link htmlTagName Tag
hi! link javascriptTSTag Tag
hi! link markdown_inlineTSURI markdownUrl
hi! link markdownLinkDelimiter Delimiter
hi! link markdownLinkTextDelimiter Delimiter
hi! link Tag Type
hi! link TSPunctBrack Delimiter
hi! link TSTag Tag
hi! link TSProperty Type
hi! link cssTSProperty String
hi! link scssTSProperty cssTSProperty
hi! link cssTSString Tag
hi! link scssTSString cssTSString

" UI

hi ColorColumn ctermbg=0 guibg=#05040b
hi clear Conceal
hi Cursor cterm=NONE ctermbg=7 ctermfg=0 guibg=#e5f2e0 guifg=#121118 gui=NONE
hi CursorColumn cterm=bold gui=bold ctermbg=0 guibg=#1a1636
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 " bg should have slightly better contrast
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=13 guifg=#a39bd6
hi Directory cterm=bold gui=bold ctermfg=4 guifg=#5c80bc
hi LineNr cterm=italic gui=italic ctermfg=5 guifg=#7d78a1
hi MatchParen cterm=italic gui=NONE ctermbg=0 guibg=#342c6d guifg=#a39bd6
hi MatchWord cterm=italic gui=NONE ctermbg=0 guibg=#342c6d
hi NonText gui=NONE ctermfg=8 guifg=#342c6d
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bc675c guibg=#bc675c
hi Pmenu      ctermbg=0 guibg=#05040b ctermfg=5 guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb ctermbg=8 guibg=#342c6d " Pmenu affects some floating windows
hi SignColumn ctermbg=NONE guibg=NONE guifg=#9bcfd6
hi TabLine cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=5 guifg=#7d78a1
hi TabLineSel cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=13 guifg=#a39bd6
hi Visual cterm=bold gui=NONE ctermbg=0 guibg=#552c6d " also affects TelescopePreviewLine
hi WarningMsg ctermfg=3 guifg=#bc985c
hi WinBar cterm=italic gui=italic ctermfg=13 guifg=#a39bd6

hi DiagnosticHint ctermfg=8 guifg=#7d78a1
hi DiagnosticError ctermfg=1 guifg=#bc675c
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#d6a39b
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#bc985c
hi DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#a39bd6
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#5c80bc

hi Error cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#ced69b guifg=#121118
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#a9d69b guifg=#121118
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d6a39b guifg=#121118
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#5c80bc
hi SpellRare      ctermbg=5 ctermfg=15 gui=undercurl guisp=#685cbc
hi SpellLocal     ctermbg=6 ctermfg=15 gui=undercurl guisp=#5cb1bc

" Diffs
" `hi`s in context of normal syntax, so can't use green/red---distinguish another way
hi DiffAdd    cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#ffffff
hi DiffDelete cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi DiffChange cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi DiffText   cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#ffffff
" `hi`s in own context, so can grey out and use green/red
hi gitDiff ctermfg=5 guifg=#685cbc
hi diffAdded ctermfg=2 guifg=#80bc5c
hi diffRemoved ctermfg=1 guifg=#bc675c

" Search
hi IncSearch cterm=reverse gui=NONE ctermbg=NONE guibg=#646d2c ctermfg=11 guifg=#ffffff
hi Search cterm=italic gui=italic ctermbg=3 guibg=#2c446d ctermfg=0 guifg=NONE

" StatusLine and WinSeparator
hi StatusLine cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=13 guifg=#a39bd6
hi StatusLineNC cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=5 guifg=#685cbc
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=5 guifg=#342c6d
if get(g:, "somedarkterminal1_statusline_bg", "default") == "none"
	hi StatusLine cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=13 guifg=#a39bd6
	hi StatusLineNC cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=5 guifg=#685cbc
elseif get(g:, "somedarkterminal1_statusline_bg", "default") == "black" && &termguicolors
	hi StatusLine gui=NONE guibg=#05040b guifg=#a39bd6
	hi StatusLineNC gui=NONE guibg=#05040b guifg=#685cbc
	hi WinSeparator guibg=NONE guifg=#05040b
endif

" UI LINKED

hi! link lCursor Cursor
hi! link DiagnosticInfo DiagnosticHint
hi! link DiagnosticWarn WarningMsg
hi! link ErrorMsg Error
hi! link MoreMsg Type
hi! link PmenuSel CursorLine " Pmenu affects some floating windows
hi! link PmenuSbar Pmenu " Pmenu affects some floating windows
hi! link Question Type
hi! link QuickFixLine CursorLine
hi! link SpellBad ErrorMsg
hi! link TabLineFill TabLine
hi! link WinBarNC LineNr
hi! link WildMenu Pmenu

" Folds
hi! link Folded Comment
hi! link FoldColumn Folded

" PLUGINS

" clever-f
hi! link CleverFDefaultLabel IncSearch

" illuminate.vim
hi IlluminatedWordText cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d
hi! link IlluminatedWordRead IlluminatedWordText
hi! link IlluminatedWordWrite IlluminatedWordText

" leap.nvim
hi! link LeapLabelPrimary IncSearch

" Neo-tree
hi NeoTreeDimText cterm=italic gui=italic ctermfg=5 guifg=#7d78a1
hi NeoTreeIndentMarker ctermfg=0 guifg=#1a1636
hi NeoTreeSymbolicLinkTarget ctermfg=6 guifg=#5cb1bc
hi! link NeoTreeDotfile NeoTreeDimText
hi! link NeoTreeExpander NeoTreeDirectoryIcon
hi! link NeoTreeGitConflict WarningMsg
hi! link NeoTreeGitConflict WarningMsg
hi! link NeoTreeGitUntracked Structure
hi! link NeoTreeRootName NeoTreeDirectoryName
hi! link NeoTreeTitleBar StatusLine

" Telescope
hi! link TelescopeNormal Normal
hi! link TelescopePromptCounter Comment
