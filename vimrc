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
cnoremap <c-p> <up>
" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '
" Esc
inoremap jk <esc>
" Follow definition in help (easier for some non US keyboards)
nnoremap <leader>9 <c-]>
" Search mappings (for their defaults, use cl and cc)
nnoremap s /
nnoremap S ?
" Alternate buffer
nnoremap <bs> :buffer#<cr>:file!<cr>
" Buffer switcher
nnoremap <leader><tab> :buffer 
" Write/save file
nnoremap <leader>w :w<cr>
" Edit/explore
nnoremap <leader>e. :edit .<cr>
nnoremap <leader>eb :Explore<cr>
nnoremap <leader>tb :tabedit %<cr>'"
" Quickfix
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
" Replace
nnoremap <leader>R :%s/
vnoremap <leader>R :%s/
" Location-list/linting
nnoremap <leader>ln lnext<cr>
nnoremap <leader>lp lprev<cr>

" Packages config
" ---------------
" Requires https://github.com/kristijanhusak/vim-packager
" Commands for packages
command! -nargs=* -bar PackagerInstall call PackagerInit() | call packager#install(<args>)
command! -nargs=* -bar PackagerUpdate call PackagerInit() | call packager#update(<args>)
command! -bar PackagerClean call PackagerInit() | call packager#clean()
command! -bar PackagerStatus call PackagerInit() | call packager#status()

" FZF Fuzzy finder
nnoremap <leader>ff :Files<cr>
xnoremap <leader>ff :Files<cr>

" Autocompletion MUcomplete
set completeopt+=menuone,noselect
set shortmess+=c " Shut off completion messages
set belloff+=ctrlg " Add only if Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

" Linting
nnoremap gd :ALEGoToDefinition<cr>
"augroup ale_config
"	autocmd!
"	autocmd FileType
"augroup END
"nnoremap <cr> :ALEHover<cr>

" Colorscheme
autocmd VimEnter * call SetColorscheme()
function! SetColorscheme()
	try
		set termguicolors
		colorscheme tokyonight
		set hlsearch " Only use with a newer colorscheme
	catch /^Vim\%((\a\+)\)\=:E185/
		set notermguicolors
		colorscheme default
	endtry
endfunction

" Statusline
let g:hackline_fugitive = 1

function! PackagerInit() abort
	packadd vim-packager
	call packager#init()
	call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
	call packager#add('sheerun/vim-polyglot') " More filetypes, detect indent
	call packager#add('editorconfig/editorconfig-vim') " Respect editorconfig
	call packager#add('tpope/vim-surround') " Surround with brackets or quotes
	call packager#add('subnut/visualstar.vim') " Search selection with * or #
	call packager#add('cohama/lexima.vim')
	call packager#add('tpope/vim-fugitive')
	call packager#add('jssteinberg/hackline.vim')
	call packager#add('lifepillar/vim-mucomplete')
	call packager#add('dense-analysis/ale')
	call packager#add('mhinz/vim-grepper') " Async modern grepping
	" Fuzzy finder
	call packager#add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
	call packager#add('junegunn/fzf.vim')
	" Colorschemes
	call packager#add('ghifarit53/tokyonight-vim')
endfunction
