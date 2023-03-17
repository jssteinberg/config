return function()
	vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

	require "oil".setup({
		use_default_keymaps = false,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<c-j>"] = "actions.select",
			["<c-p>"] = "actions.select_vsplit",
			["<c-s>"] = "actions.select_split",
			["<c-t>"] = "actions.select_tab",
			["<c-k>"] = "actions.preview",
			["<C-l>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["cd"] = "actions.tcd",
			["gh"] = "actions.toggle_hidden",
			["."] = "open_cmdline",
			["<c-c>"] = "open_terminal",
		},
	})
end
