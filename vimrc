" from $VIMRUNTIME/defaults.vim
set nocompatible
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set showcmd " display incomplete commands
set wildmenu " display completion matches in a status line
set ttimeout " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key
set incsearch
" Don't use Q for Ex mode, use it for Esc.
map Q <esc>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" Revert with ":filetype off".
filetype plugin indent on
" Revert with ":syntax off".
syntax on
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif
" Prevent that the langmap option applies to characters that result from a
" mapping.  If set (default), this may break plugins (but it's backward
" compatible).
if has("langmap") && exists("+langremap")
	set nolangremap
endif

" Set space as leader key
let mapleader=" "

" Source common vim/nvim config
source $HOME/.config/nvim/some.vim

" KEYMAPS
" Core improve
nnoremap Y y$
nnoremap <silent> <c-l> :nohlsearch<cr><c-l>
" Additional esc map
tnoremap jk <c-w>N
" Edit [CWD, buffer D, tabedit .vimrc]
nnoremap <leader>e. <cmd>edit .<cr>
nnoremap <leader>eh <cmd>edit %:h<cr>
nnoremap <leader>ec <cmd>tabedit ~/.config/vimrc<cr>:tcd  %:h<cr>
" Terminal
nn <leader><cr> <cmd>terminal<cr>
" Find links
nn <leader>fl ?\v\S+[:\|.]\S+<cr>
" Fuzzy find files with Fzy
" nnoremap <leader>s :call FzyCommand("fd --hidden --follow -E node_modules -E .git -E .github -E .swc", ":e")<cr>
nnoremap <leader>s :call FzyCommand("rg --files", ":e")<cr>
" Git
nn <leader>gg :packadd vim-fugitive<bar>G<cr>
nn <leader>gp :packadd vim-fugitive<bar>G pull<cr>
" Easymotions
let g:EasyMotion_startofline = 0 " keep cursor colum JK motion
" map s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists("+tagfunc") | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> <leader>lt <plug>(lsp-type-definition)
	nmap <buffer> <c-k> <plug>(lsp-previous-diagnostic)
	nmap <buffer> <c-j> <plug>(lsp-next-diagnostic)
	nmap <buffer> <leader>lh <plug>(lsp-hover)

	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre *.rs,*.go call execute("LspDocumentFormatSync")

	" refer to doc to add more commands
endfunction

" OPTIONS
set clipboard=unnamed " Sync system clioboard
set hlsearch " Highlight search matches
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set list listchars=tab:\·\ 
set undodir=$HOME/.vimundo undofile

" AUTO COMMANDS
aug vim_config
	" FileTypes
	au BufNewFile,BufRead *.mdx set ft=markdown
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" COLORS
set background=dark | try | colo nightcool
catch
	try | colo quiet " DUAL lunaperche quiet DARK habamax industry slate LIGHT zellner
	catch | colo slate | endtry
endtry

" FZY FUNCTION
fu! FzyCommand(choice_command, vim_command) abort
	try
		let output = system(a:choice_command . " | fzy ")
	catch /Vim:Interrupt/ | endtry | redraw!

	if v:shell_error == 0 && !empty(output)
		exec a:vim_command . " " . output
	en
endf

" PLUGINS
fu! PackInit() abort
	packadd minpac
	call minpac#init()
	call minpac#add("k-takata/minpac", {"type": "opt"})
	call minpac#add("tpope/vim-sleuth")
	call minpac#add("tpope/vim-surround")
	call minpac#add("tpope/vim-commentary")
	call minpac#add("easymotion/vim-easymotion")
	call minpac#add("jssteinberg/hackline.vim", {"branch": "dev"})
	call minpac#add("tpope/vim-fugitive", {"type": "opt"})
	call minpac#add("prabirshrestha/vim-lsp")
	call minpac#add("mattn/vim-lsp-settings")
	call minpac#add("prabirshrestha/asyncomplete.vim")
	call minpac#add("prabirshrestha/asyncomplete-lsp.vim")
	call minpac#add("yami-beta/asyncomplete-omni.vim")
	" Filetypes
	call minpac#add('othree/html5.vim')
	call minpac#add('pangloss/vim-javascript')
	call minpac#add('evanleck/vim-svelte')
	call minpac#add("wuelnerdotexe/vim-astro")
endf

command! Update source $MYVIMRC | call PackInit() | call minpac#update()
command! Clean source $MYVIMRC | call PackInit() | call minpac#clean()

" Javascript
let g:javascript_plugin_jsdoc = 1
" Svelte
let g:svelte_preprocessors=[
			\"postcss"] " "sass", "typescript"
