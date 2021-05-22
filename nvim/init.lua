-- Vanilla nvim config

-- Options
require'options'
-- Keymaps
require'set-keymaps'
-- Netrw
require'netrw-config'
-- let loaded_netrwPlugin = 1 " Do not load netrw

-- Plugins config

require'packer-plugins'
-- Register keymaps through Whick Key plugin
local wk = require('which-key')
wk.register(require'key-register'.normal_maps)
wk.register(require'key-register'.normal_leader_maps)

-- WIP

-- require 'buffers-window'
