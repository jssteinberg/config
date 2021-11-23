require('packer').startup(function(use)
	-- LOAD AT STARTUP
	------------------

	-- Package manager
	use{'wbthomason/packer.nvim'}

	-- Neovim bug fix (until core is fixed)
	use{'antoinemadec/FixCursorHold.nvim'}

	-- Increase startup time
	use{'lewis6991/impatient.nvim'} -- Speed up loading Lua modules
	use{'nathom/filetype.nvim', config = function () -- Replace native filetype.vim
		-- If using a Neovim version earlier than 0.6.0, do not source the default filetype.vim
		vim.g.did_load_filetypes = 1
		require('filetype').setup({ overrides = { extensions = {
				astro = 'html',
				style = 'scss',
				postcss = 'scss',
				mdx = 'markdown',
				gmi = 'markdown',
				fish = 'sh',
			},
		}})
	end}

	-- General
	use{'folke/which-key.nvim'} require'packages.which-key'.config() -- Keymappings popup
	use{'folke/tokyonight.nvim'} require'packages.colors'.tokyonight_config() -- Colorscheme
	use{'svermeulen/vim-yoink'} require'packages.yoink'.init() -- Cycle yank history on paste
	use{'andymass/vim-matchup'} -- Highlights, navigates, operates on code matching sets

	-- LSP & code inspection
	use{
		'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
		requires = {
			'williamboman/nvim-lsp-installer', -- `:LspInstall <language>` command
			'ray-x/lsp_signature.nvim', -- Show function signature when you type
		},
		config = function() require'packages.lsp'.config() end
	}

	use{'vuki656/package-info.nvim', requires = {"MunifTanjim/nui.nvim"}, ft = {'json'}, config = function ()
		require('package-info').setup()

		-- Show package versions
		vim.api.nvim_set_keymap("n", "<leader>ps", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })

		-- Hide package versions
		vim.api.nvim_set_keymap("n", "<leader>pc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })

		-- Update package on line
		vim.api.nvim_set_keymap("n", "<leader>pu", ":lua require('package-info').update()<CR>", { silent = true, noremap = true })

		-- Delete package on line
		vim.api.nvim_set_keymap("n", "<leader>pd", ":lua require('package-info').delete()<CR>", { silent = true, noremap = true })

		-- Install a new package
		vim.api.nvim_set_keymap("n", "<leader>pi", ":lua require('package-info').install()<CR>", { silent = true, noremap = true })

		-- Reinstall dependencies
		vim.api.nvim_set_keymap("n", "<leader>pr", ":lua require('package-info').reinstall()<CR>", { silent = true, noremap = true })

		-- Install a different package version
		vim.api.nvim_set_keymap("n", "<leader>pp", ":lua require('package-info').change_version()<CR>", { silent = true, noremap = true })
	end}

	-- Autocompletion
	use{
		'hrsh7th/nvim-cmp',
		after = 'nvim-lspconfig',
		requires = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-buffer',       -- LSP source for nvim-cmp
			'hrsh7th/cmp-path',         -- LSP source for nvim-cmp
			'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
			'hrsh7th/cmp-nvim-lua',     -- LSP source for nvim-cmp
			'hrsh7th/cmp-omni',         -- LSP source for nvim-cmp
			'L3MON4D3/LuaSnip',         -- Snippets plugin
			'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
		},
		---@diagnostic disable-next-line: different-requires
		config = function() require'packages.cmp'.config() end
	}


	-- LOAD ON VIMENTER
	-------------------

	use{'tpope/vim-surround', event='VimEnter *'} -- Surround stuff with stuff (org. tpope/vim-surround)
	use{'tpope/vim-repeat', event='VimEnter *'} -- Extend `.` repeat
	use{'Darazaki/indent-o-matic', event = 'VimEnter *'} -- Detect file's indent style
	use{'editorconfig/editorconfig-vim', event='VimEnter *', after = 'indent-o-matic'} -- Respect .editorconfig

	-- `gx` opens URI or search visual selection in browser
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
				disable = {'markdown'},
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
	-- diff view
	use{'sindrets/diffview.nvim', cmd = {'DiffviewOpen'}, config = function()
		require'diffview'.setup { file_panel = {
			use_icons = false
		}}
	end}
	-- git blame
	use{'f-person/git-blame.nvim', cmd = 'GitBlameToggle'}

	-- ### EDITING

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
	use{'jremmen/vim-ripgrep', cmd = {'Rg'}}

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

	-- Better f, F, t, T motion, repeatable with f/F
	use{'rhysd/clever-f.vim', keys ={
		{'n', 'f'}, {'n', 'F'}, {'n', 't'}, {'n', 'T'},
		{'x', 'f'}, {'x', 'F'}, {'x', 't'}, {'x', 'T'}
	}}

	-- 'Easy' motions
	use{'phaazon/hop.nvim', as = 'hop', cmd = {'HopWord', 'HopLine'}, config = function()
		require'hop'.setup { keys = 'eoqdgflhksura' }
	end}

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
