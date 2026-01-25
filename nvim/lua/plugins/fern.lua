return {
	"lambdalisue/fern.vim",
	cmd = "Fern",
	config = function()
		vim.g["fern#default_hidden"] = 1
		vim.keymap.set("n", "<leader>et", "<cmd>Fern . -drawer -reveal=%<cr>", { desc = "Fern drawer (tree)" })
	end
}
