local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim if not already installed
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

-- Add lazy.nvim to runtimepath
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Handle statusline
	{ "jssteinberg/hackline.vim", branch = "v4.0.0-0" },
	-- Tabs and editorconfig
	{ "tpope/vim-sleuth" },
	-- Extend `.` repeat
	{ "tpope/vim-repeat" },
	-- Indent keymap motions
	{ "michaeljsmith/vim-indent-object" },
	-- Measure startup time
	{ "tweekmonster/startuptime.vim", cmd = "StartupTime" },
	-- Colorscheme util
	-- { "rktjmp/lush.nvim", lazy = false },
	{ 'echasnovski/mini.colors', version = '*' },
	{ 'echasnovski/mini.hues', version = '*' },

	-- SEARCH/EXPLORE

	-- netrw replacement
	{ "stevearc/oil.nvim", config = require("pack.oil") },
	-- Terminal handling
	{ "jssteinberg/termcwd" },
	-- Fuzzy finder
	{
		'echasnovski/mini.pick',
		version = false,
		cmd = "Pick",
		config = function()
			local pick = require('mini.pick')
			pick.setup({
				source = { show = pick.default_show },
				mappings = {
					toggle_preview = '<C-p>',
					move_down      = '<C-j>',
					move_up        = '<C-k>',
				},
			})
		end
	},

	-- CODE ANALYZES/COMPLETION

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
	{
		"hinell/lsp-timeout.nvim",
		dependencies = { "neovim/nvim-lspconfig" }
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

	-- LSP signature
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts) require'lsp_signature'.setup(opts) end
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/playground",
			-- "JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function() require "pack.treesitter".config() end
	},

	-- AI code completion
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			vim.cmd([[
				imap <silent><script><expr> <c-f> copilot#Accept("\<CR>")
				let g:copilot_no_tab_map = v:true
			]])
		end
	},

	-- FORMAT
	{
		'stevearc/conform.nvim',
		cmd = 'Format',
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { { "prettierd", "prettier" } },
					typescript = { { "prettierd", "prettier" } },
					svelte = { { "prettierd", "prettier" } },
				},
			})

			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_fallback = true, range = range })
			end, { range = true })
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
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end
	},

	-- Matchparen
	{
		"andymass/vim-matchup",
		event = "CursorHold",
		-- "putilyre/sentiment.nvim",
		-- config = function() require("sentiment").setup() end,
	},

	-- Illuminate cursor word
	{ "RRethy/vim-illuminate", event = "CursorHold", config = function()
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
