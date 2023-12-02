function! Hackline(status) abort
	let l:active = a:status
	" separator sections
	let l:sep = #{l: "--", r: "--"}
	" separator items
	let l:sep_i = "/"
	" length in spaces for separators
	let l:len_l = "   "
	let l:len_i = repeat(" ", strlen(l:sep_i))

	" Statusline Left Side
	" --------------------

	let l:line = ""
	" set statusline default color
	let l:line .= l:active ? "%#StatusLine#" : "%#StatusLineNC#"
	" set mode style
	if l:active && mode() != "n"
		let l:line .= s:ShowMode()
	endif
	let l:line .= " "
	" modified flag
	let l:line .= "%(%M" . l:sep_i . "%)"
	" buffern number
	let l:line .= "%(b%{bufnr()}%)"
	" filetype
	let l:line .= "%(" . l:sep_i . "%{&filetype}%)"

	" filename
	let l:line .= "%(" . l:sep_i . "%t%)"
	" truncation point
	let l:line .= " " . l:sep.l . " %<"
	" spelllang
	if l:active && &spell == 1
		let l:line .= "%(%{&spelllang}" . l:sep_i . "%)"
	endif
	" encoding
	let l:line .= "%(%{hackline#fileencoding#info()}%)"
	" format
	let l:line .= "%(" . l:sep_i . "%{&fileformat}%)"
	" tabs/spaces
	let l:line .= "%(" . l:sep_i . "%{hackline#ui#tab#info('min')}%)"
	" Nvim LSP
	if l:active && has("nvim")
		let l:line .= hackline#ui#nvim_lsp#info(" " . l:sep.l . " ", "LSP", l:sep_i, l:sep_i, "")
	endif
	" Vim LSP
	if l:active && get(b:, "hackline_use_vim_lsp", "0")
		let l:line .= " " . l:sep.l . " LSP"
	endif

	" Statusline Right Side
	" ---------------------
	let l:line .= "%=" . l:len_i
	let l:line .= " " . l:sep.r . " %="

	" CWD
	if len(getcwd(0)) > 1
		let l:line .= "%(%{split(getcwd(0), '/')[-1]}%)"
		" Git
		let l:line .= hackline#ui#git#info("*")
		" file path
		let l:line .= "%(, %{hackline#ui#dir#info('xl')}%)"
		let l:line .= " " . l:sep.r . " "
	endif
	" Cursor position
	let l:line .= "Line %l/%L Col %c"
	" End spacing
	let l:line .= " "

	return l:line
endfunction

function! s:ShowMode(sep_l = "", sep_r = "") abort
	if mode() == "i"     | return "%#IncSearch#"
	elseif mode() == "c" | return "%#IncSearch#"
	elseif mode() == "t" | return "%#IncSearch#"
	elseif mode() == "r" | return "%#IncSearch#"
	elseif mode() == "s" | return "%#IncSearch#"
	else                 | return "%#IncSearch#"
	endif
endfunction

function! HacklineSpaces(status) abort
	let l:active = a:status
	" separator sections
	let l:sep = #{l: "  ", r: "  "}
	" separator items
	let l:sep_i = "/"
	" length in spaces for item separator
	let l:len_i = repeat(" ", strlen(l:sep_i))
	let l:line = ""

	" Statusline Left Side
	" --------------------

	" set statusline default color
	let l:line .= l:active ? "%#StatusLine#" : "%#StatusLineNC#"
	" set mode style
	if l:active && mode() != "n"
		let l:line .= s:ShowMode()
	endif
	let l:line .= " "
	" modified flag
	let l:line .= "%(%M%)"
	" buffern number
	let l:line .= "%(#%{bufnr()}%)"
	" filetype
	let l:line .= "%(" . l:sep_i . "%{&filetype}%)"
	" filename
	let l:line .= "%(" . l:sep.l . "%t%)"
	" truncation point
	let l:line .= l:sep.l . "%<"
	" CWD
	if len(getcwd(0)) > 1
		let l:line .= "%(%{split(getcwd(0), '/')[-1]}%)"
		" Git
		let l:line .= hackline#ui#git#info("*")
		" file path
		let l:line .= "%( %{hackline#ui#dir#info('xl')}%)"
	endif
	" sep l
	let l:line .= l:sep.l
	" Lang
	if l:active && &spell == 1
		let l:line .= "%(%{&spelllang}" . l:sep_i . "%)"
	endif
	" encoding
	let l:line .= "%(%{hackline#fileencoding#info()}%)"
	" format
	let l:line .= "%(" . l:sep_i . "%{&fileformat}%)"
	" tabs/spaces
	let l:line .= "%(" . l:sep_i . "%{hackline#ui#tab#info('min')}%)"
	" Nvim LSP
	if l:active && has("nvim")
		let l:line .= hackline#ui#nvim_lsp#info(l:sep.l, l:len_i)
	endif
	" Vim LSP
	if l:active && get(b:, "hackline_use_vim_lsp", "0")
		let l:line .= l:sep.l . "LSP" . l:len_i
	endif

	" Statusline Right Side
	" ---------------------
	let l:line .= "%=" . l:len_i

	" Cursor position
	let l:line .= "%l/%L:%c"
	" End spacing
	let l:line .= " "

	return l:line
endfunction

