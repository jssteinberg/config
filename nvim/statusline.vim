function! s:ShowMode(sep_l = "", sep_r = "") abort
	if mode() == "i"     | return "%#IncSearch#" . a:sep_l . "I" . a:sep_r
	elseif mode() == "c" | return "%#IncSearch#" . a:sep_l . "C" . a:sep_r
	elseif mode() == "t" | return "%#IncSearch#" . a:sep_l . "T" . a:sep_r
	elseif mode() == "r" | return "%#IncSearch#" . a:sep_l . "R" . a:sep_r
	elseif mode() == "s" | return "%#IncSearch#" . a:sep_l . "S" . a:sep_r
	else                 | return "%#IncSearch#" . a:sep_l . "V" . a:sep_r
	endif
endfunction

function! Hackline(status) abort
	let l:active = a:status
	let l:hi = hackline#config#highlight_groups()
	" separator sections
	let l:sep = #{
				\l: '  –  ',
				\r: '  \  ',
				\}
	" separator items
	let l:sep_i = get(g:, "hackline_sep_items", "  ")
	" length in spaces for item separator
	let l:len_i = repeat(' ', strlen(l:sep_i))
	" inline padding
	" set initial highlight group (color)
	let l:line = ''
	let l:line .= l:active ? l:hi.start : l:hi.inactive

	" Statusline Left Side
	" --------------------

	if l:active && hackline#config#mode() && mode() != 'n'
		let l:line .= s:ShowMode(" —", "—")
		" sep
		let l:line .=	"  / "
	else
		" ...or only inline padding
		let l:line .= " "
	endif
	" CWD
	if len(getcwd(0)) > 1
		let l:line .= "%(%{split(getcwd(0), '/')[-1]}%)"
		" Git
		let l:line .= hackline#ui#git#info("*")
		let l:line .=	"/  "
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
	let l:line .= '%( %m%)'

	" Statusline Right Side
	" ---------------------

	let l:line .= l:len_i . "%="
	" Nvim LSP
	if l:active && has("nvim")
		let l:line .= hackline#ui#nvim_lsp#info("", l:sep_i)
	endif
	" Vim LSP
	if get(b:, "hackline_use_vim_lsp", "0") &&  l:active
		let l:line .= 'LSP' . l:sep_i
	endif
	" Cursor position
	if hackline#util#has_winwidth("md")
		let l:line .= "\\_%l/%L co\\_%c"
	else
		let l:line .= l:sep_i . "line %l/%L"
	endif
	" End spacing
	let l:line .= " "

	return l:line
endfunction
