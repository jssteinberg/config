local M = {}

M.config = function()
	local ignore_ts = { "markdown", "markdown_inline", "lua", "vim", "help" }
	local disable_ts_ft = { "markdown", "lua", "vim", "help" }

	require("nvim-treesitter.configs").setup({
		ignore_install = ignore_ts,
		highlight = {
			enable = true,
			disable = disable_ts_ft,
		},
		playground = {
			enable = true,
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
		autotag = { enable = true },
		-- For JoosepAlviste/nvim-ts-context-commentstring
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
