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
}
