" Name:         lunaperchier
" Description:  B/W bg colorscheme tweaked from lunaperche by habamax.
" Author:       jssteinberg
" Maintainer:   jssteinberg
" License:      Vim License (see `:help license`)

hi clear
let g:colors_name = 'lunaperchier'

let s:t_Co = exists('&t_Co') ? (&t_Co || 0) : -1

hi! link helpVim Title
hi! link helpHeader Title
hi! link helpHyperTextJump Underlined
hi! link fugitiveSymbolicRef PreProc
hi! link fugitiveHeading Statement
hi! link fugitiveStagedHeading Statement
hi! link fugitiveUnstagedHeading Statement
hi! link fugitiveUntrackedHeading Statement
hi! link fugitiveStagedModifier PreProc
hi! link fugitiveUnstagedModifier PreProc
hi! link fugitiveHash Constant
hi! link diffFile PreProc
hi! link markdownHeadingDelimiter Special
hi! link rstSectionDelimiter PreProc
hi! link rstDirective Special
hi! link rstHyperlinkReference Special
hi! link rstFieldName Special
hi! link rstDelimiter Special
hi! link rstInterpretedText Special
hi! link colortemplateKey Statement
hi! link xmlTagName Statement
hi! link javaScriptFunction Statement
hi! link javaScriptIdentifier Statement
hi! link sqlKeyword Statement
hi! link yamlBlockMappingKey Statement
hi! link rubyMacro Statement
hi! link rubyDefine Statement
hi! link vimGroup Normal
hi! link vimVar Normal
hi! link vimOper Normal
hi! link vimSep Normal
hi! link vimParenSep Normal
hi! link vimOption Normal
hi! link vimCommentString Comment
hi! link pythonInclude Statement
hi! link elixirOperator Statement
hi! link elixirKeyword Statement
hi! link elixirBlockDefinition Statement
hi! link elixirDefine Statement
hi! link elixirPrivateDefine Statement
hi! link elixirGuard Statement
hi! link elixirPrivateGuard Statement
hi! link elixirModuleDefine Statement
hi! link elixirProtocolDefine Statement
hi! link elixirImplDefine Statement
hi! link elixirRecordDefine Statement
hi! link elixirPrivateRecordDefine Statement
hi! link elixirMacroDefine Statement
hi! link elixirPrivateMacroDefine Statement
hi! link elixirDelegateDefine Statement
hi! link elixirOverridableDefine Statement
hi! link elixirExceptionDefine Statement
hi! link elixirCallbackDefine Statement
hi! link elixirStructDefine Statement
hi! link elixirExUnitMacro Statement
hi! link elixirInclude Statement
hi! link elixirVariable Special
hi! link elixirAtom Constant
hi! link elixirDocTest String
hi! link shQuote Constant
hi! link shNoQuote Normal
hi! link shTestOpr Normal
hi! link shOperator Normal
hi! link shSetOption Normal
hi! link shOption Normal
hi! link shCommandSub Normal
hi! link shDerefPattern shQuote
hi! link shDerefOp Special
hi! link Terminal Normal
hi! link StatuslineTerm Statusline
hi! link StatuslineTermNC StatuslineNC
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
if &background ==# 'dark'
  if (has('termguicolors') && &termguicolors) || has('gui_running')
    let g:terminal_ansi_colors = ['#000000', '#af5f5f', '#5faf5f', '#af875f', '#5f87af', '#d787af', '#5fafaf', '#c6c6c6', '#767676', '#ff5f5f', '#5fd75f', '#ffd787', '#87afd7', '#ffafd7', '#5fd7d7', '#ffffff']
  endif
  hi Normal guifg=#eeeeee guibg=#000000 gui=NONE cterm=NONE
  hi Statusline guifg=#000000 guibg=#c6c6c6 gui=bold cterm=bold
  hi StatuslineNC guifg=#000000 guibg=#767676 gui=NONE cterm=NONE
  hi VertSplit guifg=#767676 guibg=NONE gui=NONE cterm=NONE
  hi TabLine guifg=#000000 guibg=#c6c6c6 gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE guibg=#767676 gui=NONE cterm=NONE
  hi TabLineSel guifg=#ffffff guibg=#000000 gui=bold cterm=bold
  hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ToolbarButton guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
  hi QuickFixLine guifg=#000000 guibg=#87afd7 gui=NONE cterm=NONE
  hi CursorLineNr guifg=#ffffff guibg=NONE gui=bold cterm=bold
  hi LineNr guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi NonText guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi FoldColumn guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi EndOfBuffer guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi SpecialKey guifg=#585858 guibg=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
  hi PmenuSel guifg=NONE guibg=#005f00 gui=NONE cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#c6c6c6 gui=NONE cterm=NONE
  hi PmenuSbar guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SignColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Error guifg=#ffffff guibg=#ff5f5f gui=NONE cterm=NONE
  hi ErrorMsg guifg=#ffffff guibg=#ff5f5f gui=NONE cterm=NONE
  hi ModeMsg guifg=#ffd787 guibg=NONE gui=reverse cterm=reverse
  hi MoreMsg guifg=#5fd75f guibg=NONE gui=NONE cterm=NONE
  hi Question guifg=#ffafd7 guibg=NONE gui=NONE cterm=NONE
  hi WarningMsg guifg=#ff5f5f guibg=NONE gui=NONE cterm=NONE
  hi Todo guifg=#5fd7d7 guibg=#000000 gui=reverse cterm=reverse
  hi Search guifg=#000000 guibg=#ffd787 gui=NONE cterm=NONE
  hi IncSearch guifg=#000000 guibg=#5fd75f gui=NONE cterm=NONE
  hi CurSearch guifg=#000000 guibg=#5fd75f gui=NONE cterm=NONE
  hi WildMenu guifg=#000000 guibg=#ffd787 gui=bold cterm=bold
  hi debugPC guifg=#5f87af guibg=NONE gui=reverse cterm=reverse
  hi debugBreakpoint guifg=#5fafaf guibg=NONE gui=reverse cterm=reverse
  hi Cursor guifg=#ffffff guibg=#000000 gui=reverse cterm=reverse
  hi lCursor guifg=#ff5fff guibg=#000000 gui=reverse cterm=reverse
  hi Visual guifg=#ffffff guibg=#005f87 gui=NONE cterm=NONE
  hi MatchParen guifg=#c5e7c5 guibg=#000000 gui=reverse cterm=reverse
  hi VisualNOS guifg=#000000 guibg=#5fafaf gui=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#262626 gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#262626 gui=NONE cterm=NONE
  hi Folded guifg=#767676 guibg=#1c1c1c gui=NONE cterm=NONE
  hi ColorColumn guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
  hi SpellBad guifg=NONE guibg=NONE guisp=#ff5f5f gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellCap guifg=NONE guibg=NONE guisp=#5fafaf gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellLocal guifg=NONE guibg=NONE guisp=#5faf5f gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellRare guifg=NONE guibg=NONE guisp=#ffafd7 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Comment guifg=#87afd7 guibg=NONE gui=NONE cterm=NONE
  hi Constant guifg=#ffd787 guibg=NONE gui=NONE cterm=NONE
  hi Identifier guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Statement guifg=#eeeeee guibg=NONE gui=bold cterm=bold
  hi Type guifg=#5fd75f guibg=NONE gui=bold cterm=bold
  hi PreProc guifg=#af875f guibg=NONE gui=NONE cterm=NONE
  hi Special guifg=#5fafaf guibg=NONE gui=bold cterm=bold
  hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Directory guifg=#5fd7d7 guibg=NONE gui=bold cterm=bold
  hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi DiffAdd guifg=#000000 guibg=#af87af gui=NONE cterm=NONE
  hi DiffChange guifg=#000000 guibg=#d0d0d0 gui=NONE cterm=NONE
  hi DiffText guifg=#000000 guibg=#5fd7d7 gui=NONE cterm=NONE
  hi DiffDelete guifg=#d78787 guibg=NONE gui=NONE cterm=NONE
  hi diffAdded guifg=#5fd75f guibg=NONE gui=NONE cterm=NONE
  hi diffRemoved guifg=#d78787 guibg=NONE gui=NONE cterm=NONE
  hi diffSubname guifg=#ffafd7 guibg=NONE gui=NONE cterm=NONE
  hi dirType guifg=#d787af guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionUser guifg=#5faf5f guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionGroup guifg=#af875f guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionOther guifg=#5fafaf guibg=NONE gui=NONE cterm=NONE
  hi dirOwner guifg=#767676 guibg=NONE gui=NONE cterm=NONE
  hi dirGroup guifg=#767676 guibg=NONE gui=NONE cterm=NONE
  hi dirTime guifg=#767676 guibg=NONE gui=NONE cterm=NONE
  hi dirSize guifg=#ffd787 guibg=NONE gui=NONE cterm=NONE
  hi dirSizeMod guifg=#d787af guibg=NONE gui=NONE cterm=NONE
  hi FilterMenuDirectorySubtle guifg=#878787 guibg=NONE gui=NONE cterm=NONE
  hi dirFilterMenuBookmarkPath guifg=#878787 guibg=NONE gui=NONE cterm=NONE
  hi dirFilterMenuHistoryPath guifg=#878787 guibg=NONE gui=NONE cterm=NONE
  hi FilterMenuLineNr guifg=#878787 guibg=NONE gui=NONE cterm=NONE
  hi CocMenuSel guifg=NONE guibg=#005f00 gui=NONE cterm=NONE
  hi CocSearch guifg=#ffd787 guibg=NONE gui=NONE cterm=NONE
