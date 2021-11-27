" Vim 8 vimrc boilerplate
" =======================

" Load default vimrc
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Options
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

" Keymaps vanilla
" ---------------
" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '
" Esc
inoremap jk <esc>
" Y works like C or D
nnoremap Y yg_
" Follow definition in help (easier for some non US keyboards)
nnoremap <leader>9 <c-]>
" Search mappings (for their defaults, use cl and cc)
nnoremap s /
nnoremap S ?
" Incrementally go back in command history
cnoremap <c-p> <up>
" Alternate buffer
nnoremap <bs> :buffer#<cr>:file!<cr>
" Buffer switcher
nnoremap <leader><tab> :buffer 
" Write/save file
nnoremap <leader>w :w<cr>
" Edit/explore
nnoremap <leader>e. :edit .<cr>
nnoremap <leader>eb :Explore<cr>
nnoremap <leader>tb :tabedit %<cr>
" Quickfix
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>


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
nnoremap <cr> :ALEHover<cr>

" Colorscheme
autocmd VimEnter * call SetColorscheme()
" use function (nightfox in vim prefers VimEnter)
function! SetColorscheme ()
	" use try/catch to set option if colorscheme exists
	try
		set termguicolors
		colorscheme tokyonight
		set hlsearch " Higlight search hurts your eyes with default colors
	catch /^Vim\%((\a\+)\)\=:E185/
		set notermguicolors
		colorscheme default
	endtry
endfunction

" Statusline
set laststatus=2
let g:skyline_fugitive = 1

" Packages
function! PackagerInit() abort
	packadd vim-packager
	call packager#init()
	call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
	call packager#add('tpope/vim-surround')
	call packager#add('tpope/vim-fugitive')
	call packager#add('sheerun/vim-polyglot')
	call packager#add('editorconfig/editorconfig-vim')
	call packager#add('cohama/lexima.vim')
	" Fuzzy finder
	call packager#add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
	call packager#add('junegunn/fzf.vim')
	" Autocompletion
	call packager#add('lifepillar/vim-mucomplete')
	" Linting
	call packager#add('dense-analysis/ale')
	" Colorscheme
	call packager#add('ghifarit53/tokyonight-vim')
	" Statusline
	call packager#add('jssteinberg/skyline.vim')
endfunction
