-- Format for Which Key plugin; Format as human readable as possible.

-- Guidelines for maps:
-- - Use qq to escape when appropriate (insert, visual, Telescope-insert)

local M = {}

M.normal_maps = {
	["<tab>"] = { "<cmd>bnext | file!<cr>",
	"Next buffer" },

	["<s-tab>"] = { "<cmd>bprevious | file!<cr>",
	"Previous buffer" },

	["<cr>"] = { "<cmd>nohlsearch<cr>",
	"Clear search highlight" },

	["<c-9>"] = { "<c-]>",
	"Jump to definition" },
	-- (default jump to definition stinks on many non-american keyboard layouts)
}

M.normal_leader_maps = {
	-- <leader> single key maps

	["<leader><tab>"] = { "<cmd>Telescope buffers<cr>",
	"Browse buffers" },

	["<leader>b"] = { name =
		"buffer(s)",

		b = { "<c-^>",
		"Alternate buffer" },

		l = { "<cmd>buffers<cr><cmd>b",
		"List buffers, edit by number" },

		w = { "<cmd>bwipeout<cr>",
		"Wipeout buffer" },
	},

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

		f = { "<cmd>Telescope find_files<cr>",
		"Find files" },

		r = { "<cmd>Telescope oldfiles<cr>",
		"Find recent files" },
	},

	["<leader>g"] = { name =
		"git",

		f = { name =
			"Git fuzzy find",

			b = { "<cmd>Telescope git_branches<cr>",
			"Find branches" },

			c = { "<cmd>Telescope git_commits<cr>",
			"Find commits" },
		}
	},

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
