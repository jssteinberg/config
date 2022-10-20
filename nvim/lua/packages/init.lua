local packer = nil

local function init()
	if packer == nil then
		packer = require "packer"
		packer.init { disable_commands = true }
	end

	local use = packer.use

	packer.reset()

	use { "wbthomason/packer.nvim", opt = true }
	-- use { "nathom/filetype.nvim", config = function() require "packages.filetype".config() end }
	use { "tpope/vim-surround" }
	use { "tpope/vim-repeat" } -- Extend `.` repeat
	use { "tpope/vim-sleuth" } -- detects indent, also uses .editorconfig
	use { "dhruvasagar/vim-open-url" } -- URLs and search

	-- Prev/next buffer
	use({
		"kwkarlwang/bufjump.nvim",
		config = function()
			require("bufjump").setup({
				forward = "<C-n>",
				backward = "<C-p>",
				on_success = nil
			})
		end,
	})

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
		requires = {
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
			-- "David-Kunz/markid",
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
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require "packages.lsp".config()
			require "packages.cmp".config()
		end
	}

	-- use {
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	requires = { "nvim-lua/plenary", "neovim/nvim-lspconfig" },
	-- 	config = function()
	-- 		require "packages.null-ls".config()
	-- 	end
	-- }

	-- LAZY LOADED
	-- -----------

	-- ### ON CURSOR HOLD

	-- Statusline
	use { "itchyny/vim-gitbranch", event = "CursorHold" }
	use {
		"jssteinberg/hackline.vim",
		after = "vim-gitbranch",
		branch = "dev",
		config = function()
			vim.g.hackline_git_info       = true
			vim.g.hackline_cwd            = true
			vim.g.hackline_normal_px      = 0
			vim.g.hackline_sep_inner_left = ": "
		end
	}

	-- Illuminate cursor word
	use { "RRethy/vim-illuminate", event = "CursorHold", config = function()
		require "illuminate".configure({ under_cursor = false })
	end }

	-- better matching functionality
	use { "andymass/vim-matchup", after = "vim-illuminate" }

	-- Context topbar
	use {
		"nvim-treesitter/nvim-treesitter-context",
		requires = { "nvim-treesitter/nvim-treesitter" },
		after = "vim-matchup",
		config = function() require "treesitter-context".setup {} end
	}

	-- ### EDIT/MOVE

	use { "tommcdo/vim-lion", keys = { { "n", "gl" }, { "n", "gL" }, { "x", "gl" }, { "x", "gL" }, } } -- Align text
	use { "lambdalisue/suda.vim", cmd = { "SudaRead", "SudaWrite" } } -- sudo save

	-- auto pair completion
	use { "windwp/nvim-autopairs", event = "InsertEnter", config = function()
		require("nvim-autopairs").setup {}
	end }

	-- Leap s/S motion
	use {
		"ggandor/leap.nvim",
		keys = {
			{ "n", "s" }, { "n", "S" },
			{ "x", "z" }, { "x", "Z" },
		},
		config = function()
			require("leap").setup { highlight_unlabeled = true }
			require("leap").set_default_keymaps()
		end
	}

	-- Hop motion commands
	use {
		"phaazon/hop.nvim",
		cmd = { "HopWord", "HopVerticalAC", "HopVerticalBC" },
		config = function() require "hop".setup() end
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

	-- Fuzzy finder
	-- telescope
	-- use {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	opt = true,
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- 	config = require "packages.telescope",
	-- }
	-- fzy
	use {
		"cloudhead/neovim-fuzzy",
		cmd = { "FuzzyOpen" },
		config = function() vim.g.fuzzy_rootcmds = {} end
	}


	-- File tree
	-- use { "MunifTanjim/nui.nvim", cmd = { "Neotree" } }
	-- use {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v2.x",
	-- 	after = "nui.nvim",
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- 	config = require "packages.neo-tree",
	-- }

	-- ### GIT

	use { "tpope/vim-fugitive", cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit" } } -- git wrapper
	use {
		"tyru/open-browser-github.vim",
		cmd = {
			"OpenGithubFile", "OpenGithuIssue", "OpenGithubPullReq", "OpenGithubProject",
		},
		requires = { "tyru/open-browser.vim" },
	}

	-- git linker
	-- use {
	-- 	"ruifm/gitlinker.nvim",
	-- 	requires = "nvim-lua/plenary.nvim",
	-- 	keys = { { "n", "<leader>gy" }, { "v", "<leader>gy" } },
	-- 	config = function() require("gitlinker").setup({}) end
	-- }

	-- git blame inline
	use { "APZelos/blamer.nvim", opt = true } -- git blame

	-- git signs
	use { "mhinz/vim-signify", opt = true }

	-- ### UTIL

	use { "echasnovski/mini.nvim", opt = true }

	-- Measure startuptime
	use { "dstein64/vim-startuptime", cmd = "StartupTime" }

	-- Colors
	use { "chrisbra/Colorizer", cmd = "ColorHighlight" }

	-- Colorscheme creation
	use { "rktjmp/lush.nvim", opt = true }
	use { "rktjmp/shipwright.nvim", opt = true }

	-- Colorschemes
	use { "bratpeki/truedark-vim" }

end

local packages = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return packages
