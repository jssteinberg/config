" nightcool.vim

hi clear
set bg=dark
let g:colors_name="nightcool"

" bg #0c0a19 fg #afc5c7
" black#0   #1a1636 black#8    #7d78a1 black_2   #342c6d
" red#1     #bc675c red#9      #d8a69f dark_red_bg #361a16
" green#2   #80bc5c green#10   #add89f
" yellow#3  #bc985c yellow#11  #d0d89f yellow_bg #646d2c
" blue#4    #5c80bc blue#12    #9fb4d8 blue_bg   #2c446d
" magenta#5 #685cbc magenta#13 #a69fd8
" cyan#6    #5cb1bc cyan#14    #9fd1d8
" white#7   #afc5c7 white#15   #e9f5e6
" ---
" violet    #985cbc violet_2   #c39fd8 violet_bg #552c6d
"
" Options:
" - `let g:nightcool_bg=v:true` or v:false for `NONE` (transparent)
" - `let g:nightcool_comments="darker"` or "bright"
"
" Design: Colorscheme of blue tones with cyan and light green foregrounds.
" Based on a neon illuminated city-park WC...
"
" Supports: treesitter, telescope, fugitive, neo-tree, gitsigns, vim-illuminate, treesitter-context, vim-matchup, winbar
"
" Util:
" - Disabled/inacive: black#8
" - Error: red#1
" - Info: magenta#5/violet*
" - Warning: yellow#3
" - Selection (bg): violet_bg

" GROUP NAMES (:h group-name)

" Normal
hi Normal ctermfg=7 guifg=#afc5c7

if get(g:, "nightcool_bg", v:true)
	hi Normal guibg=#0c0a19
endif

" Comment
hi Comment cterm=NONE gui=NONE ctermfg=8 guifg=#985cbc

if get(g:, "nightcool_comments", "darker") == "bright"
	hi Comment cterm=NONE gui=italic ctermfg=9 guifg=#c39fd8
endif

" General groups
" hi clear Conceal " is this needed?
hi Bold cterm=bold gui=bold
hi Error cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi Italic cterm=italic gui=italic
hi NonText gui=NONE ctermfg=5 guifg=#342c6d " keep cterm same as `SpecialKey`
hi Title cterm=NONE gui=NONE ctermfg=15 guifg=#e9f5e6
hi Todo cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=9 guifg=#c39fd8
hi! link Underlined Title
hi! link SpecialKey NonText " ...also for list char in Vim

" GENERAL SYNTAX GROUPS

hi Constant   cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=6 guifg=#5cb1bc
hi String     cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=11 guifg=#d0d89f
" hi Identifier cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
hi! link Identifier Constant
hi Statement  cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=15 guifg=#e9f5e6
hi PreProc    cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
hi Type       cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=14 guifg=#9fd1d8
hi Special    cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=10 guifg=#add89f

" SPECIFIC SYNTAX GROUPS

" HTML elements like Type since CSS treesitter uses that for elements
hi! link htmlTagName Type
hi! link cssTagName htmlTagName
hi! link jsModuleKeyword htmlTagName
" CSS class like string since classes are string in tags
hi! link cssClassName String

" UI

hi ColorColumn ctermbg=233 guibg=#361a16
hi Cursor cterm=NONE ctermbg=8 ctermfg=16 guibg=fg guifg=#0c0a19 gui=NONE
hi CursorColumn ctermbg=0 guibg=#1a1636
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=15 guifg=#e9f5e6
hi Directory cterm=bold gui=bold ctermfg=4 guifg=#5c80bc
hi EndOfBuffer ctermfg=5 guifg=#685cbc
hi LineNr ctermfg=8 guifg=#7d78a1
hi LineNrAbove ctermfg=5 guifg=#685cbc
hi MatchParen cterm=italic gui=NONE ctermbg=0 guibg=#342c6d guifg=#a69fd8
hi MatchWord cterm=italic gui=NONE ctermbg=0 guibg=#342c6d
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bc675c guibg=#bc675c
hi Pmenu ctermbg=0 guibg=#1a1636 ctermfg=8 guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb ctermbg=8 guibg=#342c6d " Pmenu affects some floating windows
hi SignColumn ctermbg=NONE guibg=NONE guifg=#9fd1d8
hi TabLine cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi TabLineSel cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=7 guifg=#afc5c7
hi Visual cterm=NONE gui=NONE ctermbg=238 guibg=#552c6d " also affects TelescopePreviewLine
hi WarningMsg ctermfg=3 guifg=#bc985c
hi WinBar cterm=italic gui=italic ctermfg=13 guifg=#a69fd8
hi WildMenu cterm=underline,bold gui=bold ctermbg=0 guibg=#342c6d ctermfg=15 guifg=#e9f5e6

