vim.cmd [[packadd lush.nvim]]
vim.cmd [[hi clear]]
vim.g.colors_name = "makeupdarkness2"
vim.o.background = "light"
require('lush')(require('makeuplush.darkness2'))
