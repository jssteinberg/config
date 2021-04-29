-- https://github.com/wbthomason/packer.nvim

-- Ensure packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
-- Note that this will install packer as an opt plugin; if you want packer to be a start plugin, you must modify the value of install_path in the above snippet.

-- Only required if you have packer configured as `opt`:
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged:
vim._update_package_paths()

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Simple plugins can be specified as strings
	use '9mm/vim-closer'

	-- Load on a combination of conditions: specific filetypes or commands
	-- Also run code after load (see the "config" key)
	use {
		'w0rp/ale',
		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
		cmd = 'ALEEnable',
		config = 'vim.cmd[[ALEEnable]]'
	}

	-- Plugins can have post-install/update hooks
	use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

	-- Post-install/update hook with neovim command
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Use specific branch, dependency and run lua file after load
	use {
		'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- Use dependency and run lua function after load
	use {
		'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	-- You can specify multiple plugins in a single call
	use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

	-- You can alias plugin names
	use {'dracula/vim', as = 'dracula'}
end)
