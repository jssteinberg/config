" some.vim for (Neo)vim

" KEYMAPS
" <leader>
" b: buffer alternate
" c: close window
" e: edit
" g: git
" f: find/fuzzy files
" s: search files
" t: tab
" C: tabclose || close all
" G: grep
" R: replace (search and replace)
" S: substitute

let g:indent_width=2
let g:config_scrolloff=5

" Core improved keymaps
vnoremap < <gv
vnoremap > >gv
cnoremap <c-p> <up>
cnoremap <c-n> <down>
nnoremap <c-e> $
xnoremap <c-e> $
nnoremap * /<c-r><c-w><cr>
nnoremap # ?<c-r><c-w><cr>
nn n nzz
nn N Nzz

" Line motions includes wrapped lines
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

" Esc mappings
inoremap jk <esc>

" Alternate buffer
nnoremap <silent> <leader>b <cmd>buffer#<cr>

" Write/save file
nnoremap <silent> <leader>w <cmd>write<cr>
nnoremap <silent> <leader>W <cmd>write!<cr>

" Edit/tabedit commonly used
nnoremap <leader>e. <cmd>e.<cr><cmd>call search(expand("#:t"))<cr>
nnoremap <leader>ed <cmd>wincmd v<bar>wincmd H<bar>exe "try\n e %:h\n catch\n e.\n endtry"<cr><cmd>call search(expand("#:t"))<cr>
nnoremap <leader>eh <cmd>exe "try\n e %:h\n catch\n e.\n endtry"<cr><cmd>call search(expand("#:t"))<cr>
nnoremap <leader>et <cmd>wincmd v<bar>wincmd H<bar>e.<cr><cmd>call search(expand("#:t"))<cr>
nnoremap <leader>tb <cmd>tabedit %<cr>'"
nnoremap <leader>ew :e **/
nnoremap <leader>ec <cmd>tabedit $MYVIMRC<cr><cmd>tcd %:h<cr>
nnoremap <leader>ep <cmd>e package.json<cr>
nnoremap <leader>er <cmd>e README.md<cr>

" Close tab or quit all
nn <silent> <leader>C <cmd>exe "try\n tabclose\n catch\n qa\n endtry"<cr>

" Close window or quit
nnoremap <silent> <leader>c :exe "try\n hide\n catch\n q\n endtry"<cr>

" Resize windows vertically
nn <leader>+ :vert resize +5<cr>
nn <leader>- :vert resize -5<cr>

" Replace [word, selection]
nnoremap <leader>R "ryiw:%s/<c-r>r/
vnoremap <leader>R "ry:%s/<c-r>r/

" Substitute in [buffer, selection]
nnoremap <leader>S :%s/
vnoremap <leader>S :s/

" Quickfix [next, previous, toggle]
nnoremap Q :exe "cnext\n setlocal scrolloff=" . g:config_scrolloff<cr>
nnoremap <leader>q :cprev<cr>
nnoremap <expr> <leader>Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" No/now (toggle options)
" TODO: handle other spelllang like nb
nnoremap <expr> <leader>ns &spell ? ':set nospell<cr>' : ':set spell<bar>set spelllang=en_us<cr>'
nnoremap <expr> <leader>nw &wrap ? ':set nowrap<cr>' : ':set wrap breakindent linebreak<cr>'
nnoremap <expr> <leader>nd &bg == "dark" ? ':set bg=light<cr>' : ':set bg=dark<cr>'
nnoremap <expr> <leader>nn &number ? ':set nonumber<cr>' : ':set number<cr>'
nnoremap <expr> <leader>nr &relativenumber ? ':set norelativenumber<cr>' : ':set relativenumber<cr>'

" Git
" grep for git merge conflicts
nnoremap <leader>gm :silent! grep! -e "<<<<<<<"<cr>

