-- Mappings for nvim without plugins (note that they may be repeated in keymaps-incl-plugins.lua)

local keybindings = require'keymaps-incl-plugins'

keybindings.setLeader()

-- Terminal
-- escape terminal
vim.api.nvim_set_keymap('t', keybindings.esc_map, '<c-\\><c-n>', {noremap = true})
-- open terminal in insert
vim.api.nvim_set_keymap('n', '<leader>T', ':terminal<cr>i', {noremap = true})
-- alternate buffer from terminal
-- vim.api.nvim_set_keymap('t', maps.buffer_alternate_map, '<c-\\><c-n><c-^>', {noremap = true})

-- Jump
-- jump to definition (default stinks for many non-US keyboard layouts)
vim.api.nvim_set_keymap('n', '<leader>9', '<c-]>', {noremap = true})
-- add c-i, c-o for consistency
vim.api.nvim_set_keymap('n', '<leader>o', '<c-o>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>i', '<c-i>', {noremap = true})

-- Buffers, windows and tabs
-- previous buffer
vim.api.nvim_set_keymap('n', '<leader>bb', '<c-^>', {noremap = true})
-- choose buffer in pwd
vim.api.nvim_set_keymap('n', '<tab>', '<cmd>buffer <c-r>=expand(getcwd())<cr>/**/', {noremap = true})
vim.api.nvim_set_keymap('n', '<s-tab>', '<cmd>buffer <c-r>=expand(getcwd())<cr>/**/', {noremap = true})

-- Escape
-- qq in insert
vim.api.nvim_set_keymap('i', keybindings.esc_map, '<esc>', {noremap = true})
-- qq in visual (x)
vim.api.nvim_set_keymap('x', keybindings.esc_map, '<esc>', {noremap = true})

-- Files
-- wild find
vim.api.nvim_set_keymap('n', '<leader>ff', ':edit **/', {noremap = true})

-- Search
-- nohlsearch
vim.api.nvim_set_keymap('n', '<cr>', ':nohlsearch<cr>', {noremap = true})
