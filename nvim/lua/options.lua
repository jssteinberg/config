local M = {}

M.to_not_load = function()
	-- Disable not used builtin Vim packages
	vim.g.loaded_2html_plugin = 1
	vim.g.loaded_gzip = 1
	vim.g.loaded_man = 1
	vim.g.loaded_matchit = 1
	vim.g.loaded_matchparen = 1
	vim.g.loaded_spec = 1
	vim.g.loaded_tar = 1
	vim.g.loaded_tarPlugin = 1
	vim.g.loaded_zip = 1
	vim.g.loaded_zipPlugin = 1
	-- vim.api.nvim_set_var("netrw_nogx", 1) -- disable netrw's gx mapping.
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

return M
