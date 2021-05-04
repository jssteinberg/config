-- Plugins via Paq (https://github.com/savq/paq-nvim)
vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require 'paq-nvim'.paq -- Import module and bind `paq` function
paq {'savq/paq-nvim', opt=true}    -- Let Paq manage itself

paq 'editorconfig/editorconfig-vim'  -- auto respect editorconfig files
paq 'blackCauldron7/surround.nvim'   -- surround stuff with stuff (org. tpope/vim-surround)
paq 'bronson/vim-visual-star-search' -- search visual with *
paq 'b3nj5m1n/kommentary'            -- gcc, gc in visual mode, to (un)comment. Lua

-- Statusline
paq 'hoob3rt/lualine.nvim' -- status line
require('lualine').setup{
	options = {
		theme = 'tokyonight',
		section_separators = {'',''},
		component_separators = {'',''},
		icons_enabled = false,
	},
	extensions = {'fzf'},
	sections = {
		lualine_a = {},
		lualine_b = {'diff',},
		lualine_c = {'branch','filename'},
	},
}

-- Colorscheme(s)
paq {'folke/tokyonight.nvim'}
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Align text
paq 'junegunn/vim-easy-align'
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

-- Fuzzy file search (fuzzy search more)
paq {'junegunn/fzf', run='fzf#install()'}
paq 'junegunn/fzf.vim'
vim.api.nvim_set_keymap('n', '<leader>ff', ':FZF<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><tab>', ':Buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('x', '<leader>aa', 'y:Ag <c-r>"', {noremap = true})

-- Treesitter
paq {'nvim-treesitter/nvim-treesitter'}
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
-- uses treesitter
paq 'windwp/nvim-ts-autotag' -- pair tags. Lua
require'nvim-treesitter.configs'.setup {
	autotag = {
		enable = true,
	}
}
paq 'windwp/nvim-autopairs' -- auto pair. Lua
local npairs = require("nvim-autopairs")
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

-- Auto completion
-- https://github.com/hrsh7th/nvim-compe
paq 'hrsh7th/nvim-compe'
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
