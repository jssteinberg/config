-- Vanilla nvim config

-- Options
require 'options'
-- Keymaps
require 'set-keymaps'
-- Netrw
require 'netrw-config'

-- Plugins

-- loading plugins and plugins' config after vanilla nvim config so it can
-- overwrite vanilla config if necessary, but there's a default vanilla config
-- in case plugins are changed
-- require 'paq-plugins' -- plugins via paq
require 'packer-plugins'

-- WIP
-- require 'buffers-window'

-- vim.cmd "highlight StatusEnd guifg=#000000 guibg=#ffffff"
