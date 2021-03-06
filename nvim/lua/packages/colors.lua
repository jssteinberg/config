local M = {}

-- @param {string} bg - e.g. 'day'
M.tokyonight = function(bg)
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

M.iceberg = function(bg)
	pcall(function ()
		vim.cmd("colorscheme iceberg")
		vim.cmd("set termguicolors")
	end)
end

M.vim_dim = function(bg)
	pcall(function ()
		vim.cmd("set notermguicolors")
		vim.cmd("colorscheme dim")
	end)
end

-- @param {string} bg - 'dark', 'light'
M.set_colo = function(bg)
	bg = bg or 'dark'
	M.iceberg(bg)
	vim.cmd("set background=" .. bg)
end

return M
