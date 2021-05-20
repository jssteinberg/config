-- Vanilla nvim config

-- Options
require'options'
-- Keymaps
require'set-keymaps'
-- Netrw
require'netrw-config'

-- Plugins
-- loading plugins and plugins' config after vanilla config so it can overwrite if necessary

require'packer-plugins'

-- register keymaps through Whick Key plugin
local wk = require('which-key')
wk.register(require'key-register'.normal_maps)

-- WIP
-- require 'buffers-window'
