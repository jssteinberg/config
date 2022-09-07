local packer = nil

local function init()
	if packer == nil then
		packer = require "packer"
		packer.init { disable_commands = true }
	end

	local use = packer.use

	packer.reset()

	use { "wbthomason/packer.nvim", opt = true }
	use { "nathom/filetype.nvim", config = function() require "packages.filetype".config() end }
	use { "tpope/vim-repeat" } -- Extend `.` repeat
	use { "tpope/vim-sleuth" } -- detects indent, also uses .editorconfig
	use { "dhruvasagar/vim-open-url" } -- URLs and search

	use { "echasnovski/mini.nvim", config = function()
		require("mini.indentscope").setup({ symbol = "│" })
		require("mini.indentscope").gen_animation("none")
	end }

	-- use { 'tpope/vim-surround' }
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function() require("nvim-surround").setup({}) end
	})

	-- Open/search with `gx`
	-- use { "tyru/open-browser.vim", config = function()
	-- 	require "packages.openbrowser".config()
	-- end }

	-- Gitsigns
	use { "lewis6991/gitsigns.nvim", config = function()
		require("gitsigns").setup()
	end }

	-- Statusline
	use {
		"~/dev/hackline.vim",
		branch = "v3",
		config = function()
			require "packages.hackline".config()
		end
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function() require "packages.treesitter".config() end
	}

	-- LSP
	use {
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"lukas-reineke/lsp-format.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			-- 'hrsh7th/cmp-nvim-lsp-signature-help',
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require "packages.lsp".config()
			require "packages.cmp".config()
		end
	}

	-- use {
	-- 	'jose-elias-alvarez/null-ls.nvim',
	-- 	requires = { 'nvim-lua/plenary', 'neovim/nvim-lspconfig' },
	-- 	config = function()
	-- 		require "packages.null-ls".config()
	-- 	end
	-- }


	-- LAZY LOADED
	-- -----------

	-- ### EDIT/MOVE

	use { "tommcdo/vim-lion", keys = { { "n", "gl" }, { "n", "gL" }, { "x", "gl" }, { "x", "gL" }, } } -- Align text
	use { "andymass/vim-matchup", event = "CursorHold" } -- better matching functionality
	use { "lambdalisue/suda.vim", cmd = { "SudaRead", "SudaWrite" } } -- sudo save

	-- auto pair completion
	use { "windwp/nvim-autopairs", event = "InsertEnter", config = function()
		require("nvim-autopairs").setup {}
	end }

	-- Better f, F, t, T motion, repeatable with f/F
	use { "rhysd/clever-f.vim", keys = {
		{ "n", "f" }, { "n", "F" }, { "n", "t" }, { "n", "T" },
		{ "x", "f" }, { "x", "F" }, { "x", "t" }, { "x", "T" }
	} }

	-- Leap s/S motion
	use {
		"ggandor/leap.nvim",
		keys = {
			{ "n", "s" }, { "n", "S" },
			{ "x", "z" }, { "x", "Z" },
		},
		config = function()
			require("leap").set_default_keymaps()
		end
	}

	-- Comment in/out
	use {
		"numToStr/Comment.nvim",
		keys = {
			{ "n", "gc" }, { "n", "gb" },
			{ "v", "gc" }, { "v", "gb" },
		},
		config = function()
			require("Comment").setup {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end
	}

	-- ### SEARCH/EXPLORE

	use { "subnut/visualstar.vim", keys = { { "x", "*" }, { "x", "#" } } }

	-- Quickfix
	use { "kevinhwang91/nvim-bqf", ft = "qf" }

	-- Fuzzy searcher
	use {
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		cmd = "Telescope",
		requires = { "nvim-lua/plenary.nvim" },
		config = function() require "packages.telescope".config() end
	}

	-- File tree
	use { "MunifTanjim/nui.nvim", cmd = { "Neotree" } }
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		after = "nui.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require "packages.neo-tree".config()
		end
	}

	-- Cycle buffers
	use {
		"ghillb/cybu.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		event = "BufAdd",
		config = function() require "packages.cybu".config() end,
	}

	-- Context topbar
	use {
		"nvim-treesitter/nvim-treesitter-context",
		requires = { "nvim-treesitter/nvim-treesitter" },
		event = "CursorHold",
		config = function() require "treesitter-context".setup {} end
	}

	-- ### GIT

	use { "tpope/vim-fugitive", cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit" } } -- Git wrapper
	use { "APZelos/blamer.nvim", cmd = { "BlamerToggle" } } -- git blame
	use { "rhysd/git-messenger.vim", cmd = { "GitMessenger" } } -- git message under cursor
	use {
		"tyru/open-browser-github.vim",
		cmd = {
			"OpenGithubFile", "OpenGithuIssue", "OpenGithubPullReq", "OpenGithubProject",
		},
		requires = { "tyru/open-browser.vim" },
	}

	-- git linker
	use {
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
		keys = { { "n", "<leader>gy" }, { "v", "<leader>gy" } },
		config = function() require("gitlinker").setup({}) end
	}

	-- ### UTIL

	-- Illuminate cursor word
	use { "RRethy/vim-illuminate", event = "CursorHold", config = function()
		require "illuminate".configure({ under_cursor = false })
	end }

	-- Measure startuptime
	use { "dstein64/vim-startuptime", cmd = { "StartupTime" } }

	-- Colors
	use { "rktjmp/lush.nvim", cmd = { "LushRunQuickstart", "LushRunTutorial", "Lushify" } }

	use {
		"NvChad/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function() require "colorizer".setup() end
	}

end

local packages = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return packages
