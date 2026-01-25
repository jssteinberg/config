return {
	{ "folke/tokyonight.nvim", opts = { style = "night" } },
	{
		"https://codeberg.org/johanland/nightcool-vim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000,
		config = function()
			-- vim.g.nightcool_bg = "transparent"
			-- vim.g.nightcool_statusline = "transparent"
			-- vim.g.nightcool_bgs = false
			vim.cmd([[colorscheme nightcool]])
		end,
	},
	-- Tabs and editorconfig
	{ "tpope/vim-sleuth" },
	-- Surround characters
	{ "tpope/vim-surround" },
	-- Extend `.` repeat
	{ "tpope/vim-repeat" },
	-- Visual undo tree
	{ "mbbill/undotree",       cmd = "UndotreeToggle" },
	-- Statusline
	{
		"jssteinberg/hackline.vim",
		dependencies = "itchyny/vim-gitbranch"
	},
	-- Quickfix
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	-- Hop motion commands
	{
		"phaazon/hop.nvim",
		cmd = { "HopChar1", "HopVerticalAC", "HopVerticalBC", "HopVertical", "HopLineMW" },
		config = function() require "hop".setup() end
	},
	-- Emmet
	{
		"mattn/emmet-vim",
		event = { "InsertEnter" },
		keys = { "<c-e>" },
		config = function()
			vim.g.user_emmet_leader_key = "<c-e>"
			vim.keymap.set("i", "<c-e><c-e>", "<plug>(emmet-expand-abbr)")
			vim.keymap.set("v", "<c-e><c-e>", "<plug>(emmet-expand-abbr)")
		end
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
	-- Sancks modules
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			input = { enabled = true },
			quickfile = { enabled = true },
			scroll = { enabled = true },
			-- git = { enabled = true, },
			picker = { enabled = true },
			explorer = {
				enabled = true,
				replace_netrw = false,
			},
		},
		keys = {
			-- LSP
			{ "<leader>lr",  function() Snacks.picker.lsp_references() end,        nowait = true,                 desc = "References" },
			{ "<leader>li",  function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
			{ "<leader>lt",  function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto Type Definition" },
			{ "<leader>ls",  function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
			{ "<leader>lws", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
		},
	},
	-- LSP status notification
	{
		"j-hui/fidget.nvim",
		event = "CursorHold",
		opts = {
			notification = {
				override_vim_notify = true,
				window = { relative = "win", }
			}
		}
	},
	--- Colors highlight
	{
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		config = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end
	},
	-- Illuminate cursor word
	{
		"RRethy/vim-illuminate",
		event = "CursorHold",
		config = function()
			require "illuminate".configure({
				under_cursor = false,
				delay = 200,
				large_file_cutoff = 2000,
				large_file_overrides = {
					providers = { "lsp" },
				},
				filetype_overrides = {
					vim = {
						providers = { "lsp", "regex" }
					}
				},
			})
		end
	},
}
