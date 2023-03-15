" Additional esc map
tnoremap jk <c-\><c-n>

" Edit/explore [buffer dir, buffer in new tab, close tab]
nnoremap <silent> <leader>ed :SFMToggle<cr>
nnoremap <silent> <leader>et :wincmd v<bar>wincmd H<bar>vertical resize 30<cr>

" No/now (toggle options)
nnoremap <silent> <leader>nc :call NowColo()<cr>

" PACKAGE/PLUGIN MAPPINGS

" Fuzzy finder
nnoremap <leader>fb :FzfLua buffers<cr>
nnoremap <leader>fs :FzfLua live_grep_native<cr>
nnoremap <leader>ff :FzfLua files<cr>
nnoremap <leader>s :FzfLua files<cr>

" Git
nnoremap <leader>gb <cmd>BlamerToggle<cr>
nnoremap <leader>gc <cmd>Git log -p -50 %<cr>
nnoremap <leader>gd <cmd>tabnew %<cr><cmd>Gvdiffsplit<cr>
nnoremap <leader>gg <cmd>Git<cr>
nnoremap <leader>gl <cmd>Flog<cr>
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
