-- global options
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
vim.o.title = true
vim.o.gdefault = true -- default substitute to global
vim.o.hidden = true -- allow hiding unsaved files

-- window-local options
vim.wo.relativenumber = true
vim.wo.list = true
vim.wo.breakindent = true

-- buffer-local options
vim.bo.swapfile = false
vim.bo.synmaxcol = 200
vim.bo.copyindent = true

require('maps')
require('paq')
-- require('packer')
