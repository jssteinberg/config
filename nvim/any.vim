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
" q: quickfix
" C: tabclose || close all
" G: grep
" Q: quickfix window
" R: replace (search and replace)
" S: substitute

" Core improved keymaps
vnoremap < <gv
vnoremap > >gv
cnoremap <c-p> <up>
cnoremap <c-n> <down>
nnoremap <c-s> /
xnoremap <c-s> /
cnoremap <c-s> <cr>
" Line motions includes wrapped lines
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
" Quickfix [next, previous, toggle]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
nnoremap <expr> Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'
" No/now (toggle options)
nnoremap <expr> <leader>ns &spell ? ':set nospell<cr>' : ':set spell<cr>'
nnoremap <expr> <leader>nw &wrap ? ':set nowrap<cr>' : ':set wrap breakindent linebreak<cr>'

" OPTIONS (in order of importance)
set nofoldenable foldmethod=indent
set scrolloff=15
set wrap breakindent linebreak " Wrapped lines inherits indent, break line at `breakat`
set ignorecase smartcase " Wildmenu ignores case, search smart-ignores case
set wildignorecase wildmode=lastused:full wildignore+=**/node_modules/**,**/.git/**
set tabstop=2 shiftwidth=2 " indent size
set hidden " Unsaved files can be 'hidden'
set noswapfile " No swap files, but undo files (requires `undodir` in Vim)
set sessionoptions=curdir,folds,tabpages,help
set number relativenumber signcolumn=yes " Show (relative)numbers and signcolumn
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
let g:netrw_banner = 0 " Remove top banner
let g:netrw_preview=1 " Vertical preview

" AUTO COMMANDS
aug any_config
	autocmd!
	" Open quickfix window when relevant
	au QuickFixCmdPost [^l]* cwindow
augroup END
