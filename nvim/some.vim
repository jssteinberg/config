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

" Line motions incbudes wrapped lines
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

" Esc mappings
inoremap jk <esc>

" Alternate buffer
nnoremap <leader>b :buffer#<cr>

" Buffer switcher
nnoremap <leader><tab> :buffer 

" Write/save file
nnoremap <silent> <leader>w :w<cr>

" Close tab or quit all
nnoremap <silent> <leader>C :exe "try\n tabclose\n catch\n qa\n endtry"<cr>

" Close window or quit
nnoremap <silent> <leader>c :exe "try\n wincmd q\n catch\n q\n endtry"<cr>

" Resize windows vertically
nn <leader>+ :vert resize +5<cr>
nn <leader>- :vert resize -5<cr>

" Edit/tabedit commonly used
nnoremap <leader>ep <cmd>e package.json<cr>
nnoremap <leader>er <cmd>e README.md<cr>
nnoremap <leader>ec <cmd>tabedit ~/.config/README.md<cr><cmd>tcd %:h<cr>
nnoremap <leader>e. <cmd>e.<cr><cmd>call search(expand("#:t"))<cr>
" nnoremap <leader>eh <cmd>edit %:h<cr>
nnoremap <leader>eh <cmd>exe "try\n e %:h\n catch\n e.\n endtry"<cr><cmd>call search(expand("#:t"))<cr>
nnoremap <leader>tb <cmd>tabedit %<cr>'"

" Replace [word, selection]
nnoremap <leader>R "ryiw:%s/<c-r>r/
vnoremap <leader>R "ry:%s/<c-r>r/

" Substitute in [buffer, selection]
nnoremap <leader>S :%s/
vnoremap <leader>S :s/

" Grep [args, selection]
nnoremap <leader>G :silent grep 
vnoremap <leader>G "gy<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr><c-l>

" Grep reference [word, selection]
nnoremap gr "gyiw<cr>:silent! grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr><c-l>
vnoremap gr "gy<cr>:silent! grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr><c-l>

" Grep substitute [word, selection]
nnoremap gs "gyiw<cr>:silent! grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr><c-l>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/
vnoremap gs "gy<cr>:silent! grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr><c-l>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/

" Quickfix [next, previous, toggle]
nnoremap Q :exe "cnext\n setlocal scrolloff=" . g:config_scrolloff<cr>
nnoremap <leader>q :cprev<cr>
nnoremap <bs> :cprev<cr>
nnoremap <expr> <leader>Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" Terminal
nn <silent> <leader><cr> <cmd>call GetMainTerm()<cr>

" No/now (toggle options)
nnoremap <expr> <leader>ns &spell ? ':set nospell<cr>' : ':set spell<cr>'
nnoremap <expr> <leader>nw &wrap ? ':set nowrap<cr>' : ':set wrap breakindent linebreak<cr>'
nnoremap <expr> <leader>nn &number ? ':set nonumber<cr>' : ':set number<cr>'
nnoremap <expr> <leader>nr &relativenumber ? ':set norelativenumber<cr>' : ':set relativenumber<cr>'
nnoremap <expr> <leader>nd &bg == "dark" ? ':set bg=light<cr>' : ':set bg=dark<cr>'

" Git
" grep for git merge conflicts
nnoremap <leader>gm :silent! grep -e "<<<<<<<"<cr>

" Space search
" search with s in normal and visual mode
nnoremap s <cmd>let g:space_search=1<cr>/
xnoremap s <cmd>let g:space_search=1<cr>/
" backwards search with S in normal mode
nnoremap S <cmd>let g:space_search=1<cr>?
" in command mode, if space_search then <space> is <cr>
cnoremap <expr> <space> exists("g:space_search")
			\ ? "<cr>" : " "
" autocmd to unlet variable so space_search is deactivated
augroup space_search | au!
	au CmdlineLeave * if exists("g:space_search") | unlet g:space_search | en
augroup END

" Project/session management
" create session directory if it doesn't exist
if !isdirectory($HOME.'/.vs') | call mkdir($HOME.'/.vs', '', 0770) | endif
" save current session, or prompt for new session name
nn <expr> <leader>ps exists("v:this_session") && v:this_session != '' ? ':exe "mks! " .. v:this_session<cr>:echo "mks " .. v:this_session<cr>' : ":mks! ~/.vs/"
" load session
nn <leader>po :source ~/.vs/*

" OPTIONS (in order of importance)
set nofoldenable foldmethod=indent " Toggle fold on indent
let &scrolloff=g:config_scrolloff " Keep cursor off from top/bottom
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set wildignorecase wildmode=lastused:full wildignore+=**/node_modules/**,**/.git/**
let &ts=g:indent_width | let &sw=g:indent_width " indent size
set hidden " Unsaved files can be 'hidden'
set noswapfile " No swap files, but undo files (requires `undodir` in Vim)
set sessionoptions=curdir,folds,help
set signcolumn=yes number " Show signcolumn and numbers
set cursorline " Highlight cursor line
set splitright
set showtabline=2 " Always show tabline
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
	" set grepformat^=%f:%l:%c:%m grepprg=rg\ --line-number\ --column
	set grepformat^=%f:%l:%c:%m grepprg=rg\ --vimgrep
endif

" AUTO COMMANDS
aug some_config | au!
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid.
	au BufReadPost *
				\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
				\ |   exe "normal! g`\""
				\ | en
	" Set tabstop if noexpandtab
	au BufEnter * call SetTabWidth(g:indent_width)
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

" Open main terminal, first time in insert mode
function! GetMainTerm() abort
	try
		wincmd s
		exe "buffer " . g:main_term_bufnr
	catch
		if !has("nvim") | wincmd q | en
		terminal
		startinsert
		let g:main_term_bufnr=bufnr()
	endtry
endfunction
