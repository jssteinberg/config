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
nnoremap <leader>e. :edit .<cr>
nnoremap <leader>eh :edit %:h<cr>
nnoremap <leader>ec :tabedit ~/.config/vimrc<cr>:tcd  %:h<cr>
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

" OPTIONS
set clipboard=unnamed " Sync system clioboard
set hlsearch " Highlight search matches
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set list listchars=tab:\·\  fillchars=vert:\│ " Show tabs, consistent char
set undodir=$HOME/.vimundo undofile

" AUTO COMMANDS
aug vim_config
	" FileTypes
	au BufNewFile,BufRead *.astro,*.mdx set ft=markdown
augroup END

" COLORS
try
	set background=dark | colo nightcool
catch
	set background=dark | colo quiet " DUAL lunaperche quiet DARK habamax industry slate LIGHT zellner
	hi Normal ctermbg=NONE
	hi CursorLine cterm=NONE ctermbg=236 | hi! link CursorLineNr CursorLine
	hi! link SignColumn LineNr
	hi! link Tabline Normal | hi! link TablineFill Tabline
endtry

" FZY FUNCTION
fu! FzyCommand(choice_command, vim_command) abort
	try
		let output = system(a:choice_command . " | fzy ")
	catch /Vim:Interrupt/ | endtry | redraw!

	if v:shell_error == 0 && !empty(output)
		exec a:vim_command . ' ' . output
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
endf

command! Update source $MYVIMRC | call PackInit() | call minpac#update()
command! Clean source $MYVIMRC | call PackInit() | call minpac#clean()
