vim.cmd [[packadd lush.nvim]]
vim.cmd [[hi clear]]
vim.g.colors_name = "makeupdarkness1white"
vim.o.background = "light"
require('lush')(require('makeupdarkness1.white'))
