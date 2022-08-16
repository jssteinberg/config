" somedarkterm1.vim

" Colors
" somedarkterm1.
" Syntax highlight some dark terminal first, then you can change from dark to
" light. Not opposite.
"
" Design: purple blueish theme with cyan, yellow and whiteish primaries, based
" on a certain profile pic---neon spaceish. Comments should be readable (no
" grey but dimmed down color variant), not all syntax is important and some
" secondary syntax can have dimmed down color variant.
" Function: base 16 when notermguicolors; extended color details when
" termguicolors.
" Supports: gitsigns, vim-matchup, WinBar, Telescope
"
" background #15151e
" foreground #c7d5c3
"
" black#0    #181736 black#8    #352d6c black_bg #0b0a0f
" red#1      #bb695d red#9      #d39a92
" green#2    #5dbba3 green#10   #92d3c6
" yellow#3   #b0bb5d yellow#11  #cbd392 yellow_bg #575a3f
" blue#4     #93aed2 blue#12    #9592d3
" magenta#5  #695dbb magenta#13 #9a92d3
" cyan#6     #5db0bb cyan#14    #92cbd3
" white#7    #e0f0db white#15   #ffffff
"
" gray #7a78a1
" pink #bb5d8c pink_bright #d392b3

hi clear
let g:colors_name = 'somedarkterm1'

" hi Normal ctermfg=7 guifg=#e0f0db

" GROUP NAMES (:h group-name)

" Comment
hi Comment cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bb5d8c

" *Constant String Character Number Boolean Float
hi Constant ctermfg=3 guifg=#b0bb5d
hi! link String Constant
" hi String ctermfg=14 guifg=#92cbd3

" *Identifier Function
hi Identifier cterm=NONE ctermfg=12 gui=NONE guifg=#9592d3
" hi Function cterm=NONE gui=NONE ctermfg=4 guifg=#93aed2
hi Function cterm=NONE gui=NONE ctermfg=14 guifg=#92cbd3

" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement cterm=NONE gui=NONE ctermfg=2 guifg=#5dbba3
hi Keyword cterm=NONE ctermfg=13 gui=NONE guifg=#9a92d3

" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=12 guifg=#9592d3

" *Type StorageClass Structure Typedef
hi Type cterm=NONE ctermfg=14 gui=NONE guifg=#92cbd3
hi Structure ctermfg=5 guifg=#695dbb
hi! link TSProperty Type

" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special cterm=NONE ctermfg=14 gui=NONE guifg=#92cbd3 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9592d3
hi Delimiter ctermfg=4 guifg=#93aed2
hi! link TSPunctBrack Delimiter
hi! link TSTag Tag
hi! link javascriptTSTag Tag

" *Underlined
hi Underlined cterm=NONE gui=NONE ctermfg=4 guifg=#93aed2

" *Ignore

" *Error

" *Todo
hi Todo cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=9 guifg=#d392b3

" OTHER SYNTAX

hi Title cterm=bold gui=bold ctermfg=13 guifg=#9a92d3
hi markdownUrl ctermfg=5 guifg=#695dbb

" UI

hi ColorColumn ctermbg=8 guibg=#352d6c
hi Conceal ctermbg=8 guifg=#e0f0db guibg=#352d6c
hi Cursor cterm=NONE ctermbg=7 ctermfg=0 guibg=#c7d5c3 guifg=#15151e gui=NONE
hi CursorColumn cterm=bold gui=bold ctermbg=NONE guibg=#0b0a0f
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#181736
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#181736 ctermfg=13 guifg=#9a92d3
hi Directory ctermfg=6 guifg=#5db0bb
hi LineNr ctermfg=7 guifg=#7a78a1
hi MatchParen cterm=underline,italic gui=bold ctermbg=0 guibg=#575a3f guifg=#9a92d3
hi MatchParenCur cterm=underline gui=bold ctermbg=0 guibg=#575a3f
hi MatchWord cterm=underline ctermbg=0 guibg=#575a3f
hi NonText gui=NONE ctermfg=8 guifg=#352d6c
hi NvimInternalError ctermfg=9 ctermbg=9 guifg=#bb695d guibg=#bb695d
hi Pmenu ctermbg=0 ctermfg=7 guibg=#181736 guifg=#e0f0db
hi PmenuSel ctermbg=8 ctermfg=15 guibg=#352d6c guifg=#ffffff
hi PmenuThumb     ctermbg=7 guibg=#e0f0db
hi SignColumn ctermbg=NONE guibg=NONE guifg=#92cbd3
hi StatusLine cterm=NONE gui=NONE ctermbg=16 guibg=#0b0a0f ctermfg=5 guifg=#695dbb
hi StatusLineNC cterm=NONE gui=NONE ctermbg=16 guibg=#0b0a0f ctermfg=8 guifg=#352d6c
hi TabLine cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE gui=NONE
hi TabLineFill cterm=NONE gui=NONE
hi Visual cterm=italic gui=NONE ctermbg=0 guibg=#352d6c " also affects TelescopePreviewLine
hi WarningMsg ctermfg=5 guifg=#695dbb
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=5 guifg=#0b0a0f

hi DiagnosticHint ctermfg=4 guifg=#9592d3
hi DiagnosticError ctermfg=1 guifg=#d39a92
hi DiagnosticInfo ctermfg=5 guifg=#695dbb
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#d39a92
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#695dbb
hi DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#9592d3
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#352d6c

hi Error ctermbg=NONE ctermfg=9 cterm=underline guibg=NONE guifg=#d39a92 gui=underline
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#cbd392 guifg=#15151e
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#92d3c6 guifg=#15151e
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d39a92 guifg=#15151e
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#93aed2
hi SpellRare      ctermbg=5 ctermfg=15 gui=undercurl guisp=#695dbb
hi SpellLocal     ctermbg=6 ctermfg=15 gui=undercurl guisp=#5db0bb

hi! link DiagnosticWarn WarningMsg
hi! link ErrorMsg Error
hi! link MoreMsg Type
hi! link PmenuSbar Pmenu
hi! link Question Type
hi! link SpellBad ErrorMsg
hi! link WinBarNC WinSeparator
hi! link WildMenu Pmenu

" Diffs
hi DiffAdd    cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=7 guifg=#e0f0db
hi DiffDelete cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bb695d
hi DiffChange cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7a78a1
hi DiffText   cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=9 guifg=#d39a92

" Folds
hi! link Folded Comment
hi! link FoldColumn Folded

" Search
hi IncSearch cterm=NONE gui=NONE ctermbg=11 ctermfg=0 guibg=#e0f0db guifg=#15151e
hi Search cterm=NONE gui=NONE ctermbg=3 guibg=#575a3f ctermfg=0 guifg=NONE

" Telescope
hi! link TelescopePromptCounter Comment

if &bg == "light"
	hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#181736
	hi CursorLine ctermbg=NONE guibg=NONE
endif
