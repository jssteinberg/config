" somedarkterm1.vim
"
" # Colors: somedarkterm1.
"
" Handcrafted syntax highlight for some dark terminal first, then you can
" change from dark to light. Not opposite.
"
" Design: purple blueish theme with cyan, yellow and whiteish primaries, based
" on a certain profile pic---neon spaceish. Comments should be readable (no
" grey but dimmed down color variant), not all syntax is important and some
" secondary syntax can have dimmed down color variant.
" Function: base 16 when notermguicolors; extended color details when
" termguicolors.
" Supports: gitsigns, vim-matchup, WinBar, Telescope
"
" background #13131b
" foreground #cad7c6
"
" black#0    #171532 black#8    #372f6f black_bg #060609
" red#1      #bb695d red#9      #d59d95
" green#2    #5dbba3 green#10   #95d5c8
" yellow#3   #b0bb5d yellow#11  #cdd595 yellow_bg #5a5d41
" blue#4     #97b1d3 blue#12    #9995d5 blue_bg #2d486c
" magenta#5  #695dbb magenta#13 #9d95d5
" cyan#6     #5db0bb cyan#14    #95cdd5
" white#7    #e0f0db white#15   #ffffff
"
" gray #7d78a1
" pink #bb5d8c pink_bright #d595b5 pink_bg #6c2d4d

hi clear
let g:colors_name = 'somedarkterm1'

" hi Normal guibg=#13131b guifg=#cad7c6

" GROUP NAMES (:h group-name)

" Comment
hi Comment cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bb5d8c

" *Constant String Character Number Boolean Float
hi Constant ctermfg=3 guifg=#b0bb5d
hi! link String Constant
" hi String ctermfg=14 guifg=#95cdd5

" *Identifier Function
hi Identifier cterm=NONE ctermfg=12 gui=NONE guifg=#9995d5
" hi Function cterm=NONE gui=NONE ctermfg=4 guifg=#97b1d3
hi Function cterm=NONE gui=NONE ctermfg=14 guifg=#95cdd5

" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement cterm=NONE gui=NONE ctermfg=2 guifg=#5dbba3
hi Keyword cterm=NONE ctermfg=13 gui=NONE guifg=#9d95d5

" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=12 guifg=#9995d5

" *Type StorageClass Structure Typedef
hi Type cterm=NONE ctermfg=14 gui=NONE guifg=#95cdd5
hi Structure ctermfg=5 guifg=#695dbb
hi! link TSProperty Type

" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special cterm=NONE ctermfg=14 gui=NONE guifg=#95cdd5 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9995d5
hi Delimiter ctermfg=4 guifg=#97b1d3
hi! link TSPunctBrack Delimiter
hi! link TSTag Tag
hi! link javascriptTSTag Tag

" *Underlined
hi Underlined cterm=NONE gui=NONE ctermfg=4 guifg=#97b1d3

" *Ignore

" *Error

" *Todo
hi Todo cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=9 guifg=#d595b5

" OTHER SYNTAX

hi Title cterm=NONE gui=NONE ctermfg=7 guifg=#e0f0db
hi markdownUrl ctermfg=5 guifg=#695dbb

" UI

hi ColorColumn ctermbg=8 guibg=#372f6f
hi Conceal ctermbg=8 guifg=#e0f0db guibg=#372f6f
hi Cursor cterm=NONE ctermbg=7 ctermfg=0 guibg=#cad7c6 guifg=#13131b gui=NONE
hi CursorColumn cterm=bold gui=bold ctermbg=NONE guibg=#060609
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#171532
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#171532 ctermfg=13 guifg=#9d95d5
hi Directory ctermfg=6 guifg=#5db0bb
hi LineNr ctermfg=5 guifg=#7d78a1
hi MatchParen cterm=italic gui=italic ctermbg=8 guibg=#372f6f guifg=#9d95d5
hi MatchParenCur cterm=NONE gui=NONE ctermbg=8 guibg=#372f6f
hi MatchWord cterm=italic gui=italic ctermbg=8 guibg=#372f6f
hi NonText gui=NONE ctermfg=8 guifg=#372f6f
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bb695d guibg=#bb695d
hi Pmenu ctermbg=0 ctermfg=7 guibg=#171532 guifg=#e0f0db
hi PmenuSel ctermbg=8 ctermfg=15 guibg=#372f6f guifg=#ffffff
hi PmenuThumb     ctermbg=7 guibg=#e0f0db
hi SignColumn ctermbg=NONE guibg=NONE guifg=#95cdd5
hi StatusLine cterm=NONE gui=NONE ctermbg=16 guibg=#060609 ctermfg=5 guifg=#695dbb
hi StatusLineNC cterm=NONE gui=NONE ctermbg=16 guibg=#060609 ctermfg=8 guifg=#372f6f
hi TabLine cterm=NONE ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE gui=NONE
hi TabLineFill cterm=NONE gui=NONE
hi Visual cterm=bold gui=NONE ctermbg=8 guibg=#2d486c " also affects TelescopePreviewLine
hi WarningMsg ctermfg=5 guifg=#695dbb
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=5 guifg=#060609

hi DiagnosticHint ctermfg=4 guifg=#9995d5
hi DiagnosticError ctermfg=1 guifg=#bb695d
hi DiagnosticInfo ctermfg=5 guifg=#695dbb
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#bb695d
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#695dbb
hi DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#9995d5
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#372f6f

hi Error ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#bb695d gui=underline
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#cdd595 guifg=#13131b
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#95d5c8 guifg=#13131b
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d59d95 guifg=#13131b
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#97b1d3
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
hi DiffChange cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi DiffText   cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=7 guifg=#e0f0db

" Folds
hi! link Folded Comment
hi! link FoldColumn Folded

" Search
hi IncSearch cterm=NONE gui=NONE ctermbg=11 ctermfg=0 guibg=#e0f0db guifg=#13131b
hi Search cterm=NONE gui=NONE ctermbg=3 guibg=#5a5d41 ctermfg=0 guifg=NONE

" PLUGINS

" mini.nvim
hi MiniCursorword cterm=NONE gui=NONE ctermbg=8 guibg=#372f6f

" Telescope
hi! link TelescopePromptCounter Comment

if &bg == "light"
	hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#171532
	hi CursorLine ctermbg=NONE guibg=NONE
endif
