local wk = require'which-key'
local maps = require'keymaps'

require('packer').startup(function(use)
	-- Let Packer manage itself
	use 'wbthomason/packer.nvim'

	-- Open URI /search in browser
	use{
		'tyru/open-browser.vim',
		event = 'BufRead',
		config = function()
			vim.api.nvim_set_var('netrw_nogx', 1) -- disable netrw's gx mapping.
			vim.api.nvim_set_var('openbrowser_default_search', 'duckduckgo')
		end
		-- load on cmd or keys haven't worked with this plugin
		-- cmd = {'<Plug>(openbrowser-smart-search)'}, -- gives invalid command name on PackerCompile...
		-- keys = { {'n','gx'}, {'v','gx'} },
	}
	vim.api.nvim_set_keymap('n', 'gx', '<Plug>(openbrowser-smart-search)', {})
	vim.api.nvim_set_keymap('v', 'gx', '<Plug>(openbrowser-smart-search)', {})


	-- ## BUFFERS

	-- Auto respect editorconfig files
	use{'editorconfig/editorconfig-vim'}

	-- Go to prev cursor position for buffers
	use{
		'ethanholz/nvim-lastplace',
		config = function()
			require'nvim-lastplace'.setup{}
		end
	}

	-- :Bdelete and :Bwipeout to preserve windows
	use{'famiu/bufdelete.nvim'}


	-- ## GIT

	-- fugitive
	use{'tpope/vim-fugitive'}

	-- git log
	use{
		'junegunn/gv.vim',
		cmd = {'GV'},
		requires = { 'tpope/vim-fugitive' }
	}

	-- diff view
	use{
		'sindrets/diffview.nvim',
		cmd = {'DiffviewOpen'},
		config = function()
			local cb = require'diffview.config'.diffview_callback
			require'diffview'.setup {
				file_panel = {
					use_icons = false
				}
			}
		end
	}

	-- git blame
	use{'f-person/git-blame.nvim', event = 'BufRead'}


	-- ## EDITING & TREESITTER

	use{'tpope/vim-surround', event = 'BufRead'}  -- surround stuff with stuff (org. tpope/vim-surround)
	use{'tpope/vim-repeat', event = 'BufRead'}    -- repeat surround and more

	-- Lua
	use {
		'folke/zen-mode.nvim',
		config = function()
			require('zen-mode').setup{
				window = {
					backdrop = 0.98,
					width = 100,
					options = {
						cursorline = false,
					},
				},
			}
		end
	}

	-- Toggle comments
	-- gcc, gc in visual mode, to (un)comment. Lua
	use{
		'terrortylor/nvim-comment',
		keys = {{'n','gcc'}, {'x','gc'},},
		config = function()
			require('nvim_comment').setup({
				comment_empty = false,
			})
		end
	}

	-- Align text
	use{
		'junegunn/vim-easy-align',
		event = 'BufRead',
		-- load on cmd or keys haven't worked with this plugin
		-- cmd = {'<Plug>(EasyAlign)'} -- gives invalid command name on PackerCompile...
		-- keys = {{'n','ga'}, {'x', 'ga'},}
	}
	vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
	vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

	-- Treesitter for syntax, indentation and formatting
	use {
		'nvim-treesitter/nvim-treesitter',
		event = 'BufRead',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup{
				ensure_installed = 'maintained',
				highlight = {enable = true},
			}
		end
	}

	-- Auto match pairs (uses Treesitter)
	use{
		'steelsojka/pears.nvim',
		event = 'InsertEnter',
		config = function()
			local pears = require 'pears'

			pears.setup(function(conf)
				conf.preset 'tag_matching'
			end)

			-- Keymap to close tag
			vim.api.nvim_set_keymap('i', '<c-l>', pears.expand(), {
				noremap = true, silent = true
			})

			-- Work with compe. on_enter option adds custom behavior on enter
			pears.setup(function(conf)
				conf.on_enter(function(pears_handle)
					if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
						return vim.fn['compe#confirm']('<CR>')
					else
						pears_handle()
					end
				end)
			end)
		end
	}


	-- ## LSP & CODE INSPECTION

	use{
		'kabouzeid/nvim-lspinstall',
		event = 'BufRead',
		requires = { 'neovim/nvim-lspconfig', },
		config = function() require'packages.lsp'.lspinstall_config() end
	}

	use{
		'pechorin/any-jump.vim',
		cmd = {'AnyJump', 'AnyJumpVisual', 'AnyJumpBack', 'AnyJumpLastResults'},
		keys = { {'n','<leader>j'}, {'x','<leader>j'}, {'n','<leader>ab'}, {'n','<leader>al'} },
	}

	-- ## AUTO COMPLETION

	use{
		'hrsh7th/nvim-compe',
		event = 'BufRead',
		config = function() require'packages.compe'.config() end
	}


	-- ## FILE EXPLORING & SEARCHING

	use{'subnut/visualstar.vim'}         -- visual star `*` search, or `#` backwards

	-- Telescope for fuzzy searching

	use{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
			{'TC72/telescope-tele-tabby.nvim'}
		},
		config = function()
			local actions = require('telescope.actions')
			require('telescope').setup({defaults = {
				mappings = {i = {
					[require'keymaps'.esc_map] = actions.close
				}}
			}})
		end
	}


	-- ## INTERFACE

	-- Colorscheme Tokyonights. Dark/light. Supports Treesitter. (Includes config for Alacritty)
	use{'folke/tokyonight.nvim'}
	vim.cmd[[colorscheme tokyonight]]
	vim.api.nvim_set_var('tokyonight_style', 'night')
	vim.api.nvim_set_var('tokyonight_sidebars', {'terminal', 'fugitive'})


	-- Show keymaps on delay
	use{'folke/which-key.nvim'}
	-- which-key's config doesn't like to be in packer's `use.config` value...
	wk.setup({
		plugins = {
			spelling = {
				enabled = true,
			}
		},
		triggers_blacklist = {
			i = { 'q', 'Z' },
			v = { 'q' },
			-- t = { 'q', '<leader>', '<space>' },
		},
	})
	wk.register(maps.normal)
	wk.register(maps.insert,   {mode = 'i'})
	wk.register(maps.visual,   {mode = 'v'})
	-- wk.register(maps.terminal, {mode = 't'})

end)
