vim.cmd [[
	packadd lush.nvim
	hi clear
	set t_Co=256
]]
vim.g.colors_name = "lushwhitecool"
vim.o.background = "light"
require("lush")(require("nightcool.white"))
