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

" Zen mode
nnoremap <leader>Z :call ZenModeFloat()<cr>

function! ZenModeFloat() abort
	tabnew
	let l:w = winwidth(0)
	let l:h = winheight(0)
	bd
	" let l:r to 1 if tabline shows
	let l:r = &showtabline ? 1 : 0
	let g:zenW = nvim_open_win(0, 1, { "relative": "editor", "width": 100, "height": l:h, "row": l:r, "col": (l:w - 100) / 2 })
endfunction

augroup zenW
	autocmd!
	" close window before entering another window, in try catch
	autocmd WinEnter * if exists('g:zenW') | silent! exe g:zenW . 'clo' | unlet g:zenW | endif
augroup END
