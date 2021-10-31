-- Format for Which Key plugin; Format as human readable as possible.

-- Guidelines for maps:
-- - Use M.esc_map to escape when possible and consistent (insert, visual, Telescope-insert)

SAVE_SOURCED_SESSION = function()
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

local M = {}

M.esc_map = 'qq'

M.buffer_alternate_map = '<leader>bb'

M.setLeader = function()
	-- space as <leader>
	vim.g.mapleader = ' '
	vim.api.nvim_set_keymap('n',' ','',{noremap = true})
	vim.api.nvim_set_keymap('x',' ','',{noremap = true})
end

M.init = function()
	M.setLeader()

	-- Escape
	-- qq in insert
	vim.api.nvim_set_keymap('i', M.esc_map, '<esc>', {noremap = true})
	-- qq in visual (x)
	vim.api.nvim_set_keymap('x', M.esc_map, '<esc>', {noremap = true})

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

	-- Buffer/file, windows and tabs
	-- alternative file
	vim.api.nvim_set_keymap('n', '<tab>', ':bnext | file!<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<s-tab>', ':bprevious | file!<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>bb', ':b#<cr>', {noremap = true})

	-- Command line
	-- c-p is up for incremental backwards command history
	vim.api.nvim_set_keymap('c', '<c-p>', '<up>', {noremap = true})
end

M.insert = {
	[M.esc_map] = { '<esc>',
	'Esc to normal mode' },

	['ZZ'] = { '<esc>:wq<cr>',
	'Esc and write' },

	['<c-e>'] = { '<c-y>,',
	'Emmet expand', noremap=false },
}

M.terminal = {
	[M.esc_map] = { "<c-\\><c-n>",
	"Esc to normal mode" },
}

M.visual = {
	[M.esc_map] = { "<esc>",
	"Esc to normal mode" },

	[">"] = { ">gv",
	"Indent +" },

	["<"] = { "<gv",
	"Indent -" },

	["<leader>R"] = { ":s/",
	"Replace", silent=false },

	["<leader>G"] = { 'y:Rg <c-r>"<cr>',
	"Grep selection" },

	['<leader><space>'] = { '<cmd>HopWord<cr>',
	'Hop to word' },

	['<leader>J'] = { '<cmd>HopLine<cr>',
	'Hop to line' },

	['<leader>K'] = { '<cmd>HopLine<cr>',
	'Hop to line' },


	-- Find

	["<leader>f"] = { name =
		"find",

		j = { ":AnyJumpVisual<cr>",
		"Jump to files with string" },

	},
}

