" OPTIONS
set clipboard=unnamedplus
set copyindent
set list listchars+=tab:\·\  " Show tabs, consistent char

" ALIAS GREP
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" AUTO COMMANDS
augroup options
	au!
	" Go to last known cursor position, unless it's invalid
	autocmd BufReadPost *
				\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
				\ |   exe "normal! g`\""
				\ | endif
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
	" Open quickfix window when relevant
	autocmd QuickFixCmdPost [^l]* cwindow
augroup END
