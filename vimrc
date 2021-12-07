" Vim 8 vimrc boilerplate
" =======================

" Load Vim 8 defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Options
" -------
set clipboard=unnamed " Sync with system clioboard
set cursorline " Cursorline for jumping around
set hidden " Unsaved files can be 'hidden'
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set list listchars=tab:\-\  " Show tabs if used
set number relativenumber " Relativenumber with number on cursorline
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set wildmode=lastused:full " lastused :buffer
set wrap breakindent linebreak " Wrap inherit indent, `breakat` based linebreak

" Persisten undo, mkdirs
if !isdirectory($HOME."/.vimundo")
	call mkdir($HOME."/.vimundo", "", 0770)
endif
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
nnoremap <c-l> <c-l>:nohlsearch<cr>
cnoremap <c-p> <up>

" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '

" Esc [normal, terminal]
inoremap jk <esc>
tnoremap jk <c-w>N

" Search mappings (for their defaults, use cl and cc) [search, backwards]
nnoremap s /
nnoremap S ?

" Alternate buffer
nnoremap <bs> :buffer#<cr>

" Buffer switcher
nnoremap <leader><tab> :buffer 

" Write/save file
nnoremap <leader>w :w<cr>

" Edit/explore [explore cwd, explore buffer dir, project drawer, buffer in new tab]
nnoremap <leader>e. :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:edit .<cr>
nnoremap <leader>eb :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:Explore<cr>
nnoremap <leader>et :let g:netrw_banner=0<cr>:let g:netrw_liststyle=3<cr>:Lexplore<cr>
nnoremap <leader>tb :tabedit %<cr>'"

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>

" Replace [normal, visual]
nnoremap <leader>R :%s/
vnoremap <leader>R :%s/

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
nnoremap <leader>G :Rg -e 
vnoremap <leader>G y:Rg -e "<c-r>""<cr>

" Linting
nnoremap gd :ALEGoToDefinition<cr>
nnoremap <leader>lh :ALEHover<cr>
nnoremap <leader>lr :ALEFindReferences<cr>
nnoremap <leader>la :ALECodeAction<cr>
let g:ale_fixers = {
			\   '*': ['remove_trailing_lines'],
			\}

" Autocompletion MUcomplete
set completeopt+=menuone,noselect shortmess+=c belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1

" Colorscheme
autocmd VimEnter * call SetColorscheme()
function! SetColorscheme()
	try
		" Some settings only with newer colorscheme
		set termguicolors hlsearch | colorscheme tokyonight
	catch /^Vim\%((\a\+)\)\=:E185/
		set notermguicolors nohlsearch | colorscheme default
	endtry
endfunction

function! PackagerInit() abort
	packadd vim-packager
	call packager#init()
	call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
	call packager#add('liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }) " Fuzzy
	call packager#add('sheerun/vim-polyglot') " More filetypes, detect indent
	call packager#add('jremmen/vim-ripgrep') " Integrates ripgrep
	call packager#add('tpope/vim-surround') " Surround with brackets or quotes
	call packager#add('subnut/visualstar.vim') " Search selection with * or #
	call packager#add('cohama/lexima.vim') " Autocomplete brackets and quotes
	call packager#add('lifepillar/vim-mucomplete') " Autocomplete menu
	call packager#add('tpope/vim-fugitive') " `G` command for git
	call packager#add('dense-analysis/ale') " Linting and LSP
	call packager#add('jssteinberg/hackline.vim') " Pre-configured statusline
	" Colorschemes
	call packager#add('ghifarit53/tokyonight-vim')
	call packager#add('sonph/onehalf', {'rtp': 'vim/'})
	call packager#add('ackyshake/Spacegray.vim')
	call packager#add('cocopon/iceberg.vim')
endfunction
