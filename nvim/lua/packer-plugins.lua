require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use{'editorconfig/editorconfig-vim'} -- auto respect editorconfig files
	use{'mmozuras/vim-cursor'}           -- when open buffer, go to previous cursor position
	use{'subnut/visualstar.vim'}         -- visual star `*` search, or `#` backwards

	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Whickkey to map keymappings
	use{'folke/which-key.nvim'}
	local wk = require("which-key")
	wk.setup {}

	-- Surround & Repeat
	use{'tpope/vim-surround'} -- surround stuff with stuff (org. tpope/vim-surround)
	use{'tpope/vim-repeat'}   -- repeat surround and more

	-- Colorscheme(s)
	use{'folke/tokyonight.nvim'}
	-- vim.g.tokyonight_colors = { comment = "green" }
	vim.cmd[[colorscheme tokyonight]]
	vim.g.tokyonight_style = 'night'

	-- Comments
	use{'terrortylor/nvim-comment'} -- gcc, gc in visual mode, to (un)comment. Lua
	require('nvim_comment').setup({})

	-- Open URI /search in browser
	use{'tyru/open-browser.vim'}
	vim.api.nvim_set_var('netrw_nogx', 1) -- disable netrw's gx mapping.
	vim.api.nvim_set_var('openbrowser_default_search', 'duckduckgo')
	vim.api.nvim_set_keymap('n', 'gx', '<Plug>(openbrowser-smart-search)', {})
	vim.api.nvim_set_keymap('v', 'gx', '<Plug>(openbrowser-smart-search)', {})

	-- Align text
	use{'junegunn/vim-easy-align', cmd = {'<Plug>(EasyAlign)'}}
	vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
	vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

	-- Git
	use{'tpope/vim-fugitive', cmd = {'G', 'Git'}}
	-- log
	use{'junegunn/gv.vim', cmd = {'GV'}} -- requires vim-fugitive
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
	use{'f-person/git-blame.nvim'}

	-- Auto completion
	use{'hrsh7th/nvim-compe'}
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
			nvim_lua = true;
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
	vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
	vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

end)
