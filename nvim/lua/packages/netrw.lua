local M = {}

M.config = function ()
	-- Options
	-- No help banner
	vim.api.nvim_set_var('netrw_banner', 0)
	-- Recursive rm and cp
	vim.api.nvim_set_var('netrw_localrmdir', 'rm -r')
	vim.api.nvim_set_var('netrw_localcopydircmd', 'cp -r')
	-- Set the size in % of the Netrw window when it creates a split.
	vim.api.nvim_set_var('netrw_winsize', 25) -- %
	-- Preview in vertical split
	vim.api.nvim_set_var('netrw_preview', 1)
	-- Vertical explore to right
	-- vim.api.nvim_set_var('netrw_altv', 1)
	-- Hide some files
	vim.api.nvim_set_var('netrw_list_hide', '.*.DS_Store$')
end

return M
