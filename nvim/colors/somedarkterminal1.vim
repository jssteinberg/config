" somedarkterminal1.vim

" In the night, outside of a neon illuminated city-park WC...
"
" Handcrafted syntax highlight for some dark terminals first (defaults to
" background NONE to use terminal background), but with good contrasts.
"
" bg #121118 fg #e6e5ed
" black#0    #1a1636 black#8    #342c6d black_bg #05040b
" red#1      #bc675c red#9      #d6a19a
" green#2    #80bc5c green#10   #a8d69a
" yellow#3   #bc985c yellow#11  #ced69a yellow_bg #646d2c
" blue#4     #9ab0d6 blue#12    #9d9ad6 blue_bg #2c446d
" magenta#5  #685cbc magenta#13 #a19ad6
" cyan#6     #5cb1bc cyan#14    #9aced6
" white#7    #e5f2e0 white#15   #ffffff
"
" gray #7d78a1
" violet #985cbc violet_bright #bf9ad6 violet_bg #552c6d
"
" Options:
" - g:somedarkterminal1_bg = 0 or 1. 0 for NONE, 1 for background.
" - g:somedarkterminal1_statusline_bg = 'none' or 'black'
" Design: Colorscheme of blue tones with cyan and light green foregrounds.
" Based on a neon illuminated city-park WC... `Comments` should be readable
" (no dimmed grey).
" Supports: gitsigns, vim-matchup, WinBar, Telescope
" Util:
" - Error: red#1
" - Info: violet*/magenta#5
" - Warning: yellow#3
" - Selection (bg): violet_bg
"
" Make gui only:
" :%s/\v cterm[^ ]*//g | %s/\vsomedarkterminal1(['|.])/somedarkterminal1_gui\1/g

hi clear

let g:colors_name = 'somedarkterminal1'

if &bg == 'light' | set bg=dark | endif

if get(g:, 'somedarkterminal1_bg', '0')
	hi Normal guibg=#121118 guifg=#e6e5ed
else
	hi Normal guifg=#e6e5ed
endif

" GROUP NAMES (:h group-name)

" Comment
hi Comment cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=5 guifg=#985cbc
" *Constant String Character Number Boolean Float
hi Constant ctermfg=3 guifg=#bc985c
hi String ctermfg=11 guifg=#ced69a
" *Identifier Function
hi Identifier cterm=NONE ctermfg=12 gui=NONE guifg=#9d9ad6
hi Function cterm=NONE gui=NONE ctermfg=14 guifg=#9aced6
" *Statement Conditional Repeat Label Operator Keyword Exception
hi Statement cterm=NONE gui=NONE ctermfg=4 guifg=#9ab0d6
hi Keyword cterm=NONE ctermfg=13 gui=NONE guifg=#a19ad6
" *PreProc Include Define Macro PreCondit
hi PreProc ctermfg=12 guifg=#9d9ad6
" *Type StorageClass Structure Typedef
hi Type cterm=NONE gui=NONE ctermfg=10 guifg=#a8d69a
hi Structure ctermfg=5 guifg=#685cbc
" *Special SpecialChar Tag Delimiter SpecialComment Debug
hi Special cterm=NONE ctermfg=14 gui=NONE guifg=#9aced6 " also links to TelescopeMatch
hi SpecialKey ctermfg=12 guifg=#9d9ad6
hi Delimiter ctermfg=4 guifg=#9ab0d6
" *Underlined
hi Underlined cterm=NONE gui=NONE ctermfg=4 guifg=#9ab0d6
" *Ignore
" *Error
" *Todo
hi Todo cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=9 guifg=#bf9ad6
" Other syntax
hi Bold cterm=bold gui=bold
hi Italic cterm=italic gui=italic
hi Title cterm=NONE gui=NONE ctermfg=11 guifg=#ced69a
hi TooLong cterm=underline gui=underline ctermfg=3 guifg=#bc985c
hi TSTagAttribute ctermfg=14 guifg=#9aced6
hi markdownUrl ctermfg=5 guifg=#685cbc
" Linked syntax
hi! link javascriptTSTag Tag
hi! link markdown_inlineTSURI markdownUrl
hi! link Tag Type
hi! link TSPunctBrack Delimiter
hi! link TSTag Tag
hi! link TSProperty Type

" UI

