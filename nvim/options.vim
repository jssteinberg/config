" OPTIONS
set clipboard+=unnamedplus
set copyindent
set list listchars=tab:\·\ ,trail:\~,extends:… " Show tabs, consistent char
set undofile

" ALIAS GREP
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" AUTO COMMANDS
augroup nvim_init
	au!
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
augroup END
