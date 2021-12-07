-- GLOBAL OPTIONS

-- satusline options
-- vim.opt.statusline = require 'statusline'
-- enable mouse for all modes
vim.opt.mouse = 'a'
-- use OS clipboard
vim.opt.clipboard = 'unnamedplus'
-- allow hiding unsaved buffers
vim.opt.hidden = true
-- generally ignore case
vim.opt.ignorecase = true
-- show tabs as vertical lines
vim.opt.listchars = vim.o.listchars .. ',tab:│ '
-- less timeoutlen for maps
vim.opt.timeoutlen = 500
-- session data
vim.opt.sessionoptions = 'curdir,folds,tabpages'
-- avoid cursor on Y axis edges
vim.opt.scrolloff = 10

-- Wild
-- wildmode lastused
vim.opt.wildmode = 'lastused:' .. vim.o.wildmode
-- wildmode ignorecase
vim.opt.wildignorecase = true
-- wildignore
vim.opt.wildignore =  'node_modules/,' .. vim.o.wildignore

-- Search & substitute
-- smartcase when searching
vim.opt.smartcase = true
-- global substitute as default
vim.opt.gdefault = true


-- WINDOW-LOCAL OPTIONS

-- show line numbers
vim.opt.number = true
-- show relativenumbers---eases line jumping
vim.opt.relativenumber = true
-- show signs for tabs, whitespace, etc.
vim.opt.list = true
-- always show signcolumn (used by different plugins)
vim.opt.signcolumn = 'yes'
-- cursorline and column by default
vim.opt.cursorline = true
-- fold on indent
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false

-- Wrap
-- softwrap inheriting indent
vim.opt.breakindent = true
-- break word by 'breakat'
vim.opt.linebreak = true


-- BUFFER-LOCAL OPTIONS

-- default to utf-8
vim.opt.fileencoding = 'utf-8'
-- max column to search for syntax items (low for performance)
vim.opt.synmaxcol = 200
-- copy indent on paste
vim.opt.copyindent = true
-- activate undofiles for persistent undo
vim.opt.undofile = true
-- no swapfiles when persistent undo and no multiuser system
vim.opt.swapfile = false

-- Indentation
-- tabs -- noexpandtab is default
vim.opt.tabstop = 2 -- number of spaces for tab char
vim.opt.shiftwidth = 2 -- number of spaces for autoindent
-- Formatoptions
-- (c) auto hard wrap comments
-- (j) remove comment leader when joining lines
-- (l) don't break long lines (does c still work?)
-- (n) recognize numbered lists
-- (p) don't break lines on single space following period
-- (q) allow gq formatting
vim.opt.formatoptions = 'cjlnpq'


-- AUTOCOMMANDS

-- Set filetypes for strange files
-- require'utils'.create_augroup({
-- 	{'BufNewFile,BufRead', '*.astro',   'set filetype=html'},
-- 	{'BufNewFile,BufRead', '*.styl',    'set filetype=scss'},
-- 	{'BufNewFile,BufRead', '*.postcss', 'set filetype=scss'},
-- 	{'BufNewFile,BufRead', '*.mdx',     'set filetype=markdown'},
-- 	{'BufNewFile,BufRead', '*.gmi',     'set filetype=markdown'},
-- 	{'BufNewFile,BufRead', '*.fish',    'set filetype=sh'},
-- }, 'filetypes')
