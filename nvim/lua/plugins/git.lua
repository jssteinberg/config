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
	-- lewis6991/gitsigns.nvim
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Actions
					map("n", "<leader>X", gitsigns.reset_hunk)

					map("v", "<leader>X", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)

					-- map("n", "<leader>vb", function()
					-- 	gitsigns.blame_line({ full = true })
					-- end)

					-- Toggles
					map("n", "<leader>nb", gitsigns.toggle_current_line_blame)
					-- map('n', '<leader>tw', gitsigns.toggle_word_diff)
				end
			})
		end
	},
}
