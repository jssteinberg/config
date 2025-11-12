return {
	-- AI code completion
	-- codeium
	{
		"Exafunction/windsurf.vim",
		event = "VeryLazy",
		cmd = "CodeiumChat",
		config = function()
			vim.g.codeium_disable_bindings = 1
			vim.keymap.set("i", "<c-f>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-j>", function() return vim.fn["codeium#CycleCompletions"](1) end,
				{ expr = true, silent = true })
			vim.keymap.set("i", "<c-k>", function() return vim.fn["codeium#CycleCompletions"](-1) end,
				{ expr = true, silent = true })
			vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
		end
	},
	-- Completion menu
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		-- use a release tag to download pre-built binaries
		version = "1.*",
		opts = {
			cmdline = { enabled = false },
			completion = {
				ghost_text = { enabled = false },
				-- Don't select by default, auto insert on selection
				list = { selection = { preselect = false, auto_insert = true } },
				accept = { auto_brackets = { enabled = true }, },
				menu = {
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind", "source_name" } },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				}
			},
			sources = {
				providers = {
					-- Reset fallback to always show buffer completion, defaults to `{ 'buffer' }`
					lsp = { fallbacks = {} }
				}
			},
			keymap = {
				preset = "none",
				["<CR>"] = { "accept", "fallback" },
				["<s-tab>"] = { "select_prev", "fallback" },
				["<tab>"] = { "select_next", "fallback" },
				["<C-c>"] = { "hide", "fallback" },
				["<c-s>"] = { "snippet_forward", "fallback" },
				["<c-b>"] = { "snippet_backward", "fallback" },
			}
		},
	},
}