else
  " Light background
  if (has('termguicolors') && &termguicolors) || has('gui_running')
    let g:terminal_ansi_colors = ['#000000', '#870000', '#008700', '#875f00', '#005faf', '#870087', '#005f5f', '#808080', '#767676', '#d70000', '#87d787', '#d7d787', '#0087d7', '#af00af', '#00afaf', '#ffffff']
  endif
  hi Normal guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
  hi Statusline guifg=#ffffff guibg=#000000 gui=bold cterm=bold
  hi StatuslineNC guifg=#ffffff guibg=#767676 gui=NONE cterm=NONE
  hi VertSplit guifg=#767676 guibg=NONE gui=NONE cterm=NONE
  hi TabLine guifg=#000000 guibg=#bcbcbc gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE guibg=#767676 gui=NONE cterm=NONE
  hi TabLineSel guifg=#ffffff guibg=#000000 gui=bold,reverse cterm=bold,reverse
  hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ToolbarButton guifg=#ffffff guibg=#000000 gui=NONE cterm=NONE
  hi QuickFixLine guifg=#ffffff guibg=#0087d7 gui=NONE cterm=NONE
  hi CursorLineNr guifg=#000000 guibg=NONE gui=bold cterm=bold
  hi LineNr guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi NonText guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi FoldColumn guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi EndOfBuffer guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi SpecialKey guifg=#9e9e9e guibg=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi PmenuSel guifg=NONE guibg=#afd7af gui=NONE cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#767676 gui=NONE cterm=NONE
  hi PmenuSbar guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SignColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Error guifg=#ffffff guibg=#d70000 gui=NONE cterm=NONE
  hi ErrorMsg guifg=#ffffff guibg=#d70000 gui=NONE cterm=NONE
  hi ModeMsg guifg=#d7d787 guibg=#000000 gui=reverse cterm=reverse
  hi MoreMsg guifg=#008700 guibg=NONE gui=bold cterm=bold
  hi Question guifg=#870087 guibg=NONE gui=bold cterm=bold
  hi WarningMsg guifg=#d70000 guibg=NONE gui=bold cterm=bold
  hi Todo guifg=#005f5f guibg=#ffffff gui=reverse cterm=reverse
  hi Search guifg=#000000 guibg=#d7d787 gui=NONE cterm=NONE
  hi IncSearch guifg=#000000 guibg=#87d787 gui=NONE cterm=NONE
  hi CurSearch guifg=#000000 guibg=#87d787 gui=NONE cterm=NONE
  hi WildMenu guifg=#000000 guibg=#d7d787 gui=bold cterm=bold
  hi debugPC guifg=#005faf guibg=NONE gui=reverse cterm=reverse
  hi debugBreakpoint guifg=#005f5f guibg=NONE gui=reverse cterm=reverse
  hi Cursor guifg=#000000 guibg=#ffffff gui=reverse cterm=reverse
  hi lCursor guifg=#ff00ff guibg=#000000 gui=reverse cterm=reverse
  hi Visual guifg=#ffffff guibg=#5f87af gui=NONE cterm=NONE
  hi MatchParen guifg=NONE guibg=#c5e7c5 gui=NONE cterm=NONE
  hi VisualNOS guifg=#ffffff guibg=#00afaf gui=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#fcfec3 gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#e4e4e4 gui=NONE cterm=NONE
  hi Folded guifg=#767676 guibg=#eeeeee gui=NONE cterm=NONE
  hi ColorColumn guifg=NONE guibg=#eeeeee gui=NONE cterm=NONE
  hi SpellBad guifg=NONE guibg=NONE guisp=#870000 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellCap guifg=NONE guibg=NONE guisp=#005f5f gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellLocal guifg=NONE guibg=NONE guisp=#008700 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellRare guifg=NONE guibg=NONE guisp=#af00af gui=undercurl ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Comment guifg=#005faf guibg=NONE gui=NONE cterm=NONE
  hi Constant guifg=#870000 guibg=NONE gui=NONE cterm=NONE
  hi Identifier guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Statement guifg=#000000 guibg=NONE gui=bold cterm=bold
  hi Type guifg=#008700 guibg=NONE gui=bold cterm=bold
  hi PreProc guifg=#875f00 guibg=NONE gui=NONE cterm=NONE
  hi Special guifg=#005f5f guibg=NONE gui=NONE cterm=NONE
  hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Directory guifg=#005faf guibg=NONE gui=bold cterm=bold
  hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi DiffAdd guifg=#000000 guibg=#d7afd7 gui=NONE cterm=NONE
  hi DiffChange guifg=#000000 guibg=#d0d0d0 gui=NONE cterm=NONE
  hi DiffText guifg=#000000 guibg=#5fd7d7 gui=NONE cterm=NONE
  hi DiffDelete guifg=#870000 guibg=NONE gui=NONE cterm=NONE
  hi diffAdded guifg=#008700 guibg=NONE gui=NONE cterm=NONE
  hi diffRemoved guifg=#d70000 guibg=NONE gui=NONE cterm=NONE
  hi diffSubname guifg=#870087 guibg=NONE gui=NONE cterm=NONE
  hi dirType guifg=#005f5f guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionUser guifg=#875f00 guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionGroup guifg=#008700 guibg=NONE gui=NONE cterm=NONE
  hi dirPermissionOther guifg=#870087 guibg=NONE gui=NONE cterm=NONE
  hi dirOwner guifg=#808080 guibg=NONE gui=NONE cterm=NONE
  hi dirGroup guifg=#808080 guibg=NONE gui=NONE cterm=NONE
  hi dirTime guifg=#808080 guibg=NONE gui=NONE cterm=NONE
  hi dirSize guifg=#870000 guibg=NONE gui=NONE cterm=NONE
  hi dirSizeMod guifg=#005f5f guibg=NONE gui=NONE cterm=NONE
  hi dirLink guifg=#008700 guibg=NONE gui=bold cterm=bold
  hi dirFilterMenuBookmarkPath guifg=#626262 guibg=NONE gui=NONE cterm=NONE
  hi dirFilterMenuHistoryPath guifg=#626262 guibg=NONE gui=NONE cterm=NONE
  hi FilterMenuDirectorySubtle guifg=#626262 guibg=NONE gui=NONE cterm=NONE
  hi FilterMenuLineNr guifg=#626262 guibg=NONE gui=NONE cterm=NONE
  hi CocMenuSel guifg=NONE guibg=#afd7af gui=NONE cterm=NONE
  hi CocSearch guifg=#870000 guibg=NONE gui=NONE cterm=NONE
