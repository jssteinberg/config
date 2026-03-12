return {
	-- Fuzzy finder
	{
		"echasnovski/mini.pick",
		version = false,
		cmd = "Pick",
		config = function()
			local pick = require("mini.pick")
			pick.setup({
				source = { show = pick.default_show },
				mappings = {
					toggle_preview = "<C-p>",
					move_down      = "<C-j>",
					move_up        = "<C-k>",
					mark_all       = "<C-a>",
					choose_marked  = "<C-q>",
				},
			})
		end
	},
	-- Extra pickers (oldfiles, etc.)
	{
		"echasnovski/mini.extra",
		version = false,
		keys = {
			{ "<leader>r", function() require("mini.extra").pickers.oldfiles({ current_dir = true }) end, desc = "Recent files (cwd)" },
		},
	},
}
