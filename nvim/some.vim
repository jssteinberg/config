" KEYMAPS
" <leader>
" b: buffer alternate
" c: close window
" e: edit
" g: git
" f: find/fuzzy files
" h: harpoon harpooned/marked project files
" s: search files
" t: tab
" C: tabclose || close all
" G: grep
" R: replace (search and replace)
" S: substitute

let g:indent_width=2
let g:config_scrolloff=15

" Core improved keymaps
vnoremap < <gv
vnoremap > >gv
cnoremap <c-p> <up>
cnoremap <c-n> <down>
noremap <c-s> /

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

" Tabedit buffer
nnoremap <leader>tb :tabedit %<cr>'"

" Close tab or quit all
nnoremap <silent> <leader>C :exe "try\n tabclose\n catch\n qa\n endtry"<cr>

" Close window or quit
nnoremap <silent> <leader>c :exe "try\n wincmd q\n catch\n q\n endtry"<cr>

" Edit common files
nnoremap <leader>ep :edit package.json<cr>
nnoremap <leader>er :edit README.md<cr>

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

" Git
" grep for git merge conflicts
nnoremap <leader>gm :silent! grep -e "<<<<<<<"<cr>

" Quickfix [next, previous, toggle]
nnoremap Q :exe "cnext\n setlocal scrolloff=" . g:config_scrolloff<cr>
nnoremap <leader>q :cprev<cr>
nnoremap <bs> :cprev<cr>
nnoremap <expr> <leader>Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" No/now (toggle options)
nnoremap <expr> <leader>ns &spell ? ':set nospell<cr>' : ':set spell<cr>'
nnoremap <expr> <leader>nw &wrap ? ':set nowrap<cr>' : ':set wrap breakindent linebreak<cr>'
nnoremap <expr> <leader>nn &number ? ':set nonumber norelativenumber<cr>' : ':set number relativenumber<cr>'

" s_space_search -- faster search motion with `s`, then enter with `space`.
" search with s in normal and visual mode
nnoremap s <cmd>let b:s_space_search=1<cr>/
xnoremap s <cmd>let b:s_space_search=1<cr>/
" backwards search with S in normal mode
nnoremap S <cmd>let b:s_space_search=1<cr>?
" in command mode, if s_space_search then <space> is <cr>
cnoremap <expr> <space> exists("b:s_space_search")
			\ ? "<cr>" : " "
" autocmd to unlet variable so s_search is deactivated
augroup s_search | au!
	au CmdlineLeave /,? if exists("b:s_space_search") | unlet b:s_space_search | en
augroup END

" OPTIONS (in order of importance)
set nofoldenable foldmethod=indent " Toggle fold on indent
let &scrolloff=g:config_scrolloff " Keep cursor off from top/bottom
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set wildignorecase wildmode=lastused:full wildignore+=**/node_modules/**,**/.git/**
let &ts=g:indent_width | let &sw=g:indent_width " indent size
set hidden " Unsaved files can be 'hidden'
set noswapfile " No swap files, but undo files (requires `undodir` in Vim)
set sessionoptions=curdir,folds,tabpages,help
set signcolumn=yes " Always show signcolumn
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

" NETRW OPTIONS
let g:netrw_banner=0 " Remove top banner
let g:netrw_preview=1 " Vertical preview

" AUTO COMMANDS
aug some_config | au!
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid, when inside an event handler
	" (happens when dropping a file on gvim) and for a commit message (it's
	" likely a different one than last time).
	au BufReadPost *
				\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
				\ |   exe "normal! g`\""
				\ | en
	" Open quickfix window when relevant
	au QuickFixCmdPost [^l]* cwindow
	" Set tabstop if noexpandtab
	au BufEnter * call SetTabWidth(g:indent_width)
	" Open netrw on startup when no args
	au VimEnter * if argc() == 0 | Explore! | endif
aug END

fu! SetTabWidth(ts_width) abort
	if !(&expandtab) " Hard-tabs uses my tabstop width
		exe "setlocal tabstop=" . a:ts_width
		exe "setlocal shiftwidth=" . a:ts_width
	elseif &sw != &ts " Soft-tabs gets tabstop=shiftwidth for no krøll
		exe "setlocal tabstop=" . &sw
	en
endfun

" Echo highlight groups
fu! HiGroupNames()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' › ' . synIDattr(synIDtrans(l:s), 'name')
endfun
