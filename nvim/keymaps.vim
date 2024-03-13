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
nnoremap <leader>Z :call ZenModeFloat()<cr>

function! ZenModeFloat() abort
	let g:zen_buffer = bufnr('%')
	tabnew
	" store current window handle in a global variable
	let b:zen_window_wrapper = win_getid()
	setlocal nonumber norelativenumber signcolumn=no foldcolumn=0 nocursorline nocursorcolumn
	let l:w = winwidth(0)
	let l:h = winheight(0)
	let l:opts = { "relative": "win", "width": 100, "height": l:h, "row": 0, "col": (l:w - 100) / 2 }
	let g:zen_window = nvim_open_win(g:zen_buffer, 1, opts)
endfunction

augroup zen_window
	autocmd!
	" close window before entering another window
	autocmd WinEnter * if exists('g:zen_window') | call nvim_win_close(g:zen_window, 1) | unlet g:zen_window | endif
	" if wrapper is entered and there's an empty buffer, load the zen buffer
	autocmd WinEnter * if exists('b:zen_window_wrapper') | execute 'buffer' g:zen_buffer | endif
augroup END
