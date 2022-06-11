local M = {}

-- @param {string} bg - e.g. 'day'
M.tokyonight_config = function(bg)
	if not bg or bg == 'dark' then
		vim.g.tokyonight_style = 'night'
		vim.g.tokyonight_transparent = true
	elseif bg == 'light' then
		vim.g.tokyonight_style = 'day'
		vim.g.tokyonight_transparent = false
		vim.g.tokyonight_day_brightness = 0.1
	else
		vim.g.tokyonight_style = bg
		vim.g.tokyonight_transparent = false
	end

	vim.g.tokyonight_italic_comments = false
	vim.g.tokyonight_italic_keywords = false
	vim.g.tokyonight_italic_functions = false
	vim.g.tokyonight_italic_variables = false

	pcall(function ()
		vim.cmd[[colorscheme tokyonight]]
	end)
end

M.iceberg_config = function(bg)
	pcall(function ()
		vim.cmd[[colorscheme iceberg]]
	end)
end

-- @param {string} bg - 'dark', 'light'
M.set_colo = function(bg)
	bg = bg or 'dark'
	M.iceberg_config(bg)
	vim.cmd('set bg=' .. bg)
end

return M
