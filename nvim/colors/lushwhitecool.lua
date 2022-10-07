vim.cmd [[
	packadd lush.nvim
	hi clear
	set t_Co=256
]]
vim.g.colors_name = "lushwhitecool"
vim.o.background = "light"
require("lush")(require("nightcool.white"))

vim.g.terminal_color_0 = "#1a1636"
vim.g.terminal_color_1 = "#bc675c"
vim.g.terminal_color_2 = "#80bc5c"
vim.g.terminal_color_3 = "#bc985c "
vim.g.terminal_color_4 = "#5c80bc"
vim.g.terminal_color_5 = "#685cbc"
vim.g.terminal_color_6 = "#5cb1bc"
vim.g.terminal_color_7 = "#afacc5"
vim.g.terminal_color_8 = "#7d78a1"
vim.g.terminal_color_9 = "#d6a39b"
vim.g.terminal_color_10 = "#a9d69b"
vim.g.terminal_color_11 = "#ced69b"
vim.g.terminal_color_12 = "#9bb2d6"
vim.g.terminal_color_13 = "#a39bd6"
vim.g.terminal_color_14 = "#9bcfd6"
vim.g.terminal_color_15 = "#ffffff"
vim.g.terminal_color_background = "#121118"
vim.g.terminal_color_foreground = "#e5f2e0"
