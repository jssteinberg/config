local M = {}

M.config = function()
	local telescope = require('telescope')

	telescope.setup({
		defaults = {
			file_ignore_patterns = { 'node_modules' },
			layout_strategy = 'vertical',
			layout_config = { height = 0.95 },
		},
	})
end

return M
