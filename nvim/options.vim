" OPTIONS
set clipboard+=unnamedplus
set undofile
set diffopt+=vertical
set fillchars+=eob:\ ,vert:\·

" NETRW OPTIONS
let g:netrw_banner=0
let g:netrw_preview=1 " Vertical preview

" NETRW KEYMAPS
function! SetNetrwKeymaps() abort
	nn <buffer> s /
	nn <buffer> S ?
	nmap <buffer> <c-j> <cr>
	nmap <buffer> <c-k> v
endfunction

function! TermcwdCallback() abort
	setlocal winheight=20
	setlocal nonumber
endfunction

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
	" Set netrw maps
	autocmd filetype netrw call SetNetrwKeymaps()
augroup END
