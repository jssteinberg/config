-- Mappings for nvim without plugins (note that they may be repeated in keymaps-incl-plugins)

local keybindings = require'keymaps-incl-plugins'

keybindings.setLeader()

-- escape terminal
vim.api.nvim_set_keymap('t', keybindings.esc_map, '<c-\\><c-n>', {noremap = true})
-- alternate buffer from terminal
-- vim.api.nvim_set_keymap('t', maps.buffer_alternate_map, '<c-\\><c-n><c-^>', {noremap = true})
