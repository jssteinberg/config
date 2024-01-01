set noshowmode
set showtabline=2
set tabline=%!Hacktabs()  " custom tab pages line

function! Hacktab(n) abort
	let buflist = tabpagebuflist(a:n)
	let winnrs = tabpagewinnr(a:n, "$")
	for b in buflist | if getbufvar(b, "&mod") | let l:m = 1 | endif | endfor
	let bufname = bufname(buflist[tabpagewinnr(a:n) - 1])
	let f = fnamemodify(bufname, ":p:.")
	return (get(l:, "m", 0) ? "+" : "") .. a:n . "-" . winnrs
				\..(bufname == "" ? ""
				\	: " "
				\		.(tabpagenr() == a:n ? f : fnamemodify(bufname, ":t"))
				\)
endfunction

function! Hacktabs() abort
	let line = "" | for i in range(tabpagenr('$'))
		let highlight = i + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
		let tabpagenrForMouseClick = '%' .. (i + 1) .. 'T'
		let tablabel = " %{Hacktab(" .. (i + 1) .. ")} "
		let line .= highlight .. tabpagenrForMouseClick . "%=" . tablabel . "%="
	endfor
	" after last tab, fill with TabLineFill and reset tab page nr
	return line .. '%#TabLineFill#%T'
endfunction

function! StatuslineModeLabels(sep_l = "", sep_r = "") abort
	return matchstr(mode(), "[nictrs]") != ""
				\ ? mode() : "v"
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
	" set some mode colors
	let l:line .= l:active && matchstr(mode(), "[itr]") != "" ? "%#IncSearch#" : ""
	" Start spacing
	let l:line .= " "

	if l:active && matchstr(mode(), "[nc]") == ""
		" (not normal or command mode)
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
	let l:line .= "%(%{hackline#ui#dir#info('md')}/%)"
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
