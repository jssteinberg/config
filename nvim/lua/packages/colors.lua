local M = {}

-- @param {string} bg - e.g. 'day'
M.tokyonight_config = function(bg)
	vim.cmd[[colorscheme tokyonight]]
	-- vim.api.nvim_set_var('tokyonight_sidebars', {'terminal', 'fugitive'})

	if not bg or bg == 'dark' then
		vim.g.tokyonight_style = 'night'
		vim.g.tokyonight_transparent = true
	elseif bg == 'light' then
		vim.g.tokyonight_style = 'day'
		vim.g.tokyonight_transparent = false
	else
		vim.g.tokyonight_style = bg
		vim.g.tokyonight_transparent = false
	end
end

-- @param {string} bg - 'dark', 'light'
M.setColo = function(bg)
	M.tokyonight_config(bg)
	vim.cmd('set bg=' .. bg)
end

return M
