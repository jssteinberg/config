hi clear
set bg=dark
let g:colors_name="nightcool"

" Options:
" - `let g:nightcool_bg="default" ` or "" for `NONE` (transparent)
" - `let g:nightcool_comments="default" or "gray"
"
" Supports: treesitter, winbar, vim-matchup, fugitive, neo-tree, vim-illuminate, treesitter-context

" GROUP NAMES (:h group-name)

" Normal
hi Normal ctermfg=15 guibg=#000000 guifg=#e9f5e6
if get(g:, "nightcool_bg", "default") == ""
	hi Normal guibg=NONE
endif

" Comment
hi Comment cterm=NONE gui=italic ctermfg=8 guifg=#c39fd8
if get(g:, "nightcool_comments", "normal") == "gray"
	hi Comment gui=NONE guifg=#7d78a1
endif

" General groups
" hi clear Conceal " seems to break stuff when set
hi Bold cterm=bold gui=bold
hi Error cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=1 guifg=#bc675c
hi Italic cterm=italic gui=italic
hi NonText gui=NONE ctermfg=235 guifg=#342c6d " keep cterm same as `SpecialKey`
hi Title cterm=bold gui=bold ctermfg=10 guifg=#add89f
hi Todo cterm=bold gui=NONE ctermbg=NONE guibg=#552c6d ctermfg=7 guifg=#ffffff
hi! link Underlined Title
hi! link SpecialKey NonText " ...also for list char in Vim

" GENERAL SYNTAX GROUPS

hi Constant   cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=11 guifg=#d0d89f
hi PreProc    cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
hi String     cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=10 guifg=#add89f
hi Type       cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=14 guifg=#9fd1d8
hi! link Identifier Constant
hi! link Special Type
hi! link Statement Normal

" SPECIFIC SYNTAX GROUPS

hi! link markdownLinkDelimiter Statement
hi! link htmlTag Statement
" HTML elements like Type since CSS treesitter uses (still?) that for elements
hi! link htmlTagName Type
hi! link cssTagName htmlTagName
hi! link cssAttrRegion htmlTagName " to fix selector withing media
hi! link jsModuleKeyword htmlTagName
" CSS class like string since classes are string in tags
hi! link cssClassName String
" Vim
hi! link vimCommentTitle Todo
hi! link vimCommentString Todo

" UI

hi ColorColumn ctermbg=233 guibg=#361a16
hi Cursor cterm=NONE ctermbg=8 ctermfg=16 guibg=fg guifg=#0c0a19 gui=NONE
hi CursorColumn ctermbg=0 guibg=#0c0a19"
hi CursorLine cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636
hi CursorLineNr cterm=NONE gui=NONE ctermbg=0 guibg=#1a1636 ctermfg=7 guifg=#7d78a1
hi Directory cterm=bold gui=bold ctermfg=4 guifg=#5c80bc
hi EndOfBuffer ctermfg=0 guifg=#1a1636
hi LineNr ctermfg=8 guifg=#342c6d
hi MatchParen cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d guifg=#a69fd8
hi MatchWord cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d
hi NvimInternalError ctermfg=1 ctermbg=1 guifg=#bc675c guibg=#bc675c
hi Pmenu ctermbg=0 guibg=#1a1636 ctermfg=8 guifg=#7d78a1 " Pmenu affects some floating windows
hi PmenuThumb ctermbg=8 guibg=#342c6d " Pmenu affects some floating windows
hi PmenuSel cterm=NONE gui=NONE ctermbg=0 guibg=#552c6d ctermfg=15 guifg=#ffffff  " Pmenu affects some floating windows
hi SignColumn ctermbg=NONE guibg=NONE guifg=#9fd1d8
hi TabLineFill cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=8 guifg=#7d78a1 " link breaks in Vim 9.0
hi TabLine cterm=NONE gui=NONE ctermbg=0 guibg=#0c0a19 ctermfg=8 guifg=#7d78a1
hi TabLineSel cterm=NONE gui=NONE ctermbg=NONE guibg=NONE ctermfg=15 guifg=#ffffff
hi Visual cterm=NONE gui=NONE ctermbg=238 guibg=#552c6d " also affects TelescopePreviewLine
hi WarningMsg ctermfg=3 guifg=#bc985c
hi WinBar cterm=bold gui=bold ctermfg=7 guifg=#7d78a1
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
hi StatusLine cterm=underline ctermbg=NONE ctermfg=7 guibg=#342c6d gui=NONE guifg=#ffffff
hi StatusLineNC cterm=underline ctermbg=NONE ctermfg=8 gui=NONE guibg=#342c6d guifg=#7d78a1
hi WinSeparator ctermbg=NONE ctermfg=0 guibg=NONE guifg=#342c6d

" UI LINKED

hi! link lCursor Cursor
hi! link DiagnosticInfo DiagnosticHint
hi! link DiagnosticUnderlineInfo DiagnosticUnderlineHint
hi! link ErrorMsg Error
hi! link ModeMsg Title
hi! link MoreMsg Bold
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

" oil.nvim
hi! link OilFile Title

" mini.pick
hi! link MiniPickNormal Normal
hi! link MiniPickMatchCurrent PmenuSel

" illuminate.vim
hi IlluminatedWordText cterm=NONE gui=NONE ctermbg=0 guibg=#342c6d
hi! link IlluminatedWordRead IlluminatedWordText
hi! link IlluminatedWordWrite IlluminatedWordText

" copilot.vim
hi CopilotSuggestion ctermfg=5 guifg=#685cbc

" neo-tree
hi! link NeoTreeNormal Title
hi! link NeoTreeNormalNC NeoTreeNormal
hi! link NeoTreeRootName NeoTreeDirectoryName
hi NeoTreeDimText ctermfg=5 guifg=#342c6d
hi NeoTreeDotfile ctermfg=8 guifg=#7d78a1
hi! link NeoTreeGitAdded diffAdded
hi! link NeoTreeGitModified WarningMsg

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
if has("nvim-0.8")
	lua require("nightcool.treesitter")
endif

" bg #000000 fg #e9f5e6 bg_2 #0c0a19 fg_2 #ffffff
" black#0   #1a1636 black#8    #7d78a1 black_2   #342c6d
" red#1     #bc675c red#9      #d8a69f dark_red_bg #361a16
" green#2   #80bc5c green#10   #add89f
" yellow#3  #bc985c yellow#11  #d0d89f yellow_bg #646d2c
" blue#4    #5c80bc blue#12    #9fb4d8 blue_bg   #2c446d
" magenta#5 #685cbc magenta#13 #a69fd8
" cyan#6    #5cb1bc cyan#14    #9fd1d8
" white#7   #afc5c7 white#15   #e9f5e6 white #ffffff
" ---
" violet    #985cbc violet_2   #c39fd8 violet_bg #552c6d
"
" Util:
" - Disabled/inacive: black#8
" - Error: red#1
" - Info: magenta#5/violet*
" - Warning: yellow#3
" - Selection (bg): violet_bg
