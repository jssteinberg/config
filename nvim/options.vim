set clipboard=unnamedplus
set copyindent
set cursorline
set hidden
set fileencoding=utf-8
set foldmethod=indent nofoldenable
set ignorecase smartcase
set list listchars+=tab:\·\  fillchars+=vert:\·
set number relativenumber signcolumn=yes
set mouse=a
set sessionoptions=curdir,folds,tabpages,help
set scrolloff=5
set synmaxcol=200 " reduce column to search for syntax items
set tabstop=2 shiftwidth=2 " indent size
set timeoutlen=500 " Wait less for typing of keymaps
set undofile noswapfile
set updatetime=100
set wildignorecase wildmode=lastused:full wildignore+=**/node_modules/**
set wrap breakindent linebreak " Inherit indent, `linebreak` use `breakat`

" Formatoptions
" (c) auto hard wrap comments
" (j) remove comment leader when joining lines
" (l) don't break long lines (does c still work?)
" (n) recognize numbered lists
" (p) don't break lines on single space following period
" (q) allow gq formatting
set formatoptions=cjlnpq

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
