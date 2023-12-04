function! Hackline(status) abort
	let l:active = a:status
	" separator sections
	let l:sep = #{l: "  /  ", r: "  /  "}
	" seperator secondary
	let l:sep_s = #{l: "  ", r: "  "}
	" separator items
	let l:sep_i = "/"

	" Statusline Start
	" ----------------
	let l:line = ""

	" set statusline default color
	let l:line .= l:active ? "%#StatusLine#" : "%#StatusLineNC#"
	" set mode style
	if l:active && mode() != "n"
		let l:line .= s:ShowMode()
	endif

	" Start spacing
	let l:line .= "  "

	" modified flag
	let l:line .= "%(%M" . l:sep_i . "%)"
	" commercial
	let l:line .= has("nvim") ? "Neo" : "Vim"

	let l:line .= l:sep_i

	" buffern number
	let l:line .= "%(b%{bufnr()}" . l:sep.l . "%)"

	" filetype
	let l:line .= "%(%{&filetype}" . l:sep.l . "%)"

	" file path
	let l:line .= "%(%{hackline#ui#dir#info('xl')}/%)"
	" filename
	let l:line .= "%(%t" . l:sep_s.l . "%)"

	" truncation point
	let l:line .= "%<"

	" Statusline END
	" --------------
	let l:line .= "%="

	" vim lsp
	if l:active && get(b:, "hackline_use_vim_lsp", "0")
		let l:line .= l:sep_s.l . "LSP" . l:sep.r
	endif

	" nvim LSP
	if l:active && has("nvim")
		let l:line .= hackline#ui#nvim_lsp#info(l:sep_s.l, "LSP", l:sep_i, l:sep_i, l:sep.r)
	endif

	" Cursor position
	let l:line .= "line %l/%L col %c"
	" Cursor position short
	" let l:line .= "%l/%L:%c"

	let l:line .= l:sep_s.r

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

	" CWD
	if len(getcwd(0)) > 1
		let l:line .= l:sep.r
		let l:line .= "%(%{split(getcwd(0), '/')[-1]}%)"
		" Git
		let l:line .= hackline#ui#git#info("*")
	endif

	" End spacing
	let l:line .= "  "

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
