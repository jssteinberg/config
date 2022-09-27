" nightneonwc.vim

" bg        #121118 fg         #e5f2e0
" black#0   #1a1636 black#8    #7d78a1 black_2   #342c6d black_bg #05040b
" red#1     #bc675c red#9      #d6a39b
" green#2   #80bc5c green#10   #a9d69b
" yellow#3  #bc985c yellow#11  #ced69b yellow_bg #646d2c
" blue#4    #5c80bc blue#12    #9bb2d6 blue_bg   #2c446d
" magenta#5 #685cbc magenta#13 #a39bd6
" cyan#6    #5cb1bc cyan#14    #9bcfd6
" white#7   #afacc5 white#15   #ffffff
" ---
" violet    #985cbc violet_2   #bf9ad6 violet_bg #552c6d
"
" Options:
" - `let g:nightneonwc_bg = 1`. 0 for NONE (transparent), 1 for background.
" - `let g:nightneonwc_statusline_bg =`...unlet for default, 'none' or 'black'.
" - `let g:nightneonwc_plugin_neo_tree = 1`. Or `0` to not highlight plugin.
"
" Design: Colorscheme of blue tones with cyan and light green foregrounds.
" Based on a neon illuminated city-park WC... `Comments` should be readable
" (no dimmed grey).
"
" Supports: treesitter, telescope, fugitive, neo-tree, gitsigns, vim-illuminate, treesitter-context, vim-matchup, winbar
"
" Util:
" - Disabled/inacive: black#8
" - Error: red#1
" - Info: magenta#5/violet*
" - Warning: yellow#3
" - Selection (bg): violet_bg
"
" Make gui only:
" :%s/\v cterm[^ ]*//g | %s/\vnightneonwc(['|.])/nightneonwc_gui\1/g

" #7ad544 green 1.5 color
" #d59e44 yellow 1.5 color
" #44c3d5 cyan 1.5 color
" #7eaaf4 blue 2 color
" #8c7ef4 magenta 2 color

set bg=dark
hi clear
let g:colors_name = 'nightneonwc'

" GROUP NAMES (:h group-name)

if get(g:, 'nightneonwc_bg', '1')
	hi Normal guibg=#121118 guifg=#e5f2e0
else
	hi Normal guifg=#e5f2e0
endif

hi! link Constant Normal
hi! link TSParameter Normal

" Comment
hi Comment cterm=italic gui=NONE ctermbg=NONE guibg=NONE ctermfg=5 guifg=#985cbc

" *Constant String Character Number Boolean Float
hi String ctermfg=11 guifg=#ced69b
" linked
hi! link cssClassName String
hi! link cssTSProperty String

" *Identifier Function
hi Identifier cterm=NONE ctermfg=12 gui=NONE guifg=#9bb2d6
hi Function cterm=NONE gui=NONE ctermfg=14 guifg=#9bcfd6

" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement cterm=NONE gui=NONE ctermfg=4 guifg=#9bb2d6
" hi Keyword cterm=NONE gui=NONE ctermfg=12 guifg=#9bb2d6
" linked
hi! link Label Keyword

" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=13 guifg=#a39bd6

" *Type StorageClass Structure Typedef
hi Type cterm=NONE gui=NONE ctermfg=10 guifg=#a9d69b " Have good constrast from String
hi StorageClass cterm=NONE ctermfg=14 gui=NONE guifg=#9bcfd6
" hi Structure ctermfg=5 guifg=#685cbc
" linked
hi! link Tag Type
hi! link TSProperty Type

" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special cterm=NONE ctermfg=14 gui=NONE guifg=#9bcfd6 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9bb2d6 " Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
hi TSTagAttribute ctermfg=2 guifg=#80bc5c
hi Delimiter ctermfg=8 guifg=#7d78a1
" linked
hi! link Structure Delimiter
hi! link cssTSString Tag
hi! link htmlTagName Tag
hi! link javascriptTSTag Tag
hi! link TSTag Tag
hi! link TSConstructor Tag

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
hi markdownCode ctermfg=10 guifg=#a9d69b
hi markdownUrl ctermfg=5 guifg=#685cbc
" linked
hi! link cssAttributeSelector htmlArg
hi! link htmlArg TSTagAttribute
hi! link htmlTag Delimiter
hi! link htmlEndTag htmlTag
hi! link markdown_inlineTSURI markdownUrl
hi! link markdownLinkDelimiter Delimiter
hi! link markdownLinkTextDelimiter Delimiter
hi! link TSPunctBrack Delimiter
hi! link cssTagName htmlTagName
hi! link scssTSProperty cssTSProperty
hi! link scssTSString cssTSString

" UI

