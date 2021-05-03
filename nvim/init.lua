-- Global options
vim.o.mouse = 'a' -- mouse can be used for all modes
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
vim.o.hidden = true -- allow hiding unsaved files
vim.o.sessionoptions = 'blank,curdir,folds,help,tabpages,winsize'
vim.o.ignorecase = true -- generally ignore case
vim.o.listchars = vim.o.listchars .. ',tab:│ '
-- searching
vim.o.smartcase = true -- smartcase for search
vim.o.gdefault = true -- default substitute to global

-- Window-local options
vim.wo.relativenumber = true
vim.wo.list = true
vim.wo.breakindent = true

-- Buffer-local options
vim.bo.synmaxcol = 200 -- maximum column in which to search for syntax items
vim.bo.copyindent = true
vim.bo.swapfile = false -- no swapfiles
vim.bo.undofile = true -- activate undofiles for persistent undo
-- tabs -- noexpandtab is default
vim.bo.tabstop = 3 -- number of spaces for tab char
vim.bo.shiftwidth = 3 -- number of spaces for autoindent

-- Key mappings

-- leader: space
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables

-- esc: qq
vim.api.nvim_set_keymap('i', 'qq', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('x', 'qq', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('t', 'qq', '<c-\\><c-n>', {noremap = true}) -- esc to normal mode in :terminal

-- previous buffer: leader bb
vim.api.nvim_set_keymap('n', '<leader>bb', '<c-^>', {noremap = true})

-- jump to definition: leader l
vim.api.nvim_set_keymap('n', '<leader>l', '<c-]>', {noremap = true})

-- Require
require('netrw')
require('paq') -- plugins via paq
