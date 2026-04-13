return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		require("nvim-treesitter").install({
			"lua", "vim", "vimdoc", "query",
			"bash", "markdown", "markdown_inline",
			"javascript", "typescript", "tsx",
			"json", "yaml", "toml", "html", "css",
		}):wait(300000)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
