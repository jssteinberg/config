" For space as leader key
nn <space> <nop>

" Source config
runtime ../some.vim
runtime line.vim

let g:nightcool_bg = "transparent"
let g:nightcool_statusline = "transparent"
let g:nightcool_bgs = v:false
"colo nightcool_org
" OPTIONS
set clipboard+=unnamedplus
set undofile
set diffopt+=vertical
set fillchars+=eob:\  " Hide ~ at end of buffer
set titlestring=vi%(\ %{split(getcwd(0),'/')[-1]}%)
set title
" Completion
set completeopt=menuone,noselect,noinsert
set shortmess+=c
" Netrw
let g:netrw_banner=0
let g:netrw_preview=1 " Vertical preview

" KEYMAPS
nn mm %
" Additional esc map
tnoremap jk <c-\><c-n>
" Completion
inoremap <expr> <tab> getline('.')[col('.') - 2] =~ '\s' ? "\<tab>" : col('.') == 1 ? "\<tab>" : "\<c-n>"
" Find files
nn <silent> <leader>f :Pick files<cr>
" Live grep
nn <leader>gl :Pick grep_live<cr>
" Git
nn <silent> <leader>vv :tabnew<bar>G<bar>wincmd o<cr>
nn <leader>vs <cmd>G<cr>
nn <leader>vc <cmd>G log -p -50 %<cr>
nn <leader>vd <cmd>tabnew %<cr><cmd>Gvdiffsplit<cr>
nn <leader>vp <cmd>G pull<cr>
nn <leader>vP <cmd>G push<cr>
nn <leader>vb <cmd>lua Snacks.git.blame_line()<cr>
nn <silent> <leader>vl <cmd>Flog<cr>
" Hop
noremap <leader>j <cmd>HopVertical<cr>
noremap <leader>k <cmd>HopVertical<cr>
" Color highlight groups (treesitter)
nn <leader>ti <cmd>Inspect<cr>
nn <leader>tt <cmd>so $VIMRUNTIME/syntax/hitest.vim<cr>
" Zen mode
nnoremap <leader>nz <cmd>call ZenModeFloat()<cr>

" AUTO COMMANDS
augroup nvim_init
	au!
	" Check if file has been updated
	autocmd FocusGained,BufEnter * :checktime
	" Open quickfix window when relevant
	au QuickFixCmdPost [^l]* cwindow
	" Highlight yanked text
	autocmd TextYankPost * silent! lua vim.hl.on_yank { higroup='Search', timeout=125 }
augroup END

lua << EOF
	require'options'.add_filetypes()
	require("config.lazy")
EOF

" ZEN MODE

function! ZenModeFloat() abort
	let s:zen_prev_win = nvim_get_current_win()
	let l:b = bufnr('%')
	" Get current tabpage
	let g:zen_tab = nvim_get_current_tabpage()
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
	elseif g:zen_tab == nvim_get_current_tabpage()
		call s:close_zen()
	endif
endfunction

function! s:check_close_zen() abort
	if exists('s:zen_win') && g:zen_tab == nvim_get_current_tabpage() && exists('g:zen_win_w') && (winwidth(0) != g:zen_win_w || winheight(0) != g:zen_win_h)
		call s:close_zen()
	else
		call nvim_win_set_option(s:zen_win, 'winhl', 'Normal:Normal')
	endif
endfunction
