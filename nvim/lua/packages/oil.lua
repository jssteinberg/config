return function()
	vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

	require "oil".setup({
		use_default_keymaps = false,
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
			["g:"] = "open_cmdline",
			["gc"] = "open_terminal",
		},
	})
end
