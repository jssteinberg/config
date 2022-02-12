local use = require('packages.packer').use()

-- Package manager
use{'wbthomason/packer.nvim'}
-- Neovim bug fix (until core is fixed)
use{'antoinemadec/FixCursorHold.nvim'}
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
use{'lambdalisue/fern.vim'}
use{'cocopon/vaffle.vim', config = function ()
	vim.g.vaffle_force_delete = true
	vim.g.vaffle_show_hidden_files = true
end}
use{'svermeulen/vim-yoink'} require'packages.yoink'.init() -- Cycle yank history
use{'tommcdo/vim-lion'} -- Align text
use{'mhinz/vim-startify'} -- For session handling
use{'tyru/open-browser.vim', config = function() -- `gx` open url or web search
	require'packages.openbrowser'.config()
end}
use{'jssteinberg/hackline.vim'} -- Light pre-configured statusline
use{'Darazaki/indent-o-matic'}
use{'editorconfig/editorconfig-vim', after = 'indent-o-matic'} -- Respect .editorconfig

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
		-- 'ray-x/lsp_signature.nvim', -- Function helper while typing
		'hrsh7th/nvim-cmp',         -- Autocompletion menu
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		-- 'hrsh7th/cmp-omni',
		'L3MON4D3/LuaSnip',         -- Snippets plugin
		'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
		'rafamadriz/friendly-snippets',
	},
	config = function()
		require'packages.lsp'.config()
		require'packages.cmp'.config()
	end
}

-- Treesitter
use{
	'nvim-treesitter/nvim-treesitter',
	config = function() require('nvim-treesitter.configs').setup{
		highlight = { enable = true, disable = {'vim'} },
		autotag = { enable = true }
	} end
}
-- context aware comment toggling (needs a toggler plugin)
use{
	'JoosepAlviste/nvim-ts-context-commentstring',
	after = 'nvim-treesitter',
	config = function() require'nvim-treesitter.configs'.setup {
		context_commentstring = { enable = true }
	} end
}
-- auto close tags (using treesittter)
use{'windwp/nvim-ts-autotag', after = 'nvim-treesitter', config = function ()
	require('nvim-ts-autotag').setup()
	vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = {
				spacing = 5,
				severity_limit = 'Warning',
			},
			update_in_insert = true,
		}
	)
end}


-- LAZY LOADED PACKAGES
-----------------------

-- ### BUFFERS
-- sudo save
use{'lambdalisue/suda.vim', cmd = {'SudaRead', 'SudaWrite'}}

-- ### GIT
use{'tpope/vim-fugitive', cmd = {'G', 'Git'}}
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

-- ### EDITING

use{'windwp/nvim-autopairs', event = 'InsertEnter *', config = function ()
	require('nvim-autopairs').setup{}
end}

-- gcc, gc in visual mode, to (un)comment. Lua
use{
	'terrortylor/nvim-comment',
	keys = {{'n','gcc'}, {'x','gc'},},
	config = function()
		require('nvim_comment').setup({
			comment_empty = false,
			hook = function()
				if vim.api.nvim_buf_get_option(0, "filetype") == "svelte" and
					vim.api.nvim_buf_get_option(0, "filetype") == "html" and
					vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
					require("ts_context_commentstring.internal").update_commentstring()
				end
			end
		})
	end
}

-- #### Web coding
-- Expand `html>head` to HTML
use{'mattn/emmet-vim', event='InsertEnter *'}
-- Color colors
use{'norcalli/nvim-colorizer.lua', cmd = {'ColorizerToggle'}, config = function ()
	require 'colorizer'.setup()
end}

-- ### LSP & CODE INSPECTION

use{'sbdchd/neoformat', cmd = {'NeoFormat'}}

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
				mappings = {i = {
					[require'keymaps'.esc_map] = actions.close
				}},
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