endif

if s:t_Co >= 256
  hi! link helpVim Title
  hi! link helpHeader Title
  hi! link helpHyperTextJump Underlined
  hi! link fugitiveSymbolicRef PreProc
  hi! link fugitiveHeading Statement
  hi! link fugitiveStagedHeading Statement
  hi! link fugitiveUnstagedHeading Statement
  hi! link fugitiveUntrackedHeading Statement
  hi! link fugitiveStagedModifier PreProc
  hi! link fugitiveUnstagedModifier PreProc
  hi! link fugitiveHash Constant
  hi! link diffFile PreProc
  hi! link markdownHeadingDelimiter Special
  hi! link rstSectionDelimiter PreProc
  hi! link rstDirective Special
  hi! link rstHyperlinkReference Special
  hi! link rstFieldName Special
  hi! link rstDelimiter Special
  hi! link rstInterpretedText Special
  hi! link colortemplateKey Statement
  hi! link xmlTagName Statement
  hi! link javaScriptFunction Statement
  hi! link javaScriptIdentifier Statement
  hi! link sqlKeyword Statement
  hi! link yamlBlockMappingKey Statement
  hi! link rubyMacro Statement
  hi! link rubyDefine Statement
  hi! link vimGroup Normal
  hi! link vimVar Normal
  hi! link vimOper Normal
  hi! link vimSep Normal
  hi! link vimParenSep Normal
  hi! link vimOption Normal
  hi! link vimCommentString Comment
  hi! link pythonInclude Statement
  hi! link elixirOperator Statement
  hi! link elixirKeyword Statement
  hi! link elixirBlockDefinition Statement
  hi! link elixirDefine Statement
  hi! link elixirPrivateDefine Statement
  hi! link elixirGuard Statement
  hi! link elixirPrivateGuard Statement
  hi! link elixirModuleDefine Statement
  hi! link elixirProtocolDefine Statement
  hi! link elixirImplDefine Statement
  hi! link elixirRecordDefine Statement
  hi! link elixirPrivateRecordDefine Statement
  hi! link elixirMacroDefine Statement
  hi! link elixirPrivateMacroDefine Statement
  hi! link elixirDelegateDefine Statement
  hi! link elixirOverridableDefine Statement
  hi! link elixirExceptionDefine Statement
  hi! link elixirCallbackDefine Statement
  hi! link elixirStructDefine Statement
  hi! link elixirExUnitMacro Statement
  hi! link elixirInclude Statement
  hi! link elixirVariable Special
  hi! link elixirAtom Constant
  hi! link elixirDocTest String
  hi! link shQuote Constant
  hi! link shNoQuote Normal
  hi! link shTestOpr Normal
  hi! link shOperator Normal
  hi! link shSetOption Normal
  hi! link shOption Normal
  hi! link shCommandSub Normal
  hi! link shDerefPattern shQuote
  hi! link shDerefOp Special
  hi! link Terminal Normal
  hi! link StatuslineTerm Statusline
  hi! link StatuslineTermNC StatuslineNC
  hi! link LineNrAbove LineNr
  hi! link LineNrBelow LineNr
  if &background ==# 'dark'
    hi Normal ctermfg=251 ctermbg=16 cterm=NONE
    hi Statusline ctermfg=16 ctermbg=251 cterm=bold
    hi StatuslineNC ctermfg=16 ctermbg=243 cterm=NONE
    hi VertSplit ctermfg=243 ctermbg=NONE cterm=NONE
    hi TabLine ctermfg=16 ctermbg=251 cterm=NONE
    hi TabLineFill ctermfg=NONE ctermbg=243 cterm=NONE
    hi TabLineSel ctermfg=231 ctermbg=16 cterm=bold
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=16 ctermbg=231 cterm=NONE
    hi QuickFixLine ctermfg=16 ctermbg=110 cterm=NONE
    hi CursorLineNr ctermfg=231 ctermbg=NONE cterm=bold
    hi LineNr ctermfg=240 ctermbg=NONE cterm=NONE
    hi NonText ctermfg=240 ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=240 ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=240 ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=240 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=NONE ctermbg=234 cterm=NONE
    hi PmenuSel ctermfg=NONE ctermbg=22 cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=251 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=231 ctermbg=203 cterm=NONE
    hi ErrorMsg ctermfg=231 ctermbg=203 cterm=NONE
    hi ModeMsg ctermfg=222 ctermbg=NONE cterm=reverse
    hi MoreMsg ctermfg=77 ctermbg=NONE cterm=NONE
    hi Question ctermfg=218 ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=203 ctermbg=NONE cterm=NONE
    hi Todo ctermfg=116 ctermbg=16 cterm=reverse
    hi Search ctermfg=16 ctermbg=222 cterm=NONE
    hi IncSearch ctermfg=16 ctermbg=77 cterm=NONE
    hi CurSearch ctermfg=16 ctermbg=77 cterm=NONE
    hi WildMenu ctermfg=16 ctermbg=222 cterm=bold
    hi debugPC ctermfg=67 ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=73 ctermbg=NONE cterm=reverse
    hi Visual ctermfg=231 ctermbg=24 cterm=NONE
    hi MatchParen ctermfg=30 ctermbg=16 cterm=reverse
    hi VisualNOS ctermfg=16 ctermbg=73 cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
    hi Folded ctermfg=243 ctermbg=234 cterm=NONE
    hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE
    hi SpellBad ctermfg=203 ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=73 ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=77 ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=218 ctermbg=NONE cterm=underline
    hi Comment ctermfg=110 ctermbg=NONE cterm=NONE
    hi Constant ctermfg=222 ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=255 ctermbg=NONE cterm=bold
    hi Type ctermfg=77 ctermbg=NONE cterm=bold
    hi PreProc ctermfg=137 ctermbg=NONE cterm=NONE
    hi Special ctermfg=73 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=116 ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=16 ctermbg=139 cterm=NONE
    hi DiffChange ctermfg=16 ctermbg=252 cterm=NONE
    hi DiffText ctermfg=16 ctermbg=80 cterm=NONE
    hi DiffDelete ctermfg=174 ctermbg=NONE cterm=NONE
    hi diffAdded ctermfg=77 ctermbg=NONE cterm=NONE
    hi diffRemoved ctermfg=174 ctermbg=NONE cterm=NONE
    hi diffSubname ctermfg=218 ctermbg=NONE cterm=NONE
    hi dirType ctermfg=175 ctermbg=NONE cterm=NONE
    hi dirPermissionUser ctermfg=71 ctermbg=NONE cterm=NONE
    hi dirPermissionGroup ctermfg=137 ctermbg=NONE cterm=NONE
    hi dirPermissionOther ctermfg=73 ctermbg=NONE cterm=NONE
    hi dirOwner ctermfg=243 ctermbg=NONE cterm=NONE
    hi dirGroup ctermfg=243 ctermbg=NONE cterm=NONE
    hi dirTime ctermfg=243 ctermbg=NONE cterm=NONE
    hi dirSize ctermfg=222 ctermbg=NONE cterm=NONE
    hi dirSizeMod ctermfg=175 ctermbg=NONE cterm=NONE
    hi FilterMenuDirectorySubtle ctermfg=102 ctermbg=NONE cterm=NONE
    hi dirFilterMenuBookmarkPath ctermfg=102 ctermbg=NONE cterm=NONE
    hi dirFilterMenuHistoryPath ctermfg=102 ctermbg=NONE cterm=NONE
    hi FilterMenuLineNr ctermfg=102 ctermbg=NONE cterm=NONE
    hi CocMenuSel ctermfg=NONE ctermbg=22 cterm=NONE
    hi CocSearch ctermfg=222 ctermbg=NONE cterm=NONE
  else
    " Light background
    hi Normal ctermfg=16 ctermbg=231 cterm=NONE
    hi Statusline ctermfg=231 ctermbg=16 cterm=bold
    hi StatuslineNC ctermfg=231 ctermbg=243 cterm=NONE
    hi VertSplit ctermfg=243 ctermbg=NONE cterm=NONE
    hi TabLine ctermfg=16 ctermbg=250 cterm=NONE
    hi TabLineFill ctermfg=NONE ctermbg=243 cterm=NONE
    hi TabLineSel ctermfg=231 ctermbg=16 cterm=bold,reverse
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=231 ctermbg=16 cterm=NONE
    hi QuickFixLine ctermfg=231 ctermbg=32 cterm=NONE
    hi CursorLineNr ctermfg=16 ctermbg=NONE cterm=bold
    hi LineNr ctermfg=247 ctermbg=NONE cterm=NONE
    hi NonText ctermfg=247 ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=247 ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=247 ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=247 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=NONE ctermbg=255 cterm=NONE
    hi PmenuSel ctermfg=NONE ctermbg=151 cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=231 ctermbg=160 cterm=NONE
    hi ErrorMsg ctermfg=231 ctermbg=160 cterm=NONE
    hi ModeMsg ctermfg=186 ctermbg=16 cterm=reverse
    hi MoreMsg ctermfg=28 ctermbg=NONE cterm=bold
    hi Question ctermfg=90 ctermbg=NONE cterm=bold
    hi WarningMsg ctermfg=160 ctermbg=NONE cterm=bold
    hi Todo ctermfg=23 ctermbg=231 cterm=reverse
    hi Search ctermfg=16 ctermbg=186 cterm=NONE
    hi IncSearch ctermfg=16 ctermbg=114 cterm=NONE
    hi CurSearch ctermfg=16 ctermbg=114 cterm=NONE
    hi WildMenu ctermfg=16 ctermbg=186 cterm=bold
    hi debugPC ctermfg=25 ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=23 ctermbg=NONE cterm=reverse
    hi Visual ctermfg=231 ctermbg=67 cterm=NONE
    hi MatchParen ctermfg=30 ctermbg=231 cterm=reverse
    hi VisualNOS ctermfg=231 ctermbg=37 cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=254 cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=254 cterm=NONE
    hi Folded ctermfg=243 ctermbg=255 cterm=NONE
    hi ColorColumn ctermfg=NONE ctermbg=255 cterm=NONE
    hi SpellBad ctermfg=88 ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=23 ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=28 ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=133 ctermbg=NONE cterm=underline
    hi Comment ctermfg=25 ctermbg=NONE cterm=NONE
    hi Constant ctermfg=88 ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=16 ctermbg=NONE cterm=bold
    hi Type ctermfg=28 ctermbg=NONE cterm=bold
    hi PreProc ctermfg=94 ctermbg=NONE cterm=NONE
    hi Special ctermfg=23 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=25 ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=16 ctermbg=182 cterm=NONE
    hi DiffChange ctermfg=16 ctermbg=252 cterm=NONE
    hi DiffText ctermfg=16 ctermbg=80 cterm=NONE
    hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE
    hi diffAdded ctermfg=28 ctermbg=NONE cterm=NONE
    hi diffRemoved ctermfg=160 ctermbg=NONE cterm=NONE
    hi diffSubname ctermfg=90 ctermbg=NONE cterm=NONE
    hi dirType ctermfg=23 ctermbg=NONE cterm=NONE
    hi dirPermissionUser ctermfg=94 ctermbg=NONE cterm=NONE
    hi dirPermissionGroup ctermfg=28 ctermbg=NONE cterm=NONE
    hi dirPermissionOther ctermfg=90 ctermbg=NONE cterm=NONE
    hi dirOwner ctermfg=244 ctermbg=NONE cterm=NONE
    hi dirGroup ctermfg=244 ctermbg=NONE cterm=NONE
    hi dirTime ctermfg=244 ctermbg=NONE cterm=NONE
    hi dirSize ctermfg=88 ctermbg=NONE cterm=NONE
    hi dirSizeMod ctermfg=23 ctermbg=NONE cterm=NONE
    hi dirLink ctermfg=28 ctermbg=NONE cterm=bold
    hi dirFilterMenuBookmarkPath ctermfg=241 ctermbg=NONE cterm=NONE
    hi dirFilterMenuHistoryPath ctermfg=241 ctermbg=NONE cterm=NONE
    hi FilterMenuDirectorySubtle ctermfg=241 ctermbg=NONE cterm=NONE
    hi FilterMenuLineNr ctermfg=241 ctermbg=NONE cterm=NONE
    hi CocMenuSel ctermfg=NONE ctermbg=151 cterm=NONE
    hi CocSearch ctermfg=88 ctermbg=NONE cterm=NONE
  endif
  unlet s:t_Co
  finish
