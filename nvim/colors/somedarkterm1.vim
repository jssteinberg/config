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
" blue#4     #5d86bb blue#12    #9794d4 blue_between #6f93c3
" magenta#5  #695dbb magenta#13 #9c94d4 magenta_bg   #2c2559
" cyan#6     #5db0bb cyan#14    #94ccd4
" white#7    #e0f0db white#15   #ffffff

hi clear
let g:colors_name = 'somedarkterm1'

" GROUP NAMES (:h group-name)

"Comment
hi Comment ctermfg=4 guifg=#6f93c3

" *Constant String Character Number Boolean Float
hi Constant ctermfg=3 guifg=#b0bb5d
hi String ctermfg=14 guifg=#94ccd4

" *Identifier Function
hi Identifier cterm=NONE ctermfg=12 gui=bold guifg=#9794d4
hi Function cterm=NONE ctermfg=6 gui=NONE guifg=#5db0bb

" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement ctermfg=6 guifg=#5db0bb

" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=12 guifg=#9794d4

" *Type StorageClass Structure Typedef
hi Type ctermfg=14 guifg=#94ccd4 gui=NONE
hi Structure ctermfg=5 guifg=#695dbb

" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special ctermfg=10 guifg=#94d4c7 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9794d4
hi Delimiter ctermfg=5 guifg=#695dbb

" *Underlined
hi Underlined ctermfg=12 guifg=#9794d4

" *Ignore

" *Error

" *Todo
hi Todo ctermbg=NONE ctermfg=6 cterm=bold,italic guifg=#5db0bb gui=bold,italic guibg=NONE

" OTHER SYNTAX

hi Title ctermfg=13 cterm=bold guifg=#9c94d4 gui=bold
hi markdownUrl ctermfg=5 guifg=#695dbb
hi! link javascriptTSTag Tag

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
hi MatchParen ctermbg=0 cterm=underline,italic guibg=#2d2c3f guifg=#9c94d4 gui=bold
hi MatchParenCur cterm=underline ctermbg=0 guibg=#2d2c3f gui=bold
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
hi Visual ctermbg=0 cterm=italic guibg=#2c2559 " also affects TelescopePreviewLine
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
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#5d86bb
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

if &bg == "light"
	hi Normal ctermbg=15 ctermfg=0 guibg=#ffffff guifg=#2d2c3f
	hi CursorLine ctermbg=NONE guibg=NONE
endif

