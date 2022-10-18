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
" X: git(signs) reset

" EXTEND DEFAULT MAPPINGS
vnoremap < <gv
vnoremap > >gv
cnoremap <c-p> <up>
cnoremap <c-n> <down>
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'
nnoremap <c-s> /
xnoremap <c-s> /
cnoremap <c-s> <cr>
nnoremap <c-p> "0p

" Esc mappings
inoremap jk <esc>
tnoremap jk <c-\><c-n>

" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '

" Alternate buffer
nnoremap <leader>b :buffer#<cr>

" Buffer switcher
nnoremap <leader><tab> :buffer 

" Write/save file
nnoremap <silent> <leader>w :w<cr>

" Edit/explore [buffer dir, buffer in new tab, close tab]
nnoremap <leader>ec <cmd>tabedit ~/.config/README.md<cr><cmd>tcd %:h<cr>
nnoremap <leader>ep :edit package.json<cr>
nnoremap <leader>er :edit README.md<cr>
nnoremap <leader>tb :tabedit %<cr>'"
" nnoremap <silent> <leader>c :exe "try\n wincmd q\n catch\n q\n endtry"<cr>
nnoremap <silent> <leader>C :exe "try\n tabclose\n catch\n qa\n endtry"<cr>
" neo-tree
nnoremap <silent> <leader>e. :Neotree current dir=.<cr>
nnoremap <silent> <leader>eb :Neotree toggle buffers<cr>
nnoremap <silent> <leader>ed :Neotree action=show toggle<cr>
nnoremap <silent> <leader>eh :Neotree current dir=%:p:.:h reveal<cr>
nnoremap <silent> <leader>et :Neotree reveal<cr>

" Quickfix [next, previous]
nnoremap <leader>q :cnext<cr>
nnoremap <leader>Q :cprev<cr>
nnoremap <expr> Q empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'

" Substitute/Replace [normal, selection]
nnoremap <leader>S :%s/
vnoremap <leader>S :s/
nnoremap <leader>R "ryiw:%s/<c-r>r/
vnoremap <leader>R "ry:%s/<c-r>r/

" Grep
" nnoremap gr "gyiw<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>
" vnoremap gr "gy<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>
nnoremap <leader>G :silent grep 
" nnoremap <leader>G "gyiw<cr>:silent grep <c-r>=escape('<c-r>g', '#')<cr>
vnoremap <leader>G "gy<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>
nnoremap gs "gyiw<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/
vnoremap gs "gy<cr>:silent grep -e "<c-r>=escape('<c-r>g', '#')<cr>"<cr>:cfdo %s/<c-r>=escape('<c-r>g', '#')<cr>/

" Terminal
nnoremap <silent> <leader><cr> <cmd>terminal<cr>i

" Marks
nnoremap <leader>ha 'A'"
nnoremap <leader>hs 'S'"
nnoremap <leader>hd 'D'"
nnoremap <leader>hf 'F'"
nnoremap <leader>hc 'C'"

" No/now (toggle options)
nnoremap <silent> <leader>nc :call NowColo()<cr>
nnoremap <expr> <leader>ns &spell ? ':set nospell<cr>' : ':set spell<cr>'
nnoremap <expr> <leader>nw &wrap ? ':set nowrap<cr>' : ':set wrap breakindent linebreak<cr>'

" PACKAGE/PLUGIN MAPPINGS

" Fuzzy finder
nnoremap <leader>s :FuzzyOpen<cr>

" Git
nnoremap <leader>gb <cmd>BlamerToggle<cr>
nnoremap <leader>gc <cmd>Git log -p %<cr>
nnoremap <leader>gd <cmd>tabnew %<cr><cmd>Gvdiffsplit<cr>
nnoremap <leader>gg <cmd>Git<cr>
nnoremap <leader>gj /<<<<<<<\\|=======\\|>>>>>>><cr>
nnoremap <leader>gk ?<<<<<<<\\|=======\\|>>>>>>><cr>
nnoremap <leader>gl <cmd>Git log<cr>
nnoremap <leader>go <cmd>OpenGithubFile<cr>
nnoremap <leader>gp <cmd>Git pull<cr>
nnoremap <leader>gP <cmd>Git push<cr>
nnoremap <leader>gq <cmd>Git mergetool<cr>
nnoremap <leader>gs <cmd>SignifyEnableAll<cr>

" Color highlight groups
nnoremap <leader>ct <cmd>TSHighlightCapturesUnderCursor<cr>
nn <leader>cg <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>

" URL
nn gx <cmd>OpenURLFind<cr>
vn gx y:OpenSearchURL duckduckgo <c-r>"<cr>

" Hop
noremap <leader>j <cmd>HopVerticalAC<cr>
noremap <leader>k <cmd>HopVerticalBC<cr>
