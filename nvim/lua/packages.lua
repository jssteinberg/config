local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Handle statusline
	{ "jssteinberg/hackline.vim", branch = "v4.0.0-0" },
	-- Tabs and editorconfig
	{ "tpope/vim-sleuth" },
	-- Extend `.` repeat
	{ "tpope/vim-repeat" },
	-- Measure startup time
	{ "tweekmonster/startuptime.vim", cmd = "StartupTime" },
	-- Colorscheme util
	{ "rktjmp/lush.nvim", lazy = false },

	-- AI code completion
	{ "github/copilot.vim", config = function()
		vim.cmd([[
			imap <silent><script><expr> <c-f> copilot#Accept("\<CR>")
			let g:copilot_no_tab_map = v:true
		]])
	end },

	-- SEARCH/EXPLORE

	-- netrw replacement
	{ "stevearc/oil.nvim", config = require("pack.oil") },

	-- Fuzzy finder fzf
	{ "ibhagwan/fzf-lua", cmd = { "FzfLua" }, config = require("pack.fzf") },

	-- Terminal handling
	{ "jssteinberg/termcwd" },

	-- LSP

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- "lukas-reineke/lsp-format.nvim",
		},
		config = function()
			require "pack.lsp".config()
		end
	},

	-- LSP and other autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-omni",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
		},
		config = function()
			require "pack.cmp".config()
			require "snippets"
		end,
	},

	-- TREESITTER
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function() require "pack.treesitter".config() end
	},

	-- FORMAT
	{
		'stevearc/conform.nvim',
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { { "prettierd", "prettier" } },
				},
			})
		end
	},

	-- EDIT/MOVE

	-- Surround characters
	{ "tpope/vim-surround" },

	-- Auto pair completion
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	},

	-- Emmet
	{
		"mattn/emmet-vim",
		event = "InsertEnter",
		config = function()
			vim.g.user_emmet_leader_key = "<c-e>"
		end
	},

	-- Hop motion commands
	{
		"phaazon/hop.nvim",
		cmd = { "HopChar1", "HopVerticalAC", "HopVerticalBC", "HopVertical" },
		config = function() require "hop".setup() end
	},

	-- Comment in/out
	{
		"numToStr/Comment.nvim",
		keys = {
			"gc", "gb",
			{ "gc", mode = "v" }, { "gb", mode = "v" },
		},
		config = function()
			require("Comment").setup {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end
	},

	-- Matchparen
	{
		"utilyre/sentiment.nvim",
		config = function() require("sentiment").setup() end,
		event = "CursorHold",
	},

	-- Illuminate cursor word
	{ "RRethy/vim-illuminate", event = "CursorHold", config = function()
		require "illuminate".configure({
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
	end },

	-- GIT

	-- git wrapper
	{ "tpope/vim-fugitive", cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Flog", "Flogsplit" } },

	-- git log
	{ "rbong/vim-flog", dependencies = { "tpope/vim-fugitive" }, cmd = "Flog" },

	-- git blame inline
	{ "APZelos/blamer.nvim", cmd = "BlamerToggle" }, -- git blame

	-- undo tree
	{ "mbbill/undotree", cmd = "UndotreeToggle" },

})
