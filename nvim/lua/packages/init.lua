local packer = nil

local function init()
	if packer == nil then
		packer = require 'packer'
		packer.init { disable_commands = true }
	end

	local use = packer.use

	packer.reset()

	use { 'wbthomason/packer.nvim', opt = true }
	use { 'nathom/filetype.nvim', config = function() require 'packages.filetype'.config() end }
	use { 'tpope/vim-repeat' } -- Extend `.` repeat
	use { 'tpope/vim-sleuth' } -- detects indent, also uses .editorconfig
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Project drawer
	use { 'lambdalisue/fern.vim', branch = "main", requires = {
		'antoinemadec/FixCursorHold.nvim', 'lambdalisue/fern-hijack.vim'
	} }

	-- Open/search with `gx`
	use { 'tyru/open-browser.vim', config = function()
		require 'packages.openbrowser'.config()
	end }

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = { 'nvim-treesitter/playground', 'JoosepAlviste/nvim-ts-context-commentstring' },
		config = function() require 'packages.treesitter'.config() end
	}

	-- Statusline
	use {
		"jssteinberg/hackline.vim",
		branch = "dev",
		config = function()
			vim.g.hackline_sign = "Neo"
			vim.g.hackline_highlight_secondary = 'StatusLine'
			vim.g.hackline_highlight_items = 'StatusLine'
			vim.g.hackline_highlight_modified = 'StatusLine'
			vim.g.hackline_hightlight_branch = 'StatusLine'
		end
	}

	-- Gitsigns
	use {
		"lewis6991/gitsigns.nvim",
		config = function() require('gitsigns').setup() end
	}

	-- Quick switch files and terminals
	use {
		'ThePrimeagen/harpoon',
		requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
		config = function()
			require('harpoon').setup({
				global_settings = { save_on_toggle = true },
			})
		end
	}

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		requires = {
			-- 'williamboman/nvim-lsp-installer',
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			'lukas-reineke/lsp-format.nvim',
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			require 'packages.lsp'.config()
			require 'packages.cmp'.config()
		end
	}

	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = { 'nvim-lua/plenary', 'neovim/nvim-lspconfig' },
		config = function()
			require "packages.null-ls".config()
		end
	}

	-- Mini plugins
	use {
		'echasnovski/mini.nvim',
		config = function()

			-- Highlight word under cursor
			require('mini.cursorword').setup({})

			-- Comment in/out
			require('mini.comment').setup({
				hooks = {
					pre = function()
						local buf = vim.api.nvim_get_current_buf()
						local highlighter = require "vim.treesitter.highlighter"
						if highlighter.active[buf] then
							require('ts_context_commentstring.internal').update_commentstring()
						end
					end,
				},
			})

		end
	}


	-- LAZY LOADED
	-- -----------

	use { 'rktjmp/lush.nvim', cmd = { 'LushRunQuickstart', 'LushRunTutorial', 'Lushify' } }

	-- ### EDIT/MOVE

	use { 'tpope/vim-surround', keys = { { 'n', 'ys' }, { 'n', 'c' }, { 'n', 'd' }, { 'v', 'S' } } }
	use { 'tommcdo/vim-lion', keys = { { "n", "gl" }, { "n", "gL" }, { "x", "gl" }, { "x", "gL" }, } } -- Align text
	use { 'andymass/vim-matchup', event = 'CursorHold' } -- better matching functionality
	use { 'lambdalisue/suda.vim', cmd = { 'SudaRead', 'SudaWrite' } } -- sudo save

	-- auto pair completion
	use { 'windwp/nvim-autopairs', event = 'InsertEnter', config = function()
		require('nvim-autopairs').setup {}
	end }

	-- Better f, F, t, T, repeatable with f/F, and s motion
	use {
		'ggandor/lightspeed.nvim',
		keys = {
			{ 'n', 's' }, { 'n', 'S' },
			{ 'x', 'z' }, { 'x', 'Z' },
			{ 'n', 'f' }, { 'n', 'F' }, { 'n', 't' }, { 'n', 'T' },
			{ 'x', 'f' }, { 'x', 'F' }, { 'x', 't' }, { 'x', 'T' }
		},
		config = function()
			require 'lightspeed'.setup {
				repeat_ft_with_target_char = true,
				limit_ft_matches = 10
			}
		end
	}

	-- ### SEARCH/EXPLORE

	use { 'subnut/visualstar.vim', keys = { { 'x', '*' }, { 'x', '#' }, } }

	-- Quickfix
	use {
		'kevinhwang91/nvim-bqf',
		ft = 'qf',
		-- config = function()
		-- 	require "bqf".setup({
		-- 		preview = {
		-- 			wrap = {
		-- 				default = true
		-- 			},
		-- 		}
		-- 	})
		-- end
	}

	-- Fuzzy searcher
	use {
		'nvim-telescope/telescope.nvim',
		branch = "0.1.x",
		cmd = 'Telescope',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require 'packages.telescope'.config() end
	}

	-- Project drawer
	use { 'MunifTanjim/nui.nvim', cmd = { 'Neotree' } }
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		after = 'nui.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require 'packages.neo-tree'.config()
		end
	}

	-- ### GIT

	use { 'tpope/vim-fugitive', cmd = { 'G', 'Git', 'Gdiffsplit', 'Gvdiffsplit' } } -- Git wrapper
	use { 'APZelos/blamer.nvim', cmd = { 'BlamerToggle' } } -- git blame
	use { 'rhysd/git-messenger.vim', cmd = { 'GitMessenger' } } -- git message under cursor
	use {
		'tyru/open-browser-github.vim',
		cmd = {
			'OpenGithubFile', 'OpenGithuIssue', 'OpenGithubPullReq', 'OpenGithubProject',
		},
		requires = { 'tyru/open-browser.vim' },
	}

	-- git linker
	use {
		'ruifm/gitlinker.nvim',
		requires = 'nvim-lua/plenary.nvim',
		keys = { { 'n', '<leader>gy' }, { 'v', '<leader>gy' } },
		config = function() require('gitlinker').setup({}) end
	}

	-- ### UTIL

	use {
		"amrbashir/nvim-docs-view",
		opt = true,
		cmd = { "DocsViewToggle" },
		config = function()
			require("docs-view").setup {
				position = "right",
				width = 60,
			}
		end
	}

	use {
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function() require 'colorizer'.setup() end
	}

	-- Measure startuptime
	use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } }

end

local packages = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return packages
