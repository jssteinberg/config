-- Keymaps (global)

-- Format for Which Key plugin; Format as human readable as possible.

-- Guidelines for maps:
-- - Use M.esc_map to escape when possible and consistent (insert, visual, Telescope-insert)

local M = {}

M.esc_map = 'jk'
M.buffer_alternate_map = '<bs>'

M.set_leader = function()
	-- space as <leader>
	vim.g.mapleader = ' '
	vim.api.nvim_set_keymap('n',' ','',{noremap = true})
	vim.api.nvim_set_keymap('x',' ','',{noremap = true})
end

M.init = function()
	M.set_leader()

	-- Escape
	-- insert
	vim.api.nvim_set_keymap('i', M.esc_map, '<esc>', {noremap = true})

	-- Terminal
	-- escape terminal
	vim.api.nvim_set_keymap('t', M.esc_map, '<c-\\><c-n>', {noremap = true})
	-- open terminal in insert
	vim.api.nvim_set_keymap('n', '<leader>T', ':terminal<cr>i', {noremap = true})

	-- Jump
	-- jump to definition (default stinks for many non-US keyboard layouts)
	vim.api.nvim_set_keymap('n', '<leader>9', '<c-]>', {noremap = true})
	-- add c-i, c-o for consistency
	vim.api.nvim_set_keymap('n', '<leader>o', '<c-o>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>i', '<c-i>', {noremap = true})
	-- search
	vim.api.nvim_set_keymap('n', 's', '/', {noremap = true})
	vim.api.nvim_set_keymap('n', 'S', '?', {noremap = true})
	-- next search result and center on screen
	vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true})
	vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true})
	vim.api.nvim_set_keymap('x', 'n', 'nzz', {noremap = true})
	vim.api.nvim_set_keymap('x', 'N', 'Nzz', {noremap = true})

	-- Buffers
	-- alternative file
	vim.api.nvim_set_keymap('n', M.buffer_alternate_map, ':buffer#<cr>:file!<cr>', {noremap = true})

	-- Command-mode
	-- c-p is up for incremental backwards command history
	vim.api.nvim_set_keymap('c', '<c-p>', '<up>', {noremap = true})
end


-- Plugin related keymaps and/or keymaps needing description
-- ---------------------------------------------------------

M.insert = {
	[M.esc_map] = { '<esc>',
	'Esc to normal mode' },

	['<c-e>'] = { '<c-y>,',
	'Emmet expand', noremap=false },
}

M.visual = {
	['>'] = { '>gv',
	'Indent +' },

	['<'] = { '<gv',
	'Indent -' },

	['<leader>k'] = { '<c-a>',
	'Increase number' },

	['<leader>j'] = { '<c-x>',
	'Decrease number' },

	['<leader>R'] = { ':s/',
	'Replace', silent=false },

	['<leader>G'] = { 'y:GrepperRg -e "<c-r>""<cr>',
	'Grep selection' },


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

		f = { 'y:Telescope find_files<cr>',
		'Files', silent = false },

		j = { ':AnyJumpVisual<cr>',
		'Jump to files with string' },

		w = { 'y:find **/<c-r>"',
		'Wild search', silent = false },
	},
}

