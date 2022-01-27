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

	['<leader><space>'] = { '<cmd>HopWord<cr>',
	'Hop to word' },

	['<leader>J'] = { '<cmd>HopLine<cr>',
	'Hop to line' },

	['<leader>K'] = { '<cmd>HopLine<cr>',
	'Hop to line' },


	-- Find

	['<leader>f'] = { name =
		'find',

		j = { ':AnyJumpVisual<cr>',
		'Jump to files with string' },

		w = { 'y:find **/<c-r>"',
		'Wild search', silent = false },
	},
}

M.normal = {

	['<leader>W'] = { ':SudaWrite<cr>',
	'Write restricted buffer' },


	-- Jumps/motions

	['<leader><space>'] = { '<cmd>HopWord<cr>',
	'Hop to word' },

	['<leader>J'] = { '<cmd>HopLine<cr>',
	'Hop to line' },

	['<leader>K'] = { '<cmd>HopLine<cr>',
	'Hop to line' },


	-- Add (keymaps set elsewhere)

	['<leader>a'] = { name =
		'add'},

	-- Buffers

	-- Open buffer
	[M.buffer_alternate_map] = { '<cmd>buffer#<cr>:file!<cr>',
	'Alternate' },

	['<leader><tab>'] = { ':buffer ',
	':buffer ', silent = false},


	-- Edit

	['<leader>k'] = { '<c-a>',
	'Increase number' },

	['<leader>j'] = { '<c-x>',
	'Decrease number' },

	['<leader>e'] = { name =
		'edit/explore',

		c = { ':tabedit ~/.config/README.md | tcd ~/.config<cr>',
		'Config directory' },
	},


	-- Find

	['<leader>f'] = { name =
		'find',

		d = { ':Telescope lsp_workspace_diagnostics<cr>',
		'Diagnostic' },

		f = { ':Telescope find_files<cr>',
		'Files' },

		g = { ':Telescope git_files<cr>',
		'Git files' },

		j = { ':AnyJump<cr>',
		'Jump to files with string' },

		w = { ':find **/',
		'Wild', silent=false },
	},


	-- Git

	['<leader>g'] = { name =
		'git',

		f = { ':Telescope git_files<cr>',
		'Find files' },

		l = { ':Git | GV<cr>',
		'Log' },

		m = { 'Message' },
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

		i = { '<cmd>LspInfo<cr>',
		'Info' },
	},


	-- No/now (toggle, (de)activate)

	['<leader>n'] = { name =
		'no/now',

		c = { ':ColorizerToggle<cr>',
		'Colorize' },
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


	-- Quickfix

	['Q'] = {':copen<cr>',
		'Quickfix window open' },

	['<leader>q'] = {':cnext<cr>',
		'Quickfix next', silent=false },

	['<leader>Q'] = {':cprevious<cr>',
		'Quickfix previous', silent=false },

	['<ctrl-q>'] = {':cnext<cr>',
		'Quickfix next', silent=false },


	-- Zen mode

	['<leader>Z'] = {':ZenMode<cr>',
		'Zen mode' },

}

M.normal_lsp_buffer_keymaps = function (bufnr)
	return {
		['<cr>'] = { '<cmd>lua vim.diagnostic.open_float()<cr>',
		'Show flag diagnostics', buffer = bufnr },

		K = { '<cmd>lua vim.lsp.buf.hover()<cr>',
		'Hover info', buffer = bufnr },

		['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<cr>',
		'Declaration (LSP)', buffer = bufnr },

		['gd'] = { '<cmd>lua vim.lsp.buf.definition()<cr>',
		'Definition (LSP)', buffer = bufnr },

		-- ['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<cr>',
		-- 'Implementation (LSP)', buffer = bufnr },

		['gr'] = { '<cmd>lua vim.lsp.buf.references()<cr>',
		'References of under cursor (LSP)', buffer = bufnr },

		['<leader>l'] = { name =
			'lsp',

			-- a = { '<cmd>lua vim.lsp.buf.code_action()<cr>',
			-- 'Action', buffer = bufnr },
			a = { ':Telescope lsp_code_actions theme=get_cursor<cr>',
			'Action', buffer = bufnr },

			c = { '<cmd>lua vim.diagnostics.open_float()<cr>',
			'Check line diagnostics', buffer = bufnr },

			D = { '<cmd>lua vim.lsp.buf.declaration()<cr>',
			'Declaration', buffer = bufnr },

			d = { '<cmd>lua vim.lsp.buf.definition()<cr>',
			'Definition', buffer = bufnr },

			h = { '<cmd>lua vim.lsp.buf.hover()<cr>',
			'Hover info', buffer = bufnr },

			-- i = { '<cmd>lua vim.lsp.buf.implementation()<cr>',
			-- 'Implementation', buffer = bufnr },

			l = { '<cmd>lua vim.diagnostics.set_loclist()<cr>',
			'Location list diagnostics', buffer = bufnr },

			n = { '<cmd>lua vim.diagnostics.goto_next()<cr>',
			'Next flag', buffer = bufnr },

			p = { '<cmd>lua vim.diagnostics.goto_prev()<cr>',
			'Previous flag', buffer = bufnr },

			r = { '<cmd>lua vim.lsp.buf.references()<cr>',
			'References of under cursor', buffer = bufnr },

			s = { '<cmd>lua vim.lsp.signature_help()<cr>',
			'Signature help', buffer = bufnr },
		},
	}
end

return M
