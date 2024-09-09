" NEOVIM OPTIONS

set clipboard+=unnamedplus
set undofile
set diffopt+=vertical

if has("gui_running")
	set guifont=cousine\ nerd\ font\ mono:h15
	set guifont=menlo:h14
	set linespace=2
en

" Auto commands
augroup nvim_init
	au!
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
	" Open quickfix window when relevant
	au QuickFixCmdPost [^l]* cwindow
augroup END
