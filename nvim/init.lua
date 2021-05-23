-- Vanilla nvim config

-- Options
require'options'
-- Keymaps
-- require'set-keymaps'
-- Netrw
require'netrw-config'
-- let loaded_netrwPlugin = 1 " Do not load netrw

-- Plugins config

require'packer-plugins'

-- Register keymaps through Whick Key plugin
local wk = require'which-key'
local maps = require'key-register'
wk.register(maps.normal)
wk.register(maps.insert, {mode = 'i'})
wk.register(maps.visual, {mode = 'v'})
wk.register(maps.terminal, {mode = 't'})

-- WIP

-- require 'buffers-window'
