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

" Shift + J/K moves selected lines down/up in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '

" Alternate buffer
nnoremap <bs> :buffer#<cr>

" Buffer switcher
nnoremap <leader><tab> :buffer 

" Write/save file
nnoremap <leader>w :w<cr>

" Edit/explore [explore cwd, explore buffer dir, project drawer, buffer in new tab]
nnoremap <leader>e. :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:edit .<cr>
nnoremap <leader>eb :let g:netrw_banner=0<cr>:let g:netrw_liststyle=0<cr>:edit %:p:.:h<cr>
nnoremap <leader>ec :tabedit $MYVIMRC<cr>
nnoremap <leader>et :let g:netrw_banner=0<cr>:let g:netrw_liststyle=3<cr>:Lexplore<cr>
nnoremap <leader>tb :tabedit %<cr>'"

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>

" Replace [normal, selection]
nnoremap <leader>R :%s/
vnoremap <leader>R :%s/


" Package/plugin mappings
" -----------------------

" Ripgrep
nnoremap <leader>G :Rg 
vnoremap <leader>G y:Rg -e "<c-r>""<cr>

" FZF Fuzzy finder
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fs :Telescope live_grep<cr>
nnoremap <leader>gf :Telescope git_files<cr>

" Git
nnoremap <leader>gg :Git<cr>
