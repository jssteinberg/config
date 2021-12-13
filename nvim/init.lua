-- ## Vanilla nvim config
-- Options
require'options'
-- Keymaps
require'keymaps'.init()

-- ## Packages config
-- Netrw
require'packages.netrw'.config()
-- External packages
require'packages'
-- Set colorscheme
require'packages.colors'.set_colo()
