-- Format for Which Key plugin; Format as human readable as possible.

-- Guidelines for maps:
-- - Use qq to escape when appropriate (insert, visual, Telescope-insert)

local M = {}

M.normal_maps = {
	-- <leader>

	["<leader><tab>"] = { "<cmd>Telescope buffers<cr>",
	"Browse Buffers" },

	["<leader>f"] = { name =
		"file(s)",

		f = { "<cmd>Telescope find_files<cr>",
		"Find Files" },

		r = { "<cmd>Telescope oldfiles<cr>",
		"Find Recent Files" },
	},

	["<leader>g"] = { name =
		"git",

		f = { name =
			"git fuzzy find",

			c = { "<cmd>Telescope git_commits<cr>",
			"Find Commits" },
		}
	},

	["<leader>t"] = { name =
		"toggle",

		z = { "<cmd>ZenMode<cr>",
		"Zen Mode" },
	},
}

return M
