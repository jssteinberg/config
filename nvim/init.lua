-- Global options
vim.o.mouse = 'a' -- mouse can be used for all modes
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
vim.o.hidden = true -- allow hiding unsaved files
-- vim.o.sessionoptions = 'blank,curdir,folds,help,tabpages,winsize'
vim.o.ignorecase = true -- generally ignore case
vim.o.listchars = vim.o.listchars .. ',tab:│ '
-- searching
vim.o.smartcase = true -- smartcase for search
vim.o.gdefault = true -- default substitute to global

-- Window-local options
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes' -- always show signcolumn (used by different plugins)
vim.wo.list = true
-- wrap
vim.wo.breakindent = true -- softwrap folloing indent
vim.wo.linebreak = true -- break word by 'breakat'

-- Buffer-local options
vim.bo.synmaxcol = 200 -- maximum column in which to search for syntax items
vim.bo.copyindent = true
vim.bo.undofile = true -- activate undofiles for persistent undo
vim.bo.swapfile = false -- no swapfiles when persistent undo and no multiuser system
-- tabs -- noexpandtab is default
vim.bo.tabstop = 3 -- number of spaces for tab char
vim.bo.shiftwidth = 3 -- number of spaces for autoindent

-- Key mappings

-- leader
-- space
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables

-- open terminal in insert
vim.api.nvim_set_keymap('n', '<leader>ot', ':terminal<cr>i', {noremap = true})

-- jump to definition
vim.api.nvim_set_keymap('n', '<leader>l', '<c-]>', {noremap = true})

-- search
-- visual star
vim.api.nvim_set_keymap('x', '*', 'y/<c-r><cr>', {noremap = true})
-- nohlsearch
vim.api.nvim_set_keymap('n', '<cr>', ':nohlsearch<cr>', {noremap = true})

-- esc
-- qq in insert
vim.api.nvim_set_keymap('i', 'qq', '<esc>', {noremap = true})
-- qq in visual (x)
vim.api.nvim_set_keymap('x', 'qq', '<esc>', {noremap = true})
 -- qq in terminal
vim.api.nvim_set_keymap('t', 'qq', '<c-\\><c-n>', {noremap = true})

-- buffers
-- list buffers, load by number
vim.api.nvim_set_keymap('n', '<leader>bl', ':ls<cr>:b', {noremap = true})
-- previous buffer
vim.api.nvim_set_keymap('n', '<leader>bb', '<c-^>', {noremap = true})
vim.api.nvim_set_keymap('t', '<leader>bb', '<c-\\><c-n><c-^>', {noremap = true})
-- prev/next buffer
vim.api.nvim_set_keymap('n', '<tab>', ':bnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><tab>', ':bprevious<cr>', {noremap = true})

-- files
-- wild find
vim.api.nvim_set_keymap('n', '<leader>ff', ':find **/', {noremap = true})

-- completion
-- tab for buffer completion
vim.api.nvim_set_keymap('i', '<tab>', '<c-n>', {noremap = true})
vim.api.nvim_set_keymap('i', '<s-tab>', '<c-p>', {noremap = true})

-- git
-- status
vim.api.nvim_set_keymap('n', '<leader>gs', ':exe "!git status " . shellescape(getcwd())<cr>', {noremap = true})
-- commit current
vim.api.nvim_set_keymap('n', '<leader>gcc', ':!git commit "%" -m "', {noremap = true})
-- commit all
vim.api.nvim_set_keymap('n', '<leader>gca', ':!git commit -am "', {noremap = true})

-- Require
require('statusline')
require('netrw')
require('paq') -- plugins via paq
