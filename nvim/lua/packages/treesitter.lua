local M = {}

M.config = function ()
	require('nvim-treesitter.configs').setup({
		ignore_install = { 'vim', 'lua', 'markdown' },
		highlight = {
			enable = true,
			disable = { 'vim', 'lua', 'markdown' },
		},
		autotag = { enable = true },
	})
end

return M
