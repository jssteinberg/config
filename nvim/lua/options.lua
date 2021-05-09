-- Global options

vim.o.statusline = require 'statusline'
-- enable mouse for all modes
vim.o.mouse = 'a'
-- use OS clipboard
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
-- allow hiding unsaved buffers
vim.o.hidden = true
-- generally ignore case
vim.o.ignorecase = true
-- show tabs as vertical lines
vim.o.listchars = vim.o.listchars .. ',tab:│ '
-- Search & substitute
-- smartcase when searching
vim.o.smartcase = true
-- global substitute as default
vim.o.gdefault = true

-- Window-local options

vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes' -- always show signcolumn (used by different plugins)
vim.wo.list = true
-- wrap
vim.wo.breakindent = true -- softwrap inheriting indent
vim.wo.linebreak = true -- break word by 'breakat'

-- Buffer-local options

vim.bo.fileencoding = 'utf-8'
vim.bo.synmaxcol = 200 -- max column to search for syntax items (lower for performance)
vim.bo.copyindent = true -- copy indent on paste
vim.bo.undofile = true -- activate undofiles for persistent undo
vim.bo.swapfile = false -- no swapfiles when persistent undo and no multiuser system
-- formatoptions
-- (c) auto hard wrap comments
-- (q) allow gq formatting
-- (j) remove comment leader when joining lines
-- (n) recognize numbered lists
-- (l) don't break long lines (does c still work?)
-- (p) don't break lines on single space following period
vim.bo.formatoptions = 'cqjnlp'
-- tabs -- noexpandtab is default
vim.bo.tabstop = 3 -- number of spaces for tab char
vim.bo.shiftwidth = 3 -- number of spaces for autoindent
