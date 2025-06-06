" Additional esc map
tnoremap jk <c-\><c-n>

" No/now (toggle options)
nnoremap <silent> <leader>nc :call NowColo()<cr>

" PACKAGE/PLUGIN MAPPINGS

nn <leader>e. :Oil .<cr>
nn <leader>et :Neotree<cr>
nn <leader><leader> :Neotree action=show toggle=true<cr>
" leader eb opens neotree of buffers
nn <leader>eb :Neotree buffers<cr>

" Fuzzy finder
nnoremap <leader>ff :Pick buffers<cr>
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

" Color highlight groups (treesitter)
nnoremap <leader>ti <cmd>Inspect<cr>
nn <leader>tt <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>

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
nn <silent> <leader>lR :LspStop<cr>:LspStart<cr>

" Zen mode
nnoremap <leader>Z <cmd>call ZenModeFloat()<cr>

function! ZenModeFloat() abort
	let s:zen_prev_win = nvim_get_current_win()
	let l:b = bufnr('%')
	" Get editor dimensions
	let l:w = &columns
	let l:h = &lines
	" subtract statusline
	let l:h = &laststatus == 2 || &laststatus && len(nvim_list_wins()) > 1 ? l:h - 1 : l:h
	" subtract tabline
	let l:h = &showtabline == 2 || &showtabline && len(nvim_list_tabpages()) > 1 ? l:h - 1 : l:h
	" Create zen window (and container)
	let l:top = &showtabline == 2 || &showtabline && len(nvim_list_tabpages()) > 1 ? 1 : 0
	let l:empty_buf = nvim_create_buf(0, 1)
	let s:zen_container = nvim_open_win(l:empty_buf, 1, { "relative": "editor", "width": l:w, "height": l:h, "row": l:top, "col": 0, "style": "minimal" })
	let s:zen_win = nvim_open_win(l:b, 1, { "relative": "editor", "width": 100, "height": l:h, "row": l:top, "col": (l:w - 100) / 2 })
	call nvim_win_set_option(s:zen_container, 'winhl', 'Normal:Normal')
	call nvim_win_set_option(s:zen_win, 'winhl', 'Normal:Normal')
	let g:zen_win_w = winwidth(0)
	let g:zen_win_h = winheight(0)

	augroup zen_win
		autocmd!
		autocmd WinLeave * call s:zen_win_leave()
		autocmd WinResized * call s:check_close_zen()
		autocmd VimResized * call s:close_zen()
		autocmd BufEnter * call s:check_close_zen()
	augroup END
endfunction

function! s:close_zen() abort
	if !exists('s:zen_win') | return | endif

	try
		call nvim_win_close(s:zen_container, 1)
	catch | endtry

	try
		call nvim_win_close(s:zen_win, 1)
	catch | endtry

	unlet s:zen_win

	augroup zen_win
		autocmd!
	augroup END
endfunction

function! s:zen_win_leave() abort
	" Check if current window is s:zen_win
	if exists('s:zen_win') && nvim_get_current_win() != s:zen_win
		call nvim_win_set_option(s:zen_win, 'winhl', 'Normal:Normal')
	else
		call s:close_zen()
	endif
endfunction

function! s:check_close_zen() abort
	if exists('s:zen_win') && exists('g:zen_win_w') && (winwidth(0) != g:zen_win_w || winheight(0) != g:zen_win_h)
		call s:close_zen()
	else
		call nvim_win_set_option(s:zen_win, 'winhl', 'Normal:Normal')
	endif
endfunction
