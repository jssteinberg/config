" DEFAULTS
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Create undo dir
if !isdirectory($HOME.'/.vimundo') | call mkdir($HOME.'/.vimundo', '', 0770) | endif

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
set tabstop=2 shiftwidth=2 " indent size
set wildmode=lastused:full " :b <tab> for last used buffer(s)
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`
set showtabline=2 " Always show tabline

if executable('rg')
	set grepformat^=%f:%l:%c:%m grepprg=rg\ --vimgrep
	" grepprg=rg\ --line-number\ --column
endif

" NETRW OPTIONS
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_sort_by = "exten"

" KEYMAPS
" Extend default mappings
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

" FUZZY FIND
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>s :call FzyCommand("fd --hidden --follow -E node_modules -E .git -E .github -E .swc", ":e")<cr>

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
try
	colo nightcoolwc
catch
	set background=dark | colo slate " DUAL lunaperche (9) DARK: habamax (9) industry slate LIGHT: quiet zellner 
	hi Normal ctermbg=NONE
	hi CursorLine cterm=NONE ctermbg=236 | hi! link CursorLineNr CursorLine
	hi! link SignColumn LineNr
	hi! link Tabline Normal | hi! link TablineFill Tabline
endtry
