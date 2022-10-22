" Additional esc map
tnoremap jk <c-\><c-n>

" Edit/explore [buffer dir, buffer in new tab, close tab]
nnoremap <leader>ec <cmd>tabedit ~/.config/README.md<cr><cmd>tcd %:h<cr>
" nnoremap <silent> <leader>e. :edit .<cr>
" nnoremap <silent> <leader>eh :edit %:p:.:h<cr>
" Eplorer plugin
noremap <leader>et :Fern . -drawer -reveal=% -toggle<cr>
nnoremap <silent> <leader>e. :Fern . -reveal=%<cr>
nnoremap <silent> <leader>et :Fern . -drawer -reveal=% -toggle<cr>

" Terminal
nnoremap <silent> <leader><cr> <cmd>terminal<cr>i

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
nnoremap <leader>hc <cmd>TSHighlightCapturesUnderCursor<cr>
nn <leader>ht <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>

" URL
nn gx <cmd>OpenURLFind<cr>
vn gx y:OpenSearchURL duckduckgo <c-r>"<cr>

" Hop
noremap s <cmd>HopChar1<cr>
noremap <leader>j <cmd>HopVerticalAC<cr>
noremap <leader>k <cmd>HopVerticalBC<cr>
