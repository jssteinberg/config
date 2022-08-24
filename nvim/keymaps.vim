" <leader>
" b: buffer alternate
" c: color
" e: edit
" g: git
" f: find/fuzzy files
" h: harpoon harpooned/marked project files
" s: search files
" t: tab
" q: quickfix
" C: tabclose
" G: grep
" Q: quickfix window
" R: replace (search and replace)
" X: git(signs) reset

"
nnoremap <leader>ec :tabedit $MYVIMRC<cr>:tcd %:h<cr>

" Better default indent
vnoremap < <gv
vnoremap > >gv
" Better default cmdline browsing
cnoremap <c-p> <up>
cnoremap <c-n> <down>
" Better default move across wrapped lines
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

" Esc [normal, terminal]
inoremap jk <esc>
tnoremap jk <c-\><c-n>

" Search
nnoremap <c-s> /
xnoremap <c-s> /

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
nnoremap <silent> <leader>w :w<cr>

" Edit/explore [buffer dir, buffer in new tab, close tab]
nnoremap <leader>ep :edit package.json<cr>
nnoremap <leader>er :edit README.md<cr>
nnoremap <leader>ew :edit **/*
nnoremap <leader>fw :find **/*
nnoremap <leader>tb :tabedit %<cr>'"
nnoremap <leader>C :tabclose<cr>
" neo-tree
nnoremap <silent> <leader>e. :Neotree current dir=.<cr>
nnoremap <silent> <leader>ed :Neotree action=show toggle<cr>
nnoremap <silent> <leader>eh :Neotree current dir=%:p:.:h<cr>
nnoremap <silent> <leader>et :Neotree reveal toggle<cr>

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
nnoremap <expr> Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" Grep
nnoremap <leader>G :silent grep -g "!package-lock.json" -g "!yarn.lock" 
vnoremap <silent> <leader>G y:silent grep -g "!package-lock.json" -g "!yarn.lock" -e "<c-r>""<cr>

" Replace [normal, selection]
nnoremap <leader>R :%s/
vnoremap <leader>R :s/

" Cycle colorschemes
nnoremap <silent> <leader>cc :call CycleColo()<cr>

" Package/plugin mappings
" -----------------------

" FZF Fuzzy finder
nnoremap <silent> <leader>fb :Telescope buffers<cr>
nnoremap <silent> <leader>ff :Telescope find_files<cr>
nnoremap <silent> <leader>fs :Telescope live_grep<cr>
nnoremap <silent> <leader>gf :Telescope git_files<cr>
nnoremap <silent> <leader>s :Telescope find_files<cr>

" Git
nnoremap <leader>gg <cmd>Git<cr>
nnoremap <leader>gq <cmd>Git mergetool<cr>
nnoremap <leader>gb <cmd>BlamerToggle<cr>
nnoremap <leader>gd <cmd>tabnew %<cr><cmd>Gvdiffsplit<cr>
nnoremap <leader>gp <cmd>Git pull<cr>
nnoremap <leader>gP <cmd>Git push<cr>
nnoremap <leader>gl <cmd>Git log<cr>
nnoremap <leader>go <cmd>OpenGithubFile<cr>
nnoremap <leader>gj /<<<<<<<\\|=======\\|>>>>>>><cr>
nnoremap <leader>gk ?<<<<<<<\\|=======\\|>>>>>>><cr>
nnoremap <leader>X <cmd>Gitsigns reset_hunk<cr>
xnoremap <leader>X <cmd>Gitsigns reset_hunk<cr>

" Harpoon
nnoremap <leader>hh :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent> <leader>he :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent> <leader>ha :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <silent> <leader>hs :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <silent> <leader>hd :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <silent> <leader>hf :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <silent> <leader><cr> :lua require("harpoon.term").gotoTerminal(1)<cr>i
nnoremap <silent> <leader>1 :lua require("harpoon.term").gotoTerminal(2)<cr>i

" Color highlight groups
nnoremap <leader>ct <cmd>TSHighlightCapturesUnderCursor<cr>
nn <leader>cg <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>

" LSP
" nnoremap gd :lua vim.lsp.buf.definition
