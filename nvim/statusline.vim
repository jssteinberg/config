set laststatus=3
set winbar=%f

function! Hackline(status) abort
	let l:active = a:status
	" separator label
	let l:sep_l = " "
	" separator sections
	let l:sep = #{l: "  --  ", r: "  /  "}
	" seperator secondary
	let l:sep_s = #{l: "  " , r: " "}
	" separator items
	let l:sep_i = #{l: " " , r: " "}

	" Statusline Start
	" ----------------
	let l:line = ""

	" set statusline default color
	let l:line .= l:active ? "%#StatusLine#" : "%#StatusLineNC#"

	" Start spacing
	let l:line .= " "

	if l:active && mode() != "n"
		let l:line .= "%1(%{StatuslineModeLabels()}%)"
	else
		" modified flag, fixed width 1
		let l:line .= "%1(%M%)"
	endif

	" spacing
	let l:line .= " "

	" buffern number
	let l:line .= "%(:b%{bufnr()}%)"

	" filetype
	let l:line .= "%(" . l:sep_i.l . "%{&filetype}%)"

	let l:line .= l:sep.l

	" file path
	let l:line .= "%(%{hackline#ui#dir#info('xl')}/%)"
	" filename
	let l:line .= "%(%t%)"

	let l:line .= l:sep.l

	" Cursor position
	let l:line .= "%l/%LG-%c"

	" Statusline END
	" --------------
	let l:line .= "%=" . l:sep_s.r

	" truncation point
	let l:line .= "%<"

	" vim lsp
	if l:active && get(b:, "hackline_use_vim_lsp", "0")
		let l:line .= "LSP" . l:sep.r
	endif

	" nvim LSP
	if l:active && has("nvim")
		let l:line .= hackline#ui#nvim_lsp#info("", "LSP", l:sep_l, l:sep_i.r, l:sep.r)
	endif

	" spelllang
	if l:active && &spell == 1
		let l:line .= "%(spl=%{&spelllang}" . l:sep_i.r . "%)"
	endif
	" tabs/spaces
	let l:line .= "%(%{hackline#ui#tab#info('min')}" . l:sep_i.r . "%)"
	" encoding
	let l:line .= "%(%{hackline#fileencoding#info()}%)"
	" format
	let l:line .= "%(" . l:sep_i.r . "%{&fileformat}%)"

	" CWD
	if len(getcwd(0)) > 1
		let l:line .= l:sep.r
		let l:line .= "%(%{split(getcwd(0), '/')[-1]}%)"
		" Git
		let l:line .= hackline#ui#git#info(" *")
	endif

	" End spacing
	let l:line .= "   "

	return l:line
endfunction

function! StatuslineModeLabels(sep_l = "", sep_r = "") abort
	if mode() == "i"     | return "i"
	elseif mode() == "c" | return "c"
	elseif mode() == "t" | return "t"
	elseif mode() == "r" | return "r"
	elseif mode() == "s" | return "s"
	else                 | return "v"
	endif
endfunction

function! s:ModeHis(sep_l = "", sep_r = "") abort
	if mode() == "i"     | return "%#IncSearch#"
	elseif mode() == "c" | return "%#IncSearch#"
	elseif mode() == "t" | return "%#IncSearch#"
	elseif mode() == "r" | return "%#IncSearch#"
	elseif mode() == "s" | return "%#IncSearch#"
	else                 | return "%#IncSearch#"
	endif
endfunction
