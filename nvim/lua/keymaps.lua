function setKeymaps()
	-- alternate buffer from terminal
	vim.api.nvim_set_keymap('t', '<leader>bb', '<c-\\><c-n><c-^>', {noremap = true})

	-- Editing
	-- edit indents in visual without leaving visual
	vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})
	vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})

	-- Escape (qq, ZZ)
	-- qq in insert
	vim.api.nvim_set_keymap('i', 'qq', '<esc>', {noremap = true})
	-- qq in visual (x)
	vim.api.nvim_set_keymap('x', 'qq', '<esc>', {noremap = true})
	 -- qq in terminal
	vim.api.nvim_set_keymap('t', 'qq', '<c-\\><c-n>', {noremap = true})
	-- ZZ for escape and write in insert mode
	vim.api.nvim_set_keymap('i', 'ZZ', '<esc>:write<cr>', {noremap = true})
end

return setKeymaps
