return {
	{
		"willothy/flatten.nvim",
		config = true,
		-- or pass configuration with
		-- opts = {	}
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	},
	-- Terminal
	{
		"jssteinberg/termcwd",
		config = function()
			vim.g.termcwd_height = 15
			vim.g.termcwd_split_full_bottom = true
			vim.keymap.set("n", "<leader><cr>", require("termcwd").sp(), { desc = "Terminal CWD" })
			vim.keymap.set("n", "<leader>1", require("termcwd").sp(1), { desc = "Terminal CWD 1" })
			vim.keymap.set("n", "<leader>2", require("termcwd").sp(2), { desc = "Terminal CWD 2" })
			vim.keymap.set("n", "<leader>0", require("termcwd").sp("g", ""), { desc = "Terminal instance" })
			-- enter term in insert mode
			vim.g.termcwd_insert = true
			-- more mappings to exit insert mode in terminal
			vim.keymap.set("t", "<leader><cr>", "<c-\\><c-n><c-w><c-w>")
		end
	},
}
