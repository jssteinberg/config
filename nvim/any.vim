" OPTIONS (in order of importance)
set nofoldenable foldmethod=indent
set scrolloff=15
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set wildignorecase wildmode=lastused:full wildignore+=**/node_modules/**,**/.git/**
set tabstop=2 shiftwidth=2 " indent size
set hidden " Unsaved files can be 'hidden'
set noswapfile undofile " No swap files, but undo files (requires `undodir` in Vim)
set sessionoptions=curdir,folds,tabpages,help
set number relativenumber signcolumn=yes " Show (relative)numbers and signcolumn
set cursorline " Highlight cursor line
set splitright
set showtabline=2 " Always show tabline
set timeoutlen=500 " Wait less for typing of keymaps
set updatetime=100

" FORMAT OPTIONS
" (c) auto hard wrap comments
" (j) remove comment leader when joining lines
" (l) don't break long lines (does c still work?)
" (n) recognize numbered lists
" (p) don't break lines on single space following period
" (q) allow gq formatting
set formatoptions=cjlnpq

" GREP OPTIONS
" (Rip)grep
if executable('rg')
	" set grepformat^=%f:%l:%c:%m grepprg=rg\ --line-number\ --column
	set grepformat^=%f:%l:%c:%m grepprg=rg\ --vimgrep
endif

" NETRW OPTIONS
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_sort_by = "exten"
