vim.cmd [[packadd lush.nvim]]
vim.cmd [[hi clear]]
vim.g.colors_name = "makeuplush"

-- you could detect background == dark || light here and require
-- different files
require('lush')(require('makeuplush'))
