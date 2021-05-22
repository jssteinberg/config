-- map - Function for mapping that just makes the keymappings more readable
-- mode, action, mapping, options
local map = function(mode, action, mapping, opt)
	vim.api.nvim_set_keymap(mode, mapping, action, opt)
end

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

	-- Git
	-- status
	vim.api.nvim_set_keymap('n', '<leader>gs', ':exe "!git status " . shellescape(getcwd())<cr>', {noremap = true})
	-- (TODO: should these be commands?:)
	-- add
	vim.api.nvim_set_keymap('n', '<leader>ga', ':!git add ', {noremap = true})
	-- commit current buffer
	vim.api.nvim_set_keymap('n', '<leader>gcc', ':!git add "%" && git commit "%" -m "', {noremap = true})
	-- commit all
	vim.api.nvim_set_keymap('n', '<leader>gca', ':!git commit -am "', {noremap = true})
	-- commit only
	vim.api.nvim_set_keymap('n', '<leader>gc<space>', ':!git commit ', {noremap = true})
end

return setKeymaps
