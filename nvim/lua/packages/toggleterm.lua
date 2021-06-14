local M = {}

M.config = function() require'toggleterm'.setup{
	start_in_insert = false,
	hide_numbers = false,
	shade_terminals = false,
} end

return M
