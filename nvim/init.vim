set clipboard=unnamedplus
set copyindent
set cursorline
set hidden
set fileencoding=utf-8
set foldmethod=indent nofoldenable
set ignorecase smartcase
set list listchars+=tab:\·\  fillchars+=vert:\·
set number relativenumber signcolumn=yes
set mouse=a
set sessionoptions=curdir,folds,tabpages,help
set scrolloff=5
set synmaxcol=200 " reduce column to search for syntax items
set tabstop=2 shiftwidth=2 " indent size
set timeoutlen=500 " Wait less for typing of keymaps
set undofile noswapfile
set wildmode=lastused:full wildignore+=node_modules/
set wrap breakindent linebreak " Inherit indent, `linebreak` use `breakat`

" Formatoptions
" (c) auto hard wrap comments
" (j) remove comment leader when joining lines
" (l) don't break long lines (does c still work?)
" (n) recognize numbered lists
" (p) don't break lines on single space following period
" (q) allow gq formatting
set formatoptions=cjlnpq

augroup vimStartup
	au!
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid, when inside an event handler
	autocmd BufReadPost *
				\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
				\ |   exe "normal! g`\""
				\ | endif

augroup END

lua << EOF

-- ## Vanilla nvim config
-- Options
-- require'options'
-- Keymaps
require'keymaps'.init()

-- ## Packages config
-- Netrw
require'packages.netrw'.config()
-- External packages
require'packages'
-- Set colorscheme
require'packages.colors'.set_colo()

EOF
