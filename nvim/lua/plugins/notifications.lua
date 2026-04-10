return {
	-- Async notification UI (replaces blocking vim.notify)
	{
		"rcarriga/nvim-notify",
		lazy = true,
		opts = {
			timeout = 3000,
			render = "minimal",
			stages = "fade",
			top_down = false,
		},
		init = function()
			vim.notify = function(msg, level, opts)
				require("notify")(msg, level, vim.tbl_extend("force", { title = "nvim" }, opts or {}))
			end
		end,
	},
	-- LSP status spinners
	{
		"j-hui/fidget.nvim",
		event = "CursorHold",
		opts = {
			notification = {
				override_vim_notify = true,
				window = { relative = "win" }
			}
		}
	},
}