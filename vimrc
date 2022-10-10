" DEFAULTS
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" OPTIONS
set clipboard=unnamed " Sync system clioboard
set cursorline " Highlight cursor line
set hidden " Unsaved files can be 'hidden'
set foldmethod=indent nofoldenable
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set list listchars=tab:\·\  fillchars=vert:\│ " Show tabs, consistent char
set number relativenumber " Line number, relative numbers
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set sessionoptions=curdir,folds,tabpages,help
set tabstop=2 shiftwidth=2 " indent size
set wildmode=lastused:full " :b <tab> for last used buffer(s)
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`
set showtabline=2 " Always show tabline

" Persisten undo, mkdir
if !isdirectory($HOME.'/.vimundo') | call mkdir($HOME.'/.vimundo', '', 0770) | endif
set undofile undodir=$HOME/.vimundo

" netrw settings
let g:netrw_altfile = 1
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_sort_by = "exten"
let g:netrw_winsize=25

" grep
if executable('rg')
	set grepformat^=%f:%l:%c:%m grepprg=rg\ --line-number\ --column
endif

" KEYMAPS
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

" Edit/explore [explore cwd, explore buffer dir, ...]
nnoremap <leader>e. :edit .<cr>
nnoremap <leader>eh :edit %:p:.:h<cr>
nnoremap <leader>ec :tabedit ~/.config/vimrc<cr>:tcd  %:p:.:h<cr>
nnoremap <leader>ep :edit package.json<cr>
nnoremap <leader>er :edit README.md<cr>
nnoremap <leader>ew :edit **/*
nnoremap <leader>fw :find **/*
" ...with tabs
nnoremap <leader>tb :tabedit %<cr>'"
nnoremap <leader>C :tabclose<cr>

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
nnoremap <expr> Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" Grep
nnoremap <leader>G :Grep 
nnoremap gr "gyiw<cr>:grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:copen<cr>
nnoremap gs "gyiw<cr>:grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:copen<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/
vnoremap gr "gy<cr>:grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:copen<cr>
vnoremap gs "gy<cr>:grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:copen<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/

" Replace [normal, visual]
nnoremap <leader>R :%s/
vnoremap <leader>R :s/

" Marks
nnoremap <leader>ha 'A'"
nnoremap <leader>hs 'S'"
nnoremap <leader>hd 'D'"
nnoremap <leader>hf 'F'"
nnoremap <leader>hc 'C'"

" Fuzzy find
nnoremap <leader>s :Files<cr>

" FZF
" https://dev.to/pbnj/interactive-fuzzy-finding-in-vim-without-plugins-4kkj
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

" GREP COMMAND
" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
function! Grep(...)
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" COLORS
set bg=dark
colo lunaperche " DUAL lunaperche DARK: habamax torte LIGHT: quiet zellner 
hi Normal ctermbg=NONE
hi! link Tabline Normal
hi! link TablineFill Tabline
