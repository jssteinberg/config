local M = {}

M.config = function ()
	
end

M.use = function ()
	-- Some startup magic from https://github.com/ecosse3/nvim/blob/master/lua/plugins.lua
	local execute = vim.api.nvim_command

	-- check if packer is installed (~/.local/share/nvim/site/pack)
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	local compile_path = install_path .. "/plugin/packer_compiled.lua"
	local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

	if not is_installed then
		if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
			execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
			execute("packadd packer.nvim")
			print("Installed packer.nvim.")
			is_installed = 1
		end
	end

	-- Packer commands
	vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
	vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
	vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
	vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
	vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

	local packer = nil
	if not is_installed then return end
	if packer == nil then
		packer = require('packer')
		packer.init({
			-- we don't want the compilation file in '~/.config/nvim'
			compile_path = compile_path
		})
	end

	return packer.use
end

return M