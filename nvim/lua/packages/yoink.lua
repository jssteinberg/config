local M = {}

M.init = function()
	vim.api.nvim_set_var('yoinkSavePersistently', 1)
	vim.api.nvim_set_keymap('n', '<c-p>', '<Plug>(YoinkPostPasteSwapBack)', {})
	vim.api.nvim_set_keymap('n', '<c-n>', '<Plug>(YoinkPostPasteSwapForward)', {})
	vim.api.nvim_set_keymap('n', 'p', '<Plug>(YoinkPaste_p)', {})
	vim.api.nvim_set_keymap('n', 'P', '<Plug>(YoinkPaste_P)', {})
	-- vim.api.nvim_set_keymap('n', 'gp', '<Plug>(YoinkPaste_gp)', {})
	-- vim.api.nvim_set_keymap('n', 'gP', '<Plug>(YoinkPaste_gP)', {})
	require'which-key'.register( {
		["gp"] = { "<Plug>(YoinkPaste_gp)", '"p", but leave the cursor' },
		["gP"] = { "<Plug>(YoinkPaste_gP)", '"P", but leave the cursor' },
	}, { mode = 'n', noremap = false, })
end

return M
