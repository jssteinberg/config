" Additional esc map
tnoremap jk <c-\><c-n>

" No/now (toggle options)
nnoremap <silent> <leader>nc :call NowColo()<cr>

" PACKAGE/PLUGIN MAPPINGS

nn <leader>et :Neotree<cr>
nn <leader><leader> :Neotree action=show toggle=true<cr>
nn <leader>e. :Neotree position=current reveal<cr>
" leader eb opens neotree of buffers
nn <leader>eb :Neotree buffers<cr>

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
noremap <tab> <cmd>HopLineMW<cr>

" Emmet
imap <c-e><c-e> <plug>(emmet-expand-abbr)
vmap <c-e><c-e> <plug>(emmet-expand-abbr)

" LSP
nn <leader>lR <cmd>LspRestart<cr>

" Zen mode
nnoremap <leader>Z <cmd>call ZenModeFloat()<cr>

function! ZenModeFloat() abort
	let s:zen_prev_win = nvim_get_current_win()
	let l:b = bufnr('%')
	" Get editor dimensions
	tabnew | silent wincmd o
	let l:w = winwidth(0)
	let l:h = winheight(0)
	bd
	" Create zen window (and container)
	let l:h = !&laststatus || (&laststatus == 1 && len(nvim_list_wins())) ? l:h : l:h + 1
	let l:r = &showtabline == 2 || &showtabline && len(nvim_list_tabpages()) > 1 ? 1 : 0
	let l:empty_buf = nvim_create_buf(0, 1)
	let s:zen_container = nvim_open_win(l:empty_buf, 1, { "relative": "editor", "width": l:w, "height": l:h, "row": l:r, "col": 0, "style": "minimal" })
	let s:zen_win = nvim_open_win(l:b, 1, { "relative": "editor", "width": 100, "height": l:h, "row": l:r, "col": (l:w - 100) / 2 })
	call nvim_win_set_option(s:zen_container, 'winhl', 'Normal:Normal')
	call nvim_win_set_option(s:zen_win, 'winhl', 'Normal:Normal')
	let g:zen_win_w = winwidth(0)
	let g:zen_win_h = winheight(0)
endfunction

function! s:close_zen() abort
	" Do with timeout to check if focus was returned
	if exists('s:zen_win') | try
		call nvim_win_close(s:zen_win, 1)
		call nvim_win_close(s:zen_container, 1)
		unlet s:zen_win
		" call nvim_set_current_win(s:zen_prev_win)
	catch | endtry | endif
endfunction

function! s:check_close_zen() abort
	if exists('s:zen_win') && (winwidth(0) != g:zen_win_w || winheight(0) != g:zen_win_h)
		call s:close_zen()
	endif
endfunction

augroup zen_win
	autocmd!
	autocmd WinLeave,VimResized * call s:close_zen()
	autocmd WinResized * call s:check_close_zen()
augroup END
