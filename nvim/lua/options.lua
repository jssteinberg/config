-- GLOBAL OPTIONS

-- satusline options
vim.o.statusline = require 'statusline'
-- enable mouse for all modes
vim.o.mouse = 'a'
-- use OS clipboard
vim.o.clipboard = 'unnamedplus'
-- allow hiding unsaved buffers
vim.o.hidden = true
-- generally ignore case
vim.o.ignorecase = true
-- show tabs as vertical lines
vim.o.listchars = vim.o.listchars .. ',tab:│ '
-- less timeoutlen for maps
vim.o.timeoutlen = 500
-- session data
vim.o.sessionoptions = 'curdir,folds,tabpages'
-- avoid cursor on Y axis edges
vim.o.scrolloff = 10

-- Wild
-- wildmode lastused
vim.o.wildmode = 'lastused:' .. vim.o.wildmode
-- wildmode ignorecase
vim.o.wildignorecase = true
-- wildignore
vim.o.wildignore =  'node_modules/,' .. vim.o.wildignore

-- Search & substitute
-- smartcase when searching
vim.o.smartcase = true
-- global substitute as default
vim.o.gdefault = true


-- WINDOW-LOCAL OPTIONS

-- show line numbers
vim.wo.number = true
-- show relativenumbers---eases line jumping
vim.wo.relativenumber = true
-- show signs for tabs, whitespace, etc.
vim.wo.list = true
-- always show signcolumn (used by different plugins)
vim.wo.signcolumn = 'yes'
-- cursorline and column by default
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
-- fold on indent
vim.wo.foldmethod = 'indent'
vim.wo.foldenable = false

-- Wrap
-- softwrap inheriting indent
vim.wo.breakindent = true
-- break word by 'breakat'
vim.wo.linebreak = true


-- BUFFER-LOCAL OPTIONS

-- default to utf-8
vim.bo.fileencoding = 'utf-8'
-- max column to search for syntax items (low for performance)
vim.bo.synmaxcol = 200
-- copy indent on paste
vim.bo.copyindent = true
-- activate undofiles for persistent undo
vim.bo.undofile = true
-- no swapfiles when persistent undo and no multiuser system
vim.bo.swapfile = false

-- Indentation
-- tabs -- noexpandtab is default
vim.bo.tabstop = 2 -- number of spaces for tab char
vim.bo.shiftwidth = 2 -- number of spaces for autoindent
-- Formatoptions
-- (c) auto hard wrap comments
-- (j) remove comment leader when joining lines
-- (l) don't break long lines (does c still work?)
-- (n) recognize numbered lists
-- (p) don't break lines on single space following period
-- (q) allow gq formatting
vim.bo.formatoptions = 'cjlnpq'


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
