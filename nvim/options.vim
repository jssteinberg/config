" NEOVIM OPTIONS

set clipboard+=unnamedplus
set undofile

" Auto commands
augroup nvim_init
	au!
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
	" Open quickfix window when relevant
	au QuickFixCmdPost [^l]* cwindow
augroup END
