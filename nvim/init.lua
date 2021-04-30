-- Global options
vim.o.mouse = 'a' -- mouse can be used for all modes
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
vim.o.hidden = true -- allow hiding unsaved files
-- searching
vim.o.smartcase = true -- ignore case when lowercase
vim.o.gdefault = true -- default substitute to global

-- Window-local options
vim.wo.relativenumber = true
vim.wo.list = true
vim.wo.breakindent = true

-- Buffer-local options
vim.bo.swapfile = false
vim.bo.synmaxcol = 200
vim.bo.copyindent = true

-- Require
require('maps') -- key mappings
require('paq') -- plugins via paq
-- require('packer') -- plugins via packer (does not work)
