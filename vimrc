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
set number relativenumber " Relative numbers, number on cursor line
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set sessionoptions=curdir,folds,tabpages,help
set wildmode=lastused:full " :b <tab> for last used buffer(s)
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`

" Persisten undo, mkdir
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

" Shift + J/K moves selected lines down/up in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
nnoremap <leader>ec :tabedit $MYVIMRC<cr>
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

" Git via fugitive
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gP :Git push<cr>

" Ripgrep
nnoremap <leader>G :Rg 
vnoremap <leader>G y:Rg -e "<c-r>""<cr>

" Linting
nnoremap gd :ALEGoToDefinition<cr>
nnoremap <leader>lh :ALEHover<cr>
nnoremap <leader>lr :ALEFindReferences<cr>
nnoremap <leader>la :ALECodeAction<cr>

" Colorscheme
source $HOME/.config/colocyclone.vim
nnoremap <silent> <leader>cc :call ColorschemeCycleFavs()<cr>
let g:colo_favs=[#{name:'tokyobones',transparent:1}, #{name:'spacegray'}, #{name:'iceberg',transparent:1}, #{name:'iceberg',bg:'light'}]
autocmd VimEnter * call SetColorscheme(g:colo_favs[0]) | let g:colo_favs[0].current=1

" Autocompletion MUcomplete
set completeopt+=menuone,noselect shortmess+=c belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1

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
	call packager#add('mhinz/vim-startify') " For session handling
	call packager#add('tommcdo/vim-lion')
	call packager#add('jssteinberg/hackline.vim') " Pre-configured statusline
	" Colorschemes
	call packager#add('ghifarit53/tokyonight-vim')
	call packager#add('ackyshake/Spacegray.vim')
	call packager#add('cocopon/iceberg.vim')
	call packager#add('mcchrish/zenbones.nvim')
endfunction
