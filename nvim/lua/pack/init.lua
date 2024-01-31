local packer = nil

local function init()
	if packer == nil then
		packer = require "packer"
		packer.init { disable_commands = true }
	end

	local use = packer.use

	packer.reset()

	use { "wbthomason/packer.nvim", opt = true }             -- Package manager
	use { "tpope/vim-sleuth" }                               -- Tabs and editorconfig
	use { "tpope/vim-surround" }                             -- Surround characters
	use { "tpope/vim-repeat" }                               -- Extend `.` repeat
	use { "dhruvasagar/vim-open-url" }                       -- URLs and search
	use { "michaeljsmith/vim-indent-object" }                -- Keymaps for indents
	use { "tweekmonster/startuptime.vim" }                   -- Measure startup time
	use { "stevearc/oil.nvim", config = require("pack.oil") } -- netrw replacement

	-- AI code completion
	use { "github/copilot.vim", config = function()
		vim.cmd([[
			imap <silent><script><expr> <c-f> copilot#Accept("\<CR>")
			let g:copilot_no_tab_map = v:true
		]])
	end }

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function() require "pack.treesitter".config() end
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
			"hrsh7th/cmp-omni",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
		},
		config = function()
			require "pack.lsp".config()
			require "pack.cmp".config()
			require "snippets"
		end
	}

	-- Matchparen
	use {
		"utilyre/sentiment.nvim",
		tag = "*",
		config = function() require("sentiment").setup() end,
	}

	-- Illuminate cursor word
	use { "RRethy/vim-illuminate", config = function()
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
	end }

	-- LAZY LOADED
	-- -----------

	-- ### ON CURSOR HOLD

	-- Context topbar
	use {
		"nvim-treesitter/nvim-treesitter-context",
		requires = { "nvim-treesitter/nvim-treesitter" },
		event = "cursorhold",
		config = function() require "treesitter-context".setup {} end
	}

	-- ### EDIT/MOVE

	-- Align text
	use { "tommcdo/vim-lion", keys = { { "n", "gl" }, { "n", "gL" }, { "x", "gl" }, { "x", "gL" }, } }

	-- Sudo save
	use { "lambdalisue/suda.vim", opt = true }

	-- Auto pair completion
	use { "windwp/nvim-autopairs", event = "InsertEnter", config = function()
		require("nvim-autopairs").setup {}
	end }

	-- Emmet
	use { "mattn/emmet-vim", event = "InsertEnter" }
	vim.g.user_emmet_leader_key = "<c-e>"

	-- Hop motion commands
	use {
		"phaazon/hop.nvim",
		cmd = { "HopChar1", "HopVerticalAC", "HopVerticalBC", "HopVertical" },
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

	-- Quickfix
	use { "kevinhwang91/nvim-bqf", ft = "qf" }

	-- Fuzzy finder
	-- fzf
	use { "ibhagwan/fzf-lua", cmd = { "FzfLua" }, config = require("pack.fzf") }

	-- ### GIT

	use { "tpope/vim-fugitive", cmd = { "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Flog", "Flogsplit" } } -- git wrapper
	use {
		"tyru/open-browser-github.vim",
		cmd = {
			"OpenGithubFile", "OpenGithuIssue", "OpenGithubPullReq", "OpenGithubProject",
		},
		requires = { "tyru/open-browser.vim" },
	}
	use { "rbong/vim-flog", after = "vim-fugitive" }

	-- git blame inline
	use { "APZelos/blamer.nvim", cmd = "BlamerToggle" } -- git blame

	-- undo tree
	use { "mbbill/undotree", cmd = "UndotreeToggle" }

	-- ### UTIL

	-- Colors
	use { "chrisbra/Colorizer", cmd = "ColorHighlight" }

	-- Colorscheme creation
	use { "rktjmp/lush.nvim", opt = true }
	use { "rktjmp/shipwright.nvim", opt = true }
	use { "lifepillar/vim-colortemplate", opt = true }
end

local packages = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return packages