M.normal = {
	["<leader>R"] = { ":%s/",
	"Replace", silent=false },

	["<leader>G"] = { ':Rg ',
	"Grep selection", silent=false },

	["<leader>w"] = { ":write<cr>",
	"Write buffer" },

	["<leader>W"] = { ":SudaWrite<cr>",
	"Write restricted buffer" },

	["<leader><tab>"] = { ":buffer#<cr>:file!<cr>",
	"Edit alternate file" },


	-- Jumps/motions

	["<leader>9"] = { "<c-]>",
	"Jump to definition" },

	["<leader>o"] = { "<c-o>",
	"Go back in jump list" },

	['<leader>i'] = { '<c-i>',
	'Go forward in jump list' },

	['<leader><space>'] = { '<cmd>HopWord<cr>',
	'Hop to word' },

	['<leader>J'] = { '<cmd>HopLine<cr>',
	'Hop to line' },

	['<leader>K'] = { '<cmd>HopLine<cr>',
	'Hop to line' },


	-- Buffers

	["<leader>a"] = { name =
		"add"},

	-- Buffers

	["<leader>b"] = { name =
		"buffer(s)",

		['<tab>'] = { ":buffer ",
		":buffer ", silent=false },

	},
	[M.buffer_alternate_map] = { "<cmd>buffer#<cr>:file!<cr>",
	"Alternate" },


	-- Colors

	["<leader>c"] = { name =
		"colors",

		d = { ':lua require"packages.colors".setColo("dark")<cr>',
		'Dark' },

		l = { ':lua require"packages.colors".setColo("light")<cr>',
		'Light' },
	},


	-- Edit

	-- Increase/decrease number
	['<leader>k'] = { '<c-a>',
	'Increase number' },
	['<leader>j'] = { '<c-x>',
	'Decrease number' },

	["<leader>e"] = { name =
		"edit",

		['.'] = { ":edit .<cr>",
		"Working directory" },

		c = { ":tabedit ~/.config/README.md | tcd ~/.config<cr>",
		"Config directory" },

		b = { ':Explore<cr>',
		"Buffer directory" },

		w = { ':edit **/',
		"Wild", silent=false },
	},


	-- Find

	["<leader>f"] = { name =
		"find",

		b = { ":Telescope buffers<cr>",
		"Buffers" },

		d = { ":Telescope file_browser<cr>",
		"Directory content" },

		f = { ":Telescope find_files<cr>",
		"Files" },

		j = { ":AnyJump<cr>",
		"Jump to files with string" },

		g = { name =
			"git",

			b = { ":Telescope git_branches<cr>",
			"Branches" },

			c = { ":Telescope git_commits<cr>",
			"Commits" },

			f = { ":Telescope git_files<cr>",
			"Files" },
		},

		o = { ":Telescope oldfiles<cr>",
		"Old (recent) files" },

		s = { ":Telescope live_grep<cr>",
		"String (live grep)" },

		t = { ":Telescope tele_tabby list<cr>",
		"Tabs" },
	},


	-- Git

	["<leader>g"] = { name =
		"git",

		b = { ':GitBlameToggle<cr>',
		'Blame' },

		c = { name =
			'commit',

			a = { ':Git commit -a<cr>',
			"Current buffer" },

			c = { ':Git add % | Git commit %<cr>',
			"Current buffer" },
		},

		d = { ':DiffviewOpen<cr>',
		'Diff view' },

		f = { name =
			"find",

			b = { ":Telescope git_branches<cr>",
			"Branches" },

			c = { ":Telescope git_commits<cr>",
			"Commits" },

			f = { ":Telescope git_files<cr>",
			"Files" },
		},

		g = { ':Git<cr>',
		'Git' },

		l = { ':GV<cr>',
		'Log' },

		-- p = { ':split term://git push<cr>:wincmd J<cr>:wincmd p<cr>',
		-- 'Push' },

		s = { ':exe "!git status " . shellescape(getcwd())<cr>',
		'Status' },
	},


	-- Harpoon files

	["<leader>h"] = { name =
		"harpoon",

		a = { ':lua require("harpoon.mark").add_file()<cr>',
		'Add' },

		e = { ':lua require("harpoon.ui").toggle_quick_menu()<cr>',
		'edit' },

		['1'] = { ':lua require("harpoon.ui").nav_file(1)<cr>',
		'1. file' },

		['2'] = { ':lua require("harpoon.ui").nav_file(2)<cr>',
		'2. file' },

		['3'] = { ':lua require("harpoon.ui").nav_file(3)<cr>',
		'3. file' },

		['4'] = { ':lua require("harpoon.ui").nav_file(4)<cr>',
		'4. file' },
	},


	-- No

	["<leader>n"] = { name =
		"no",

		s = { ':nohlsearch<cr>',
		'Search' },
	},


	-- Session

	["<leader>s"] = { name =
		"session",

		s = { ':lua SAVE_SOURCED_SESSION()<cr>',
		"Save the sourced session" },
	},


	-- Tab

	["<leader>t"] = { name =
		"tab",

		['.'] = { ":tabedit .<cr>",
		"Edit working directory" },

		b = { ":tabedit %<cr>",
		"Edit buffer" },

		c = { ":tabclose<cr>",
		"Close" },
	},


	-- Terminal

	["<leader>T"] = {":terminal<cr>i",
		"Terminal in CWD" },

	["<leader><cr>"] = {':lua require("harpoon.term").gotoTerminal(100)<cr>i',
		"Terminal 0", noremap=false },

	["<leader>1"] = {':lua require("harpoon.term").gotoTerminal(1)<cr>i',
		"Terminal 1", noremap=false },

	["<leader>2"] = {':lua require("harpoon.term").gotoTerminal(2)<cr>i',
		"Terminal 2", noremap=false },

	["<leader>3"] = {':lua require("harpoon.term").gotoTerminal(3)<cr>i',
		"Terminal 3", noremap=false },


	-- Windows

	['<c-x>'] = { '<c-w><c-x>',
	'Exchange window with next' },


	-- Quickfix

	["Q"] = {":copen<cr>",
		"Quickfix window open" },

	["<leader>q"] = {":cnext<cr>",
		"Quickfix next", silent=false },

	["<leader>Q"] = {":cprevious<cr>",
		"Quickfix previous", silent=false },

	["<ctrl-q>"] = {":cnext<cr>",
		"Quickfix next", silent=false },


	-- Zen mode

	["<leader>Z"] = {":ZenMode<cr>",
		"Zen mode" },

}

return M
