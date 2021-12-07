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
--require('packer').startup(function(use)
--	use{'wbthomason/packer.nvim'}
--end)
