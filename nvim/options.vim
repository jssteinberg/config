" OPTIONS
set clipboard+=unnamedplus
set copyindent
set undofile
set cursorcolumn
set number
set signcolumn=number

" ALIAS GREP
" cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
" cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" AUTO COMMANDS
augroup nvim_init
	au!
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
	" Open quickfix window when relevant
	au QuickFixCmdPost [^l]* cwindow
	" When new window is opened or close, or when tab is changed
	autocmd WinEnter * :call s:StatuslineStyle()
augroup END

function! s:StatuslineStyle() abort
	let g:nightcool_statusline = winnr('$') != 1 && &laststatus != 3
				\ ? "underline"
				\ : ""

	if g:colors_name == "nightcool"
		colo nightcool
	endif
endfunction
