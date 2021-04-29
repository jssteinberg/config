-- Plugins via Paq (https://github.com/savq/paq-nvim)
vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require 'paq-nvim'.paq  -- Import module and bind `paq` function
paq {'savq/paq-nvim', opt=true}     -- Let Paq manage itself

-- Colorschemes
paq {'folke/tokyonight.nvim'}
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

paq 'editorconfig/editorconfig-vim' -- auto respect editorconfig files
paq 'tpope/vim-surround' -- surround stuff with stuff
paq 'tpope/vim-repeat' -- repeat surround and more
paq 'bronson/vim-visual-star-search' -- search visual with *
paq 'tomtom/tcomment_vim' -- gcc in normal mode, gc in visual mode, to (un)comment
paq '9mm/vim-closer' -- auto close stuff -- doesn't seem too good

paq 'junegunn/vim-easy-align'
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

paq {'junegunn/fzf', run='fzf#install()'}
paq 'junegunn/fzf.vim'
vim.api.nvim_set_keymap('n', '<leader>ff', ':FZF<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><tab>', ':Buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('x', '<leader>aa', 'y:Ag <c-r>"', {noremap = true})

paq {'nvim-treesitter/nvim-treesitter'}
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}
