local maps = require'key-register'

-- alternate buffer from terminal
vim.api.nvim_set_keymap('t', maps.buffer_alternate_map, '<c-\\><c-n><c-^>', {noremap = true})
vim.api.nvim_set_keymap('t', maps.esc_map, '<c-\\><c-n>', {noremap = true})