endif

if s:t_Co >= 16
  if &background ==# 'dark'
    hi Normal ctermfg=grey ctermbg=black cterm=NONE
    hi Statusline ctermfg=black ctermbg=grey cterm=bold
    hi StatuslineNC ctermfg=black ctermbg=darkgrey cterm=NONE
    hi VertSplit ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi TabLine ctermfg=black ctermbg=grey cterm=NONE
    hi TabLineFill ctermfg=NONE ctermbg=darkgrey cterm=NONE
    hi TabLineSel ctermfg=white ctermbg=black cterm=bold
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=black ctermbg=white cterm=NONE
    hi QuickFixLine ctermfg=black ctermbg=blue cterm=NONE
    hi CursorLineNr ctermfg=white ctermbg=NONE cterm=bold
    hi LineNr ctermfg=grey ctermbg=NONE cterm=NONE
    hi NonText ctermfg=grey ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=grey ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=grey ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=grey ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=black ctermbg=darkgrey cterm=NONE
    hi PmenuSel ctermfg=black ctermbg=darkgreen cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=grey cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=white ctermbg=red cterm=NONE
    hi ErrorMsg ctermfg=white ctermbg=red cterm=NONE
    hi ModeMsg ctermfg=yellow ctermbg=NONE cterm=reverse
    hi MoreMsg ctermfg=green ctermbg=NONE cterm=NONE
    hi Question ctermfg=magenta ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=red ctermbg=NONE cterm=NONE
    hi Todo ctermfg=cyan ctermbg=black cterm=reverse
    hi Search ctermfg=black ctermbg=yellow cterm=NONE
    hi IncSearch ctermfg=black ctermbg=green cterm=NONE
    hi CurSearch ctermfg=black ctermbg=green cterm=NONE
    hi WildMenu ctermfg=black ctermbg=yellow cterm=bold
    hi debugPC ctermfg=darkblue ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
    hi Visual ctermfg=white ctermbg=darkblue cterm=NONE
    hi MatchParen ctermfg=darkcyan ctermbg=black cterm=reverse
    hi VisualNOS ctermfg=black ctermbg=darkcyan cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorColumn ctermfg=black ctermbg=yellow cterm=NONE
    hi Folded ctermfg=black ctermbg=darkyellow cterm=NONE
    hi ColorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi SpellBad ctermfg=red ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=darkcyan ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=green ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=magenta ctermbg=NONE cterm=underline
    hi Comment ctermfg=blue ctermbg=NONE cterm=NONE
    hi Constant ctermfg=yellow ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=grey ctermbg=NONE cterm=bold
    hi Type ctermfg=green ctermbg=NONE cterm=bold
    hi PreProc ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi Special ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=cyan ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=black ctermbg=darkmagenta cterm=NONE
    hi DiffChange ctermfg=black ctermbg=lightgray cterm=NONE
    hi DiffText ctermfg=black ctermbg=cyan cterm=NONE
    hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
    hi diffAdded ctermfg=green ctermbg=NONE cterm=NONE
    hi diffRemoved ctermfg=darkred ctermbg=NONE cterm=NONE
    hi diffSubname ctermfg=magenta ctermbg=NONE cterm=NONE
  else
    " Light background
    hi Normal ctermfg=black ctermbg=white cterm=NONE
    hi Statusline ctermfg=white ctermbg=black cterm=bold
    hi StatuslineNC ctermfg=white ctermbg=darkgrey cterm=NONE
    hi VertSplit ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi TabLine ctermfg=black ctermbg=lightgrey cterm=NONE
    hi TabLineFill ctermfg=NONE ctermbg=darkgrey cterm=NONE
    hi TabLineSel ctermfg=white ctermbg=black cterm=bold,reverse
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=white ctermbg=black cterm=NONE
    hi QuickFixLine ctermfg=white ctermbg=blue cterm=NONE
    hi CursorLineNr ctermfg=black ctermbg=NONE cterm=bold
    hi LineNr ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi NonText ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=darkgrey ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=black ctermbg=grey cterm=NONE
    hi PmenuSel ctermfg=black ctermbg=darkgreen cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=darkgrey cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=white ctermbg=red cterm=NONE
    hi ErrorMsg ctermfg=white ctermbg=red cterm=NONE
    hi ModeMsg ctermfg=yellow ctermbg=black cterm=reverse
    hi MoreMsg ctermfg=darkgreen ctermbg=NONE cterm=bold
    hi Question ctermfg=darkmagenta ctermbg=NONE cterm=bold
    hi WarningMsg ctermfg=red ctermbg=NONE cterm=bold
    hi Todo ctermfg=darkcyan ctermbg=white cterm=reverse
    hi Search ctermfg=black ctermbg=yellow cterm=NONE
    hi IncSearch ctermfg=black ctermbg=green cterm=NONE
    hi CurSearch ctermfg=black ctermbg=green cterm=NONE
    hi WildMenu ctermfg=black ctermbg=yellow cterm=bold
    hi debugPC ctermfg=darkblue ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
    hi Visual ctermfg=white ctermbg=darkblue cterm=NONE
    hi MatchParen ctermfg=darkcyan ctermbg=white cterm=reverse
    hi VisualNOS ctermfg=black ctermbg=cyan cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorColumn ctermfg=black ctermbg=yellow cterm=NONE
    hi Folded ctermfg=black ctermbg=darkyellow cterm=NONE
    hi ColorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi SpellBad ctermfg=darkred ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=darkcyan ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=darkgreen ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=magenta ctermbg=NONE cterm=underline
    hi Comment ctermfg=darkblue ctermbg=NONE cterm=NONE
    hi Constant ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=black ctermbg=NONE cterm=bold
    hi Type ctermfg=darkgreen ctermbg=NONE cterm=bold
    hi PreProc ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi Special ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=darkblue ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=black ctermbg=darkmagenta cterm=NONE
    hi DiffChange ctermfg=black ctermbg=lightgray cterm=NONE
    hi DiffText ctermfg=black ctermbg=cyan cterm=NONE
    hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
    hi diffAdded ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi diffRemoved ctermfg=red ctermbg=NONE cterm=NONE
    hi diffSubname ctermfg=darkmagenta ctermbg=NONE cterm=NONE
  endif
  unlet s:t_Co
  finish
