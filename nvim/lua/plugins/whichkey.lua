return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").add({
			{ "<leader>e",  group = "Explore" },
			{ "<leader>v",  group = "Version/Git" },
			{ "<leader>g",  group = "Grep" },
			{ "<leader>t",  group = "Treesitter" },
			{ "<leader>s",  group = "Search/substitute" },
			{ "<leader>l",  group = "LSP" },
			{ "<leader>lw", group = "Workspace" },
		})
	end,
}
