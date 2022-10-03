vim.cmd [[
	packadd lush.nvim
	hi clear
	set t_Co=256
]]
vim.g.colors_name = "makeupdarkness1whitelush"
vim.o.background = "light"
require("lush")(require("makeupdarkness1.white"))