endif

if s:t_Co >= 8
  if &background ==# 'dark'
    hi Normal ctermfg=grey ctermbg=black cterm=NONE
    hi Statusline ctermfg=grey ctermbg=black cterm=bold,reverse
    hi StatuslineNC ctermfg=black ctermbg=grey cterm=NONE
    hi VertSplit ctermfg=grey ctermbg=NONE cterm=NONE
    hi TabLine ctermfg=grey ctermbg=black cterm=reverse
    hi TabLineFill ctermfg=NONE ctermbg=grey cterm=NONE
    hi TabLineSel ctermfg=grey ctermbg=black cterm=NONE
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=grey ctermbg=black cterm=bold,reverse
    hi QuickFixLine ctermfg=grey ctermbg=darkblue cterm=bold
    hi CursorLineNr ctermfg=black ctermbg=NONE cterm=bold
    hi LineNr ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi NonText ctermfg=black ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=black ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=black ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=black ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=black ctermbg=grey cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=darkgreen cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi PmenuSel ctermfg=black ctermbg=darkgreen cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=grey ctermbg=darkred cterm=NONE
    hi ErrorMsg ctermfg=grey ctermbg=darkred cterm=NONE
    hi ModeMsg ctermfg=darkyellow ctermbg=black cterm=reverse
    hi MoreMsg ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi Question ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Todo ctermfg=darkcyan ctermbg=black cterm=reverse
    hi Search ctermfg=darkyellow ctermbg=black cterm=reverse
    hi IncSearch ctermfg=darkgreen ctermbg=black cterm=reverse
    hi CurSearch ctermfg=darkgreen ctermbg=black cterm=reverse
    hi WildMenu ctermfg=black ctermbg=darkyellow cterm=bold
    hi debugPC ctermfg=darkblue ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
    hi Visual ctermfg=black ctermbg=darkblue cterm=NONE
    hi MatchParen ctermfg=darkcyan ctermbg=black cterm=reverse
    hi VisualNOS ctermfg=black ctermbg=darkcyan cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi Folded ctermfg=black ctermbg=darkyellow cterm=NONE
    hi ColorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi SpellBad ctermfg=darkred ctermbg=NONE cterm=reverse,underline
    hi SpellCap ctermfg=darkcyan ctermbg=NONE cterm=reverse,underline
    hi SpellLocal ctermfg=darkgreen ctermbg=black cterm=reverse,underline
    hi SpellRare ctermfg=darkmagenta ctermbg=NONE cterm=reverse,underline
    hi Comment ctermfg=darkblue ctermbg=NONE cterm=NONE
    hi Constant ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=black ctermbg=NONE cterm=bold
    hi Type ctermfg=darkgreen ctermbg=NONE cterm=bold
    hi PreProc ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi Special ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=bold
    hi Directory ctermfg=darkcyan ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=black ctermbg=darkmagenta cterm=NONE
    hi DiffChange ctermfg=black ctermbg=darkcyan cterm=NONE
    hi DiffText ctermfg=black ctermbg=grey cterm=NONE
    hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
  else
    " Light background
    hi Normal ctermfg=black ctermbg=grey cterm=NONE
    hi Statusline ctermfg=grey ctermbg=black cterm=bold
    hi StatuslineNC ctermfg=grey ctermbg=darkgrey cterm=NONE
    hi VertSplit ctermfg=black ctermbg=NONE cterm=NONE
    hi TabLine ctermfg=black ctermbg=grey cterm=reverse
    hi TabLineFill ctermfg=NONE ctermbg=darkgrey cterm=NONE
    hi TabLineSel ctermfg=black ctermbg=grey cterm=NONE
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ToolbarButton ctermfg=grey ctermbg=black cterm=bold
    hi QuickFixLine ctermfg=grey ctermbg=darkblue cterm=bold
    hi CursorLineNr ctermfg=black ctermbg=NONE cterm=bold
    hi LineNr ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi NonText ctermfg=black ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=black ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=black ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=black ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=grey ctermbg=black cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=darkgreen cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
    hi PmenuSel ctermfg=black ctermbg=darkgreen cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Error ctermfg=grey ctermbg=darkred cterm=NONE
    hi ErrorMsg ctermfg=grey ctermbg=darkred cterm=NONE
    hi ModeMsg ctermfg=darkyellow ctermbg=black cterm=reverse
    hi MoreMsg ctermfg=darkgreen ctermbg=NONE cterm=NONE
    hi Question ctermfg=darkmagenta ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Todo ctermfg=darkcyan ctermbg=black cterm=reverse
    hi Search ctermfg=black ctermbg=darkyellow cterm=NONE
    hi IncSearch ctermfg=black ctermbg=darkgreen cterm=NONE
    hi CurSearch ctermfg=black ctermbg=darkgreen cterm=NONE
    hi WildMenu ctermfg=black ctermbg=darkyellow cterm=bold
    hi debugPC ctermfg=darkblue ctermbg=NONE cterm=reverse
    hi debugBreakpoint ctermfg=darkcyan ctermbg=NONE cterm=reverse
    hi Visual ctermfg=grey ctermbg=darkblue cterm=NONE
    hi MatchParen ctermfg=darkcyan ctermbg=grey cterm=reverse
    hi VisualNOS ctermfg=black ctermbg=darkcyan cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
    hi CursorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi Folded ctermfg=black ctermbg=darkyellow cterm=NONE
    hi ColorColumn ctermfg=black ctermbg=darkyellow cterm=NONE
    hi SpellBad ctermfg=darkred ctermbg=NONE cterm=reverse,underline
    hi SpellCap ctermfg=darkcyan ctermbg=NONE cterm=reverse,underline
    hi SpellLocal ctermfg=darkgreen ctermbg=black cterm=reverse,underline
    hi SpellRare ctermfg=darkmagenta ctermbg=NONE cterm=reverse,underline
    hi Comment ctermfg=darkblue ctermbg=NONE cterm=NONE
    hi Constant ctermfg=darkred ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Statement ctermfg=black ctermbg=NONE cterm=bold
    hi Type ctermfg=darkgreen ctermbg=NONE cterm=bold
    hi PreProc ctermfg=darkyellow ctermbg=NONE cterm=NONE
    hi Special ctermfg=darkcyan ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=black ctermbg=NONE cterm=bold
    hi Directory ctermfg=darkcyan ctermbg=NONE cterm=bold
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
    hi DiffAdd ctermfg=black ctermbg=darkmagenta cterm=NONE
    hi DiffChange ctermfg=black ctermbg=darkcyan cterm=NONE
    hi DiffText ctermfg=grey ctermbg=black cterm=NONE
    hi DiffDelete ctermfg=darkred ctermbg=NONE cterm=NONE
  endif
  unlet s:t_Co
  finish
