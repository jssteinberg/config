local wk = require'which-key'
local maps = require'keymaps'

local M = {}

M.config = function()
	wk.setup({
		plugins = {
			spelling = {
				enabled = true,
			},
			registers = false
		},
	})
	wk.register(maps.normal)
	wk.register(maps.insert, {mode = 'i'})
	wk.register(maps.visual, {mode = 'v'})
end

return M
