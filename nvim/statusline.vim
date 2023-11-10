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
	let l:sep = #{l: ' · ', r: ' · '}
	" separator items
	let l:sep_i = " "
	" length in spaces for item separator
	let l:len_i = repeat(' ', strlen(l:sep_i))
	let l:line = ''

	" Statusline Left Side
	" --------------------

	" set statusline default color
	let l:line .= l:active ? "%#StatusLine#" : "%#StatusLineNC#"
	" set mode style
	if l:active && hackline#config#mode() && mode() != 'n'
		let l:line .= s:ShowMode()
	endif
	let l:line .= " "
	" buffern number
	let l:line .= '%(#%{bufnr()}%)'
	" filetype
	let l:line .= '%( %{&filetype}%)'
	" truncation point
	let l:line .= ' %<· '
	" sep
	" let l:line .= l:sep.l
	" encoding
	let l:line .= '%(%{hackline#fileencoding#info()}%)'
	" format
	let l:line .= '%(' . l:sep_i . '%{&fileformat}%)'
	" tabs/spaces
	let l:line .= '%(' . l:sep_i . '%{hackline#ui#tab#info("min")}%)'
	" sep
	let l:line .= l:sep.l
	" CWD
	if len(getcwd(0)) > 1
		let l:line .= "%(%{split(getcwd(0), '/')[-1]}%)"
		" Git
		let l:line .= hackline#ui#git#info("*")
		let l:line .= "/"
	endif
	" file path
	let l:line .= '%(%{hackline#ui#dir#info("xl")}%t%)'
	" modified flag
	let l:line .= '%(%m%)'

	" Statusline Right Side
	" ---------------------

	let l:line .= l:len_i . "%="
	" Nvim LSP
	if l:active && has("nvim")
		let l:line .= hackline#ui#nvim_lsp#info("", l:sep.r)
	endif
	" Vim LSP
	if l:active && get(b:, "hackline_use_vim_lsp", "0")
		let l:line .= "LSP "
	endif
	" Lang
	if l:active && &spell == 1
		let l:line .= "%(" . l:sep.r . "%{&spelllang}" . l:sep_i . "%)"
	endif
	" Cursor position
	let l:line .= "%l/%L:%c"
	" End spacing
	let l:line .= " "

	return l:line
endfunction
