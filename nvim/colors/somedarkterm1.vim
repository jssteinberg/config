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
" foreground #e1e1ea fg_muted   #a8a7c1
"
" black#0    #2d2c3f black#8    #615e87
" red#1      #bb695d red#9      #d49c94
" green#2    #5dbba3 green#10   #94d4c7
" yellow#3   #b0bb5d yellow#11  #ccd494
" blue#4     #95b0d3 blue#12    #9794d4 blue_muted #5d86bb
" magenta#5  #695dbb magenta#13 #9c94d4 magenta_bg #251f4c
" cyan#6     #5db0bb cyan#14    #94ccd4
" white#7    #e0f0db white#15   #ffffff

hi clear
let g:colors_name = 'somedarkterm1'

" hi Normal ctermfg=12 guifg=#9794d4

" GROUP NAMES (:h group-name)

" Comment
hi Comment ctermfg=5 guifg=#695dbb

" *Constant String Character Number Boolean Float
hi Constant ctermfg=3 guifg=#b0bb5d
hi String ctermfg=14 guifg=#94ccd4

" *Identifier Function
hi Identifier cterm=bold ctermfg=12 gui=bold guifg=#9794d4
" hi Function cterm=NONE gui=NONE ctermfg=4 guifg=#95b0d3
hi Function cterm=NONE gui=NONE ctermfg=13 guifg=#9c94d4

" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement cterm=bold ctermfg=6 gui=bold guifg=#5db0bb
hi Keyword cterm=NONE ctermfg=6 gui=NONE guifg=#5db0bb

" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=12 guifg=#9794d4

" *Type StorageClass Structure Typedef
hi Type cterm=NONE ctermfg=14 gui=NONE guifg=#94ccd4
hi Structure ctermfg=5 guifg=#695dbb
hi! link TSProperty Type

" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special cterm=none ctermfg=10 gui=none guifg=#94d4c7 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9794d4
hi Delimiter ctermfg=4 guifg=#95b0d3
hi! link TSPunctBrack Delimiter
hi! link TSTag Tag
hi! link javascriptTSTag Tag

" *Underlined
hi Underlined ctermfg=12 guifg=#9794d4

" *Ignore

" *Error

" *Todo
hi Todo ctermbg=NONE ctermfg=6 cterm=bold,italic guifg=#5db0bb gui=bold,italic guibg=NONE

" OTHER SYNTAX

hi Title ctermfg=13 cterm=bold guifg=#9c94d4 gui=bold
hi markdownUrl ctermfg=5 guifg=#695dbb

" UI

hi ColorColumn ctermbg=8 guibg=#615e87
hi Conceal ctermbg=8 guifg=#e0f0db guibg=#615e87
hi Cursor cterm=NONE ctermbg=7 ctermfg=0 guibg=#e1e1ea guifg=#15151e gui=NONE
hi CursorColumn ctermbg=NONE cterm=bold guibg=NONE gui=bold
hi CursorLine ctermbg=0 cterm=NONE guibg=#222230 gui=NONE
hi CursorLineNr ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#e0f0db gui=NONE
hi Directory ctermfg=6 guifg=#5db0bb
hi Folded ctermbg=NONE cterm=italic guibg=NONE guifg=#94ccd4 gui=italic
hi LineNr ctermfg=8 guifg=#615e87
hi MatchParen cterm=underline,italic gui=bold ctermbg=0 guibg=#2d2c3f guifg=#9c94d4
hi MatchParenCur cterm=underline gui=bold ctermbg=0 guibg=#2d2c3f
hi MatchWord cterm=underline ctermbg=0 guibg=#2d2c3f
hi NonText ctermfg=0 guifg=#2d2c3f gui=NONE
hi NvimInternalError ctermfg=9 ctermbg=9 guifg=#bb695d guibg=#bb695d
hi Pmenu ctermbg=0 ctermfg=7 guibg=#2d2c3f guifg=#e0f0db
hi PmenuSel ctermbg=8 ctermfg=15 guibg=#615e87 guifg=#ffffff
hi PmenuThumb     ctermbg=7 guibg=#e0f0db
hi SignColumn ctermbg=NONE guibg=NONE guifg=#94ccd4
hi StatusLine ctermbg=NONE ctermfg=NONE cterm=reverse guifg=NONE guibg=NONE gui=reverse
hi StatusLineNC ctermfg=8 ctermbg=NONE cterm=reverse guibg=NONE guifg=#615e87 gui=reverse
hi TabLine cterm=NONE ctermfg=8 ctermbg=NONE guifg=#615e87 guibg=NONE gui=NONE
hi TabLineFill cterm=NONE gui=NONE
hi Visual cterm=italic gui=NONE ctermbg=0 guibg=#251f4c " also affects TelescopePreviewLine
hi WarningMsg ctermfg=5 guifg=#695dbb
hi WinSeparator ctermbg=NONE ctermfg=8 guifg=#615e87 guibg=NONE

hi DiagnosticHint ctermfg=8 guifg=#615e87
hi DiagnosticError ctermfg=1 guifg=#d49c94
hi DiagnosticInfo ctermfg=4 guifg=#9794d4
hi DiagnosticHint ctermfg=8 guifg=#615e87
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#d49c94
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#695dbb
hi DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#9794d4
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#615e87

hi Error ctermbg=NONE ctermfg=9 cterm=underline guibg=NONE guifg=#d49c94 gui=underline
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#ccd494 guifg=#15151e
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#94d4c7 guifg=#15151e
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d49c94 guifg=#15151e
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#95b0d3
hi SpellRare      ctermbg=5 ctermfg=15 gui=undercurl guisp=#695dbb
hi SpellLocal     ctermbg=6 ctermfg=15 gui=undercurl guisp=#5db0bb

hi! link DiagnosticWarn WarningMsg
hi! link ErrorMsg Error
hi! link FoldColumn Folded
hi! link MoreMsg Type
hi! link PmenuSbar Pmenu
hi! link Question Type
hi! link SpellBad ErrorMsg
hi! link WinBarNC WinSeparator
hi! link WildMenu Pmenu

" Diffs
hi DiffAdd    cterm=bold ctermbg=NONE ctermfg=7 gui=bold guibg=NONE guifg=#e0f0db
hi DiffDelete cterm=bold ctermbg=NONE ctermfg=1 gui=bold guibg=NONE guifg=#bb695d
hi DiffChange cterm=NONE ctermbg=NONE ctermfg=8 gui=NONE guibg=NONE guifg=#a8a7c1
hi DiffText   cterm=bold ctermbg=NONE ctermfg=9 gui=bold guibg=NONE guifg=#d49c94

" Search
hi IncSearch ctermbg=7 ctermfg=0 cterm=NONE guibg=#e0f0db guifg=#15151e gui=NONE
hi Search ctermbg=11 ctermfg=0 guibg=#ccd494 guifg=#15151e

" Telescope
hi! link TelescopePromptCounter Comment

if &bg == "light"
	hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#2d2c3f
	hi CursorLine ctermbg=NONE guibg=NONE
endif
