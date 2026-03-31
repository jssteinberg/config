return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				if pcall(vim.treesitter.start, ev.buf) then return end
			end,
		})
	end,
}
