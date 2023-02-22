nnoremap ds :lua require("s_space_search.forward").search()<cr>

" Additional esc map
tnoremap jk <c-\><c-n>

" Edit/explore [buffer dir, buffer in new tab, close tab]
nnoremap <leader>ec <cmd>tabedit ~/.config/README.md<cr><cmd>tcd %:h<cr>
nnoremap <leader>e. <cmd>Vaffle .<cr>
nnoremap <leader>eh <cmd>Vaffle %:h<cr>
nnoremap <silent> <leader>ed :SFMToggle<cr>

" Terminal
nnoremap <silent> <leader><cr> <cmd>wincmd s<cr><cmd>terminal<cr>i

" Marks
nnoremap <leader>ma 'A'"
nnoremap <leader>ms 'S'"
nnoremap <leader>md 'D'"
nnoremap <leader>mf 'F'"
nnoremap <leader>mc 'C'"

" No/now (toggle options)
nnoremap <silent> <leader>nc :call NowColo()<cr>

" PACKAGE/PLUGIN MAPPINGS

" Fuzzy finder
nnoremap <leader>s :FuzzyOpen<cr>
nnoremap <leader>fb :FzfLua buffers<cr>
nnoremap <leader>fs :FzfLua live_grep_native<cr>
nnoremap <leader>ff :FzfLua files<cr>

" Git
nnoremap <leader>gb <cmd>BlamerToggle<cr>
nnoremap <leader>gc <cmd>Git log -p -50 %<cr>
nnoremap <leader>gd <cmd>tabnew %<cr><cmd>Gvdiffsplit<cr>
nnoremap <leader>gg <cmd>Git<cr>
nnoremap <leader>gj /<<<<<<<\\|=======\\|>>>>>>><cr>
nnoremap <leader>gk ?<<<<<<<\\|=======\\|>>>>>>><cr>
nnoremap <leader>gl <cmd>Git log<cr>
nnoremap <leader>go <cmd>OpenGithubFile<cr>
nnoremap <leader>gp <cmd>Git pull<cr>
nnoremap <leader>gP <cmd>Git push<cr>
nnoremap <leader>gq <cmd>Git mergetool<cr>

" Color highlight groups
nnoremap <leader>hc <cmd>TSHighlightCapturesUnderCursor<cr>
nn <leader>ht <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>

" URL
nn gx <cmd>OpenURLFind<cr>
vn gx y:OpenSearchURL duckduckgo <c-r>"<cr>

" Hop
" noremap s <cmd>HopChar1<cr>
noremap <leader>j <cmd>HopVertical<cr>
noremap <leader>k <cmd>HopVertical<cr>

" Emmet
imap <c-e><c-e> <plug>(emmet-expand-abbr)
vmap <c-e><c-e> <plug>(emmet-expand-abbr)
