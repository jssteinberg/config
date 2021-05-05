-- Plugins via Paq (https://github.com/savq/paq-nvim)
vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require 'paq-nvim'.paq -- Import module and bind `paq` function
paq {'savq/paq-nvim', opt=true}    -- Let Paq manage itself

paq 'editorconfig/editorconfig-vim' -- auto respect editorconfig files
paq 'b3nj5m1n/kommentary'           -- gcc, gc in visual mode, to (un)comment. Lua
paq 'nvim-lua/plenary.nvim'         -- lua functions, used by: telescope, gitsigns...

-- Align text
paq 'junegunn/vim-easy-align'
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

-- Colorscheme(s)
paq {'folke/tokyonight.nvim'}
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"

-- Git
paq 'lewis6991/gitsigns.nvim'
require('gitsigns').setup{
	keymaps = {
		-- ['n <leader>hn'] = '<cmd>lua require"gitsigns".next_hunk()<CR>',
		['n <leader>hn'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
		['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
	}
}
vim.o.statusline = ' ↯%{get(b:,"gitsigns_head","")} %{get(b:,"gitsigns_status","")} ' .. vim.o.statusline

-- Surround
paq 'blackCauldron7/surround.nvim'  -- surround stuff with stuff (org. tpope/vim-surround)
require("surround").setup({prefix = 'S'})

-- Fuzzy file search (fuzzy search more)
paq 'nvim-lua/popup.nvim'
paq 'nvim-telescope/telescope.nvim'
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
vim.api.nvim_set_keymap('n', '<leader><tab>', '<cmd>Telescope buffers<cr>', {})

-- Treesitter
paq {'nvim-treesitter/nvim-treesitter'}
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
-- uses treesitter
-- auto pair tags
paq 'windwp/nvim-ts-autotag'
require'nvim-treesitter.configs'.setup {
	autotag = {
		enable = true,
	}
}
-- auto pair pairs
paq 'windwp/nvim-autopairs'
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
