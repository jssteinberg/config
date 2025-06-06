set nocompatible
set wildmenu wildcharm=<c-z> " Enable usage in map target
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set showcmd " display incomplete commands
set ttimeout " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key
set incsearch
set regexpengine=0 " needs to be explicitly set to always be active
set mouse+=a
set shortmess-=S " display short messages in ruler
" Enable file type detection & default filetype settings & indent files
filetype plugin indent on
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

" OPTIONS
set clipboard=unnamed " Sync system clioboard
set hlsearch " Highlight search matches
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set undodir=$HOME/.vimundo undofile
set fillchars+=eob:\ ,vert:\·

" NETRW OPTIONS
let g:netrw_preview=1 " Vertical preview

" COLORS - recommended (dual) lunaperche quiet (dark) habamax industry slate (light) zellner
try | colo lunaperche
hi VertSplit cterm=NONE ctermbg=NONE
catch | colo slate | endtry

" KEYMAPS
" Core improve
nnoremap Y y$
nnoremap <silent> <c-l> :nohlsearch<cr><c-l>
inoremap <expr> <tab> getline('.')[col('.') - 2] =~ '\s' ? "\<tab>" : col('.') == 1 ? "\<tab>" : "\<c-n>"

" Additional esc map
tnoremap jk <c-w>N
" Fuzzy find files
" nn <leader>s :call FuzzyFiles("rg --files", ":e")<cr>
nn <leader>s :Clap files<cr>
" Git
nn <silent> <leader>gg :packadd vim-fugitive<bar>G<cr>
nn <leader>gc :packadd vim-fugitive<bar>G log -p -50 %<cr>
nn <silent> <leader>gp :packadd vim-fugitive<bar>G pull<cr>
nn <silent> <leader>gP :packadd vim-fugitive<bar>G push<cr>
" Easymotions
let g:EasyMotion_startofline = 0 " keep cursor colum JK motion
map <Leader>j :packadd vim-easymotion<cr><Plug>(easymotion-j)
map <Leader>k :packadd vim-easymotion<cr><Plug>(easymotion-k)
" Codium
let g:codeium_disable_bindings = 1
imap <script><silent><nowait><expr> <c-f> codeium#Accept()
imap <c-j>   <cmd>call codeium#CycleCompletions(1)<cr>
imap <c-k>   <cmd>call codeium#CycleCompletions(-1)<cr>
imap <c-x>   <cmd>call codeium#Clear()<cr>
" Augment
" let g:augment_disable_tab_mapping = v:true
" inoremap <c-f> <cmd>call augment#Accept()<cr>

" TERMINAL
nn <silent> <leader><cr> <cmd>call termcwd#spGet()<cr>
nn <silent> <leader>t<cr> <cmd>call termcwd#tabGet()<cr>
nn <silent> <leader>1 <cmd>call termcwd#spGet(0,'')<cr>
let g:termcwd_split_full_bottom = 1
let g:termcwd_height = 20

" LSP KEYMAPS
function! s:on_lsp_buffer_enabled() abort
	let g:lsp_diagnostics_virtual_text_align="right"
	let g:lsp_diagnostics_virtual_text_wrap="truncate"
	let g:lsp_format_sync_timeout = 1000
	setlocal omnifunc=lsp#complete
	setlocal foldmethod=expr
		\ foldexpr=lsp#ui#vim#folding#foldexpr()
		\ foldtext=lsp#ui#vim#folding#foldtext()
	if exists("+tagfunc") | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> <leader>lr <plug>(lsp-references)
	nmap <buffer> <leader>lt <plug>(lsp-type-definition)
	nmap <buffer> <c-k> <plug>(lsp-previous-diagnostic)
	nmap <buffer> <c-j> <plug>(lsp-next-diagnostic)
	nmap <buffer> <leader>lh <plug>(lsp-hover)
	nmap <buffer> <leader>K <plug>(lsp-hover)
	nmap <buffer> <cr> :LspDocumentDiagnostics<cr>
	autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

" NETRW KEYMAPS
function! SetNetrwKeymaps() abort
	nn <buffer> s /
	nn <buffer> S ?
	nmap <buffer> <c-j> <cr>
	nmap <buffer> <c-k> v
endfunction

" AUTO COMMANDS
aug vim_config | au!
	" Set filetypes
	au BufNewFile,BufRead *.mdx set ft=markdown
	" Call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
	" Set netrw maps
	autocmd filetype netrw call SetNetrwKeymaps()
augroup END

" FUZZY EDIT W/FZY
fu! FuzzyFiles(choice_command, vim_command) abort
	try | let output = system(a:choice_command . " | fzy ")
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
	call minpac#add("easymotion/vim-easymotion", {"type": "opt"})
	call minpac#add("tpope/vim-fugitive", {"type": "opt"})
	call minpac#add("prabirshrestha/vim-lsp")
	call minpac#add("mattn/vim-lsp-settings")
	call minpac#add("tpope/vim-vinegar")
	call minpac#add("Exafunction/codeium.vim")
	" call minpac#add("augmentcode/augment.vim")
	call minpac#add("tweekmonster/startuptime.vim")
	call minpac#add("liuchengxu/vim-clap", {"do": ":Clap install-binary"})
	call minpac#add("subnut/visualstar.vim")
	" Filetypes
	call minpac#add("othree/html5.vim")
	call minpac#add("pangloss/vim-javascript")
	call minpac#add("evanleck/vim-svelte")
	call minpac#add("wuelnerdotexe/vim-astro")
endf

command! Update source $MYVIMRC | call PackInit() | call minpac#update()
command! Clean source $MYVIMRC | call PackInit() | call minpac#clean()

" Javascript
let g:javascript_plugin_jsdoc = 1
" Svelte
let g:svelte_preprocessors=[
			\"postcss"] " "sass", "typescript"
" Astro
let g:astro_typescript = "enable"
