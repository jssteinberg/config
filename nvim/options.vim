" OPTIONS
set clipboard+=unnamedplus
set copyindent
set list listchars=tab:\·\ ,trail:\~,extends:… " Show tabs, consistent char
set undofile
set packpath+=~/.vim/pack/mypac

" ALIAS GREP
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" AUTO COMMANDS
augroup nvim_init
	au!
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
	" Open quickfix window when relevant
	au QuickFixCmdPost [^l]* cwindow
augroup END
