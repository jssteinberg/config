" somedarkterm1.vim
" Highlight some, dark terminal first

hi clear
let g:colors_name = 'somedarkterm1'

" Common fixes for dark and light
hi ColorColumn ctermbg=8
hi CursorColumn ctermbg=0 cterm=bold
hi CursorLine ctermbg=0 cterm=none
hi CursorLineNr ctermbg=none cterm=none
hi DiffAdd ctermbg=none ctermfg=3 cterm=bold
hi DiffChange ctermbg=none ctermfg=2
hi DiffText ctermbg=none ctermfg=10 cterm=bold
hi DiffDelete ctermbg=none ctermfg=8
hi LineNr ctermfg=8
hi MatchParen ctermbg=none cterm=underline,italic
hi MatchParenCur cterm=underline
hi MatchWord cterm=underline
hi NonText ctermfg=8
hi SignColumn ctermbg=none
hi StatusLineNC ctermfg=8 ctermbg=0
hi TabLine cterm=none ctermfg=8 ctermbg=none
hi TabLineFill cterm=none
hi WinSeparator ctermbg=none ctermfg=8

if &bg == 'dark'
endif

if &bg == 'light'
endif

" cterm={attr-list}			*attr-list* *highlight-cterm* *E418*
" 	attr-list is a comma-separated list (without spaces) of the
" 	following items (in any order):
" 		bold
" 		underline
" 		underlineline	double underline
" 		undercurl	curly underline
" 		underdot	dotted underline
" 		underdash	dashed underline
" 		strikethrough
" 		reverse
" 		inverse		same as reverse
" 		italic
" 		standout
" 		nocombine	override attributes instead of combining them
" 		NONE		no attributes used (used to reset it)
"
" 	Note that "bold" can be used here and by using a bold font.  They
" 	have the same effect.
" 	"underlineline", "undercurl", "underdot", and "underdash" fall back
" 	to "underline" in a terminal that does not support them. The color is
" 	set using |highlight-guisp|.
