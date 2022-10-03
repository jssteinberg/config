" DEFAULTS
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" OPTIONS
set clipboard=unnamed " Sync system clioboard
set hidden " Unsaved files can be 'hidden'
set foldmethod=indent nofoldenable
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set list listchars=tab:\│\ 
" set list listchars=tab:\·\  fillchars=vert:\· " Show tabs, consistent char
set number relativenumber signcolumn=yes " Line number, relative numbers, always show signcolumn
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set sessionoptions=curdir,folds,tabpages,help
set tabstop=2 shiftwidth=2 " indent size
set wildmode=lastused:full " :b <tab> for last used buffer(s)
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`

if executable('rg')
	set grepformat^=%f:%l:%c:%m grepprg=rg\ --line-number\ --column
endif

" alias to silent grep
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'

" Persisten undo, mkdir
if !isdirectory($HOME."/.vimundo") | call mkdir($HOME."/.vimundo", "", 0770) | endif
set undofile undodir=$HOME/.vimundo

" Netrw, built in explorer
"let g:netrw_preview=1 " Vertical preview
let g:netrw_winsize=25

" Keymaps
" -------
" Better defaults
vnoremap < <gv
vnoremap > >gv
nnoremap Y y$
nnoremap <silent> <c-l> :nohlsearch<cr><c-l>
cnoremap <c-p> <up>
cnoremap <c-n> <down>
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

" Esc [normal, terminal]
inoremap jk <esc>
tnoremap jk <c-w>N

" Search (for their defaults, use cl and cc) [search, backwards, visual mode]
nnoremap <c-s> /
xnoremap <c-s> /

" Set space as leader key
"nnoremap <space> <nop>
let mapleader=' '

" Alternate buffer
nnoremap <leader>b :buffer#<cr>

" Buffer switcher
nnoremap <leader><tab> :buffer 

" Write/save file
nnoremap <silent> <leader>w :w<cr>

" Edit/explore [explore cwd, explore buffer dir, project drawer, buffer in new tab]
nnoremap <leader>e. :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:edit .<cr>
nnoremap <leader>eh :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:edit %:p:.:h<cr>
nnoremap <leader>ec :tabedit $MYVIMRC<cr>
nnoremap <leader>et :let g:netrw_banner=0<cr>:let g:netrw_liststyle=3<cr>:Lexplore<cr>
nnoremap <leader>tb :tabedit %<cr>'"
nnoremap <leader>ep :edit package.json<cr>
nnoremap <leader>er :edit README.md<cr>
nnoremap <leader>ew :edit **/*
nnoremap <leader>fw :find **/*

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
nnoremap <expr> Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" Grep
nnoremap <leader>G :silent grep -g 
nnoremap gr "gyiw<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:copen<cr>
nnoremap gs "gyiw<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:copen<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/
vnoremap gr "gy<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:copen<cr>
vnoremap gs "gy<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:copen<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/

" Replace [normal, visual]
nnoremap <leader>R :%s/
vnoremap <leader>R :s/

" Netrw remaps
function! NetrwRemaps ()
	nn <buffer> s /
	nn <buffer> S ?
endfunction

" Marks
nnoremap <leader>ha 'A
nnoremap <leader>hs 'S
nnoremap <leader>hd 'D
nnoremap <leader>hf 'F

" FZF (https://dev.to/pbnj/interactive-fuzzy-finding-in-vim-without-plugins-4kkj)
function! FZF() abort
	let l:tempname = tempname()
	" fzf | awk '{ print $1":1:0" }' > file
	execute 'silent !fzf --multi ' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
	try
		execute 'cfile ' . l:tempname
		redraw!
	finally
		call delete(l:tempname)
	endtry
endfunction

command! -nargs=* Files call FZF()

nnoremap <leader>s :Files<cr>

" Autocommands
augroup vimrc
	au!
	autocmd FileType netrw call NetrwRemaps()
	" Set LSP keymaps for buffer
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
