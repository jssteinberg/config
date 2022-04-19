local use = require('packages.packer').use()

-- Package manager
use{'wbthomason/packer.nvim'}
-- Increase startup time
use{'lewis6991/impatient.nvim'} -- Speed up loading Lua modules
use{'nathom/filetype.nvim', config = function () -- Replace native filetype.vim
	require'packages.filetype'.config()
end}
-- Colorschemes
use{'folke/tokyonight.nvim'}
-- Extend vim
use{'folke/which-key.nvim'} require'packages.which-key'.config() -- Keymappings popup
use{'tpope/vim-surround'} -- Surround stuff with stuff (org. tpope/vim-surround)
use{'tpope/vim-repeat'} -- Extend `.` repeat
use{'tpope/vim-fugitive'} -- Git wrapper
-- use{'svermeulen/vim-yoink'} require'packages.yoink'.init() -- Cycle yank history
use{'tommcdo/vim-lion'} -- Align text
use{'jssteinberg/hackline.vim'} -- Light pre-configured statusline
use{'tpope/vim-sleuth'} -- detects indent, also uses .editorconfig
use{'lambdalisue/fern.vim', requires = {'antoinemadec/FixCursorHold.nvim', 'lambdalisue/fern-hijack.vim'}} -- project drawer
use{'tyru/open-browser.vim', config = function() -- `gx` open url or web search
	require'packages.openbrowser'.config()
end}

use{'mhinz/vim-startify', cmd = {"SSave", "Startify", "SLoad", "SDelete", "SClose"}} -- For session handling

-- netrw replacement
-- use {
-- 	"tamago324/lir.nvim", requires = { "nvim-lua/plenary.nvim", },
-- 	config = function () require'packages.lir'.config() end
-- }

-- 'Harpoon' files and terminals
use{
	'ThePrimeagen/harpoon',
	requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
	config = function() require('harpoon').setup({
		global_settings = { save_on_toggle = true },
	}) end
}

-- LSP and autocompletion
use{
	'neovim/nvim-lspconfig',
	requires = {
		'williamboman/nvim-lsp-installer', -- `:LspInstall` commands
		'hrsh7th/nvim-cmp',                -- Autocompletion menu
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-omni',
		'L3MON4D3/LuaSnip',                -- Snippets plugin
		'saadparwaiz1/cmp_luasnip',        -- Snippets source for nvim-cmp
		'rafamadriz/friendly-snippets',
	},
	config = function()
		require'packages.lsp'.config()
		require'packages.cmp'.config()
		require("luasnip.loaders.from_vscode").lazy_load()
	end
}

-- Treesitter
use{
	'nvim-treesitter/nvim-treesitter',
	requires = {
		'JoosepAlviste/nvim-ts-context-commentstring',
		'windwp/nvim-ts-autotag',
		'RRethy/nvim-treesitter-textsubjects',
	},
	config = function() require'packages.treesitter'.config() end
}


-- LAZY LOADED PACKAGES
-----------------------

-- ### BUFFERS
-- sudo save
use{'lambdalisue/suda.vim', cmd = {'SudaRead', 'SudaWrite'}}

-- ### GIT
-- git log
use{'junegunn/gv.vim', cmd = {'GV'}, requires = {{'tpope/vim-fugitive', opt = true}}}
-- git blame
use{'APZelos/blamer.nvim', cmd ={'BlamerToggle'}}
-- git message under cursor
use{'rhysd/git-messenger.vim', cmd ={'GitMessenger'}}
-- git linker
use {
	'ruifm/gitlinker.nvim',
	requires = 'nvim-lua/plenary.nvim',
	keys = {{'n','<leader>gy'},{'v','<leader>gy'}},
	config = function ()
		require('gitlinker').setup({})
	end
}
-- git gutter signs
use{'mhinz/vim-signify', cmd = {'SignifyToggle'}}

-- ### EDITING

-- pair
use{'windwp/nvim-autopairs', event = 'InsertEnter *', config = function ()
	require('nvim-autopairs').setup{}
end}

-- quickfix
use {'kevinhwang91/nvim-bqf', ft = 'qf'}

-- Outline code from LSP
use{'simrat39/symbols-outline.nvim', cmd = {"SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose"}}

-- gcc, gc in visual mode, to (un)comment. Lua
use{ 'tpope/vim-commentary', keys = {{'n','gcc'}, {'x','gc'}} }

-- project drawer
use {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	cmd = {'Neotree'},
	requires = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function ()
		require'packages.neo-tree'.config()
	end
}

-- #### Web coding

-- Emmet
use{'mattn/emmet-vim', event='InsertEnter *'}
vim.g.user_emmet_leader_key = "<c-e>"

-- Color colors
use{'norcalli/nvim-colorizer.lua', cmd = {'ColorizerToggle'}, config = function ()
	require 'colorizer'.setup()
end}

-- ### LSP & CODE INSPECTION

-- Convenient UI for grepping word
use{
	'pechorin/any-jump.vim',
	cmd = {'AnyJump', 'AnyJumpVisual', 'AnyJumpBack', 'AnyJumpLastResults'},
	config = function ()
		vim.g.any_jump_disable_default_keybindings = false
	end
}

-- ### FILE EXPLORING & SEARCHING

-- Ripgrep
use{'jremmen/vim-ripgrep', cmd = {'Rg', 'RgRoot'}}

-- Visual star `*` search, or `#` backwards
use{'subnut/visualstar.vim', keys = {{'x','*'}, {'x','#'},}}

use{
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	requires = {'nvim-lua/plenary.nvim'},
	config = function()
		local actions = require('telescope.actions')
		require('telescope').setup({
			defaults = {
				file_ignore_patterns = {'node_modules'}
			},
		})
	end
}

-- ### MOTIONS

-- 'Easy' motions
use{'phaazon/hop.nvim', as = 'hop', cmd = {'HopWord', 'HopLine'}, config = function()
	require'hop'.setup { keys = 'eoqdgflhksura' }
end}

-- Better f, F, t, T motion, repeatable with f/F
use{'rhysd/clever-f.vim', keys ={
	{'n', 'f'}, {'n', 'F'}, {'n', 't'}, {'n', 'T'},
	{'x', 'f'}, {'x', 'F'}, {'x', 't'}, {'x', 'T'}
}}

-- ### UTILITY

-- Zen mode
use{
	'folke/zen-mode.nvim',
	cmd = {'ZenMode'},
	config = function() require('zen-mode').setup{ window = {
		backdrop = 1,
		width = 100,
		heigth = 0.9,
		options = {
			cursorline = false,
			cursorcolumn = false, -- disable cursor column
		},
	}} end
}