endif

if s:t_Co >= 0
  hi Normal term=NONE
  hi ColorColumn term=reverse
  hi Conceal term=NONE
  hi Cursor term=reverse
  hi CursorColumn term=NONE
  hi CursorLine term=underline
  hi CursorLineNr term=bold
  hi DiffAdd term=reverse
  hi DiffChange term=NONE
  hi DiffDelete term=reverse
  hi DiffText term=reverse
  hi Directory term=NONE
  hi EndOfBuffer term=NONE
  hi ErrorMsg term=bold,reverse
  hi FoldColumn term=NONE
  hi Folded term=NONE
  hi IncSearch term=bold,reverse,underline
  hi LineNr term=NONE
  hi MatchParen term=bold,underline
  hi ModeMsg term=bold
  hi MoreMsg term=NONE
  hi NonText term=NONE
  hi Pmenu term=reverse
  hi PmenuSbar term=reverse
  hi PmenuSel term=bold
  hi PmenuThumb term=NONE
  hi Question term=standout
  hi Search term=reverse
  hi SignColumn term=reverse
  hi SpecialKey term=bold
  hi SpellBad term=underline
  hi SpellCap term=underline
  hi SpellLocal term=underline
  hi SpellRare term=underline
  hi StatusLine term=bold,reverse
  hi StatusLineNC term=bold,underline
  hi TabLine term=bold,underline
  hi TabLineFill term=NONE
  hi Terminal term=NONE
  hi TabLineSel term=bold,reverse
  hi Title term=NONE
  hi VertSplit term=NONE
  hi Visual term=reverse
  hi VisualNOS term=NONE
  hi WarningMsg term=standout
  hi WildMenu term=bold
  hi CursorIM term=NONE
  hi ToolbarLine term=reverse
  hi ToolbarButton term=bold,reverse
  hi CurSearch term=reverse
  hi CursorLineFold term=underline
  hi CursorLineSign term=underline
  hi Comment term=bold
  hi Constant term=NONE
  hi Error term=bold,reverse
  hi Identifier term=NONE
  hi Ignore term=NONE
  hi PreProc term=NONE
  hi Special term=NONE
  hi Statement term=NONE
  hi Todo term=bold,reverse
  hi Type term=NONE
  hi Underlined term=underline
  unlet s:t_Co
  finish
