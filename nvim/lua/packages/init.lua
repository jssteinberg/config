require('packer').startup(function(use)

	-- LOAD AT STARTUP/BUFREAD
	--------------------------

	-- Let Packer manage itself
	use{'wbthomason/packer.nvim'}
	-- Colors: dark & light, Treesitter support ...
	use{'folke/tokyonight.nvim'} require'packages.colors'.tokyonight_config()
	-- Editorconfig, set relevant options
	use{'editorconfig/editorconfig-vim'}
	-- LSP & code inspection
	use{
		'neovim/nvim-lspconfig',
		requires = {'kabouzeid/nvim-lspinstall', 'ray-x/lsp_signature.nvim'},
		config = function() require'packages.lsp'.lspinstall_config() end
	}
	-- Auto completion
	use{'hrsh7th/nvim-compe', event = 'BufRead', config = function()
		require'packages.compe'.config()
	end}

	-- ### EDITING & TREESITTER
	use{'tpope/vim-surround', event = 'BufRead'}  -- surround stuff with stuff (org. tpope/vim-surround)
	use{'tpope/vim-repeat', event = 'BufRead'}    -- repeat surround and more
	-- Cycle yank history on paste
	use{'svermeulen/vim-yoink'}
	vim.api.nvim_set_var('yoinkSavePersistently', 1)
	vim.api.nvim_set_keymap('n', '<c-p>', '<Plug>(YoinkPostPasteSwapBack)', {})
	vim.api.nvim_set_keymap('n', '<c-n>', '<Plug>(YoinkPostPasteSwapForward)', {})
	vim.api.nvim_set_keymap('n', 'p', '<Plug>(YoinkPaste_p)', {})
	vim.api.nvim_set_keymap('n', 'P', '<Plug>(YoinkPaste_P)', {})
	vim.api.nvim_set_keymap('n', 'gp', '<Plug>(YoinkPaste_gp)', {})
	vim.api.nvim_set_keymap('n', 'gP', '<Plug>(YoinkPaste_gP)', {})
	-- Treesitter
	use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
		require('nvim-treesitter.configs').setup{
			ensure_installed = 'maintained',
			highlight = {enable = true},
		}
	end}

	-- ### UTILITY
	-- `gx` opens URI or search visual selection in browser
	use{'tyru/open-browser.vim', event = 'BufRead', config = function()
		require'packages.openbrowser'.config()
	end}
	-- 'Easy' motions
	use{'phaazon/hop.nvim', as = 'hop', event = 'BufRead', config = function()
		require'hop'.setup { keys = 'etoqdygflhksura' }
	end}
	-- Show keymaps on delay
	use{'folke/which-key.nvim'} require'packages.whichkey'.config()


	-- LOAD LAZY
	------------

	-- ### BUFFERS

	-- :Bdelete and :Bwipeout to preserve windows
	use{'famiu/bufdelete.nvim', cmd = {'Bdelete', 'Bwipeout'}}

	-- ### GIT

	-- fugitive
	use{'tpope/vim-fugitive', cmd = {'G', 'Git'}}
	-- git log
	use{ 'junegunn/gv.vim', cmd = {'GV'}, requires = {{'tpope/vim-fugitive', opt = true}}}
	-- diff view
	use{ 'sindrets/diffview.nvim', cmd = {'DiffviewOpen'}, config = function()
		require'diffview'.setup { file_panel = {
			use_icons = false
		} }
	end }
	-- git blame
	use{'f-person/git-blame.nvim', cmd = 'GitBlameToggle'}

	-- ### EDITING & TREESITTER

	-- Matchies and pairing
	use{'steelsojka/pears.nvim', event = 'InsertEnter', config = function()
		require'pears'.setup(function(conf)
			conf.preset 'tag_matching'
			conf.on_enter(function(pears_handle)
				if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
					return vim.fn['compe#confirm']('<CR>')
				else
					pears_handle()
				end
			end)
		end)
	end}

	-- Toggle comments
	-- gcc, gc in visual mode, to (un)comment. Lua
	use{
		'terrortylor/nvim-comment',
		keys = {{'n','gcc'}, {'x','gc'},},
		config = function() require('nvim_comment').setup({
			comment_empty = false,
		}) end
	}

	-- Align text
	use{ 'junegunn/vim-easy-align', opt = true }
	vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
	vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

	-- ### LSP & CODE INSPECTION

	-- Convenient UI for grepping word
	use{
		'pechorin/any-jump.vim',
		cmd = {'AnyJump', 'AnyJumpVisual', 'AnyJumpBack', 'AnyJumpLastResults'},
		keys = { {'n','<leader>j'}, {'x','<leader>j'}, {'n','<leader>ab'}, {'n','<leader>al'} },
	}

	-- ### FILE EXPLORING & SEARCHING

	-- Ripgrep
	use{'jremmen/vim-ripgrep', cmd = {'Rg'}}

	-- Visual star `*` search, or `#` backwards
	use{'subnut/visualstar.vim', keys = {{'x','*'}, {'x','#'},}}

	-- Telescope for fuzzy searching
	use{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'TC72/telescope-tele-tabby.nvim'},
		config = function()
			local actions = require('telescope.actions')
			require('telescope').setup({defaults = {
				mappings = {i = {
					[require'keymaps'.esc_map] = actions.close
				}}
			}})
		end
	}

	-- ### MOTIONS

	-- Better f, F, t, T motion, repeatable with f/F
	use{'rhysd/clever-f.vim', keys ={
		{'n', 'f'}, {'n', 'F'}, {'n', 't'}, {'n', 'T'},
		{'v', 'f'}, {'v', 'F'}, {'v', 't'}, {'v', 'T'}
	}}

	-- ### UTILITY

	-- Zen mode
	use{
		'folke/zen-mode.nvim',
		cmd = {'ZenMode'},
		config = function() require('zen-mode').setup{ window = {
			backdrop = 0.98,
			width = 100,
			options = {
				cursorline = false,
			},
		}} end
	}

	-- Terminal toggling
	use{
		'akinsho/nvim-toggleterm.lua',
		cmd = { 'ToggleTermCloseAll', 'ToggleTermOpenAll', 'ToggleTerm' },
		config = function() require'packages.toggleterm'.config() end
	}
end)
