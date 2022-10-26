" nightcoolwc.vim

hi clear
set bg=dark
let g:colors_name="nightcoolwc"

" bg #0c0a19 fg #afc5c7
" black#0   #1a1636 black#8    #7d78a1 black_2   #342c6d
" red#1     #bc675c red#9      #d8a69f dark_red_bg #361a16
" green#2   #80bc5c green#10   #add89f
" yellow#3  #bc985c yellow#11  #d0d89f yellow_bg #646d2c
" blue#4    #5c80bc blue#12    #9fb4d8 blue_bg   #2c446d
" magenta#5 #685cbc magenta#13 #a69fd8
" cyan#6    #5cb1bc cyan#14    #9fd1d8
" white#7   #afc5c7 white#15   #e9f5e6
" ---
" violet    #985cbc violet_2   #c39fd8 violet_bg #552c6d
"
" Options:
" - `let g:nightcoolwc_bg=v:true` or v:false for `NONE` (transparent)
" - `let g:nightcoolwc_statusline="darkblue"` or "darker"
" - `let g:nightcoolwc_comments="darker"` or "bright"
"
" Design: Colorscheme of blue tones with cyan and light green foregrounds.
" Based on a neon illuminated city-park WC... `Comment` should be readable
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
" Make gui only version:
" :%s/\v cterm[^ ]*//g | %s/\vnightcoolwc(['|.])/nightcoolwc_gui\1/g

" GROUP NAMES (:h group-name)

if has("nvim")
	let g:terminal_color_0="#1a1636"
	let g:terminal_color_1="#bc675c"
	let g:terminal_color_2="#80bc5c"
	let g:terminal_color_3="#bc985c"
	let g:terminal_color_4="#5c80bc"
	let g:terminal_color_5="#685cbc"
	let g:terminal_color_6="#5cb1bc"
	let g:terminal_color_7="#afc5c7"
	let g:terminal_color_8="#7d78a1"
	let g:terminal_color_9="#d8a69f"
	let g:terminal_color_10="#add89f"
	let g:terminal_color_11="#d0d89f"
	let g:terminal_color_12="#9fb4d8"
	let g:terminal_color_13="#a69fd8"
	let g:terminal_color_14="#9fd1d8"
	let g:terminal_color_15="#e9f5e6"
endif

hi Normal ctermfg=7 guifg=#afc5c7
hi Bold cterm=bold gui=bold
hi Italic cterm=italic gui=italic
hi Title cterm=NONE gui=NONE ctermfg=15 guifg=#e9f5e6

if get(g:, "nightcoolwc_bg", v:true)
	hi Normal guibg=#0c0a19
endif

hi clear Conceal
hi! link Constant Normal
hi! link TSParameter Normal

" Comment
hi Comment cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#985cbc

if get(g:, "nightcoolwc_comments", "darker") == "bright"
	hi Comment gui=italic ctermfg=9 guifg=#c39fd8
endif

" *Constant String Character Number Boolean Float
hi String ctermfg=11 guifg=#d0d89f
" linked
hi! link cssClassName String
hi! link cssTSProperty String

" *Identifier Function
hi Identifier cterm=NONE ctermfg=12 gui=NONE guifg=#9fb4d8
hi Function cterm=NONE gui=NONE ctermfg=14 guifg=#9fd1d8

" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement cterm=NONE gui=NONE ctermfg=12 guifg=#9fb4d8
hi Keyword cterm=NONE gui=NONE ctermfg=15 guifg=#e9f5e6
" linked
hi! link Label Keyword

" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=13 guifg=#a69fd8
hi Include ctermfg=7 guifg=#afc5c7

" *Type StorageClass Structure Typedef
hi Type cterm=NONE gui=NONE ctermfg=10 guifg=#add89f " Have good constrast from String
hi StorageClass cterm=NONE ctermfg=14 gui=NONE guifg=#9fd1d8
" hi Structure ctermfg=5 guifg=#685cbc
" linked
hi! link Tag Type
hi! link TSProperty Type

" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special cterm=NONE ctermfg=14 gui=NONE guifg=#9fd1d8 " also links to TelescopeMatch
hi SpecialKey ctermfg=8 guifg=#7d78a1
hi TSTagAttribute ctermfg=2 guifg=#80bc5c
hi Delimiter ctermfg=8 guifg=#7d78a1
" linked
hi! link Structure Delimiter
hi! link cssTSString Tag
hi! link htmlTagName Tag
hi! link javascriptTSTag Tag
hi! link TSTag Tag
hi! link TSConstructor Tag
" hi! link @tag Tag
" hi! link @variable Type

" *Underlined
hi Underlined cterm=NONE gui=NONE ctermfg=12 guifg=#9fb4d8

" *Ignore
" *Error

" *Todo
hi Todo cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=9 guifg=#c39fd8
" linked
hi! link vimCommentTitle Todo
hi! link TSNote Todo

" Other syntax
hi TooLong cterm=underline gui=underline ctermfg=3 guifg=#bc985c
hi markdownCode ctermfg=10 guifg=#add89f
hi markdownUrl ctermfg=8 guifg=#7d78a1
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

