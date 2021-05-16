require('packer').startup(function(use)
	-- Let Packer manage itself
	use 'wbthomason/packer.nvim'

	-- GENERAL

	-- Auto respect editorconfig files
	use{'editorconfig/editorconfig-vim'}

	-- Go to prev cursor position for buffers
	use{'mmozuras/vim-cursor', event = 'BufRead'}

	-- Show keymaps on delay
	use{'folke/which-key.nvim'}
	local wk = require("which-key")
	wk.setup({})

	-- Colorscheme Tokyonights. Dark/light. Supports Treesitter. (Includes config for Alacritty)
	use{'folke/tokyonight.nvim'}
	vim.cmd[[colorscheme tokyonight]]
	vim.api.nvim_set_var('tokyonight_style', 'night')

	-- Open URI /search in browser
	use{
		'tyru/open-browser.vim',
		-- cmd = {'<Plug>(openbrowser-smart-search)'}, -- gives invalid command name on PackerCompile...
		-- keys = { {'n','gx'}, {'v','gx'} },
		event = 'BufRead',
		config = function()
			vim.api.nvim_set_var('netrw_nogx', 1) -- disable netrw's gx mapping.
			vim.api.nvim_set_var('openbrowser_default_search', 'duckduckgo')
		end
	}
	vim.api.nvim_set_keymap('n', 'gx', '<Plug>(openbrowser-smart-search)', {})
	vim.api.nvim_set_keymap('v', 'gx', '<Plug>(openbrowser-smart-search)', {})

	-- EDITING AND TREESITTER

	use{'tpope/vim-surround', event = 'BufRead'}  -- surround stuff with stuff (org. tpope/vim-surround)
	use{'tpope/vim-repeat', event = 'BufRead'}    -- repeat surround and more

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
		-- cmd = {'<Plug>(EasyAlign)'} -- gives invalid command name on PackerCompile...
		-- keys = {{'n','ga'}, {'x', 'ga'},}
		event = 'BufRead',
	}
	vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
	vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

 	-- Auto completion
	use{
		'hrsh7th/nvim-compe',
		event = 'BufRead',
		config = function()
			vim.o.completeopt = "menuone,noselect"
			require'compe'.setup {
				enabled = true;
				autocomplete = true;
				debug = false;
				min_length = 1;
				preselect = 'enable';
				throttle_time = 80;
				source_timeout = 200;
				incomplete_delay = 400;
				max_abbr_width = 100;
				max_kind_width = 100;
				max_menu_width = 100;
				documentation = true;

				source = {
					path = true;
					buffer = true;
					-- calc = true;
					-- nvim_lsp = true;
					-- nvim_lua = true;
					-- vsnip = true;
					-- ultisnips = true;
				};
			}

			local t = function(str)
				return vim.api.nvim_replace_termcodes(str, true, true, true)
			end
			local check_back_space = function()
				local col = vim.fn.col('.') - 1
				if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
					return true
				else
					return false
				end
			end

			-- Use (s-)tab to:
			--- move to prev/next item in completion menuone
			--- jump to prev/next snippet's placeholder
			_G.tab_complete = function()
				if vim.fn.pumvisible() == 1 then
					return t "<C-n>"
				elseif vim.fn.call("vsnip#available", {1}) == 1 then
					return t "<Plug>(vsnip-expand-or-jump)"
				elseif check_back_space() then
					return t "<Tab>"
				else
					return vim.fn['compe#complete']()
				end
			end
			_G.s_tab_complete = function()
				if vim.fn.pumvisible() == 1 then
					return t "<C-p>"
				elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
					return t "<Plug>(vsnip-jump-prev)"
				else
					return t "<S-Tab>"
				end
			end

			-- bind (s-)tab
			vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
			vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
			vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
			vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
		end
	}

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
						return vim.fn["compe#confirm"]("<CR>")
					else
						pears_handle()
					end
				end)
			end)
		end
	}

	-- GIT

	-- fugitive
	use{'tpope/vim-fugitive'}

	-- git log
	use{
		'junegunn/gv.vim',
		cmd = {'GV'},
		requires = {
			{'tpope/vim-fugitive'},
		}
	}
	vim.api.nvim_set_keymap('n', '<leader>gl', ':GV<cr>', {noremap = true})

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
	vim.api.nvim_set_keymap('n', '<leader>gd', ':DiffviewOpen<cr>', {noremap = true})

	-- git blame
	use{'f-person/git-blame.nvim', event = 'BufRead'}

	-- SEARCHING

	use{'subnut/visualstar.vim'}         -- visual star `*` search, or `#` backwards

	-- Telescope for fuzzy searching

	use{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		},
		config = function()
			local actions = require('telescope.actions')
			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							['qq'] = actions.close
						}
					}
				}
			})
		end
	}

	vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {})
	vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>',  {})
	vim.api.nvim_set_keymap('n', '<leader><tab>', '<cmd>Telescope buffers<cr>',    {}) -- change tab

	local telescope_mappings = {
		["<leader>ff"] = {
			"<cmd>Telescope find_files<cr>",
			"Find File",
		},
		["<leader>fr"] = {
			"<cmd>Telescope oldfiles<cr>",
			"Open Recent File"
		}
	}

	wk.register(telescope_mappings)

end)
