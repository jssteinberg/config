return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		require("nvim-treesitter").setup({
			auto_install = true,
		})
	end
}
