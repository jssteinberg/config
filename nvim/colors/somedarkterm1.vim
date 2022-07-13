" somedarkterm1.vim
" Highlight some---dark terminal first, then you can change from dark to
" light. Not opposite.
"
" Design: base 8 with 16 for extra finesse; readable comments (not muted)
" Supports: vim-matchup, WinBar

set notermguicolors " rm when support gui
hi clear
let g:colors_name = 'somedarkterm1'

" Common fixes for dark and light
hi ColorColumn ctermbg=8
hi Comment ctermfg=6 cterm=italic
hi Cursor cterm=reverse
hi CursorColumn ctermbg=none cterm=bold
hi CursorLine ctermbg=0 cterm=none
hi CursorLineNr ctermbg=none ctermfg=7 cterm=none
hi DiagnosticHint ctermfg=8
hi DiffAdd ctermbg=none ctermfg=2 cterm=bold
hi DiffChange ctermbg=none ctermfg=3
hi DiffText ctermbg=none ctermfg=11 cterm=bold
hi DiffDelete ctermbg=none ctermfg=8
hi Error ctermbg=none ctermfg=9 cterm=underline
hi Folded ctermbg=none
hi LineNr ctermfg=8
hi MatchParen ctermbg=none cterm=underline,italic
hi MatchParenCur cterm=underline
hi MatchWord cterm=underline
hi NonText ctermfg=8
hi Pmenu ctermbg=8 ctermfg=15
hi PmenuSel ctermbg=7 ctermfg=0
hi PreProc ctermfg=12
hi SignColumn ctermbg=none
hi StatusLine ctermbg=7 ctermfg=0 cterm=none
hi StatusLineNC ctermfg=8 ctermbg=7
hi TabLine cterm=none ctermfg=8 ctermbg=none
hi TabLineFill cterm=none
hi Type ctermfg=2
hi Todo ctermbg=6
hi Visual ctermbg=8 ctermfg=15
hi WinSeparator ctermbg=none ctermfg=8

hi! link ErrorMsg Error
hi! link FoldColumn Folded
hi! link SpellBad ErrorMsg
hi! link WinBarNC WinSeparator

if &bg == "light"
	hi Normal ctermbg=15 ctermfg=0
endif
