return function()
	vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

	require "oil".setup({
		use_default_keymaps = false,
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
		},
		keymaps = {
			["g?"] = "actions.show_help",
			["-"] = "actions.parent",
			["<CR>"] = "actions.select",
			["<C-j>"] = "actions.select",
			["<C-p>"] = "actions.select_vsplit",
			["<C-s>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-k>"] = "actions.preview",
			["<C-l>"] = "actions.refresh",
			["cd"] = "actions.tcd",
			["g."] = "actions.open_cwd",
			["gh"] = "actions.toggle_hidden",
			["."] = "actions.open_cmdline",
			["gc"] = "actions.open_terminal",
		},
	})
end
