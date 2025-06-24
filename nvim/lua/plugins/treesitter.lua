return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = 'master',
	config = function()
		local ignore_ts = { "markdown", "markdown_inline" }
		local disable_ts_ft = { "markdown" }
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ignore_install = ignore_ts,
			highlight = {
				enable = true,
				disable = disable_ts_ft,
			},
			playground = {
				enable = true,
				updatetime = 25,      -- Debounced time for highlighting nodes in the playground from source code
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
		})
	end
}
