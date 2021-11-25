" Vim 8 vimrc boilerplate
" =======================

" Load default vimrc
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Options
set clipboard=unnamed " Sync with system clioboard
set hidden " Unsaved files can be 'hidden'
"set hlsearch " Higlight search (hurts your eyes with default colors)
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set list listchars=tab:\-\  " Show tabs if used
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set rulerformat=%y%m\ %l/%L " [filetype][modified] line/lines
set wildmode=lastused:full " lastused :buffer


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


" Packages config
" ---------------
"
" Requires package manager: https://github.com/kristijanhusak/vim-packager

" Netrw
let g:netrw_preview=1 " Vertical preview
let g:netrw_localcopydircmd='cp -r'
let g:netrw_winsize=25

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

" Commands for packages
command! -nargs=* -bar PackagerInstall call PackagerInit() | call packager#install(<args>)
command! -nargs=* -bar PackagerUpdate call PackagerInit() | call packager#update(<args>)
command! -bar PackagerClean call PackagerInit() | call packager#clean()
command! -bar PackagerStatus call PackagerInit() | call packager#status()

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
endfunction
