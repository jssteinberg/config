local use = require('packages.packer').use()

-- # ALL PACKAGES

-- Package manager
use { 'wbthomason/packer.nvim' }

-- Increase startup time
use{ 'lewis6991/impatient.nvim' } -- Speed up loading Lua modules
use { 'nathom/filetype.nvim', config = function() -- Replace native filetype.vim
	require 'packages.filetype'.config()
end }

-- Colorschemes
use { 'folke/tokyonight.nvim' }

-- Extend vim
-- use { 'folke/which-key.nvim' } require 'packages.which-key'.config() -- Keymappings popup
use { 'tpope/vim-surround' } -- Surround stuff with stuff (org. tpope/vim-surround)
use { 'tpope/vim-fugitive' } -- Git wrapper
use { 'tommcdo/vim-lion' } -- Align text
use { 'tpope/vim-sleuth' } -- detects indent, also uses .editorconfig
use { 'jssteinberg/hackline.vim' } -- Light pre-configured statusline
use { 'lambdalisue/fern.vim', requires = { -- project drawer
	'antoinemadec/FixCursorHold.nvim', 'lambdalisue/fern-hijack.vim'
} }
use { 'tyru/open-browser.vim', config = function() -- `gx` open url or web search
	require 'packages.openbrowser'.config()
end }

-- LSP and autocompletion

use { 'github/copilot.vim' }

use {
	'neovim/nvim-lspconfig',
	requires = {
		'williamboman/nvim-lsp-installer', -- `:LspInstall` commands
		'hrsh7th/nvim-cmp',                -- Autocompletion menu
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		-- 'hrsh7th/cmp-nvim-lua',
		-- 'hrsh7th/cmp-omni',
		-- 'hrsh7th/cmp-path',
		'L3MON4D3/LuaSnip',                -- Snippets plugin
		'saadparwaiz1/cmp_luasnip',        -- Snippets source for nvim-cmp
	},
	config = function()
		require'packages.lsp'.config()
		require 'packages.cmp'.config()
	end
}

-- Treesitter
use {
	'nvim-treesitter/nvim-treesitter',
	config = function() require 'packages.treesitter'.config() end
}


-- LAZY LOADED PACKAGES
-----------------------

-- ### GIT

use { 'junegunn/gv.vim', cmd = { 'GV' }, requires = { { 'tpope/vim-fugitive', opt = true } } } -- git log
use { 'APZelos/blamer.nvim', cmd = { 'BlamerToggle' } } -- git blame
use { 'rhysd/git-messenger.vim', cmd = { 'GitMessenger' } } -- git message under cursor

-- git linker
use {
	'ruifm/gitlinker.nvim',
	requires = 'nvim-lua/plenary.nvim',
	keys = { { 'n', '<leader>gy' }, { 'v', '<leader>gy' } },
	config = function()
		require('gitlinker').setup({})
	end
}

-- ### EDITING

use { 'tpope/vim-repeat', keys = { { 'n', '.' } } } -- Extend `.` repeat
-- use { 'kevinhwang91/nvim-bqf', ft = 'qf' } -- quickfix
use { 'simrat39/symbols-outline.nvim', cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen' } } -- outline code from lsp
use { 'lambdalisue/suda.vim', cmd = { 'SudaRead', 'SudaWrite' } } -- sudo save

-- auto pair completion
use { 'windwp/nvim-autopairs', event = 'InsertEnter', config = function()
	require('nvim-autopairs').setup {}
end }

use { 'andymass/vim-matchup', event = 'CursorMoved' }

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

-- terminals
use {
	's1n7ax/nvim-terminal',
	keys = {
		{ 'n', '<leader><cr>' },
		{ 'n', '<leader>1' },
		{ 'n', '<leader>2' },
		{ 'n', '<leader>3' },
		{ 'n', '<leader>4' },
		{ 'n', '<leader>5' },
	},
	config = function()
		require('nvim-terminal').setup({
			toggle_keymap = '<leader><cr>',
		})
	end,
}

-- ### LSP & CODE INSPECTION

-- Language aware word grepping and UI
use {
	'pechorin/any-jump.vim',
	cmd = { 'AnyJump', 'AnyJumpVisual', 'AnyJumpBack', 'AnyJumpLastResults' },
	config = function()
		vim.g.any_jump_disable_default_keybindings = false
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
	config = function()
		require('telescope').setup({
			defaults = {
				file_ignore_patterns = { 'node_modules' }
			},
		})
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

use { 'tweekmonster/startuptime.vim', cmd = { 'StartupTime' } } -- Measure startuptime
-- use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } } -- Measure startuptime

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
