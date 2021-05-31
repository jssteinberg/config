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

	-- Terminal
	-- escape terminal
	vim.api.nvim_set_keymap('t', M.esc_map, '<c-\\><c-n>', {noremap = true})
	-- open terminal in insert
	vim.api.nvim_set_keymap('n', '<leader>T', ':terminal<cr>i', {noremap = true})
	-- alternate buffer from terminal
	-- vim.api.nvim_set_keymap('t', maps.buffer_alternate_map, '<c-\\><c-n><c-^>', {noremap = true})

	-- Jump
	-- jump to definition (default stinks for many non-US keyboard layouts)
	vim.api.nvim_set_keymap('n', '<leader>9', '<c-]>', {noremap = true})
	-- add c-i, c-o for consistency
	vim.api.nvim_set_keymap('n', '<leader>o', '<c-o>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader>i', '<c-i>', {noremap = true})

	-- Buffer/file, windows and tabs
	-- next/prev
	vim.api.nvim_set_keymap('n', '<tab>', ':bnext | file!<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<s-tab>', ':bprevious | file!<cr>', {noremap = true})
	-- alternative file
	vim.api.nvim_set_keymap('n', '<leader>bb', '<c-^>', {noremap = true})

	-- Escape
	-- qq in insert
	vim.api.nvim_set_keymap('i', M.esc_map, '<esc>', {noremap = true})
	-- qq in visual (x)
	vim.api.nvim_set_keymap('x', M.esc_map, '<esc>', {noremap = true})

	-- Files
	-- wild find
	vim.api.nvim_set_keymap('n', '<leader>ff', ':edit **/', {noremap = true})
end

M.insert = {
	[M.esc_map] = { "<esc>",
	"Esc to normal mode" },

	['ZZ'] = { "<esc><cmd>write<cr>",
	"Esc and write" },
}

M.terminal = {
	[M.esc_map] = { "<c-\\><c-n>",
	"Esc to normal mode" },

	["<leader>b"] = { name =
		"buffer(s)",
	},
	[M.buffer_alternate_map] = { "<c-\\><c-n><c-^>",
	"Alternate buffer" },
}

M.visual = {
	[M.esc_map] = { "<esc>",
	"Esc to normal mode" },

	[">"] = { ">gv",
	"Indent +" },

	["<"] = { "<gv",
	"Indent -" },
}

M.normal = {
	-- ["<cr>"] = { "<cmd>nohlsearch<cr>",
	-- "Clear search highlight" },

	["<c-t>"] = { "<cmd>tabnext<cr>",
	"Tab, next" },

	["<leader>w"] = { "<cmd>write<cr>",
	"Write buffer to current file" },

	["<leader><tab>"] = { "<cmd>Telescope oldfiles<cr>",
	"Old (recent) files" },

	-- Jump list

	["<leader>9"] = { "<c-]>",
	"Jump to definition" },

	["<leader>o"] = { "<c-o>",
	"Go back in jump list" },

	["<leader>i"] = { "<c-i>",
	"Go forward in jump list" },


	-- Buffers

	["<tab>"] = { "<cmd>bnext | file!<cr>",
	"Next buffer" },

	["<s-tab>"] = { "<cmd>bprevious | file!<cr>",
	"Previous buffer" },

	["<leader>b"] = { name =
		"buffer(s)",

		d = { "<cmd>Bdelete<cr>",
		"Delete buffer, keep window" },

		w = { "<cmd>Bwipeout<cr>",
		"Wipeout buffer, keep window" },

	},
	[M.buffer_alternate_map] = { "<c-^>",
	"Alternate" },


	-- Edit

	["<leader>e"] = { name =
		"edit",

		['.'] = { "<cmd>edit .<cr>",
		"Working directory" },

		c = { "<cmd>tabedit ~/.config | tcd ~/.config<cr>",
		"Config directory" },

		b = { '<cmd>edit %:p:h<cr>/<c-r>=expand("#:t")<cr><cr>',
		"Buffer directory" },
	},


	-- Find

	["<leader>f"] = { name =
		"find",

		b = { "<cmd>Telescope buffers<cr>",
		"Buffers" },

		d = { "<cmd>Telescope file_browser<cr>",
		"Directory content" },

		f = { "<cmd>Telescope find_files<cr>",
		"Files" },

		g = { name =
			"git",

			b = { "<cmd>Telescope git_branches<cr>",
			"branches" },

			c = { "<cmd>Telescope git_commits<cr>",
			"commits" },

			f = { "<cmd>Telescope git_files<cr>",
			"files" },
		},

		o = { "<cmd>Telescope oldfiles<cr>",
		"Old (recent) files" },

		w = { "<cmd>Telescope grep_string<cr>",
		"Word" },
	},


	-- Git

	["<leader>g"] = { name =
		"git",

		c = { name =
			'commit',

			a = { '<cmd>Git commit -a<cr>',
			"Current buffer" },

			c = { '<cmd>Git add % | Git commit %<cr>',
			"Current buffer" },
		},

		d = { '<cmd>DiffviewOpen<cr>',
		'Diff view' },

		f = { name =
			"find",

			b = { "<cmd>Telescope git_branches<cr>",
			"Branches" },

			c = { "<cmd>Telescope git_commits<cr>",
			"Commits" },

			f = { "<cmd>Telescope git_files<cr>",
			"Files" },
		},

		l = { '<cmd>GV<cr>',
		'Log' },

		s = { ':exe "!git status " . shellescape(getcwd())<cr>',
		'Status' },
	},

	["<leader>G"] = { "<cmd>Git<cr>",
	":Git (status)" },


	-- Session

	["<leader>s"] = { name =
		"session",

		s = { '<cmd>lua SAVE_SOURCED_SESSION()<cr>',
		"Save the sourced session" },
	},


	-- Tab

	["<leader>t"] = { name =
		"tab",

		['.'] = { "<cmd>tabedit .<cr>",
		"Edit working directory" },

		b = { "<cmd>tabedit %<cr>",
		"Edit buffer" },

		c = { "<cmd>tabclose<cr>",
		"Close" },

		l = { "<cmd>Telescope tele_tabby list<cr>",
		"List tabs" },
	},


	-- Terminal

	["<leader>T"] = {"<cmd>terminal<cr>i",
		"Terminal pwd" },
-- 	["<leader>T"] = { name =
-- 		"terminal",

-- 		['.'] = { "<cmd>terminal<cr>i",
-- 		"Terminal pwd" },
-- 	},


	-- Zen mode

	["<leader>Z"] = {"<cmd>ZenMode<cr>",
		"Zen mode" },

}

return M
