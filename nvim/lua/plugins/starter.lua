return {
	"echasnovski/mini.starter",
	version = false,
	lazy = false,
	config = function()
		local starter = require("mini.starter")
		starter.setup({
			header = "",
			footer = "",
			query_updaters = "",
			items = {
				starter.sections.recent_files(8, true),
			},
			content_hooks = {
				starter.gen_hook.aligning("center", "center"),
			},
		})

		vim.api.nvim_set_hl(0, "MiniStarterItemPrefix", {})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniStarterOpened",
			callback = function(args)
				local buf = args.buf
				local opts = { buffer = buf, silent = true }
				vim.keymap.set("n", "j", "<Cmd>lua MiniStarter.update_current_item('next')<CR>", opts)
				vim.keymap.set("n", "k", "<Cmd>lua MiniStarter.update_current_item('prev')<CR>", opts)
				vim.wo.statusline = " "
			end,
		})
	end,
}
