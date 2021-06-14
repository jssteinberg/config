local wk = require'which-key'
local maps = require'keymaps'

local M = {}

M.config = function()
	-- which-key's config doesn't like to be in packer's `use.config` value...
	wk.setup({
		plugins = {
			spelling = {
				enabled = true,
			},
			registers = false
		},
		triggers_blacklist = {
			i = { 'q', 'Z' },
			v = { 'q' },
		},
	})
	wk.register(maps.normal)
	wk.register(maps.insert,   {mode = 'i'})
	wk.register(maps.visual,   {mode = 'v'})
end

return M
