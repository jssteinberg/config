" Additional esc map
tnoremap jk <c-\><c-n>

" No/now (toggle options)
nnoremap <silent> <leader>nc :call NowColo()<cr>

" PACKAGE/PLUGIN MAPPINGS

nn <leader>et :Neotree<cr>
nn <leader><leader> :Neotree action=show toggle=true<cr>
nn <leader>e. :Neotree position=current reveal<cr>

" Fuzzy finder
nnoremap <leader>ff :Pick files<cr>
nnoremap <leader>fb :Pick buffers<cr>
nnoremap <leader>fs :Pick grep_live<cr>
nnoremap <leader>s :Pick files<cr>

" Git
nnoremap <leader>gb <cmd>BlamerToggle<cr>
nnoremap <leader>gc <cmd>Git log -p -50 %<cr>
nnoremap <leader>gd <cmd>tabnew %<cr><cmd>Gvdiffsplit<cr>
nnoremap <leader>gg <cmd>Git<cr>
nnoremap <silent> <leader>gl <cmd>Flog<cr>
nnoremap <leader>gp <cmd>Git pull<cr>
nnoremap <leader>gP <cmd>Git push<cr>
nnoremap <leader>gq <cmd>Git mergetool<cr>
nnoremap <leader>go <cmd>RepoLink!<cr>
vnoremap <leader>go  <cmd>RepoLink!<cr>

" Color highlight groups
nnoremap <leader>hc <cmd>Inspect<cr>
nn <leader>ht <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>

" URL
nn gx <cmd>OpenURLFind<cr>
vn gx y:OpenSearchURL duckduckgo <c-r>"<cr>

" Hop
noremap <leader>j <cmd>HopVertical<cr>
noremap <leader>k <cmd>HopVertical<cr>

" Emmet
imap <c-e><c-e> <plug>(emmet-expand-abbr)
vmap <c-e><c-e> <plug>(emmet-expand-abbr)

" LSP
nn <leader>lR <cmd>LspRestart<cr>

" Zen mode mapping that
" - open current buffer in a new tab
" - create scratch buffers on both vertical sides
" - focuses the center buffer
nnoremap <leader>Z :call ZenMode()<cr>

function! ZenMode() abort
	let l:buf = bufnr('%')
	tabnew
	let l:w = winwidth(0)
	vnew
	vnew
	execute '2wincmd w'
	execute 'buffer' l:buf
	execute 'vert resize 100'
	execute '1wincmd w'
	setlocal nonumber norelativenumber signcolumn=no foldcolumn=0 nocursorline nocursorcolumn
	execute 'vert resize ' . (l:w - 100) / 2
	execute '3wincmd w'
	setlocal nonumber norelativenumber signcolumn=no foldcolumn=0 nocursorline nocursorcolumn
	execute 'vert resize ' . (l:w - 100) / 2
	execute '2wincmd w'
endfunction
