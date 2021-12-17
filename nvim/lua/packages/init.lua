local use = require('packages.packer').use()

-- LOAD AT STARTUP
------------------

-- Package manager
use{'wbthomason/packer.nvim'}

-- Neovim bug fix (until core is fixed)
use{'antoinemadec/FixCursorHold.nvim'}

-- Increase startup time
use{'lewis6991/impatient.nvim'} -- Speed up loading Lua modules
use{'nathom/filetype.nvim', config = function () -- Replace native filetype.vim
	require'packages.filetype'.config()
end}

-- General
use{'folke/which-key.nvim'} require'packages.which-key'.config() -- Keymappings popup
use{'svermeulen/vim-yoink'} require'packages.yoink'.init() -- Cycle yank history on paste
use{'jssteinberg/hackline.vim'} -- My statusline plugin

-- Colorschemes
use{'folke/tokyonight.nvim'}
use{'bluz71/vim-moonfly-colors'}

-- LSP and autocompletion
use{
	'neovim/nvim-lspconfig',
	requires = {
		'williamboman/nvim-lsp-installer', -- `:LspInstall` commands
		'ray-x/lsp_signature.nvim', -- Function helper while typing
		'hrsh7th/nvim-cmp',         -- Autocompletion menu
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		-- 'hrsh7th/cmp-omni',
		'L3MON4D3/LuaSnip',         -- Snippets plugin
		'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
	},
	config = function()
		require'packages.lsp'.config()
		require'packages.cmp'.config()
	end
}

-- LOAD ON VIMENTER
-------------------

use{'tpope/vim-surround', event='VimEnter *'} -- Surround stuff with stuff (org. tpope/vim-surround)
use{'tpope/vim-repeat', event='VimEnter *'} -- Extend `.` repeat
use{'tpope/vim-sleuth', event = 'VimEnter *'} -- Detect file's indent style
use{'editorconfig/editorconfig-vim', event='VimEnter *', after = 'vim-sleuth'} -- Respect .editorconfig

use{'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, event = 'VimEnter *', config = function ()
	require('gitsigns').setup{
		keymaps = {
			noremap = false,
			['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
			['n <leader>gn'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
			['n <leader>gp'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},
		}
	}
end}

-- `gx` open url or duckduckgo selection
use{'tyru/open-browser.vim', event = 'VimEnter *', config = function()
	require'packages.openbrowser'.config()
end}

-- Treesitter
use{
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	event = 'VimEnter *',
	config = function() require('nvim-treesitter.configs').setup{
		ensure_installed = 'maintained',
		highlight = {
			enable = true,
			disable = {'vim'},
		},
		autotag = {
			enable = true,
		}
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
-- auto close tags
use{'windwp/nvim-ts-autotag', after = 'nvim-treesitter', config = function ()
	require('nvim-ts-autotag').setup()
end}

-- 'Harpoon' files and terminals
use{
	'ThePrimeagen/harpoon',
	event = 'VimEnter *',
	requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
	config = function() require('harpoon').setup({
		global_settings = { save_on_toggle = true },
	}) end
}


-- LOAD ON INSERT, CMD, OR KEYMAP
---------------------------------
-- (Some exceptions for "requires" of plugins.)

-- ### BUFFERS

-- sudo save
use{'lambdalisue/suda.vim', cmd = {'SudaRead', 'SudaWrite'}}

-- ### GIT

-- fugitive
use{'tpope/vim-fugitive', cmd = {'G', 'Git'}}
-- git log
use{'junegunn/gv.vim', cmd = {'GV'}, requires = {{'tpope/vim-fugitive', opt = true}}}
-- neogit
use{'TimUntersberger/neogit', cmd = 'Neogit', requires = {'nvim-lua/plenary.nvim'}, config = function ()
	require('neogit').setup{}
end}

-- ### EDITING

use{'lambdalisue/fern.vim', cmd = 'Fern'}
vim.cmd([[
augroup fern-custom
	autocmd! *
	autocmd FileType fern setlocal nonumber norelativenumber signcolumn=no
augroup END
]])
use{'cohama/lexima.vim', event = 'InsertEnter *'} -- close parentheses and quotes
-- use{'alvan/vim-closetag', event = 'InsertEnter *'} -- close

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

-- Align text
use{ 'junegunn/vim-easy-align', opt = true }
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
require'which-key'.register({
	['ga'] = { '<Plug>(EasyAlign)',
	'Align (requires :packadd vim-easy-align)' },
})

-- #### Web coding
-- Expand `html>head` to HTML
use{'mattn/emmet-vim', event='InsertEnter *'}
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
