require('packer').startup(function(use)

	-- LOAD AT STARTUP/BUFREAD
	--------------------------

	use{'wbthomason/packer.nvim'} -- Package manager
	use{'folke/tokyonight.nvim'} require'packages.colors'.tokyonight_config() -- Colorscheme
	use{'folke/which-key.nvim'} require'packages.whichkey'.config()
	use{'editorconfig/editorconfig-vim'}
	use{'andymass/vim-matchup'}
	use{'svermeulen/vim-yoink'} require'packages.yoink'.init() -- Cycle yank history on paste
	use{'tpope/vim-surround'} -- surround stuff with stuff (org. tpope/vim-surround)
	use{'tpope/vim-repeat'} -- repeat surround and more
	use{'mattn/emmet-vim'} -- vim.api.nvim_set_keymap('i', '<c-e>', '<c-y>,', {})

	-- `gx` opens URI or search visual selection in browser
	use{'tyru/open-browser.vim', event = 'BufRead', config = function()
		require'packages.openbrowser'.config()
	end}

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

	-- Treesitter
	use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
		require('nvim-treesitter.configs').setup{
			ensure_installed = 'maintained',
			highlight = {
				enable = true,
				disable = {'lua', 'markdown', 'fish'}, -- enable lua to test when Treesitter is more stable
			},
		}
	end}

	-- Aynsc executions
	use{ 'skywind3000/asyncrun.vim', cmd = {'AsyncRun'}, }
	vim.api.nvim_set_keymap('n', '<leader>gp', ':AsyncRun git push<cr>:copen | wincmd p<cr>', {noremap=true})

	-- 'Harpoon' files and terminals
	use{
		'ThePrimeagen/harpoon',
		requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
		-- keys = {{'n','<leader><cr>'}},
		config = function() require("harpoon").setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		}) end
	}

	-- LOAD LAZY
	------------

	-- ### BUFFERS

	-- :Bdelete and :Bwipeout to preserve windows
	use{'famiu/bufdelete.nvim', cmd = {'Bdelete', 'Bwipeout'}}
	-- sudo save
	use{'lambdalisue/suda.vim', cmd = {'SudaRead', 'SudaWrite'}}

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

	-- ### EDITING

	-- Matching and pairing
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
		-- keys = { {'n','<leader>j'}, {'x','<leader>j'}, {'n','<leader>ab'}, {'n','<leader>al'} },
		config = function ()
			vim.g.any_jump_disable_default_keybindings = false
		end
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
		requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
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

	-- 'Easy' motions
	use{'phaazon/hop.nvim', as = 'hop', cmd = {'HopWord', 'HopLine'}, config = function()
		require'hop'.setup { keys = 'etoqdygflhksura' }
	end}

	-- 2 char search with s/S
	-- use{
	-- 	'ggandor/lightspeed.nvim',
	-- 	keys = {
	-- 		{'n', 's'}, {'n', 'S'},
	-- 		{'n', 'f'}, {'n', 'F'}, {'n', 't'}, {'n', 'T'},
	-- 		{'v', 'f'}, {'v', 'F'}, {'v', 't'}, {'v', 'T'}
	-- 	},
	-- 	config = function() require'lightspeed'.setup {
	-- 		jump_to_first_match = true,
	-- 		full_inclusive_prefix_key = '<tab>',
	-- 		highlight_unique_chars = true
	-- 	} end
	-- }

	-- ### UTILITY

	use{'junegunn/limelight.vim', cmd = {'Limelight'}}
	vim.api.nvim_set_var('limelight_conceal_ctermfg', 'gray')

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
end)
