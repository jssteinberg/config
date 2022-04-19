" Better defaults
vnoremap < <gv
vnoremap > >gv
cnoremap <c-p> <up>
cnoremap <c-n> <down>

" Esc [normal, terminal]
inoremap jk <esc>
tnoremap jk <c-\><c-n>

" Search (for their defaults, use cl and cc) [search, backwards, visual mode]
nnoremap s /
nnoremap S ?
vnoremap s /
cnoremap <expr> <Tab>   getcmdtype() =~ "[/?]" ? "<C-g>" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() =~ "[/?]" ? "<C-t>" : "<S-Tab>"

" Shift + J/K moves selected lines down/up in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '

" Alternate buffer
nnoremap <bs> :buffer#<cr>
nnoremap <leader>b :buffer#<cr>

" Buffer switcher
nnoremap <leader><tab> :buffer 
" Write/save file
nnoremap <leader>w :w<cr>

" Edit/explore [buffer dir, buffer in new tab, close tab]
nnoremap <leader>eh :edit %:p:.:h<cr>
nnoremap <leader>ep :edit package.json<cr>
nnoremap <leader>er :edit README.md<cr>
nnoremap <leader>ew :edit **/*
nnoremap <leader>tb :tabedit %<cr>'"
nnoremap <leader>tc :tabclose<cr>
" fern
nnoremap <silent> <leader>e. :Fern . -reveal=%<cr>
nnoremap <silent> <leader>et :Fern . -drawer -reveal=% -toggle<cr>
" neo-tree
nnoremap <silent> <leader>ed :Neotree reveal toggle<cr>
" lir
" nnoremap <silent> <leader>fd :lua require'lir.float'.toggle('.')<cr>
" nnoremap <silent> <leader>fc :lua require'lir.float'.toggle('%')<cr>

" Find
" neo-tree
nnoremap <silent> <leader>fd :NeoTreeFloatToggle<cr>
nnoremap <leader>fh :edit %:h<c-z>*

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
nnoremap <expr> Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" Replace [normal, selection]
nnoremap <leader>R :%s/
vnoremap <leader>R :s/


" Package/plugin mappings
" -----------------------

" Netrw remaps
function! NetrwRemaps ()
	nn <buffer> s /
endfunction

" Ripgrep
nnoremap <leader>G :Rg -g "!package-lock.json" -g "!yarn.lock" 
vnoremap <leader>G y:Rg -g "!package-lock.json" -g "!yarn.lock" -e "<c-r>""<cr>

" FZF Fuzzy finder
nnoremap <leader><leader> :Telescope find_files<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fs :Telescope live_grep<cr>
nnoremap <leader>gf :Telescope git_files<cr>

" Git
nnoremap <leader>gg :Git<cr>
nnoremap <leader>gq :Git mergetool<cr>
nnoremap <leader>gb :BlamerToggle<cr>
nnoremap <leader>gm :GitMessenger<cr>
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gP :Git push<cr>
nnoremap <leader>gs :SignifyToggle<cr>

" Emmet
imap <c-e><c-e> <plug>(emmet-expand-abbr)
vmap <c-e><c-e> <plug>(emmet-expand-abbr)

augroup keymaps
	au!
	autocmd FileType netrw call NetrwRemaps()
augroup END
