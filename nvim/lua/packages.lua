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
	{ "tweekmonster/startuptime.vim",   cmd = "StartupTime" },
	-- Visual undo tree
	{ "mbbill/undotree",                cmd = "UndotreeToggle" },
	-- Colorscheme util
	-- { "rktjmp/lush.nvim", lazy = false },
	-- { "echasnovski/mini.colors",        version = "*" },
	-- { "echasnovski/mini.hues",          version = "*" },
	-- Colorschemes
	{ "ajgrf/parchment" },
	{ "EdenEast/nightfox.nvim" },
	-- File types
	{ "andreshazard/vim-freemarker" },

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
		dependencies = "itchyny/vim-gitbranch"
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
			vim.g.termcwd_split_full_top = true
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

	-- LSP mouse hover
	{
		"soulis-1256/eagle.nvim",
		event = "CursorHold",
		config = function()
			require("eagle").setup({})
			vim.o.mousemoveevent = true
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

	-- Context topbar
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	event = "cursorhold",
	-- 	config = function() require "treesitter-context".setup {} end
	-- },

	-- AI code completion
	{
		"github/copilot.vim",
		event = "VimEnter",
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.cmd([[
				imap <silent><script><expr> <c-f> copilot#Accept("\<CR>")
			]])
			-- imap <tab> <Plug>(copilot-accept-word)
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
		event = "VeryLazy", -- keep for lazy loading
		opts = {
			-- config
		},
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