" ColorColumn	Used for the columns set with 'colorcolumn'.
" Conceal		Placeholder characters substituted for concealed
" 		text (see 'conceallevel').
" 							*hl-CurSearch*
" CurSearch	Used for highlighting a search pattern under the cursor
" 		(see 'hlsearch').
" 							*hl-Cursor*
" Cursor		Character under the cursor.
" lCursor		Character under the cursor when |language-mapping|
" 		is used (see 'guicursor').
" 							*hl-CursorIM*
" CursorIM	Like Cursor, but used when in IME mode. |CursorIM|
" 							*hl-CursorColumn*
" CursorColumn	Screen-column at the cursor, when 'cursorcolumn' is set.
" 							*hl-CursorLine*
" CursorLine	Screen-line at the cursor, when 'cursorline' is set.
" 		Low-priority if foreground (ctermfg OR guifg) is not set.
" 							*hl-Directory*
" Directory	Directory names (and other special names in listings).
" 							*hl-DiffAdd*
" DiffAdd		Diff mode: Added line. |diff.txt|
" 							*hl-DiffChange*
" DiffChange	Diff mode: Changed line. |diff.txt|
" 							*hl-DiffDelete*
" DiffDelete	Diff mode: Deleted line. |diff.txt|
" 							*hl-DiffText*
" DiffText	Diff mode: Changed text within a changed line. |diff.txt|
" 							*hl-EndOfBuffer*
" EndOfBuffer	Filler lines (~) after the end of the buffer.
" 		By default, this is highlighted like |hl-NonText|.
" 							*hl-TermCursor*
" TermCursor	Cursor in a focused terminal.
" 							*hl-TermCursorNC*
" TermCursorNC	Cursor in an unfocused terminal.
" 							*hl-ErrorMsg*
" ErrorMsg	Error messages on the command line.
" 							*hl-WinSeparator*
" WinSeparator	Separators between window splits.
" 							*hl-Folded*
" Folded		Line used for closed folds.
" 							*hl-FoldColumn*
" FoldColumn	'foldcolumn'
" 							*hl-SignColumn*
" SignColumn	Column where |signs| are displayed.
" 							*hl-IncSearch*
" IncSearch	'incsearch' highlighting; also used for the text replaced with
" 		":s///c".
" 							*hl-Substitute*
" Substitute	|:substitute| replacement text highlighting.
"
" 							*hl-LineNr*
" LineNr		Line number for ":number" and ":#" commands, and when 'number'
" 		or 'relativenumber' option is set.
" 							*hl-LineNrAbove*
" LineNrAbove	Line number for when the 'relativenumber'
" 		option is set, above the cursor line.
" 							*hl-LineNrBelow*
" LineNrBelow	Line number for when the 'relativenumber'
" 		option is set, below the cursor line.
" 							*hl-CursorLineNr*
" CursorLineNr	Like LineNr when 'cursorline' is set and 'cursorlineopt'
" 		contains "number" or is "both", for the cursor line.
" 							*hl-CursorLineSign*
" CursorLineSign	Like SignColumn when 'cursorline' is set for the cursor line.
" 							*hl-CursorLineFold*
" CursorLineFold	Like FoldColumn when 'cursorline' is set for the cursor line.
" 							*hl-MatchParen*
" MatchParen	Character under the cursor or just before it, if it
" 		is a paired bracket, and its match. |pi_paren.txt|
"
" 							*hl-ModeMsg*
" ModeMsg		'showmode' message (e.g., "-- INSERT --").
" 							*hl-MsgArea*
" MsgArea		Area for messages and cmdline.
" 							*hl-MsgSeparator*
" MsgSeparator	Separator for scrolled messages, `msgsep` flag of 'display'.
" 							*hl-MoreMsg*
" MoreMsg		|more-prompt|
" 							*hl-NonText*
" NonText		'@' at the end of the window, characters from 'showbreak'
" 		and other characters that do not really exist in the text
" 		(e.g., ">" displayed when a double-wide character doesn't
" 		fit at the end of the line). See also |hl-EndOfBuffer|.
" 							*hl-Normal*
" Normal		Normal text.
" 							*hl-NormalFloat*
" NormalFloat	Normal text in floating windows.
" 							*hl-NormalNC*
" NormalNC	Normal text in non-current windows.
" 							*hl-Pmenu*
" Pmenu		Popup menu: Normal item.
" 							*hl-PmenuSel*
" PmenuSel	Popup menu: Selected item.
" 							*hl-PmenuSbar*
" PmenuSbar	Popup menu: Scrollbar.
" 							*hl-PmenuThumb*
" PmenuThumb	Popup menu: Thumb of the scrollbar.
" 							*hl-Question*
" Question	|hit-enter| prompt and yes/no questions.
" 							*hl-QuickFixLine*
" QuickFixLine	Current |quickfix| item in the quickfix window. Combined with
"                 |hl-CursorLine| when the cursor is there.
" 							*hl-Search*
" Search		Last search pattern highlighting (see 'hlsearch').
" 		Also used for similar items that need to stand out.
" 							*hl-SpecialKey*
" SpecialKey	Unprintable characters: Text displayed differently from what
" 		it really is. But not 'listchars' whitespace. |hl-Whitespace|
" 							*hl-SpellBad*
" SpellBad	Word that is not recognized by the spellchecker. |spell|
" 		Combined with the highlighting used otherwise.
" 							*hl-SpellCap*
" SpellCap	Word that should start with a capital. |spell|
" 		Combined with the highlighting used otherwise.
" 							*hl-SpellLocal*
" SpellLocal	Word that is recognized by the spellchecker as one that is
" 		used in another region. |spell|
" 		Combined with the highlighting used otherwise.
" 							*hl-SpellRare*
" SpellRare	Word that is recognized by the spellchecker as one that is
" 		hardly ever used. |spell|
" 		Combined with the highlighting used otherwise.
" 							*hl-StatusLine*
" StatusLine	Status line of current window.
" 							*hl-StatusLineNC*
" StatusLineNC	Status lines of not-current windows.
" 		Note: If this is equal to "StatusLine", Vim will use "^^^" in
" 		the status line of the current window.
" 							*hl-TabLine*
" TabLine		Tab pages line, not active tab page label.
" 							*hl-TabLineFill*
" TabLineFill	Tab pages line, where there are no labels.
" 							*hl-TabLineSel*
" TabLineSel	Tab pages line, active tab page label.
" 							*hl-Title*
" Title		Titles for output from ":set all", ":autocmd" etc.
" 							*hl-Visual*
" Visual		Visual mode selection.
"  							*hl-VisualNOS*
" VisualNOS	Visual mode selection when vim is "Not Owning the Selection".
" 							*hl-WarningMsg*
" WarningMsg	Warning messages.
" 							*hl-Whitespace*
" Whitespace	"nbsp", "space", "tab", "multispace", "lead" and "trail"
" 		in 'listchars'.
" 							*hl-WildMenu*
" WildMenu	Current match in 'wildmenu' completion.
" 							*hl-WinBar*
" WinBar		Window bar of current window.
" 							*hl-WinBarNC*
" WinBarNC	Window bar of not-current windows.
"
" 					*hl-User1* *hl-User1..9* *hl-User9*
" The 'statusline' syntax allows the use of 9 different highlights in the
" statusline and ruler (via 'rulerformat').  The names are User1 to User9.
"
" For the GUI you can use the following groups to set the colors for the menu,
" scrollbars and tooltips.  They don't have defaults.  This doesn't work for the
" Win32 GUI.  Only three highlight arguments have any effect here: font, guibg,
" and guifg.
"
" 							*hl-Menu*
" Menu		Current font, background and foreground colors of the menus.
" 		Also used for the toolbar.
" 		Applicable highlight arguments: font, guibg, guifg.
"
" 							*hl-Scrollbar*
" Scrollbar	Current background and foreground of the main window's
" 		scrollbars.
" 		Applicable highlight arguments: guibg, guifg.
"
" 							*hl-Tooltip*
" Tooltip		Current font, background and foreground of the tooltips.
" 		Applicable highlight arguments: font, guibg, guifg.
