local nvim_utils = require('utils')

-- Options
-- No help banner
vim.api.nvim_set_var('netrw_banner', 0)
-- Change the copy command. Mostly to enable recursive copy of directories.
vim.api.nvim_set_var('netrw_localcopydircmd', 'cp -r')
-- Set the size in % of the Netrw window when it creates a split.
vim.api.nvim_set_var('netrw_winsize', 25) -- %
-- Preview in vertical split
vim.api.nvim_set_var('netrw_preview', 1)

-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>fe', ':edit .<cr>', {noremap = true})
-- Open current buffer's folder (make this to command :e% ?)
vim.api.nvim_set_keymap('n', '<leader>f%', ':edit %:p:h<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f5', ':edit %:p:h<cr>', {noremap = true})
-- Open as file tree
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>Lexplore .<cr><cmd>vertical resize 30<cr>', {noremap = true})

-- Kyemaps in netrw
function netrw_buffer_keymaps()
	-- Move up one directory level
	vim.api.nvim_buf_set_keymap(0, 'n', 'h', '-^', {})
	-- Open file or directory
	vim.api.nvim_buf_set_keymap(0, 'n', 'l', '<cr>', {})
end

function set_previewwindow()
	if vim.api.nvim_get_option_info('filetype') ~= 'netrw' then
		vim.wo.previewwindow = true
	end
end

-- Auto commands
nvim_utils.create_augroup({
	-- Set keymaps for netrw buffer
	{'filetype', 'netrw', [[lua netrw_buffer_keymaps()]]},
	-- {'BufEnter', '*', [[lua set_previewwindow()]]},
}, 'netrw')
