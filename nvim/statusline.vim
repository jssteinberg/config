set tabline=%!Hacktabs()  " custom tab pages line

function! MyTabLabel(n) abort
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let wins = tabpagewinnr(a:n, "$")
	let dirty = 0 | for b in buflist | if getbufvar(b, "&mod") | let dirty = 1 | endif | endfor
	let label = (dirty ? "+" : "") .. a:n . "-" . wins

	if tabpagenr() == a:n
		let bufname = bufname(buflist[winnr - 1])
		return label .. (bufname != "" ? " " . fnamemodify(bufname, ":p:.") : "-")
	else
		return label
	endif
endfunction

function! Hacktabs() abort
	let s = '' | for i in range(tabpagenr('$'))
		let s ..= i + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
		" set the tab page number (for mouse clicks)
		let s ..= '%' .. (i + 1) .. 'T'
		" the label is made by MyTabLabel()
		let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	return s .. '%#TabLineFill#%T'
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

	if l:active && mode() != "n"
		" Start spacing
		let l:line .= " "
		let l:line .= "%1(%{StatuslineModeLabels()}%)"
	else
		" Start spacing
		let l:line .= " "
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
	let l:line .= "%(%{hackline#ui#dir#info('lg')}/%)"
	" filename
	let l:line .= "%(%t%)"

	let l:line .= l:sep.l

	" Cursor position
	let l:line .= "l-%l/%L c-%c"

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
