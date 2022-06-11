local M = {}

M.config = function ()
	require('nvim-treesitter.configs').setup({
		ignore_install = { 'vim', 'lua' },
		highlight = {
			enable = true,
			disable = { 'vim', 'lua' },
		},
		autotag = { enable = true },
	})
end

return M
