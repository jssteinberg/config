local M = {}

M.to_not_load = function()
	-- disable builtin vim packages
	vim.g.loaded_gzip = 0
	vim.g.loaded_tar = 0
	vim.g.loaded_tarPlugin = 0
	vim.g.loaded_zipPlugin = 0
	vim.g.loaded_2html_plugin = 0
	vim.g.loaded_netrw = 0
	vim.g.loaded_netrwPlugin = 0
	vim.g.loaded_matchit = 0
	vim.g.loaded_matchparen = 0
	vim.g.loaded_spec = 0
end

return M
