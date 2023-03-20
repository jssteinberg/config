hi clear
set bg=dark
let g:colors_name="nightcool"

" Options:
" - `let g:nightcool_bg=v:true` or v:false for `NONE` (transparent)
" - `let g:nightcool_comments="bold"` or "normal"
" - `let g:nightcool_statusline="default"` or "black"
" - `let g:nightcool_treesitter=v:true` or v:false
"
" Design: Colorscheme of blue tones with cyan and light green foregrounds.
" Based on a neon illuminated city-park WC...
"
" Supports: treesitter, telescope, fugitive, neo-tree, gitsigns, vim-illuminate, treesitter-context, vim-matchup, winbar

" GROUP NAMES (:h group-name)

" Normal
hi Normal ctermfg=15 guifg=#e9f5e6

if get(g:, "nightcool_bg", v:true)
	hi Normal guibg=#000000
endif

" Comment
hi Comment cterm=bold gui=bold ctermfg=8 guifg=#985cbc

if get(g:, "nightcool_comments", "bold") == "normal"
	hi Comment cterm=NONE gui=NONE
endif

" General groups
" hi clear Conceal " is this needed?
hi Bold cterm=bold gui=bold
hi Error cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi Italic cterm=italic gui=italic
hi NonText gui=NONE ctermfg=235 guifg=#342c6d " keep cterm same as `SpecialKey`
hi Title cterm=bold gui=bold ctermfg=10 guifg=#add89f
hi Todo cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=9 guifg=#c39fd8
hi! link Underlined Title
hi! link SpecialKey NonText " ...also for list char in Vim

" GENERAL SYNTAX GROUPS

hi Constant   cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=15 guifg=#e9f5e6
hi String     cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=11 guifg=#d0d89f
" hi Identifier cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
hi! link Identifier Constant
hi Statement  cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=13 guifg=#a69fd8
hi PreProc    cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
hi Type       cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=10 guifg=#add89f
" hi Special    cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=14 guifg=#9fd1d8
hi! link Special Type

" SPECIFIC SYNTAX GROUPS

hi! link markdownLinkDelimiter Statement
" HTML elements like Type since CSS treesitter uses that for elements
hi! link htmlTagName Type
hi! link cssTagName htmlTagName
hi! link cssAttrRegion htmlTagName " to fix selector withing media
hi! link jsModuleKeyword htmlTagName
" CSS class like string since classes are string in tags
hi! link cssClassName String

" UI

hi ColorColumn ctermbg=233 guibg=#361a16
hi Cursor cterm=NONE ctermbg=8 ctermfg=16 guibg=fg guifg=#0c0a19 gui=NONE
hi CursorColumn ctermbg=0 guibg=#1a1636
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636
hi CursorLineNr cterm=NONE gui=bold ctermbg=0 guibg=#1a1636 ctermfg=13 guifg=#a69fd8
hi Directory cterm=bold gui=bold ctermfg=4 guifg=#5c80bc
hi EndOfBuffer ctermfg=0 guifg=#1a1636
hi LineNr ctermfg=8 guifg=#685cbc
hi LineNrBelow ctermfg=8 guifg=#7d78a1
hi MatchParen cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d guifg=#a69fd8
hi MatchWord cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bc675c guibg=#bc675c
hi Pmenu ctermbg=0 guibg=#1a1636 ctermfg=8 guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb ctermbg=8 guibg=#342c6d " Pmenu affects some floating windows
hi SignColumn ctermbg=NONE guibg=NONE guifg=#9fd1d8
hi TabLine cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1
hi TabLineFill cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1 " link breaks in Vim 9.0
hi TabLineSel cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=7 guifg=#afc5c7
hi Visual cterm=NONE gui=NONE ctermbg=238 guibg=#552c6d " also affects TelescopePreviewLine
hi WarningMsg ctermfg=3 guifg=#bc985c
hi WinBar cterm=NONE gui=italic ctermfg=13 guifg=#a69fd8
hi WildMenu cterm=underline,bold gui=bold ctermbg=0 guibg=#342c6d ctermfg=15 guifg=#ffffff

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
hi DiffAdd    cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=15 guifg=#ffffff
hi DiffDelete cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi DiffChange cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=2 guifg=#80bc5c
hi! link DiffText DiffAdd
" `hi`s in own context, so can grey out and use green/red
hi gitDiff cterm=bold gui=bold ctermfg=8 guifg=#7d78a1
hi diffAdded cterm=NONE gui=NONE ctermfg=2 guifg=#80bc5c
hi! link diffRemoved DiffDelete

" Search
hi IncSearch cterm=bold,underline gui=NONE ctermbg=241 guibg=#646d2c ctermfg=NONE guifg=#ffffff
hi Search cterm=NONE gui=NONE ctermbg=238 guibg=#2c446d ctermfg=NONE guifg=NONE

" StatusLine and WinSeparator
hi StatusLine   cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=15 guifg=#ffffff
hi StatusLineNC cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=8 guifg=#7d78a1
hi WinSeparator ctermbg=NONE guibg=NONE ctermfg=0 guifg=#1a1636

if get(g:, "nightcool_statusline", "default") == "black"
	hi StatusLine   gui=bold guibg=#000000 guifg=#d0d89f
	hi StatusLineNC gui=bold guibg=#000000 guifg=#7d78a1
en

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

" Neovim terminal colors
let g:terminal_color_0  = "#1a1636"
let g:terminal_color_1  = "#bc675c"
let g:terminal_color_2  = "#80bc5c"
let g:terminal_color_3  = "#bc985c"
let g:terminal_color_4  = "#5c80bc"
let g:terminal_color_5  = "#685cbc"
let g:terminal_color_6  = "#5cb1bc"
let g:terminal_color_7  = "#afc5c7"
let g:terminal_color_8  = "#7d78a1"
let g:terminal_color_9  = "#d8a69f"
let g:terminal_color_10 = "#add89f"
let g:terminal_color_11 = "#d0d89f"
let g:terminal_color_12 = "#9fb4d8"
let g:terminal_color_13 = "#a69fd8"
let g:terminal_color_14 = "#9fd1d8"
let g:terminal_color_15 = "#e9f5e6"

" NEOVIM Treesitter (version 0.8 is new hi syn "@group")
if has("nvim-0.8") && get(g:, "nightcool_treesitter", v:true)
	lua require("nightcool.treesitter")
endif

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
" Util:
" - Disabled/inacive: black#8
" - Error: red#1
" - Info: magenta#5/violet*
" - Warning: yellow#3
" - Selection (bg): violet_bg
