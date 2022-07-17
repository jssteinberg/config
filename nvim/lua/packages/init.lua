local packer = nil

local function init()
	if packer == nil then
		packer = require 'packer'
		packer.init { disable_commands = true }
	end

	local use = packer.use

	packer.reset()

	use { 'wbthomason/packer.nvim', opt = true }

	use { 'nathom/filetype.nvim', config = function()
		require 'packages.filetype'.config()
	end }

	use { 'wuelnerdotexe/vim-enfocado' } -- colorscheme
	use { 'tpope/vim-sleuth' } -- detects indent, also uses .editorconfig

	-- Project drawer
	use { 'lambdalisue/fern.vim', requires = {
		'antoinemadec/FixCursorHold.nvim', 'lambdalisue/fern-hijack.vim'
	} }
	-- let g:fern#default_hidden=1
	-- vim.g.fern.default_hidden = true

	-- Open/search with `gx`
	use { 'tyru/open-browser.vim', config = function()
		require 'packages.openbrowser'.config()
	end }

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = { "nvim-treesitter/playground" },
		config = function()
			require 'packages.treesitter'.config()
		end
	}

	-- Statusline
	use {
		'~/Documents/hackline.vim',
		config = function()
			vim.g.hackline_sign = "Neo"
			-- vim.g.hackline_labels = {
			-- 	sign = "Nvi",
			-- 	command = "/ C",
			-- 	insert = "/ I",
			-- 	...
			-- }
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
			'williamboman/nvim-lsp-installer',
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

	-- Tabnine completion
	use {
		'tzachar/cmp-tabnine',
		run = './install.sh',
		requires = 'hrsh7th/nvim-cmp',
		config = function() require "packages.cmp".tabnine() end
	}

	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = { 'nvim-lua/plenary', 'neovim/nvim-lspconfig' },
		config = function()
			require "packages.null-ls".config()
		end
	}


	-- LAZY LOADED
	-- -----------

	-- ### EDIT/MOVE

	use { 'tpope/vim-surround', keys = { { 'n', 'ys' }, { 'n', 'c' }, { 'v', 'S' } } }
	use { 'tpope/vim-repeat', keys = { { 'n', '.' } } } -- Extend `.` repeat
	use { 'tommcdo/vim-lion', keys = { { "n", "gl" }, { "n", "gL" }, { "x", "gl" }, { "x", "gL" }, } } -- Align text
	use { 'lambdalisue/suda.vim', cmd = { 'SudaRead', 'SudaWrite' } } -- sudo save
	use { 'simrat39/symbols-outline.nvim', cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen' } } -- outline code from lsp

	-- auto pair completion
	use { 'windwp/nvim-autopairs', event = 'InsertEnter', config = function()
		require('nvim-autopairs').setup {}
	end }

	use { 'andymass/vim-matchup', event = 'CursorHold' }

	-- gcc, gc in visual mode, to (un)comment. Lua
	use {
		'terrortylor/nvim-comment', keys = { { 'n', 'gcc' }, { 'x', 'gc' }, },
		config = function() require('nvim_comment').setup({}) end
	}

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
	-- use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

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
	use {
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim',
		cmd = { "Neogit" },
		config = function()
			require "neogit".setup({})
		end
	}

	-- git linker
	use {
		'ruifm/gitlinker.nvim',
		requires = 'nvim-lua/plenary.nvim',
		keys = { { 'n', '<leader>gy' }, { 'v', '<leader>gy' } },
		config = function()
			require('gitlinker').setup({})
		end
	}

	-- ### UTIL

	use {
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require 'colorizer'.setup()
		end
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
