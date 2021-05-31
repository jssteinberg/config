local wk = require'which-key'
local maps = require'keymaps-incl-plugins'

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


	-- ## LSP

	use{
		'neovim/nvim-lspconfig',
		requires = {'kabouzeid/nvim-lspinstall'},
		config = function()
			local function setup_servers()
				require'lspinstall'.setup()
				local servers = require'lspinstall'.installed_servers()
				for _, server in pairs(servers) do
					require'lspconfig'[server].setup{}
				end
			end

			setup_servers()

			-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
			require'lspinstall'.post_install_hook = function ()
				setup_servers() -- reload installed servers
				vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
			end
		end
	}

	-- Auto completion

	-- vim-vsnip
	use{
		'hrsh7th/vim-vsnip',
		requies = {'hrsh7th/vim-vsnip-integ'},
	}
	-- vsnip recommended config
-- 	" Expand
-- 	imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
-- 	smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

-- 	" Expand or jump
-- 	imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
-- 	smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

-- 	" Jump forward or backward
-- 	imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- 	smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- 	imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
-- 	smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

-- 	" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- 	" See https://github.com/hrsh7th/vim-vsnip/pull/50
-- 	nmap        s   <Plug>(vsnip-select-text)
-- 	xmap        s   <Plug>(vsnip-select-text)
-- 	nmap        S   <Plug>(vsnip-cut-text)
-- 	xmap        S   <Plug>(vsnip-cut-text)

-- 	" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
-- 	let g:vsnip_filetypes = {}
-- 	let g:vsnip_filetypes.javascriptreact = ['javascript']
-- 	let g:vsnip_filetypes.typescriptreact = ['typescript']

	-- nvim-compe
	use{
		'hrsh7th/nvim-compe',
		event = 'BufRead',
		config = function()
			vim.o.completeopt = 'menuone,noselect'

			require'compe'.setup{ source = {
				path = true;
				buffer = true;
				calc = true;
				nvim_lsp = true;
				nvim_lua = true;
				vsnip = true;
				ultisnips = false;
			}; }

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

			-- functions for using (s-)tab
			_G.tab_complete = function()
				if vim.fn.pumvisible() == 1 then
					return t '<C-n>'
				elseif vim.fn.call('vsnip#available', {1}) == 1 then
					return t '<Plug>(vsnip-expand-or-jump)'
				elseif check_back_space() then
					return t '<Tab>'
				else
					return vim.fn['compe#complete']()
				end
			end
			_G.s_tab_complete = function()
				if vim.fn.pumvisible() == 1 then
					return t '<C-p>'
				elseif vim.fn.call('vsnip#jumpable', {-1}) == 1 then
					return t '<Plug>(vsnip-jump-prev)'
				else
					return t '<S-Tab>'
				end
			end

			-- bind (s-)tab
			vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
			vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
			vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
			vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
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
						return vim.fn['compe#confirm']('<CR>')
					else
						pears_handle()
					end
				end)
			end)
		end
	}


	-- ## FILETYPES

	-- Lua


	-- ## FILE EXPLORING & SEARCHING

	use{'subnut/visualstar.vim'}         -- visual star `*` search, or `#` backwards

	-- Telescope for fuzzy searching

	use{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		},
		config = function()
			local actions = require('telescope.actions')

			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							[require'keymaps-incl-plugins'.esc_map] = actions.close
						}
					}
				}
			})
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
