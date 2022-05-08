" Vis 8 vimrc boilerplate
" =======================

" Load Vim 8 defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Options
" -------
set clipboard=unnamed " Sync system clioboard
set hidden " Unsaved files can be 'hidden'
set foldmethod=indent nofoldenable
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set list listchars=tab:\·\  fillchars=vert:\· " Show tabs, consistent char
set number relativenumber " Line number, relative numbers, always show signcolumn
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
nnoremap <c-s> /
xnoremap z /
xnoremap <c-s> /

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
nnoremap <leader>eh :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:edit %:p:.:h<cr>
nnoremap <leader>ec :tabedit $MYVIMRC<cr>
nnoremap <leader>et :let g:netrw_banner=0<cr>:let g:netrw_liststyle=3<cr>:Lexplore<cr>
nnoremap <leader>tb :tabedit %<cr>'"
nnoremap <leader>ep :edit package.json<cr>
nnoremap <leader>er :edit README.md<cr>

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
nnoremap <expr> Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

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

" Packages config
" ---------------

" File Finder
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fs :Rg<cr>
nnoremap <leader>s :Files<cr>

" Ripgrep
nnoremap <leader>G :Rg 
vnoremap <leader>G y:Rg <c-r>"<cr>

" Git
nnoremap <leader>gg :Git<cr>
nnoremap <leader>gq :Git mergetool<cr>
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gP :Git push<cr>

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

try
	call jetpack#begin()

	call jetpack#add('tpope/vim-fugitive') " `G` command for git
	call jetpack#add('junegunn/fzf.vim', { 'on': ['Files', 'Rg'] })
	call jetpack#add('junegunn/fzf', { 'do': {-> fzf#install()} })

	call jetpack#add('tpope/vim-commentary') " Toggle comments with gcc
	call jetpack#add('tpope/vim-surround') " Surround with brackets or quotes
	call jetpack#add('tpope/vim-repeat') " Repeat more with '.'
	call jetpack#add('cohama/lexima.vim', { 'on': ['InsertEnter'] }) " Autocomplete brackets/quotes
	call jetpack#add('subnut/visualstar.vim') " Search selection with * or #
	call jetpack#add('tommcdo/vim-lion') " Align text with gl gL

	call jetpack#add('sheerun/vim-polyglot') " More filetypes, detect indent
	call jetpack#add('lifepillar/vim-mucomplete', { 'on': ['InsertEnter'] }) " Tab-completing mappings and vanilla completion
	call jetpack#add('jssteinberg/hackline.vim') " Light statusline
	call jetpack#add('justinmk/vim-sneak') " Sneak motion, hijack s/S

	" Colorscheming
	call jetpack#add('ackyshake/Spacegray.vim')
	call jetpack#add('cocopon/iceberg.vim')

	call jetpack#end()

	colo spacegray | set bg=dark hlsearch termguicolors

	highlight Normal guibg=NONE
	highlight LineNr guibg=NONE
	highlight SignColumn guibg=NONE

	" call jetpack#add('jremmen/vim-ripgrep') " Integrates ripgrep
	" call jetpack#add('mhinz/vim-startify') " For session handling
	" " Code completion
	" call jetpack#add('alvan/vim-closetag', { 'on': ["InsertEnter"] }) " Autocomplete tags
	" " LSP auto completion
	" call jetpack#add('prabirshrestha/vim-lsp')
	" call jetpack#add('mattn/vim-lsp-settings')
	" call jetpack#add('prabirshrestha/asyncomplete.vim', { 'on': ["InsertEnter"] })
	" call jetpack#add('prabirshrestha/asyncomplete-lsp.vim', { 'on': ["InsertEnter"] })
catch
	colorscheme default
	set notermguicolors t_Co=16 nohlsearch
endtry
