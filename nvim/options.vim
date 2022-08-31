set clipboard=unnamedplus
set copyindent
set cursorline
set hidden
set fileencoding=utf-8
set foldmethod=indent nofoldenable
set ignorecase smartcase
" set list listchars+=tab:\│\ 
set list listchars+=tab:\·\ 
" fillchars+=vert:\·
set number relativenumber signcolumn=yes
set mouse=a
set sessionoptions=curdir,folds,tabpages,help
set scrolloff=5
set synmaxcol=300 " reduce column to search for syntax items
set tabstop=2 shiftwidth=2 " indent size
set timeoutlen=500 " Wait less for typing of keymaps
set undofile noswapfile
set updatetime=100
set wildignorecase wildmode=lastused:full wildignore+=**/node_modules/**
set wrap breakindent linebreak " Inherit indent, `linebreak` use `breakat`

if exists("&winbar")
	augroup winbar
		au!
		au BufReadPost * setlocal winbar=%{pathshorten(expand('%:p:.:h'))}/%t%m
	augroup END

	try
		set laststatus=3
		" set cmdheight=0
		" let g:somedarkterminal1_statusline_bg = "none"
	catch | endtry
else
	set showtabline=2
endif

" FORMATOPTIONS

" (c) auto hard wrap comments
" (j) remove comment leader when joining lines
" (l) don't break long lines (does c still work?)
" (n) recognize numbered lists
" (p) don't break lines on single space following period
" (q) allow gq formatting
set formatoptions=cjlnpq

" NETRW

let g:netrw_altfile = 1
let g:netrw_alto = 1
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_sort_by = "exten"

" GREP

if executable('rg')
	" use ripgrep
	set grepformat^=%f:%l:%c:%m grepprg=rg\ --line-number\ --column
endif

" alias to silent grep
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" AUTO COMMANDS

augroup option_like_autocmds
	au!
	" Go to last known cursor position, unless it's invalid
	autocmd BufReadPost *
				\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
				\ |   exe "normal! g`\""
				\ | endif
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
augroup END
