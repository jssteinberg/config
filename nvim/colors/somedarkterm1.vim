" somedarkterm1.vim
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
" foreground #e1e1ea fg_muted   #9896b6
"
" black#0    #2b2a3c black#8    #565478
" red#1      #bb695d red#9      #d39a92
" green#2    #5dbba3 green#10   #92d3c6
" yellow#3   #b0bb5d yellow#11  #cbd392 yellow_bg #3a3c2a
" blue#4     #95b0d3 blue#12    #9592d3
" magenta#5  #695dbb magenta#13 #9a92d3 magenta_bg #3e357e magenta_between #796fc3
" cyan#6     #5db0bb cyan#14    #92cbd3
" white#7    #e0f0db white#15   #ffffff

hi clear
let g:colors_name = 'somedarkterm1'

" hi Normal ctermfg=12 guifg=#9592d3

" GROUP NAMES (:h group-name)

" Comment
hi Comment cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=5 guifg=#796fc3

" *Constant String Character Number Boolean Float
hi Constant ctermfg=3 guifg=#b0bb5d
hi! link String Constant
" hi String ctermfg=14 guifg=#92cbd3

" *Identifier Function
hi Identifier cterm=bold ctermfg=12 gui=bold guifg=#9592d3
" hi Function cterm=NONE gui=NONE ctermfg=4 guifg=#95b0d3
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
hi Delimiter ctermfg=4 guifg=#95b0d3
hi! link TSPunctBrack Delimiter
hi! link TSTag Tag
hi! link javascriptTSTag Tag

" *Underlined
hi Underlined cterm=NONE gui=NONE ctermfg=4 guifg=#95b0d3

" *Ignore

" *Error

" *Todo
hi Todo ctermbg=NONE ctermfg=6 cterm=bold,italic guifg=#5db0bb gui=bold,italic guibg=NONE

" OTHER SYNTAX

hi Title ctermfg=13 cterm=bold guifg=#9a92d3 gui=bold
hi markdownUrl ctermfg=5 guifg=#695dbb

" UI

hi ColorColumn ctermbg=8 guibg=#565478
hi Conceal ctermbg=8 guifg=#e0f0db guibg=#565478
hi Cursor cterm=NONE ctermbg=7 ctermfg=0 guibg=#e1e1ea guifg=#15151e gui=NONE
hi CursorColumn ctermbg=NONE cterm=bold guibg=NONE gui=bold
hi CursorLine ctermbg=0 cterm=NONE guibg=#222230 gui=NONE
hi CursorLineNr ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#e0f0db gui=NONE
hi Directory ctermfg=6 guifg=#5db0bb
hi LineNr ctermfg=8 guifg=#565478
hi MatchParen cterm=underline,italic gui=bold ctermbg=0 guibg=#3e357e guifg=#9a92d3
hi MatchParenCur cterm=underline gui=bold ctermbg=0 guibg=#3e357e
hi MatchWord cterm=underline ctermbg=0 guibg=#3e357e
hi NonText ctermfg=0 guifg=#2b2a3c gui=NONE
hi NvimInternalError ctermfg=9 ctermbg=9 guifg=#bb695d guibg=#bb695d
hi Pmenu ctermbg=0 ctermfg=7 guibg=#2b2a3c guifg=#e0f0db
hi PmenuSel ctermbg=8 ctermfg=15 guibg=#565478 guifg=#ffffff
hi PmenuThumb     ctermbg=7 guibg=#e0f0db
hi SignColumn ctermbg=NONE guibg=NONE guifg=#92cbd3
hi StatusLine ctermbg=NONE ctermfg=NONE cterm=reverse guifg=NONE guibg=NONE gui=reverse
" hi StatusLineNC cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=8 guifg=#565478
hi StatusLineNC cterm=reverse gui=reverse ctermbg=NONE guibg=NONE ctermfg=8 guifg=#565478
hi TabLine cterm=NONE ctermfg=8 ctermbg=NONE guifg=#565478 guibg=NONE gui=NONE
hi TabLineFill cterm=NONE gui=NONE
hi Visual cterm=italic gui=NONE ctermbg=0 guibg=#3e357e " also affects TelescopePreviewLine
hi WarningMsg ctermfg=5 guifg=#695dbb
hi WinSeparator ctermbg=NONE ctermfg=8 guifg=#565478 guibg=NONE

hi DiagnosticHint ctermfg=8 guifg=#565478
hi DiagnosticError ctermfg=1 guifg=#d39a92
hi DiagnosticInfo ctermfg=4 guifg=#9592d3
hi DiagnosticHint ctermfg=8 guifg=#565478
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#d39a92
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#695dbb
hi DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#9592d3
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#565478

hi Error ctermbg=NONE ctermfg=9 cterm=underline guibg=NONE guifg=#d39a92 gui=underline
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#cbd392 guifg=#15151e
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#92d3c6 guifg=#15151e
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d39a92 guifg=#15151e
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#95b0d3
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
hi DiffAdd    cterm=bold ctermbg=NONE ctermfg=7 gui=bold guibg=NONE guifg=#e0f0db
hi DiffDelete cterm=bold ctermbg=NONE ctermfg=1 gui=bold guibg=NONE guifg=#bb695d
hi DiffChange cterm=NONE ctermbg=NONE ctermfg=8 gui=NONE guibg=NONE guifg=#9896b6
hi DiffText   cterm=bold ctermbg=NONE ctermfg=9 gui=bold guibg=NONE guifg=#d39a92

" Folds
hi! link Folded Comment
hi! link FoldColumn Folded

" Search
hi IncSearch ctermbg=7 ctermfg=0 cterm=NONE guibg=#e0f0db guifg=#15151e gui=NONE
" hi Search ctermbg=11 guibg=#b0bb5d ctermfg=0 guifg=#15151e
hi Search gui=underline ctermbg=11 guibg=#3a3c2a ctermfg=0 guifg=NONE

" Telescope
hi! link TelescopePromptCounter Comment

if &bg == "light"
	hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#2b2a3c
	hi CursorLine ctermbg=NONE guibg=NONE
endif
