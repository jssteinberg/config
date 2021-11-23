local M = {}

-- @param {string} bg - e.g. 'day'
M.config = function(bg)
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

	vim.g.tokyonight_italic_comments = false
	vim.g.tokyonight_italic_keywords = false
	vim.g.tokyonight_italic_functions = false
	vim.g.tokyonight_italic_variables = false
	vim.g.tokyonight_colors = {
		comment = '#a9b1d6'
	}

	vim.cmd[[colorscheme tokyonight]]
end

-- @param {string} bg - 'dark', 'light'
M.set_colo = function(bg)
	M.config(bg)
	vim.cmd('set bg=' .. bg)
end

return M
