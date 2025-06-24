return {
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
	},
	-- Git wrapper
	{ "tpope/vim-fugitive", cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Flog", "Flogsplit" } },
	-- git log
	{ "rbong/vim-flog",     dependencies = { "tpope/vim-fugitive" },                               cmd = "Flog" },
}
