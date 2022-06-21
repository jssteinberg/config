let g:color_theme = 'dark'

" Better defaults
vnoremap < <gv
vnoremap > >gv
cnoremap <c-p> <up>
cnoremap <c-n> <down>
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

" Esc [normal, terminal]
inoremap jk <esc>
tnoremap jk <c-\><c-n>

" Search
nnoremap <c-s> /
xnoremap <c-s> /
cnoremap <expr> <tab>   getcmdtype() =~ "[/?]" ? "<C-g>" : "<C-z>"
cnoremap <expr> <s-tab> getcmdtype() =~ "[/?]" ? "<C-t>" : "<S-Tab>"

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
nnoremap <leader>ep :edit package.json<cr>
nnoremap <leader>er :edit README.md<cr>
nnoremap <leader>ew :edit **/*
nnoremap <leader>tb :tabedit %<cr>'"
nnoremap <leader>tc :tabclose<cr>
" fern
nnoremap <silent> <leader>eh :Fern %:p:.:h -reveal=%<cr>
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

" Cycle colorschemes
nnoremap <silent> <leader>cc :call CycleColo()<cr>

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
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fs :Telescope live_grep<cr>
nnoremap <leader>gf :Telescope git_files<cr>
nnoremap <leader>s :Telescope find_files<cr>

" Git
nnoremap <leader>gg <cmd>Git<cr>
nnoremap <leader>gq <cmd>Git mergetool<cr>
nnoremap <leader>gb <cmd>BlamerToggle<cr>
nnoremap <leader>gp <cmd>Git pull<cr>
nnoremap <leader>gP <cmd>Git push<cr>
nnoremap <leader>gl <cmd>Git log<cr>
nnoremap <leader>go <cmd>OpenGithubFile<cr>

" Copilot
imap <silent><script><expr> <c-f> copilot#Accept("\<CR>")
inoremap jl <esc>:Copilot<cr>

" Harpoon
nnoremap <leader>hh :lua require("harpoon.mark").add_file()<cr>
nnoremap <silent> <leader>he :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent> <leader>ha :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <silent> <leader>hs :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <silent> <leader>hd :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <silent> <leader>hf :lua require("harpoon.ui").nav_file(4)<cr>
nnoremap <silent> <leader><cr> :lua require("harpoon.term").gotoTerminal(1)<cr>i
nnoremap <silent> <leader>1 :lua require("harpoon.term").gotoTerminal(2)<cr>i

augroup keymaps
	au!
	autocmd FileType netrw call NetrwRemaps()
augroup END

function! CycleColo()
	if g:color_theme == 'dark'
		let g:color_theme = 'light'
		lua require('packages.colors').set_colo('light')
	else
		let g:color_theme = 'dark'
		lua require('packages.colors').set_colo('dark')
	endif
endfunction
