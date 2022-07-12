" somedarkterm1.vim
" Highlight some---dark terminal first, then you can change from dark to
" light. Not opposite.
" Supports: vim-matchup, WinBar

set notermguicolors " rm when support gui
hi clear
let g:colors_name = 'somedarkterm1'

" Common fixes for dark and light
hi ColorColumn ctermbg=8
hi Cursor cterm=reverse
hi CursorColumn ctermbg=none cterm=bold
hi CursorLine ctermbg=0 cterm=none
hi CursorLineNr ctermbg=none ctermfg=7 cterm=none
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
hi SignColumn ctermbg=none
hi StatusLineNC ctermfg=8 ctermbg=0
hi TabLine cterm=none ctermfg=8 ctermbg=none
hi TabLineFill cterm=none
hi Visual ctermbg=8 ctermfg=15
hi WinSeparator ctermbg=none ctermfg=8

hi! link ErrorMsg Error
hi! link FoldColumn Folded
hi! link SpellBad ErrorMsg
hi! link WinBarNC WinSeparator
