function! s:ShowMode(sep_l = "", sep_r = "") abort
	if mode() == "i"     | return "%#IncSearch#"
	elseif mode() == "c" | return "%#IncSearch#"
	elseif mode() == "t" | return "%#IncSearch#"
	elseif mode() == "r" | return "%#IncSearch#"
	elseif mode() == "s" | return "%#IncSearch#"
	else                 | return "%#IncSearch#"
	endif
endfunction

function! Hackline(status) abort
	let l:active = a:status
	" separator sections
	let l:sep = #{l: '  '}
	" separator items
	let l:sep_i = " · "
	" length in spaces for item separator
	let l:len_i = repeat(' ', strlen(l:sep_i))
	let l:line = ''

	" Statusline Left Side
	" --------------------

	let l:line .= l:active ? "%#StatusLine#" : "%#StatusLineNC#"
	if l:active && hackline#config#mode() && mode() != 'n'
		let l:line .= s:ShowMode()
	endif
	let l:line .= " "
	" CWD
	if len(getcwd(0)) > 1
		let l:line .= "%(%{split(getcwd(0), '/')[-1]}%)"
		" Git
		let l:line .= hackline#ui#git#info("*")
		let l:line .=	" /  "
	endif
	" buffern number
	let l:line .= '%(#%{bufnr()}%)'
	" filetype
	let l:line .= '%( %{&filetype}%)'
	" sep
	let l:line .= l:sep.l
	" truncation point
	let l:line .= '%<'
	" encoding
	let l:line .= '%(%{hackline#fileencoding#info()}%)'
	" format
	let l:line .= '%(' . l:sep_i . '%{&fileformat}%)'
	" tabs/spaces
	let l:line .= '%(' . l:sep_i . '%{hackline#ui#tab#info()}%)'
	let l:line .= l:sep.l
	" file path
	let l:line .= '%(%{hackline#ui#dir#info("xl")}%t%)'
	" modified flag
	let l:line .= '%(%m%)'

	" Statusline Right Side
	" ---------------------

	let l:line .= l:len_i . "%="
	" Nvim LSP
	if l:active && has("nvim")
		let l:line .= hackline#ui#nvim_lsp#info("", "  ")
	endif
	" Vim LSP
	if get(b:, "hackline_use_vim_lsp", "0") &&  l:active
		let l:line .= 'LSP  '
	endif
	" Cursor position
	if hackline#util#has_winwidth("md")
		let l:line .= "\\ %l/%L co\\ %c"
	else
		let l:line .= l:sep_i . "line %l/%L"
	endif
	" End spacing
	let l:line .= " "

	return l:line
endfunction
