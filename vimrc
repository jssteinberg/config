" Vim 8 vimrc boilerplate
" =======================

" Load Vim 8 defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Options
" -------
set clipboard=unnamed " Sync system clioboard
set cursorline " Highlight cursorline
set hidden " Unsaved files can be 'hidden'
set foldmethod=indent nofoldenable
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set list listchars=tab:\·\  fillchars=vert:\· " Show tabs, reuse char
set number relativenumber signcolumn=yes " Line number, relative numbers, always show signcolumn
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set sessionoptions=curdir,folds,tabpages,help
set wildmode=lastused:full " :b <tab> for last used buffer(s)
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`

" Persisten undo, mkdir
if !isdirectory($HOME."/.vimundo") | call mkdir($HOME."/.vimundo", "", 0770) | endif
set undofile undodir=$HOME/.vimundo

" Netrw, built in explorer
let g:netrw_preview=1 " Vertical preview
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

" Esc [normal, terminal]
inoremap jk <esc>
tnoremap jk <c-w>N

" Search (for their defaults, use cl and cc) [search, backwards, visual mode]
nnoremap s /
nnoremap S ?
vnoremap s /

" Shift + J/K moves selected lines down/up in visual mode
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '

" Alternate buffer
nnoremap <bs> :buffer#<cr>
nnoremap <leader>b :buffer#<cr>

" Buffer switcher
nnoremap <leader><tab> :buffer 

" Write/save file
nnoremap <leader>w :w<cr>

" Edit/explore [explore cwd, explore buffer dir, project drawer, buffer in new tab]
nnoremap <leader>e. :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:edit .<cr>
nnoremap <leader>eb :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:edit %:p:.:h<cr>
nnoremap <leader>ec :tabedit $MYVIMRC<cr>
nnoremap <leader>et :let g:netrw_banner=0<cr>:let g:netrw_liststyle=3<cr>:Lexplore<cr>
nnoremap <leader>tb :tabedit %<cr>'"

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>

" Replace [normal, visual]
nnoremap <leader>R :%s/
vnoremap <leader>R :s/

" Netrw remaps
function! NetrwRemaps ()
	nn <buffer> s /
endfunction

" Packages config
" ---------------
" Requires https://github.com/kristijanhusak/vim-packager
" Commands for packages
command! -nargs=* -bar PackagerInstall call PackagerInit() | call packager#install(<args>)
command! -nargs=* -bar PackagerUpdate call PackagerInit() | call packager#update(<args>)
command! -bar PackagerClean call PackagerInit() | call packager#clean()
command! -bar PackagerStatus call PackagerInit() | call packager#status()

" FZF Fuzzy finder
nnoremap <leader>ff :Clap files<cr>
nnoremap <leader>fs :Clap grep<cr>
nnoremap <leader>gf :Clap gfiles<cr>

" Ripgrep
nnoremap <leader>G :Rg 
vnoremap <leader>G y:Rg -e "<c-r>""<cr>

" Git
nnoremap <leader>gg :Git<cr>
nnoremap <leader>gq :Git mergetool<cr>

" LSP keymaps
function! s:on_lsp_buffer_enabled() abort
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> gq :LspDocumentFormatSync<cr>
	nmap <buffer> K <plug>(lsp-hover)
	nmap <buffer> <leader>la :LspCodeAction<cr>
	nmap <buffer> <leader>ld :LspDocumentDiagnostics<cr>
	nmap <buffer> <leader>ln <plug>(lsp-next-diagnostic)
	nmap <buffer> <leader>lp <plug>(lsp-previous-diagnostic)
	nmap <buffer> <leader>lr <plug>(lsp-rename)
	inoremap <buffer> <expr><c-d> lsp#scroll(-4)
	inoremap <buffer> <expr><c-f> lsp#scroll(+4)
endfunction

" Colorscheme
source $HOME/.config/colocyclone.vim
nnoremap <silent> <leader>cc :call ColoNext()<cr>
let g:colo_favs=[ #{name:'spacegray',transparent:1}, #{name:'iceberg',bg:'light'} ]
call SetColorscheme(g:colo_favs[0]) | let g:colo_favs[0].current=1

" Autocompletion
set completeopt+=menuone completeopt+=noselect shortmess+=c belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1

" Close tags
let g:closetag_filetypes = 'html,javascript,markdown,php,svelte,typescript,twig,vue'
let g:closetag_xhtml_filenames = g:closetag_filetypes

" Autocommands
augroup vimrc
	au!
	autocmd FileType netrw call NetrwRemaps()
	" Set LSP keymaps for buffer
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Packages
function! PackagerInit() abort
	packadd vim-packager
	call packager#init()
	call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
	call packager#add('liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }) " Fuzzy
	call packager#add('sheerun/vim-polyglot') " More filetypes, detect indent
	call packager#add('jremmen/vim-ripgrep') " Integrates ripgrep
	call packager#add('tpope/vim-surround') " Surround with brackets or quotes
	call packager#add('subnut/visualstar.vim') " Search selection with * or #
	call packager#add('tpope/vim-fugitive') " `G` command for git
	call packager#add('mhinz/vim-startify') " For session handling
	call packager#add('tommcdo/vim-lion') " Align text with gl gL
	call packager#add('tpope/vim-commentary') " Toggle comments with gcc
	call packager#add('jssteinberg/hackline.vim') " Light statusline
	" Code completion
	call packager#add('cohama/lexima.vim') " Autocomplete brackets and quotes
	call packager#add('alvan/vim-closetag') " Autocomplete tags
	" LSP auto completion
	call packager#add('prabirshrestha/vim-lsp')
	call packager#add('mattn/vim-lsp-settings')
	call packager#add('prabirshrestha/asyncomplete.vim')
	call packager#add('prabirshrestha/asyncomplete-lsp.vim')
	call packager#add('lifepillar/vim-mucomplete') " Tab-completing mappings and vanilla completion
	" Colorschemes
	call packager#add('ackyshake/Spacegray.vim')
	call packager#add('cocopon/iceberg.vim')
endfunction
