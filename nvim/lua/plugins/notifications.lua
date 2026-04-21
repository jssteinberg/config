return {
	-- Async notification UI (replaces blocking vim.notify)
	{
		"rcarriga/nvim-notify",
		opts = {
		},
		init = function()
			vim.notify = function(msg, level, opts)
				require("notify")(msg, level, vim.tbl_extend("force", { title = "nvim" }, opts or {}))
			end
		end,
		config = function()
			require("notify").setup({
				merge_duplicates = false,
				background_colour = "#000000",
				top_down = false,
				icons = {
					DEBUG = "…",
					ERROR = "E",
					INFO = "I",
					TRACE = "->",
					WARN = "W"
				},
				render = "wrapped-compact",
				-- stages = "fade",
			})
		end
	},
	-- LSP status spinners
	{
		"j-hui/fidget.nvim",
		event = "CursorHold",
		opts = {
			notification = {
				-- override_vim_notify = true,
				window = { relative = "win" }
			}
		}
	},
}
