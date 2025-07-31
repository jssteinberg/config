set laststatus=3
set winbar=\ %(:b%{bufnr()}\ %)%{Pathname()}%t\ %m\ %#Normal#
set tabline=%!Hacktabs()  " custom tabline

function! Pathname() abort
	let l:p = expand('%:p:.:h')
	if l:p == '' || l:p == '.'
		return ''
	endif
	return l:p .. '/'
endfunction

function! Hacktab(n) abort
	let buflist = tabpagebuflist(a:n)
	let winnrs = tabpagewinnr(a:n, "$")
	let bufname = bufname(buflist[tabpagewinnr(a:n) - 1])
	let filePath = fnamemodify(bufname, ":p:.")
	" store if any buffer is modified
	for b in buflist | if getbufvar(b, "&mod") | let l:m = 1 | endif | endfor
	" return tab label
	return (get(l:, "m", 0) ? "[+] " : "")
				\..a:n . "gt"
				\..(bufname == ""
				\	? " [NO NAME]"
				\	: " " .. fnamemodify(bufname, ":t")
				\)
endfunction

function! Hacktabs() abort
	let line = "" | for i in range(tabpagenr('$'))
		let highlight = i + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
		let tabpagenrForMouseClick = '%' .. (i + 1) .. 'T'
		let tablabel = " %{Hacktab(" .. (i + 1) .. ")} "
		let line .= highlight .. tabpagenrForMouseClick .. tablabel
	endfor
	" after last tab, fill with TabLineFill and reset tab page nr
	return line .. '%#TabLineFill#%T'
endfunction

function! StatuslineModeLabels() abort
	return matchstr(mode(), "[nictrsv]") != ""
				\ ? mode() : "V"
endfunction

function! Hackline(status) abort
	let l:active = a:status
	" separator sections
	let l:sep = #{l: " -- ", r: " / "}
	" seperator secondary
	let l:sep_s = #{l: " " , r: " "}
	" separator items
	let l:sep_i = #{l: ", " , r: ", "}

	" Statusline Start
	" ----------------
	let l:line = ""

	" set statusline default color
	let l:line .= l:active ? "%#StatusLineNC#" : "%#StatusLineNC#"
	" Start spacing
	let l:line .= ""

	" CWD
	if len(getcwd(0)) > 1
		" sep
		let l:line .= "%(%{split(getcwd(0), '/')[-1]}%)"
		" Git
		let l:line .= hackline#ui#git#info("*")
		let l:line .= l:sep_i.l
	endif
	" file path
	let l:line .= "%#Bold#"
	let l:line .= '%(%{hackline#ui#dir#info()}/%)%t'
	let l:line .= " %m"
	let l:line .= l:active ? "%#StatusLineNC#" : "%#StatusLineNC#"
	let l:line .= "%y"
	" Cursor position
	let l:line .= l:sep_i.l
	let l:line .= "%p%%/%L L" . l:sep_s.l . "%l:%c"

	" END left
	" --------------
	let l:line .= "%=" . l:sep_s.l

	" truncation point
	let l:line .= "%<"

	" nvim LSP
	if l:active && has("nvim")
		let l:line .= hackline#ui#nvim_lsp#info(l:sep_s.l, ":Lsp…", " ", "/", l:sep.r)
	endif


	" spelllang
	if l:active && &spell == 1
		let l:line .= "%(spl=%{&spelllang}" . l:sep_i.r . "%)"
	endif
	" tabs/spaces
	let l:line .= "%(%{hackline#ui#tab#info()}" . l:sep_i.r . "%)"
	" encoding
	let l:line .= "%(%{hackline#fileencoding#info()}%)"
	" format
	let l:line .= "%(" . l:sep_i.r . "%{&fileformat}%)"

	" End spacing
	let l:line .= " "

	return l:line
endfunction