hi ColorColumn ctermbg=8 guibg=#05040b
hi Conceal ctermbg=8 guibg=#342c6d
hi Cursor cterm=NONE ctermbg=7 ctermfg=0 guibg=#e6e5ed guifg=#121118 gui=NONE
hi CursorColumn cterm=bold gui=bold ctermbg=0 guibg=#1a1636
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 " bg should have slightly better contrast
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=13 guifg=#a19ad6
hi Directory cterm=bold gui=bold ctermfg=5 guifg=#685cbc
hi LineNr ctermfg=5 guifg=#7d78a1
hi MatchParen cterm=italic gui=NONE ctermbg=8 guibg=#342c6d guifg=#a19ad6
" hi MatchParenCur cterm=NONE gui=NONE ctermbg=8 guibg=#342c6d
hi MatchWord cterm=italic gui=NONE ctermbg=8 guibg=#342c6d
hi NonText gui=NONE ctermfg=8 guifg=#342c6d
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bc675c guibg=#bc675c
hi Pmenu      ctermbg=0 guibg=#05040b ctermfg=5 guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb ctermbg=8 guibg=#342c6d " Pmenu affects some floating windows
hi SignColumn ctermbg=NONE guibg=NONE guifg=#9aced6
hi TabLineSel cterm=NONE gui=NONE ctermfg=13 guifg=#a19ad6
hi Visual cterm=bold gui=NONE ctermbg=8 guibg=#552c6d " also affects TelescopePreviewLine
hi WarningMsg ctermfg=3 guifg=#bc985c
hi WinBar cterm=bold gui=bold ctermfg=13 guifg=#a19ad6

hi DiagnosticHint ctermfg=5 guifg=#685cbc
hi DiagnosticError ctermfg=1 guifg=#bc675c
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#d6a19a
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#bc985c
hi DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#a19ad6
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#9ab0d6

hi Error ctermbg=NONE ctermfg=1 cterm=underline guibg=NONE guifg=#bc675c gui=underline
hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#ced69a guifg=#121118
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#a8d69a guifg=#121118
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d6a19a guifg=#121118
hi SpellCap       ctermbg=4 ctermfg=15 gui=undercurl guisp=#9ab0d6
hi SpellRare      ctermbg=5 ctermfg=15 gui=undercurl guisp=#685cbc
hi SpellLocal     ctermbg=6 ctermfg=15 gui=undercurl guisp=#5cb1bc

" Diffs
hi DiffAdd    cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#ffffff
hi DiffDelete cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=1 guifg=#7d78a1
hi DiffChange cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=7 guifg=#e6e5ed
hi DiffText   cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#ffffff

" Search
hi IncSearch cterm=reverse gui=NONE ctermbg=NONE guibg=#646d2c ctermfg=11 guifg=#ffffff
hi Search cterm=NONE gui=NONE ctermbg=3 guibg=#2c446d ctermfg=0 guifg=NONE

" StatusLine and WinSeparator
hi StatusLine cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=13 guifg=#a19ad6
hi StatusLineNC cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d ctermfg=5 guifg=#685cbc
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=8 guifg=#342c6d
if get(g:, "somedarkterminal1_statusline_bg", "default") == "none"
	hi StatusLine cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=13 guifg=#a19ad6
	hi StatusLineNC cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=5 guifg=#685cbc
elseif get(g:, "somedarkterminal1_statusline_bg", "default") == "black" && &termguicolors
	hi StatusLine gui=NONE guibg=#05040b guifg=#a19ad6
	hi StatusLineNC gui=NONE guibg=#05040b guifg=#685cbc
	hi WinSeparator guibg=NONE guifg=#05040b
endif

" UI LINKED

hi! link lCursor Cursor
hi! link DiagnosticInfo DiagnosticHint
hi! link DiagnosticWarn WarningMsg
hi! link ErrorMsg Error
hi! link MoreMsg Type
hi! link PmenuSel CursorLine " Pmenu affects some floating windows
hi! link PmenuSbar Pmenu " Pmenu affects some floating windows
hi! link Question Type
hi! link QuickFixLine CursorLine
hi! link SpellBad ErrorMsg
hi! link TabLine LineNr
hi! link TabLineFill LineNr
hi! link WinBarNC LineNr
hi! link WildMenu Pmenu

" Folds
hi! link Folded Comment
hi! link FoldColumn Folded

" PLUGINS

" clever-f
hi! link CleverFDefaultLabel IncSearch

" illuminate.vim
hi IlluminatedWordText cterm=NONE gui=NONE ctermbg=8 guibg=#342c6d
hi! link IlluminatedWordRead IlluminatedWordText
hi! link IlluminatedWordWrite IlluminatedWordText

" leap.nvim
hi! link LeapLabelPrimary IncSearch

" Neo-tree
hi! link NeoTreeDimText LineNr
hi! link NeoTreeDotfile NeoTreeDimText
hi! link NeoTreeExpander NeoTreeDirectoryIcon
hi! link NeoTreeGitConflict WarningMsg
hi! link NeoTreeGitConflict WarningMsg
hi! link NeoTreeGitUntracked Structure
hi! link NeoTreeIndentMarker WinSeparator
hi! link NeoTreeRootName Title
hi! link NeoTreeTitleBar StatusLine

" Telescope
hi! link TelescopeNormal Normal
hi! link TelescopePromptCounter Comment