" Project/session management
" create session directory if it doesn't exist
if !isdirectory($HOME.'/.vs') | call mkdir($HOME.'/.vs', '', 0770) | endif
" save session
nn <leader>ps :mks! ~/.vs/
" load session
nn <leader>po :source ~/.vs/*

" Go to tab B
nn gl <cmd>call GoToTabB()<cr>
" store tabB
aug tabB | au! | au TabLeave * let g:tabB = tabpagenr() | aug end
" fn go to g:last_t if an existing tab, else go to prev tab
function! GoToTabB() abort
	try | if g:tabB != tabpagenr()
		exe "tabn" . g:tabB | return
	end | catch | endtry
	exe "tabp"
endfunction

" SPACE CONFIRMS - maps to cmdline that are confirmed with <space>
" Setup:
" <space> is enter key in command mode if `space_confirms`
cno <expr> <space> exists("g:space_confirms") ? "<cr>" : " "
" space_confirms is unlet by autocmd so it's deactivated
augroup space_confirms | au!
	au CmdlineLeave * if exists("g:space_confirms") | unlet g:space_confirms | en
augroup end
" Mappings:
" search in normal and visual mode
nn s <cmd>let g:space_confirms=1<cr>/
xn s <cmd>let g:space_confirms=1<cr>/
" backward search in normal mode
nn S <cmd>let g:space_confirms=1<cr>?
" switch buffer in normal mode
nn <leader><tab> <cmd>let g:space_confirms=1<cr>:buffer <c-z>

" Grep [args, selection]
nnoremap <leader>G :silent grep -e ""<left>
vnoremap <leader>G <cmd>call RgVisual()<cr>

" Grep reference [word, selection]
nnoremap gr <cmd>call Rg()<cr>
vmap gr <leader>G

" Grep substitute [word, selection]
nnoremap gs :call Rg()<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/
vnoremap gs :call RgVisual()<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/

function! Rg() abort
	normal! "gyiw
	call s:RgG()
endfunction

function! RgVisual() abort
	normal! "gy
	call s:RgG()
endfunction

function! s:RgG() abort
	let l:q = escape(@g, "'()")
	exe "silent grep -e '" . l:q . "'"
	redraw!
	echo l:q
endfunction

" OPTIONS - in approx. order of importance

set nofoldenable foldmethod=indent " Toggle fold on indent
let &scrolloff=g:config_scrolloff " Keep cursor off from top/bottom
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set wildignorecase wildmode=lastused:full wildignore+=**/node_modules/**,**/.git/**
let &ts=g:indent_width | let &sw=g:indent_width " indent size
set hidden " Unsaved files can be 'hidden'
set list " Show tab characters
set noswapfile " No swap files, but undo files (requires `undodir` in Vim)
set sessionoptions=curdir,folds,help,tabpages,folds
set signcolumn=yes
set cursorline " Highlight cursor line
set splitright
set timeoutlen=750 " Timeout for keymaps
set updatetime=100

" FORMAT OPTIONS
" (c) auto hard wrap comments
" (j) remove comment leader when joining lines
" (l) don't break long lines (does c still work?)
" (n) recognize numbered lists
" (p) don't break lines on single space following period
" (q) allow gq formatting
set formatoptions=cjlnpq

" GREP OPTIONS
" (Rip)grep
if executable('rg')
	set grepprg=rg\ --vimgrep grepformat^=%f:%l:%c:%m
endif

" AUTO COMMANDS
aug some_config | au!
	" Set tabstop if noexpandtab
	au BufWinEnter,FocusGained * call SetTabWidth(g:indent_width)
	" After packages are loaded set listchars
	au BufEnter * set listchars=tab:\·\ ,trail:\~,extends:…,precedes:…
aug END

" GLOBAL FUNCTIONS

" Set/correct buffer local tab type width
function! SetTabWidth(ts_width) abort
	if !(&expandtab) " Hard-tabs uses tabstop width param
		exe "setlocal tabstop=" . a:ts_width
		exe "setlocal shiftwidth=" . a:ts_width
	elseif &sw != &ts " Soft-tabs gets tabstop=shiftwidth for no fuss
		exe "setlocal tabstop=" . &sw
	en
endfunction

" Echo highlight groups
function! HiGroupNames() abort
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' › ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
