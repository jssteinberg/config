" OPTIONS
set noswapfile undofile
set clipboard=unnamedplus
set copyindent
set cursorline
set hidden
set fileencoding=utf-8
set foldmethod=indent nofoldenable
set ignorecase smartcase
set list listchars+=tab:\·\ 
set number relativenumber signcolumn=yes:1
set sessionoptions=curdir,folds,tabpages,help
set scrolloff=15
set splitright
set synmaxcol=300 " reduce column to search for syntax items
set tabstop=2 shiftwidth=2 " indent size
set timeoutlen=500 " Wait less for typing of keymaps
set updatetime=100
set wildignorecase wildmode=lastused:full wildignore+=**/node_modules/**,**/.git/**
set wrap breakindent linebreak " Inherit indent, `linebreak` use `breakat`
set showtabline=2

if executable('rg')
	" set grepformat^=%f:%l:%c:%m grepprg=rg\ --line-number\ --column
	set grepformat^=%f:%l:%c:%m grepprg=rg\ --vimgrep
endif

" NETRW OPTIONS
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_sort_by = "exten"

" FORMAT OPTIONS
" (c) auto hard wrap comments
" (j) remove comment leader when joining lines
" (l) don't break long lines (does c still work?)
" (n) recognize numbered lists
" (p) don't break lines on single space following period
" (q) allow gq formatting
set formatoptions=cjlnpq

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
	" Remove numbers in terminal
	autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
	" Open quickfix window when relevant
	autocmd QuickFixCmdPost [^l]* cwindow
augroup END