hi ColorColumn ctermbg=233 guibg=#361a16
hi Cursor cterm=NONE ctermbg=8 ctermfg=16 guibg=fg guifg=#0c0a19 gui=NONE
hi CursorColumn ctermbg=0 guibg=#1a1636
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=15 guifg=#e9f5e6
hi Directory cterm=bold gui=bold ctermfg=4 guifg=#5c80bc
hi LineNr ctermfg=8 guifg=#7d78a1
hi LineNrAbove ctermfg=5 guifg=#685cbc
hi MatchParen cterm=italic gui=NONE ctermbg=0 guibg=#342c6d guifg=#a69fd8
hi MatchWord cterm=italic gui=NONE ctermbg=0 guibg=#342c6d
hi NonText gui=NONE ctermfg=8 guifg=#342c6d " keep cterm same as `SpecialKey`
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bc675c guibg=#bc675c
hi Pmenu ctermbg=0 guibg=#1a1636 ctermfg=8 guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb ctermbg=8 guibg=#342c6d " Pmenu affects some floating windows
hi SignColumn ctermbg=NONE guibg=NONE guifg=#9fd1d8
hi TabLine cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi TabLineSel cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=7 guifg=#afc5c7
hi Visual cterm=NONE gui=NONE ctermbg=238 guibg=#552c6d " also affects TelescopePreviewLine
hi WarningMsg ctermfg=3 guifg=#bc985c
hi WinBar cterm=italic gui=italic ctermfg=13 guifg=#a69fd8
hi WildMenu cterm=bold gui=bold ctermbg=0 guibg=#342c6d ctermfg=13 guifg=#e9f5e6

hi DiagnosticError ctermfg=1 guifg=#bc675c
hi DiagnosticHint ctermfg=8 guifg=#5c80bc
hi DiagnosticWarn ctermfg=4 guifg=#7d78a1
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#bc675c
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#5c80bc
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#bc985c

hi Error cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#d0d89f guifg=#0c0a19
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#add89f guifg=#0c0a19
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d8a69f guifg=#0c0a19
hi SpellBad cterm=underline gui=NONE ctermbg=NONE ctermfg=1 guifg=#d8a69f
hi SpellCap   cterm=underline gui=undercurl ctermbg=NONE guisp=#5c80bc
hi SpellRare  cterm=underline gui=undercurl ctermbg=NONE guisp=#685cbc
hi SpellLocal cterm=underline gui=undercurl ctermbg=NONE guisp=#5cb1bc

" Diffs
" `hi`s in context of normal syntax, so can't use green/red---distinguish another way
hi DiffAdd    cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#e9f5e6
hi DiffDelete cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi DiffChange cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi DiffText   cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#e9f5e6
" `hi`s in own context, so can grey out and use green/red
hi gitDiff cterm=bold gui=bold ctermfg=5 guifg=#685cbc
hi diffAdded cterm=bold gui=bold ctermfg=2 guifg=#80bc5c
hi! link diffRemoved DiffDelete

" Search
hi IncSearch cterm=bold,underline gui=NONE ctermbg=240 guibg=#646d2c ctermfg=NONE guifg=#e9f5e6
hi Search cterm=italic gui=NONE ctermbg=238 guibg=#2c446d ctermfg=NONE guifg=NONE

" StatusLine and WinSeparator
" darkblue
hi StatusLine cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=15 guifg=#a69fd8
hi StatusLineNC cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=8 guifg=#685cbc
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=8 guifg=#342c6d
" darker variant
if get(g:, "nightcoolwc_statusline", "darkblue") == "darker"
	hi StatusLine   gui=NONE guibg=#1a1636 guifg=#e9f5e6
	hi StatusLineNC gui=NONE guibg=#1a1636 guifg=#7d78a1
	hi WinSeparator ctermfg=0 guifg=#1a1636
endif

" UI LINKED

hi! link lCursor Cursor
hi! link DiagnosticInfo DiagnosticHint
hi! link DiagnosticUnderlineInfo DiagnosticUnderlineHint
hi! link ErrorMsg Error
hi! link ModeMsg Title
hi! link MoreMsg Bold
hi! link PmenuSel CursorLineNr " Pmenu affects some floating windows
hi! link PmenuSbar Pmenu " Pmenu affects some floating windows
hi! link Question Bold
hi! link QuickFixLine Visual
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLineFill TabLine
hi! link VertSplit WinSeparator
hi! link WinBarNC LineNr

" Folds
hi! link Folded Todo
hi! link FoldColumn Folded

" PLUGINS NVIM

" illuminate.vim
hi IlluminatedWordText cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d
hi! link IlluminatedWordRead IlluminatedWordText
hi! link IlluminatedWordWrite IlluminatedWordText

" mini.nvim
hi! link MiniIndentscopePrefix NonText
hi! link MiniIndentscopeSymbol NonText

" neo-tree
hi NeoTreeDimText cterm=NONE gui=NONE ctermfg=5 guifg=#7d78a1
hi NeoTreeIndentMarker ctermfg=8 guifg=#342c6d
hi NeoTreeSymbolicLinkTarget ctermfg=6 guifg=#5cb1bc
hi! link NeoTreeDotfile NeoTreeDimText
hi! link NeoTreeExpander NeoTreeDirectoryIcon
hi! link NeoTreeGitConflict WarningMsg
hi! link NeoTreeGitDeleted WarningMsg
hi! link NeoTreeGitUntracked Structure
hi! link NeoTreeGitModfied NeoTreeNormal
hi! link NeoTreeModified NeoTreeNormal
hi! link NeoTreeRootName NeoTreeDirectoryName
hi! link NeoTreeTitleBar StatusLine

" Telescope
hi! link TelescopeNormal Normal
hi! link TelescopePromptCounter Comment

" Treesitter context
hi! link TreesitterContext CursorLine
hi! link TreesitterContextLineNumber WildMenu
