-- Plugins via [Paq](https://github.com/savq/paq-nvim)
vim.cmd 'packadd paq-nvim'         -- load paq
local paq = require 'paq-nvim'.paq -- import module and bind `paq` function

paq{'savq/paq-nvim',opt=true}        -- let Paq manage itself
-- paq{'nvim-lua/plenary.nvim'}         -- lua functions, used by: telescope, gitsigns...
-- paq{'nvim-lua/popup.nvim'}           -- popup window functions. Used by telescope...
paq{'editorconfig/editorconfig-vim'} -- auto respect editorconfig files
paq{'mmozuras/vim-cursor'}           -- when open buffer, go to previous cursor position
paq{'subnut/visualstar.vim'}         -- visual star `*` search, or `#` backwards
-- paq{'yamatsum/nvim-cursorline'}      -- highlight word under cursor

-- Whickkey to map keymappings
paq{'folke/which-key.nvim'}
local wk = require("which-key")
wk.setup {}

-- Surround & Repeat
paq{'tpope/vim-surround'} -- surround stuff with stuff (org. tpope/vim-surround)
paq{'tpope/vim-repeat'}   -- repeat surround and more

-- Colorscheme(s)
paq{'folke/tokyonight.nvim'}
-- vim.g.tokyonight_colors = { comment = "green" }
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = 'night'

-- Comments
paq{'terrortylor/nvim-comment'} -- gcc, gc in visual mode, to (un)comment. Lua
require('nvim_comment').setup({})

-- Open URI /search in browser
paq{'tyru/open-browser.vim'}
vim.api.nvim_set_var('netrw_nogx', 1) -- disable netrw's gx mapping.
vim.api.nvim_set_var('openbrowser_default_search', 'duckduckgo')
vim.api.nvim_set_keymap('n', 'gx', '<Plug>(openbrowser-smart-search)', {})
vim.api.nvim_set_keymap('v', 'gx', '<Plug>(openbrowser-smart-search)', {})

-- Align text
paq{'junegunn/vim-easy-align'}
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

-- Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
-- let g:undotree_SetFocusWhenToggle=1
-- nn <silent> <leader>fu :UndotreeToggle<CR>

-- Git
-- paq 'lewis6991/gitsigns.nvim'
-- require('gitsigns').setup({})
-- vim.o.statusline = ' ↯%{get(b:,"gitsigns_head","")} %{get(b:,"gitsigns_status","")}: ' .. require('statusline')
-- fugitive.vim
paq 'tpope/vim-fugitive'
-- log
paq 'junegunn/gv.vim' -- requires vim-fugitive
vim.api.nvim_set_keymap('n', '<leader>gl', ':GV<cr>', {noremap = true})
-- diff view
paq 'sindrets/diffview.nvim'
local cb = require'diffview.config'.diffview_callback
require'diffview'.setup {
	file_panel = {
		use_icons = false
	}
}
vim.api.nvim_set_keymap('n', '<leader>gd', ':DiffviewOpen<cr>', {noremap = true})
-- git blame
paq{'f-person/git-blame.nvim'}

-- Auto completion
paq{'hrsh7th/nvim-compe'}
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

-- Fuzzy file search (fuzzy search more)
-- paq{'nvim-telescope/telescope.nvim'}
-- local actions = require('telescope.actions')
-- require('telescope').setup{
-- 	defaults = {
-- 		mappings = {
-- 			i = {
-- 				['qq'] = actions.close
-- 			}
-- 		}
-- 	}
-- }
-- vim.api.nvim_set_keymap('n', '<leader>ff',    '<cmd>Telescope find_files<cr>', {}) -- find file
-- vim.api.nvim_set_keymap('n', '<leader>fs',    '<cmd>Telescope live_grep<cr>',  {}) -- find string
-- -- vim.api.nvim_set_keymap('n', '<leader><tab>', '<cmd>Telescope buffers<cr>',    {}) -- change tab
-- local telescopeMappings = {
-- 	["<leader>ff"] = {
-- 		"<cmd>Telescope find_files<cr>",
-- 		"Find File",
-- 	},
-- 	["<leader>fr"] = {
-- 		"<cmd>Telescope oldfiles<cr>",
-- 		"Open Recent File"
-- 	},
-- }
-- wk.register(telescopeMappings)

-- Treesitter
paq{'nvim-treesitter/nvim-treesitter',run=':TSUpdate'}
local ts = require 'nvim-treesitter.configs'
ts.setup{ensure_installed = 'maintained', highlight = {enable = true}}
-- uses treesitter
-- auto pair tags
paq{'windwp/nvim-ts-autotag'}
require'nvim-treesitter.configs'.setup {
	autotag = {
		enable = true
	}
}
-- auto pair pairs
paq{'windwp/nvim-autopairs'}
local npairs = require('nvim-autopairs')
npairs.setup({
	check_ts = true,
	ts_config = {
		lua = {'string'},-- it will not add pair on that treesitter node
		javascript = {'template_string'},
		java = false,-- don't check treesitter on java
	}
})
require('nvim-treesitter.configs').setup {
	autopairs = {enable = true}
}
