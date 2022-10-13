" Source defaults.vim
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Create undo dir
if !isdirectory($HOME.'/.vimundo') | call mkdir($HOME.'/.vimundo', '', 0770) | en

" OPTIONS
set noswapfile undofile undodir=$HOME/.vimundo " No swap files, but undo files
set clipboard=unnamed " Sync system clioboard
set cursorline " Highlight cursor line
set hidden " Unsaved files can be 'hidden'
set foldmethod=indent nofoldenable
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set list listchars=tab:\·\  fillchars=vert:\│ " Show tabs, consistent char
set number relativenumber signcolumn=yes
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set sessionoptions=curdir,folds,tabpages,help
set splitright
set tabstop=2 shiftwidth=2 " indent size
set wildmode=lastused:full " :b <tab> for last used buffer(s)
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`
set showtabline=2 " Always show tabline

" Netrw
let g:netrw_banner = 0 | let g:netrw_altv = 1 | let g:netrw_sort_by = "exten"

" (Rip)grep
if executable('rg')
	set grepformat^=%f:%l:%c:%m grepprg=rg\ --vimgrep
en

" KEYMAPS
nnoremap Y y$
nnoremap <silent> <c-l> :nohlsearch<cr><c-l>
vnoremap < <gv
vnoremap > >gv
cnoremap <c-p> <up>
cnoremap <c-n> <down>
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'
nnoremap <c-s> /
xnoremap <c-s> /
nnoremap <c-p> "0p

" Esc mappings
inoremap jk <esc>
tnoremap jk <c-w>N

" Set space as leader key
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
" ...with tabs
nnoremap <leader>tb :tabedit %<cr>'"
nnoremap <silent> <leader>C :exe "try\n tabclose\n catch\n qa\n endtry"<cr>

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
nnoremap <expr> Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" Replace [normal, visual]
nnoremap <leader>R :%s/
vnoremap <leader>R :s/

" Grep (grep cmd, grep cursor word, grep cursor word and populate cfdo)
nnoremap <leader>G :silent! grep  
nnoremap gr "gyiw<cr>:silent! grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>
nnoremap gs "gyiw<cr>:silent! grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/
vnoremap gr "gy<cr>:silent! grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>
vnoremap gs "gy<cr>:silent! grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/

" Fuzzy find files with Fzy
nnoremap <leader>s :call FzyCommand("fd --hidden --follow -E node_modules -E .git -E .github -E .swc", ":e")<cr>

fu! FzyCommand(choice_command, vim_command)
	try | let output = system(a:choice_command . " | fzy ")
	catch /Vim:Interrupt/ | endtry | redraw!
	if v:shell_error == 0 && !empty(output)
		exec a:vim_command . ' ' . output
	en
endf

" COLORS
try | colo nightcoolwc | catch
	set background=dark | colo slate " DUAL lunaperche quiet (9) DARK: habamax (9) industry slate LIGHT: zellner
	hi Normal ctermbg=NONE
	hi CursorLine cterm=NONE ctermbg=236 | hi! link CursorLineNr CursorLine
	hi! link SignColumn LineNr
	hi! link Tabline Normal | hi! link TablineFill Tabline
endtry

augroup vimrc
	autocmd!
	" Open quickfix window when relevant
	autocmd QuickFixCmdPost [^l]* cwindow
augroup END
