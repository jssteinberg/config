-- Format for Which Key plugin; Format as human readable as possible.

-- Guidelines for maps:
-- - Use qq to escape when appropriate (insert, visual, Telescope-insert)

local M = {}

M.esc_map = 'qq'
M.buffer_alternate_map = '<leader>bb'

M.insert = {
	[M.esc_map] = { "<esc>",
	"Esc to normal mode" },

	['ZZ'] = { "<esc><cmd>write<cr>",
	"Esc and write" },
}

M.terminal = {
	[M.esc_map] = { "<c-\\><c-n>>",
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
	["<cr>"] = { "<cmd>nohlsearch<cr>",
	"Clear search highlight" },

	["<c-9>"] = { "<c-]>",
	"Jump to definition" },

	["<tab>"] = { "<cmd>bnext | file!<cr>",
	"Next buffer" },

	["<s-tab>"] = { "<cmd>bprevious | file!<cr>",
	"Previous buffer" },

	["<leader><tab>"] = { "<cmd>Telescope buffers<cr>",
	"Browse buffers" },

	["<leader>b"] = { name =
		"buffer(s)",

		l = { "<cmd>buffers<cr><cmd>b",
		"List buffers, edit by number" },

		w = { "<cmd>bwipeout<cr>",
		"Wipeout buffer" },

	},
	[M.buffer_alternate_map] = { "<c-^>",
	"Alternate" },

	["<leader>e"] = { name =
		"edit",

		['.'] = { "<cmd>tabedit .<cr>",
		"edit working directory" },

		c = { "<cmd>tabedit ~/.config | tcd ~/.config<cr>",
		"edit config directory" },

		b = { "<cmd>tabedit %:p:h<cr>",
		"edit buffer directory" },
	},

	["<leader>f"] = { name =
		"find",

		d = { "<cmd>Telescope file_browser<cr>",
		"Find (per) directory" },

		f = { "<cmd>Telescope find_files<cr>",
		"Find files" },

		g = { name =
			"git",

			b = { "<cmd>Telescope git_branches<cr>",
			"branches" },

			c = { "<cmd>Telescope git_commits<cr>",
			"commits" },

			f = { "<cmd>Telescope git_files<cr>",
			"files" },
		},

		r = { "<cmd>Telescope oldfiles<cr>",
		"Find recent files" },
	},

	["<leader>g"] = { name =
		"git",

		c = { name =
			'commit',

			a = { '<cmd>Git commit -a<cr>i',
			"Current buffer" },

			c = { '<cmd>Git add % | Git commit %<cr>i',
			"Current buffer" },
		},

		f = { name =
			"find",

			b = { "<cmd>Telescope git_branches<cr>",
			"branches" },

			c = { "<cmd>Telescope git_commits<cr>",
			"commits" },

			f = { "<cmd>Telescope git_files<cr>",
			"files" },
		},

		s = { ':exe "!git status " . shellescape(getcwd())<cr>',
		'Status' },
	},

	["<leader>G"] = { "<cmd>Git<cr>",
	":Git (status)" },

	["<leader>t"] = { name =
		"toggle",

		t = { "<cmd>terminal<cr>i",
		"Toggle terminal" },
		-- t = { "<cmd>ToggleTerm<cr>",
		-- "Toggle terminal" },

		z = { "<cmd>ZenMode<cr>",
		"Zen Mode" },
	},
}

return M