endif

" Background: any
" Background: dark
" Color: color00                 #000000        16             black
" Color: color08                 #767676        243            darkgrey
" Color: color01                 #AF5F5F        131            darkred
" Color: color09                 #FF5F5F        203            red
" Color: color02                 #5FAF5F        71             darkgreen
" Color: color10                 #5FD75F        77             green
" Color: color03                 #AF875F        137            darkyellow
" Color: color11                 #FFD787        222            yellow
" Color: color04                 #5F87AF        67             darkblue
" Color: color12                 #87AFD7        110            blue
" Color: color05                 #D787AF        175            darkmagenta
" Color: color13                 #FFAFD7        218            magenta
" Color: color06                 #5FAFAF        73             darkcyan
" Color: color14                 #5FD7D7        116            cyan
" Color: color07                 #C6C6C6        251            grey
" Color: color15                 #FFFFFF        231            white
" Color: colorDimWhite           #EEEEEE        255            grey
" Color: colorLine               #262626        235            darkgrey
" Color: colorB                  #1C1C1C        234            darkgrey
" Color: colorNonT               #585858        240            grey
" Color: colorTab                #585858        240            grey
" Color: colorC                  #FFFFFF        231            white
" Color: colorlC                 #FF5FFF        207            magenta
" Color: colorV                  #005F87        24             darkblue
" Color: colorMP                 #C5E7C5        30             darkcyan
" Color: colorPMenuSel           #005F00        22             darkgreen
" Color: colorDim                #878787        102            grey
" Color: diffAdd                 #AF87AF        139            darkmagenta
" Color: diffDelete              #D78787        174            darkred
" Color: diffChange              #D0D0D0        252            lightgray
" Color: diffText                #5FD7D7        80             cyan
" Color: fgDiff                  #000000        16             black
" Term colors: color00 color01 color02 color03 color04 color05 color06 color07
" Term colors: color08 color09 color10 color11 color12 color13 color14 color15
" Background: light
" Color: color00                 #000000        16             black
" Color: color08                 #767676        243            darkgrey
" Color: color01                 #870000        88             darkred
" Color: color09                 #D70000        160            red
" Color: color02                 #008700        28             darkgreen
" Color: color10                 #87D787        114            green
" Color: color03                 #875F00        94             darkyellow
" Color: color11                 #D7D787        186            yellow
" - bg variant                   #fcfec3
" Color: color04                 #005FAF        25             darkblue
" Color: color12                 #0087D7        32             blue
" Color: color05                 #870087        90             darkmagenta
" Color: color13                 #AF00AF        133            magenta
" Color: color06                 #005F5F        23             darkcyan
" Color: color14                 #00AFAF        37             cyan
" Color: color07                 #808080        244            grey
" Color: color15                 #FFFFFF        231            white
" Color: colorLine               #E4E4E4        254            grey
" Color: colorB                  #EEEEEE        255            grey
" Color: colorNonT               #9E9E9E        247            darkgrey
" Color: colorTab                #BCBCBC        250            lightgrey
" Color: colorC                  #000000        16             black
" Color: colorlC                 #FF00FF        201            magenta
" Color: colorV                  #5F87AF        67             darkblue
" Color: colorMP                 #C5E7C5        30             darkcyan
" Color: colorPMenuSel           #AFD7AF        151            darkgreen
" Color: colorDim                #626262        241            darkgrey
" Color: diffAdd                 #D7AFD7        182            darkmagenta
" Color: diffDelete              #870000        88             darkred
" Color: diffChange              #D0D0D0        252            lightgray
" Color: diffText                #5FD7D7        80             cyan
" Color: fgDiff                  #000000        16             black
" Term colors: color00 color01 color02 color03 color04 color05 color06 color07
" Term colors: color08 color09 color10 color11 color12 color13 color14 color15
" Background: any
" vim: et ts=2 sw=2
