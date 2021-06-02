local M = {}

M.tokyonight_config = function()
	vim.cmd[[colorscheme tokyonight]]
	vim.api.nvim_set_var('tokyonight_style', 'night')
	vim.api.nvim_set_var('tokyonight_sidebars', {'terminal', 'fugitive'})
end

return M