M.normal = {
	['<leader>R'] = { ':%s/',
	'Replace', silent=false },

	['<leader>G'] = { ':GrepperRg ',
	'Grep selection', silent=false },

	['<leader>w'] = { ':write<cr>',
	'Write buffer' },

	['<leader>W'] = { ':SudaWrite<cr>',
	'Write restricted buffer' },

	['<leader><tab>'] = { ':buffer#<cr>:file!<cr>',
	'Edit alternate file' },


	-- Jumps/motions

	['<leader>9'] = { '<c-]>',
	'Jump to definition' },

	['<leader>o'] = { '<c-o>',
	'Go back in jump list' },

	['<leader>i'] = { '<c-i>',
	'Go forward in jump list' },

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

	-- Colors

	['<leader>c'] = { name =
		'colors',

		d = { ':lua require"packages.colors".set_colo("dark")<cr>',
		'Dark' },

		l = { ':lua require"packages.colors".set_colo("light")<cr>',
		'Light' },
	},


	-- Edit

	['<leader>k'] = { '<c-a>',
	'Increase number' },

	['<leader>j'] = { '<c-x>',
	'Decrease number' },

	['<leader>e'] = { name =
		'edit/explore',

		['.'] = { ':edit .<cr>',
		'Working directory' },

		c = { ':tabedit ~/.config/README.md | tcd ~/.config<cr>',
		'Config directory' },

		b = { ':Explore<cr>',
		'Buffer directory' },

		i = { ':IndentOMatic<cr>',
		'Indent style', silent=false },

		t = { ':lua require"packages.netrw".open_project_drawer()<cr>',
		'Tree explorer' },

		w = { ':edit **/',
		'Wild', silent=false },
	},


	-- Find

	['<leader>f'] = { name =
		'find',

		b = { ':Telescope buffers<cr>',
		'Buffers' },

		d = { ':Telescope lsp_workspace_diagnostics<cr>',
		'Diagnostic' },

		f = { ':Telescope find_files<cr>',
		'Files' },

		j = { ':AnyJump<cr>',
		'Jump to files with string' },

		g = { name =
			'git',

			b = { ':Telescope git_branches<cr>',
			'Branches' },

			c = { ':Telescope git_commits<cr>',
			'Commits' },

			f = { ':Telescope git_files<cr>',
			'Files' },
		},

		o = { ':Telescope oldfiles<cr>',
		'Old (recent) files' },

		s = { ':Telescope live_grep<cr>',
		'String (live grep)' },

		w = { ':find **/',
		'Wild', silent=false },
	},


	-- Git

	['<leader>g'] = { name =
		'git',

		b = { ':GitBlameToggle<cr>',
		'Blame' },

		c = { name =
			'commit',

			a = { ':Git commit -a<cr>',
			'All' },

			c = { ':Git add % | Git commit %<cr>',
			'Current buffer' },
		},

		d = { ':DiffviewOpen<cr>',
		'Diff view' },

		f = { name =
			'find',

			b = { ':Telescope git_branches<cr>',
			'Branches' },

			c = { ':Telescope git_commits<cr>',
			'Commits' },

			f = { ':Telescope git_files<cr>',
			'Files' },
		},

		g = { ':Neogit<cr>',
		'Git' },

		l = { ':Git | GV<cr>',
		'Log' },

		p = { ':Git push<cr>',
		'Push' },
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

		s = { ':nohlsearch<cr>',
		'Search' },
	},


	-- Packages

	['<leader>p'] = { name =
		'packages',

	},


	-- Session

	['<leader>s'] = { name =
		'session',

		s = { ':lua require"keymaps".save_sourced_session()<cr>',
		'Save the sourced session' },
	},


	-- Tab

	['<leader>t'] = { name =
		'tab',

		['.'] = { ':tabedit .<cr>',
		'Edit working directory' },

		b = { ':tabedit %<cr>',
		'Edit buffer' },

		c = { ':tabclose<cr>',
		'Close' },
	},


	-- Terminal

	['<leader>T'] = {':terminal<cr>i',
		'Terminal in CWD' },

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

-- 	['<leader>q'] = { name =
-- 		'quickfix',

-- 		o = { ':colder<cr>',
-- 		'Older list' },
-- 	},

	-- Zen mode

	['<leader>Z'] = {':ZenMode<cr>',
		'Zen mode' },

}

M.normal_lsp_buffer_keymaps = function (bufnr)
	return {
		['<cr>'] = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
		'Show flag diagnostics', buffer = bufnr },

		K = { '<cmd>lua vim.lsp.buf.hover()<cr>',
		'Hover info', buffer = bufnr },

		['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<cr>',
		'Declaration (LSP)', buffer = bufnr },

		['gd'] = { '<cmd>lua vim.lsp.buf.definition()<cr>',
		'Definition (LSP)', buffer = bufnr },

		['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<cr>',
		'Implementation (LSP)', buffer = bufnr },

		['gr'] = { '<cmd>lua vim.lsp.buf.references()<cr>',
		'References of under cursor (LSP)', buffer = bufnr },

		['<leader>l'] = { name =
			'lsp',

			-- a = { '<cmd>lua vim.lsp.buf.code_action()<cr>',
			-- 'Action', buffer = bufnr },
			a = { ':Telescope lsp_code_actions theme=get_cursor<cr>',
			'Action', buffer = bufnr },

			D = { '<cmd>lua vim.lsp.buf.declaration()<cr>',
			'Declaration', buffer = bufnr },

			d = { '<cmd>lua vim.lsp.buf.definition()<cr>',
			'Definition', buffer = bufnr },

			h = { '<cmd>lua vim.lsp.buf.hover()<cr>',
			'Hover info', buffer = bufnr },

			-- i = { '<cmd>lua vim.lsp.buf.implementation()<cr>',
			-- 'Implementation', buffer = bufnr },

			l = { '<cmd>lua vim.lsp.buf.show_line_diagnostics()<cr>',
			'Line diagnostics info (for flag)', buffer = bufnr },

			n = { '<cmd>lua vim.lsp.diagnostics.goto_next()<cr>',
			'Next flag', buffer = bufnr },

			p = { '<cmd>lua vim.lsp.diagnostics.goto_prev()<cr>',
			'Previous flag', buffer = bufnr },

			r = { '<cmd>lua vim.lsp.buf.references()<cr>',
			'References of under cursor', buffer = bufnr },

			s = { '<cmd>lua vim.lsp.signature_help()<cr>',
			'Signature help', buffer = bufnr },
		},
	}
end

M.remap_comma = function ()
	vim.api.nvim_set_keymap('n', ',', ':', {noremap=true})
end

-- save current session
M.save_sourced_session = function()
	local getSession = function()
		return vim.api.nvim_get_vvar('this_session')
	end
	if getSession() ~= '' then
		vim.cmd('mksession! ' .. getSession())
		print('mksession! ' .. getSession())
	else
		print('No sourced session (:so <session-file>)')
	end
end

return M
