local M = {}

M.tab = function(terminal, dir)
	-- terminal fallbaks to "main"
	local name = terminal or "main"
	local wd = dir or vim.fn.getcwd()

	return function()
		vim.fn["termcwd#tabGet"](name, wd)
	end
end

M.split = function(terminal, dir)
	-- terminal fallbaks to "main"
	local name = terminal or "main"
	local wd = dir or vim.fn.getcwd()

	return function()
		vim.fn["termcwd#splitGet"](name, wd)
	end
end

-- alias M.sp to M.split
M.sp = M.split

return M