hi DiagnosticError ctermfg=1 guifg=#bc675c
hi DiagnosticHint ctermfg=8 guifg=#5c80bc
hi DiagnosticWarn ctermfg=4 guifg=#7d78a1
hi DiagnosticUnderlineError cterm=underline gui=underline guisp=#bc675c
hi DiagnosticUnderlineHint cterm=underline gui=underline guisp=#2c446d
hi DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#bc985c

hi RedrawDebugClear     ctermbg=11 ctermfg=0 guibg=#d0d89f guifg=#0c0a19
hi RedrawDebugComposed  ctermbg=10 ctermfg=0 guibg=#add89f guifg=#0c0a19
hi RedrawDebugRecompose ctermbg=9  ctermfg=0 guibg=#d8a69f guifg=#0c0a19
hi SpellBad cterm=underline gui=NONE ctermbg=NONE ctermfg=1 guifg=#d8a69f
hi SpellCap   cterm=underline gui=undercurl ctermbg=NONE guisp=#5c80bc
hi SpellRare  cterm=underline gui=undercurl ctermbg=NONE guisp=#685cbc
hi SpellLocal cterm=underline gui=undercurl ctermbg=NONE guisp=#5cb1bc

" Diffs
" `hi`s in context of normal syntax, so can't use green/red---distinguish another way
hi DiffAdd    cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#e9f5e6
hi DiffDelete cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi DiffChange cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=2 guifg=#80bc5c
hi! link DiffText DiffAdd
" `hi`s in own context, so can grey out and use green/red
hi gitDiff cterm=bold gui=bold ctermfg=8 guifg=#7d78a1
hi diffAdded cterm=NONE gui=NONE ctermfg=2 guifg=#80bc5c
hi! link diffRemoved DiffDelete

" Search
hi IncSearch cterm=bold,underline gui=NONE ctermbg=240 guibg=#646d2c ctermfg=NONE guifg=#e9f5e6
hi Search cterm=italic gui=NONE ctermbg=238 guibg=#2c446d ctermfg=NONE guifg=NONE

" StatusLine and WinSeparator
hi StatusLine   cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=15 guifg=#e9f5e6
hi StatusLineNC cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=8 guifg=#7d78a1
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=0 guifg=#1a1636

" UI LINKED

hi! link lCursor Cursor
hi! link DiagnosticInfo DiagnosticHint
hi! link DiagnosticUnderlineInfo DiagnosticUnderlineHint
hi! link ErrorMsg Error
hi! link ModeMsg Title
hi! link MoreMsg Bold
hi! link PmenuSel CursorLineNr " Pmenu affects some floating windows
hi! link PmenuSbar Pmenu " Pmenu affects some floating windows
hi! link Question Bold
hi! link QuickFixLine Visual
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLineFill TabLine
hi! link VertSplit WinSeparator
hi! link WinBarNC LineNr

" Folds
hi! link Folded Todo
hi! link FoldColumn Folded

" (N)VIM PLUGINS

" illuminate.vim
hi IlluminatedWordText cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d
hi! link IlluminatedWordRead IlluminatedWordText
hi! link IlluminatedWordWrite IlluminatedWordText

if has("nvim") " NEOVIM
	lua require("nightcool.neovim")
endif
