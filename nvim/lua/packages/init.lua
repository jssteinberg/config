local use = require('packages.packer').use()

-- Package manager
use { 'wbthomason/packer.nvim' }

-- Increase startup time
use { 'nathom/filetype.nvim', config = function() -- Replace native filetype.vim
	require 'packages.filetype'.config()
end }

use { 'cocopon/iceberg.vim' } -- use { 'folke/tokyonight.nvim' } -- colo
use { 'tpope/vim-surround' } -- Surround stuff with stuff
use { 'tommcdo/vim-lion' } -- Align text
use { 'tpope/vim-sleuth' } -- detects indent, also uses .editorconfig
use { 'github/copilot.vim' }
use { 'folke/which-key.nvim', config = function()
	require('packages.which-key').config()
end }

-- Open/search with `gx`
use { 'tyru/open-browser.vim', config = function()
	require 'packages.openbrowser'.config()
end }

-- Project drawer
use { 'lambdalisue/fern.vim', requires = {
	'antoinemadec/FixCursorHold.nvim', 'lambdalisue/fern-hijack.vim'
} }

-- Statusline
use { 'jssteinberg/hackline.vim', requires = {
	'itchyny/vim-gitbranch'
} }

-- Treesitter
use { 'nvim-treesitter/nvim-treesitter', config = function()
	require 'packages.treesitter'.config()
end }

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


-- LAZY LOADED
-- -----------

-- ### EDITING

use { 'tpope/vim-repeat', keys = { { 'n', '.' } } } -- Extend `.` repeat
use { 'simrat39/symbols-outline.nvim', cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen' } } -- outline code from lsp
use { 'lambdalisue/suda.vim', cmd = { 'SudaRead', 'SudaWrite' } } -- sudo save

-- auto pair completion
use { 'windwp/nvim-autopairs', event = 'InsertCharPre', config = function()
	require('nvim-autopairs').setup {}
end }

use { 'andymass/vim-matchup', event = 'CursorHold' }

-- gcc, gc in visual mode, to (un)comment. Lua
use {
	'terrortylor/nvim-comment', keys = { { 'n', 'gcc' }, { 'x', 'gc' }, },
	config = function() require('nvim_comment').setup({}) end
}

-- project drawer
use {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	cmd = { 'Neotree' },
	requires = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
	},
	config = function()
		require 'packages.neo-tree'.config()
	end
}

-- ### FILE EXPLORING & SEARCHING

use { 'jremmen/vim-ripgrep', cmd = { 'Rg', 'RgRoot' } } -- ripgrep integration

-- Visual star `*` search, or `#` backwards
use { 'subnut/visualstar.vim', keys = { { 'x', '*' }, { 'x', '#' }, } }

use {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	requires = { 'nvim-lua/plenary.nvim' },
	config = function() require 'packages.telescope'.config() end
}

-- ### GIT

use { 'tpope/vim-fugitive', cmd = { 'G', 'Git' } } -- Git wrapper
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
	config = function()
		require('gitlinker').setup({})
	end
}

-- ### MOTIONS

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

-- ### UTILITY

use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } } -- Measure startuptime

-- Zen mode
use {
	'folke/zen-mode.nvim',
	cmd = { 'ZenMode' },
	config = function() require('zen-mode').setup { window = {
			backdrop = 1,
			width = 100,
			heigth = 0.9,
			options = {
				cursorline = false,
				cursorcolumn = false, -- disable cursor column
			},
		} }
	end
}
