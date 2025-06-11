" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '

" Source config
runtime ../some.vim

" OPTIONS
set clipboard+=unnamedplus
set undofile
set diffopt+=vertical
set fillchars+=eob:\ ,vert:\·
" Netrw
let g:netrw_banner=0
let g:netrw_preview=1 " Vertical preview

" KEYMAPS
" Additional esc map
tnoremap jk <c-\><c-n>
" Completion
inoremap <expr> <tab> getline('.')[col('.') - 2] =~ '\s' ? "\<tab>" : col('.') == 1 ? "\<tab>" : "\<c-n>"
" Find files
nn <leader>f :Pick files<cr>
" Explore folder
nn <leader>ef <cmd>lua MiniFiles.open()<cr>
" Live grep
nn <leader>sr :Pick grep_live<cr>
" Hop
noremap <leader>j <cmd>HopVertical<cr>
noremap <leader>k <cmd>HopVertical<cr>
" Color highlight groups (treesitter)
nn <leader>ti <cmd>Inspect<cr>
nn <leader>tt <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>

" AUTO COMMANDS
augroup nvim_init
	au!
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
	" Open quickfix window when relevant
	au QuickFixCmdPost [^l]* cwindow
	" Highlight yanked text
	autocmd TextYankPost * silent! lua vim.hl.on_yank {higroup='Search', timeout=250}
augroup END

lua << EOF
	require("config.lazy")
EOF
