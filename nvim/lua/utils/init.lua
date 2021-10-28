local M = {}
local cmd = vim.cmd

-- Auto commands
-- Use:
-- require'utils'.create_augroup({
-- 	{'FileType,BufRead,WinEnter', 'netrw', 'setlocal number relativenumber'},
-- }, 'group_name')
function M.create_augroup(autocmds, name)
	cmd('augroup ' .. name)
	cmd('autocmd!')
	for _, autocmd in ipairs(autocmds) do
		cmd('autocmd ' .. table.concat(autocmd, ' '))
	end
	cmd('augroup END')
end

return M
