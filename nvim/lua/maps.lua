-- leader
vim.api.nvim_set_keymap('n', '<space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables

-- esc mappings
vim.api.nvim_set_keymap('i', 'qq', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('x', 'qq', '<esc>', {noremap = true})
vim.api.nvim_set_keymap('t', 'qq', '<c-\\><c-n>', {noremap = true})

-- navigate buffers
vim.api.nvim_set_keymap('n', '<leader>bb', '<c-^>', {noremap = true})

-- netrw
vim.api.nvim_set_keymap('n', '<leader>fb', ':e %:p:h<cr>', {noremap = true})
