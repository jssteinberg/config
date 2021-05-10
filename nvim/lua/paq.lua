-- Plugins via [Paq](https://github.com/savq/paq-nvim)
vim.cmd 'packadd paq-nvim'         -- load paq
local paq = require 'paq-nvim'.paq -- import module and bind `paq` function

paq{'savq/paq-nvim',opt=true}        -- let Paq manage itself
paq{'nvim-lua/plenary.nvim'}         -- lua functions, used by: telescope, gitsigns...
paq{'editorconfig/editorconfig-vim'} -- auto respect editorconfig files
paq{'mmozuras/vim-cursor'}           -- when open buffer, go to previous cursor position
-- Surround & Repeat
paq{'tpope/vim-surround'} -- surround stuff with stuff (org. tpope/vim-surround)
paq{'tpope/vim-repeat'}   -- repeat surround and more

-- Colorscheme(s)
paq{'folke/tokyonight.nvim'}
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = 'night'

-- Comments
paq{'terrortylor/nvim-comment'} -- gcc, gc in visual mode, to (un)comment. Lua
require('nvim_comment').setup({})

-- Align text
paq{'junegunn/vim-easy-align'}
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

-- Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
-- let g:undotree_SetFocusWhenToggle=1
-- nn <silent> <leader>fu :UndotreeToggle<CR>


-- Git
paq 'lewis6991/gitsigns.nvim'
require('gitsigns').setup({})
vim.o.statusline = ' ↯%{get(b:,"gitsigns_head","")} %{get(b:,"gitsigns_status","")}: ' .. require('statusline')
-- git log
paq 'TimUntersberger/neogit'

-- Fuzzy file search (fuzzy search more)
paq{'nvim-lua/popup.nvim'}
paq{'nvim-telescope/telescope.nvim'}
local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				['qq'] = actions.close
			}
		}
	}
}
vim.api.nvim_set_keymap('n', '<leader>ff',    '<cmd>Telescope find_files<cr>', {}) -- find file
vim.api.nvim_set_keymap('n', '<leader>fs',    '<cmd>Telescope live_grep<cr>',  {}) -- find string
vim.api.nvim_set_keymap('n', '<leader><tab>', '<cmd>Telescope buffers<cr>',    {}) -- change tab

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
