-- Keymaps (global)
-- Format mappings via Which Key as human readable as possible.

local M = {}

M.esc_map = 'jk'
M.buffer_alternate_map = '<bs>'

M.insert = {
	['<c-e>'] = { '<c-y>,',
	'Emmet expand', noremap=false },
}

M.visual = {
	['<leader>k'] = { '<c-a>',
	'Increase number' },

	['<leader>j'] = { '<c-x>',
	'Decrease number' },


	-- Hop

	['<leader>J'] = { '<cmd>HopLine<cr>',
	'Hop to line' },

	['<leader>K'] = { '<cmd>HopLine<cr>',
	'Hop to line' },


	-- Find

	['<leader>f'] = { name =
		'find',

		j = { ':AnyJumpVisual<cr>',
		'Jump to files with string' },
	},
}

M.normal = {

	-- NAMES

	["<leader>c"] = { name = "command"},

	-- MAPPINGS

	['<leader>W'] = { ':SudaWrite<cr>',
	'Write restricted buffer' },


	-- Jumps/motions

	['<leader>J'] = { '<cmd>HopLine<cr>',
	'Hop to line' },

	['<leader>K'] = { '<cmd>HopLine<cr>',
	'Hop to line' },


	-- Edit

	['<leader>k'] = { '<c-a>',
	'Increase number' },

	['<leader>j'] = { '<c-x>',
	'Decrease number' },


	-- Find

	['<leader>f'] = { name =
		'find',

		j = { ':AnyJump<cr>',
		'Jump to files with string' },
	},


	-- Git

	['<leader>g'] = {
		name = 'git',
		l = { ':Git | GV<cr>', 'Log' },
	},


	-- Harpoon files

	['<leader>h'] = { name =
		'harpoon',

		h = { ':lua require("harpoon.mark").add_file()<cr>',
		'Harpoon-add file', silent=false },

		e = { ':lua require("harpoon.ui").toggle_quick_menu()<cr>',
		'Edit \'harpooned\' files' },

		a = { ':lua require("harpoon.ui").nav_file(1)<cr>',
		'a (1) file' },

		s = { ':lua require("harpoon.ui").nav_file(2)<cr>',
		's (2) file' },

		d = { ':lua require("harpoon.ui").nav_file(3)<cr>',
		'd (3) file' },

		f = { ':lua require("harpoon.ui").nav_file(4)<cr>',
		'f (4) file' },
	},


	-- LSP

	['<leader>l'] = { name =
		'lsp',
	},


	-- No/now (toggle, (de)activate)

	['<leader>n'] = { name =
		'no/now',

	},


	-- Terminal

	['<leader><cr>'] = {':lua require("harpoon.term").gotoTerminal(100)<cr>i',
		'Terminal 0', noremap=false },

	['<leader>1'] = {':lua require("harpoon.term").gotoTerminal(1)<cr>i',
		'Terminal 1', noremap=false },

	['<leader>2'] = {':lua require("harpoon.term").gotoTerminal(2)<cr>i',
		'Terminal 2', noremap=false },

	['<leader>3'] = {':lua require("harpoon.term").gotoTerminal(3)<cr>i',
		'Terminal 3', noremap=false },


	-- Windows

	['<c-x>'] = { '<c-w><c-x>',
	'Exchange window with next' },


	-- Zen mode

	['<leader>Z'] = {':ZenMode<cr>',
		'Zen mode' },

}

return M
