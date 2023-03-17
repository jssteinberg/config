return function()
	vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

	require "oil".setup({
		keymaps = {
			["<c-j>"] = "actions.select",
			["<c-p>"] = "actions.select_vsplit",
			["<c-s>"] = "actions.select_split",
			["<c-t>"] = "actions.select_tab",
			["<c-k>"] = "actions.preview",
			["cd"] = "actions.tcd",
			["gh"] = "actions.toggle_hidden",
			["."] = "open_cmdline",
			["<c-c>"] = "open_terminal",
		},
	})
end
