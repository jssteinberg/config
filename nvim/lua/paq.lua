-- Plugins via Paq (https://github.com/savq/paq-nvim)
vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require 'paq-nvim'.paq -- Import module and bind `paq` function
paq {'savq/paq-nvim', opt=true}    -- Let Paq manage itself

paq 'editorconfig/editorconfig-vim' -- auto respect editorconfig files
paq 'blackCauldron7/surround.nvim'  -- surround stuff with stuff (org. tpope/vim-surround)
paq 'b3nj5m1n/kommentary'           -- gcc, gc in visual mode, to (un)comment. Lua

-- Colorscheme(s)
paq {'folke/tokyonight.nvim'}
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"

-- Align text
paq 'junegunn/vim-easy-align'
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

-- Fuzzy file search (fuzzy search more)
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
vim.api.nvim_set_keymap('n', '<leader><tab>', '<cmd>Telescope buffers<cr>', {})
-- paq {'junegunn/fzf', run='fzf#install()'}
-- paq 'junegunn/fzf.vim'
-- vim.api.nvim_set_keymap('n', '<leader>ff', ':FZF<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader><tab>', ':Buffers<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('x', '<leader>aa', 'y:Ag <c-r>"', {noremap = true})

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
