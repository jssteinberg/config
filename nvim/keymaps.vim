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
nnoremap <leader>b :buffer#<cr>

" Buffer switcher
nnoremap <leader><tab> :buffer <c-z><s-tab>
" Write/save file
nnoremap <leader>w :w<cr>

" Edit/explore [buffer dir, buffer in new tab, close tab]
nnoremap <leader>e. :edit .<cr>
nnoremap <leader>eb :edit %:p:.:h<cr>
nnoremap <leader>ew :edit **/*
nnoremap <leader>tb :tabedit %<cr>'"
nnoremap <leader>tc :tabclose<cr>

" Find files
vnoremap <leader>fw y:find **/*<c-r>"<c-z><s-tab>
nnoremap <leader>fw :find **/*

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>

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
nnoremap <leader>G :Rg 
vnoremap <leader>G y:Rg -e "<c-r>""<cr>

" FZF Fuzzy finder
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fs :Telescope live_grep<cr>
nnoremap <leader>gf :Telescope git_files<cr>

" Git
nnoremap <leader>gg :Git<cr>
nnoremap <leader>gq :Git mergetool<cr>
nnoremap <leader>gb :BlamerToggle<cr>
nnoremap <leader>gm :GitMessenger<cr>

" Fern
nnoremap <silent> <leader>e. :Fern . -reveal=%<cr>
nnoremap <silent> <leader>ed :Fern . -drawer -reveal=% -toggle<cr>

" Neo-tree
nnoremap <silent> <leader>et :NeoTreeRevealToggle<cr>

" Lir
nnoremap <silent> <leader>fd :lua require'lir.float'.toggle('.')<cr>
nnoremap <silent> <leader>fc :lua require'lir.float'.toggle('%')<cr>

augroup keymaps
	au!
	autocmd FileType netrw call NetrwRemaps()
augroup END
