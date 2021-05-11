-- map - Function for mapping that just makes the keymappings more readable
-- mode, action, mapping, options
local map = function(mode, action, mapping, opt)
	vim.api.nvim_set_keymap(mode, mapping, action, opt)
end

-- mappings variable - should be readable and usable for the Whichkey plugin
-- Whichkey format
-- wk.register({
-- 	["<leader>f"] = { name = "+file" },
-- 	["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
-- 	["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
-- 	["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
-- })
local mappings = {
	["<leader>f"] = {
		name = "+file"
	},
	["<leader>ff"] = {
		"<cmd>Telescope find_files<cr>",
		"Find File",
	},
	["<leader>fr"] = {
		"<cmd>Telescope oldfiles<cr>",
		"Open Recent File"
	},
}

function setKeymaps()
	-- jump to definition (default stinks on various keyboard layouts)
	map('n', '<c-]>', '<leader>l', {noremap = true})

	-- Buffers, windows and tabs
	-- list buffers, open with buffer number
	vim.api.nvim_set_keymap('n', '<leader>bl', ':buffers<cr>:buffer ', {noremap = true})
	vim.api.nvim_set_keymap('n', '<leader><tab>', ':buffers<cr>:buffer **/', {noremap = true}) -- (or use: ':call feedkeys(':b<space>**/*', 't')<cr>')
	-- tab for every buffer
	vim.api.nvim_set_keymap('n', '<leader>bt', ':tab sball<cr>', {noremap = true})
	-- previous buffer
	vim.api.nvim_set_keymap('n', '<leader>bb', '<c-^>', {noremap = true})
	vim.api.nvim_set_keymap('t', '<leader>bb', '<c-\\><c-n><c-^>', {noremap = true})
	-- prev/next buffer
	vim.api.nvim_set_keymap('n', '<tab>', ':bnext | file!<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<s-tab>', ':bprevious | file!<cr>', {noremap = true})
	-- vertical split
	vim.api.nvim_set_keymap('n', '<c-w>w', ':vsplit<cr>', {noremap = true})
	vim.api.nvim_set_keymap('n', '<c-w><c-w>', ':vsplit<cr>', {noremap = true})

	-- Completion
	-- tab for buffer completion
	vim.api.nvim_set_keymap('i', '<tab>', '<c-n>', {noremap = true})
	vim.api.nvim_set_keymap('i', '<s-tab>', '<c-p>', {noremap = true})

	-- Escape
	-- qq in insert
	vim.api.nvim_set_keymap('i', 'qq', '<esc>', {noremap = true})
	-- qq in visual (x)
	vim.api.nvim_set_keymap('x', 'qq', '<esc>', {noremap = true})
	 -- qq in terminal
	vim.api.nvim_set_keymap('t', 'qq', '<c-\\><c-n>', {noremap = true})

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

	-- Files
	-- wild find
	vim.api.nvim_set_keymap('n', '<leader>ff', ':edit **/', {noremap = true})

	-- Terminal
	-- open terminal in insert
	vim.api.nvim_set_keymap('n', '<leader>ot', ':terminal<cr>i', {noremap = true})

	-- Search
	-- visual star
	vim.api.nvim_set_keymap('x', '*', 'y/<c-r><cr>', {noremap = true})
	-- nohlsearch
	vim.api.nvim_set_keymap('n', '<cr>', ':nohlsearch<cr>', {noremap = true})
end

return setKeymaps
