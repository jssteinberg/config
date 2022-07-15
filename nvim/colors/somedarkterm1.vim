" somedarkterm1.vim
" Highlight some---dark terminal first, then you can change from dark to
" light. Not opposite.
"
" Design: base 16 when notermguicolors; extended color details when termguicolors; readable comments (not muted).
" Supports: gitsigns, vim-matchup, WinBar, Telescope
"
"   background #15151e
"   foreground #e1e1ea
"   black      #0      #2d2c3f
"   black      #8      #615e87
"   red        #1      #bb695d
"   red        #9      #d49c94
"   green      #2      #5dbba3
"   green      #10     #94d4c7
"   yellow     #3      #b0bb5d
"   yellow     #11     #ccd494
"   blue       #4      #5d86bb
"   blue       #12     #9794d4
"   magenta    #5      #695dbb
"   magenta    #13     #9c94d4
"   cyan       #6      #5db0bb
"   cyan       #14     #94ccd4
"   white      #7      #e0f0db
"   white      #15     #ffffff

" set notermguicolors " rm when support gui
hi clear
let g:colors_name = 'somedarkterm1'

" SYNTAX

hi Comment ctermfg=2 cterm=italic guifg=#5dbba3 gui=italic

hi Constant ctermfg=3 guifg=#b0bb5d
hi Delimiter ctermfg=5 guifg=#695dbb
hi Identifier cterm=none ctermfg=12 guifg=#9794d4
hi PreProc ctermfg=12 guifg=#9794d4
hi Special ctermfg=10 guifg=#94d4c7 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9794d4
hi Statement ctermfg=6 guifg=#5db0bb
hi String ctermfg=14 guifg=#94ccd4
hi Title ctermfg=13 cterm=bold guifg=#9c94d4 gui=bold
hi Todo ctermbg=none ctermfg=6 cterm=bold,italic guifg=#5db0bb gui=bold,italic guibg=none
hi Type ctermfg=14 guifg=#94ccd4 gui=none
hi Underlined ctermfg=12 guifg=#9794d4

hi markdownUrl ctermfg=5 guifg=#695dbb

hi! link javascriptTSTag Tag

" DEBUG

hi DiagnosticHint ctermfg=8 guifg=#615e87
hi DiagnosticError ctermfg=1 guifg=#d49c94
hi DiagnosticWarn ctermfg=3 guifg=#ccd494
hi DiagnosticInfo ctermfg=4 guifg=#9794d4
hi DiagnosticHint ctermfg=8 guifg=#615e87
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#d49c94
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#ccd494
hi DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#9794d4
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#615e87
hi DiffAdd ctermbg=none ctermfg=2 cterm=bold guibg=none gui=bold
hi DiffChange ctermbg=none ctermfg=3 guibg=none
hi DiffText ctermbg=none ctermfg=11 cterm=bold guibg=none gui=bold
hi DiffDelete ctermbg=none ctermfg=8 guifg=#615e87 guibg=none
hi Error ctermbg=none ctermfg=9 cterm=underline guibg=none guifg=#d49c94 gui=underline
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#ccd494 guifg=#15151e
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#94d4c7 guifg=#15151e
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d49c94 guifg=#15151e
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#5d86bb
hi SpellRare      ctermbg=5 ctermfg=15 gui=undercurl guisp=#695dbb
hi SpellLocal     ctermbg=6 ctermfg=15 gui=undercurl guisp=#5db0bb

hi! link ErrorMsg Error
hi! link SpellBad ErrorMsg

" UI

hi ColorColumn ctermbg=8 guibg=#615e87
hi Conceal ctermbg=8 guifg=#e0f0db guibg=#615e87
hi Cursor cterm=reverse gui=reverse
hi CursorColumn ctermbg=none cterm=bold guibg=none gui=bold
hi CursorLine ctermbg=0 cterm=none guibg=#2d2c3f gui=none
hi CursorLineNr ctermbg=none ctermfg=7 cterm=none guibg=none guifg=#e0f0db gui=none
hi Directory ctermfg=6 guifg=#5db0bb
hi Folded ctermbg=none cterm=italic guibg=none guifg=#94ccd4 gui=italic
hi LineNr ctermfg=8 guifg=#615e87
hi MatchParen ctermbg=none cterm=underline,italic guibg=none gui=underline,italic
hi MatchParenCur cterm=underline gui=underline
hi MatchWord cterm=underline gui=underline
hi NonText ctermfg=0 guifg=#2d2c3f gui=none
hi NvimInternalError ctermfg=9 ctermbg=9 guifg=#bb695d guibg=#bb695d
hi Pmenu ctermbg=0 ctermfg=7 guibg=#2d2c3f guifg=#e0f0db
hi PmenuSel ctermbg=8 ctermfg=15 guibg=#615e87 guifg=#ffffff
hi PmenuThumb     ctermbg=7 guibg=#e0f0db
hi Search ctermfg=11 ctermbg=none cterm=underline guibg=none guifg=#ccd494 gui=underline
hi SignColumn ctermbg=none guibg=none guifg=#94ccd4
hi StatusLine ctermbg=none ctermfg=none cterm=reverse guibg=#15151e guifg=#e1e1ea gui=none
hi StatusLineNC ctermfg=8 ctermbg=none cterm=reverse guibg=none guifg=#615e87 gui=reverse
hi TabLine cterm=none ctermfg=8 ctermbg=none guifg=#615e87 guibg=none gui=none
hi TabLineFill cterm=none gui=none
hi Visual ctermbg=0 cterm=italic guibg=#2d2c3f gui=italic " also affects TelescopePreviewLine
hi WarningMsg ctermfg=9 guifg=#d49c94
hi WinSeparator ctermbg=none ctermfg=8 guifg=#615e87 guibg=none

hi! link FoldColumn Folded
hi! link MoreMsg Type
hi! link PmenuSbar Pmenu
hi! link WinBarNC WinSeparator
hi! link WildMenu Pmenu
hi! link Question Type

" PLUGINS

if &bg == "light"
	hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#2d2c3f
	hi CursorLine ctermbg=none guibg=none
endif
