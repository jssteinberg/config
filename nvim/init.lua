-- Vanilla nvim config

-- Options
require'options'
-- Keymaps
require'set-keymaps'
-- Netrw
require'netrw-config'

-- Plugins config

require'packer-plugins'
-- Register keymaps through Whick Key plugin
local wk = require('which-key')
wk.register(require'key-register'.normal_maps)

-- WIP

-- require 'buffers-window'
