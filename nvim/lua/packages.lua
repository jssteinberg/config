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
	-- Tabs and editorconfig
	{ "tpope/vim-sleuth" },
	-- Extend `.` repeat
	{ "tpope/vim-repeat" },
	-- Indent keymap motions
	{ "michaeljsmith/vim-indent-object" },
	-- Measure startup time
	{ "tweekmonster/startuptime.vim",                cmd = "StartupTime" },
	-- Visual undo tree
	{ "mbbill/undotree",                             cmd = "UndotreeToggle" },
	-- Colorscheme util
	-- { "rktjmp/lush.nvim", lazy = false },
	-- { "echasnovski/mini.colors",        version = "*" },
	-- { "echasnovski/mini.hues",          version = "*" },
	-- Colorschemes
	{ "https://codeberg.org/johanland/nightcool-vim" },
	{ "ajgrf/parchment" },
	{ "EdenEast/nightfox.nvim" },
	{ "miikanissi/modus-themes.nvim" },
	{ "bettervim/yugen.nvim" },
	-- File types
	-- java
	{ "andreshazard/vim-freemarker" },
	-- Environments
	-- ...
	-- DB
	{
		"tpope/vim-dadbod",
		cmd = { "DB" }
	},
	-- Debug https://theosteiner.de/debugging-javascript-frameworks-in-neovim
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = {
			{ "<leader>db", function() require("dap").toggle_breakpoint() end },
			{ "<leader>dc", function() require("dap").continue() end },
		},
		config = function()
			require("dapui").setup()
		end
	},

	--- Colors highlight
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc").setup({
				-- Your preferred settings
				-- Example: enable highlighter
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end
	},

	-- Statusline
	{
		"jssteinberg/hackline.vim",
		dependencies = "itchyny/vim-gitbranch",
		branch = "fix-deprecated",
	},

	-- gx
	{
		"tyru/open-browser.vim",
		keys = { "gx", { "gx", mode = "v" } },
		config = function()
			vim.g.openbrowser_default_search = "duckduckgo"
			vim.cmd [[
				nmap gx <Plug>(openbrowser-open)
				vmap gx <Plug>(openbrowser-smart-search)
			]]
		end
	},

	-- Terminal
	{
		"jssteinberg/termcwd",
		config = function()
			vim.g.termcwd_split_full_bottom = true
			vim.g.termcwd_height = 20
			vim.keymap.set("n", "<leader><cr>", require("termcwd").sp(), { desc = "Shell (CWD)" })
			vim.keymap.set("n", "<leader>t<cr>", require("termcwd").tab(), { desc = "Tabshell (CWD)" })
			vim.keymap.set("n", "<leader>1", require("termcwd").sp(1, ""), { desc = "Shell 1" })
			vim.keymap.set("n", "<leader>2", require("termcwd").sp(2, ""), { desc = "Shell 2" })
		end
	},

	-- SEARCH/EXPLORE
	-- Quickfix window
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		opts = {
			preview = {
				auto_preview = false
			}
		}
	},
	-- Netrw replacement
	{ "stevearc/oil.nvim", config = require("pack.oil") },
	-- Tree viewer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		cmd = "Neotree",
		config = require("pack.neo-tree"),
	},
	-- Fuzzy finder
	{
		"echasnovski/mini.pick",
		version = false,
		cmd = "Pick",
		config = function()
			local pick = require("mini.pick")
			pick.setup({
				source = { show = pick.default_show },
				mappings = {
					toggle_preview = "<C-p>",
					move_down      = "<C-j>",
					move_up        = "<C-k>",
					mark_all       = "<C-a>",
					choose_marked  = "<C-q>",
				},
			})
		end
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"lukas-reineke/lsp-format.nvim",
		},
		config = function()
			require "pack.lsp".config()
		end
	},

	-- typescript better error messages
	-- {
	-- 	"dmmulroy/ts-error-translator.nvim",
	-- 	event = "VeryLazy",
	-- },

	-- LSP status and notify
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			notification = {
				window = {
					align = "top"
				}
			}
		}
	},

	-- LSP client auto stop/start
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		-- opts = {
		-- 	notifications = true
		-- }
	},

	-- LSP mouse hover
	{
		"soulis-1256/eagle.nvim",
		event = "CursorHold",
		keys = { "<cr>" },
		config = function()
			require("eagle").setup({
				border = "solid",
				keyboard_mode = true,
				max_width_factor = 1.5,
			})
			vim.o.mousemoveevent = true
			vim.keymap.set("n", "<cr>", ":EagleWin<CR>", { noremap = true, silent = true })
		end
	},

	-- LSP signature
	-- {
	-- 	"Dan7h3x/signup.nvim",
	-- 	branch = "main",
	-- 	config = function()
	-- 		require("signup").setup({
	-- 			dock_toggle_key = "<Leader>ls",
	-- 		})
	-- 	end
	-- },

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
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			require "pack.cmp".config()
			require("luasnip.loaders.from_snipmate").lazy_load()
			-- require "snippets"
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "windwp/nvim-ts-autotag" },
		config = function() require "pack.treesitter".config() end
	},

	-- AI code completion
	-- codeium
	{
		"Exafunction/codeium.vim",
		event = "VimEnter",
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
		cmd = { "HopChar1", "HopVerticalAC", "HopVerticalBC", "HopVertical", "HopLineMW" },
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
	-- {
	-- 	"andymass/vim-matchup",
	-- 	event = "CursorHold",
	-- },
	{
		"utilyre/sentiment.nvim",
		version = "*",
		event = "CursorHold",
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

	-- GIT

	-- git wrapper
	{ "tpope/vim-fugitive",  cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Flog", "Flogsplit" } },
	-- git log
	{ "rbong/vim-flog",      dependencies = { "tpope/vim-fugitive" },                               cmd = "Flog" },
	-- git blame inline
	{ "APZelos/blamer.nvim", cmd = "BlamerToggle" }, -- git blame
	-- git link
	{
		"9seconds/repolink.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "RepoLink" },
		opts = {},
	}

})
