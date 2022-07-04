local M = {}

M.visual = {
	['<leader>k'] = { '<c-a>', 'Increase number' },
	['<leader>j'] = { '<c-x>', 'Decrease number' },

	-- Find
	['<leader>f'] = { name = 'find' },
}

M.normal = {

	-- NAMES
	["<leader>c"] = { name = "command" },

	-- MAPPINGS
	['<leader>W'] = { ':SudaWrite<cr>', 'Write restricted buffer' },

	-- Edit
	['<leader>k'] = { '<c-a>', 'Increase number' },
	['<leader>j'] = { '<c-x>', 'Decrease number' },

	-- Find
	['<leader>f'] = { name = 'find' },

	-- Git
	['<leader>g'] = {
		name = 'git',
		l = { ':Git | GV<cr>', 'Log' },
	},

	-- LSP
	['<leader>l'] = { name = 'lsp' },
	-- No/now (toggle, (de)activate)
	['<leader>n'] = { name = 'no/now' },
}

return M