hi ColorColumn ctermbg=0 guibg=#05040b
hi clear Conceal
hi Cursor cterm=NONE ctermbg=7 ctermfg=0 guibg=#e5f2e0 guifg=#121118 gui=NONE
hi CursorColumn cterm=bold gui=bold ctermbg=0 guibg=#1a1636
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 " bg should have slightly better contrast
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=13 guifg=#a39bd6
hi Directory cterm=bold gui=bold ctermfg=4 guifg=#5c80bc
hi LineNr cterm=italic gui=italic ctermfg=8 guifg=#7d78a1
hi MatchParen cterm=italic gui=NONE ctermbg=0 guibg=#342c6d guifg=#a39bd6
hi MatchWord cterm=italic gui=NONE ctermbg=0 guibg=#342c6d
hi NonText gui=NONE ctermfg=8 guifg=#342c6d
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bc675c guibg=#bc675c
hi Pmenu      ctermbg=0 guibg=#05040b ctermfg=8 guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb ctermbg=8 guibg=#342c6d " Pmenu affects some floating windows
hi SignColumn ctermbg=NONE guibg=NONE guifg=#9bcfd6
hi TabLine cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi TabLineSel cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=13 guifg=#a39bd6
hi Visual cterm=bold gui=NONE ctermbg=0 guibg=#552c6d " also affects TelescopePreviewLine
hi WarningMsg ctermfg=3 guifg=#bc985c
hi WinBar cterm=italic gui=italic ctermfg=13 guifg=#a39bd6

hi DiagnosticError ctermfg=1 guifg=#bc675c
hi DiagnosticHint ctermfg=8 guifg=#5c80bc
hi DiagnosticWarn ctermfg=4 guifg=#7d78a1
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#bc675c
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#5c80bc
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#bc985c

hi Error cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#ced69b guifg=#121118
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#a9d69b guifg=#121118
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d6a39b guifg=#121118
hi SpellBad cterm=NONE gui=NONE ctermfg=9 guifg=#d6a39b
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#5c80bc
hi SpellRare      ctermbg=5 ctermfg=15 gui=undercurl guisp=#685cbc
hi SpellLocal     ctermbg=6 ctermfg=15 gui=undercurl guisp=#5cb1bc

" Diffs
" `hi`s in context of normal syntax, so can't use green/red---distinguish another way
hi DiffAdd    cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#ffffff
hi DiffDelete cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi DiffChange cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi DiffText   cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#ffffff
" `hi`s in own context, so can grey out and use green/red
hi gitDiff cterm=bold gui=bold ctermfg=5 guifg=#685cbc
hi diffAdded cterm=bold gui=bold ctermfg=2 guifg=#80bc5c
hi! link diffRemoved DiffDelete

" Search
hi IncSearch cterm=reverse gui=NONE ctermbg=NONE guibg=#646d2c ctermfg=11 guifg=#ffffff
hi Search cterm=italic gui=NONE ctermbg=3 guibg=#2c446d ctermfg=0 guifg=NONE

" StatusLine and WinSeparator
hi StatusLine cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=13 guifg=#a39bd6
hi StatusLineNC cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=5 guifg=#685cbc
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=5 guifg=#342c6d
if get(g:, "nightneonwc_statusline_bg", "default") == "none"
	hi StatusLine cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=13 guifg=#a39bd6
	hi StatusLineNC cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=5 guifg=#685cbc
elseif get(g:, "nightneonwc_statusline_bg", "default") == "black" && &termguicolors
	hi StatusLine gui=NONE guibg=#05040b guifg=#a39bd6
	hi StatusLineNC gui=NONE guibg=#05040b guifg=#685cbc
	hi WinSeparator guibg=NONE guifg=#05040b
endif

" UI LINKED

hi! link lCursor Cursor
hi! link DiagnosticInfo DiagnosticHint
hi! link DiagnosticUnderlineInfo DiagnosticUnderlineHint
hi! link ErrorMsg Error
hi! link MoreMsg Bold
hi! link PmenuSel CursorLine " Pmenu affects some floating windows
hi! link PmenuSbar Pmenu " Pmenu affects some floating windows
hi! link Question Bold
hi! link QuickFixLine Visual
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

" markid
hi markid1 gui=italic guifg=#7ad544
hi markid2 gui=italic guifg=#d59e44
hi markid3 gui=italic guifg=#44c3d5
hi markid4 gui=italic guifg=#7eaaf4
hi markid5 gui=italic guifg=#8c7ef4

" mini.nvim
hi! link MiniIndentscopePrefix NonText
hi! link MiniIndentscopeSymbol NonText

" Neo-tree
if has("nvim") && get(g:, "nightneonwc_plugin_neo_tree", 1)
	try
		call nightneonwc#plugins#neo_tree#highlights()
	catch | endtry
endif

" Telescope
hi! link TelescopeNormal Normal
hi! link TelescopePromptCounter Comment

" Treesitter context
hi! link TreesitterContext ColorColumn
hi! link TreesitterContextLineNumber CursorLineNr
