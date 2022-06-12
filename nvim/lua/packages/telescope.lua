local M = {}

M.config = function ()
	local telescope = require('telescope')

	telescope.setup({
		defaults = {
			file_ignore_patterns = { 'node_modules' }
		},
	})
end

return M
