return {
	{
		"lambdalisue/fern.vim",
		dependencies = { "hrsh7th/fern-mapping-collapse-or-leave.vim", "andykog/fern-highlight.vim" },
		cmd = "Fern",
		config = function()
			vim.g["fern#default_hidden"] = 1
		end
	}
}
