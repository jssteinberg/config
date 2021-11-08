local M = {}

M.config = function ()
	-- Options
	-- No help banner
	vim.api.nvim_set_var('netrw_banner', 0)
	-- Change the copy command. Mostly to enable recursive copy of directories.
	vim.api.nvim_set_var('netrw_localcopydircmd', 'cp -r')
	-- Set the size in % of the Netrw window when it creates a split.
	vim.api.nvim_set_var('netrw_winsize', 25) -- %
	-- Preview in vertical split
	vim.api.nvim_set_var('netrw_preview', 1)
	-- Vertical explore to right
	vim.api.nvim_set_var('netrw_altv', 1)
	-- Hide some files
	vim.api.nvim_set_var('netrw_list_hide', '.*.DS_Store$')
end

M.open_project_drawer = function ()
	-- set tree view (will not work if user already changed list style)
	vim.api.nvim_set_var('netrw_liststyle', 3)
	-- vertical explore pwd
	vim.cmd[[ Lexplore ]]
	-- move to left, entire height
	-- vim.cmd[[ wincmd H | vertical resize 40 ]]
end

return M
