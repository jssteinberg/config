local M = {}

M.config = function()
	vim.api.nvim_set_var('netrw_nogx', 1) -- disable netrw's gx mapping.
	vim.api.nvim_set_var('openbrowser_default_search', 'duckduckgo')
	vim.api.nvim_set_keymap('n', 'gx', '<Plug>(openbrowser-smart-search)', {})
	vim.api.nvim_set_keymap('v', 'gx', '<Plug>(openbrowser-smart-search)', {})
end

return M
