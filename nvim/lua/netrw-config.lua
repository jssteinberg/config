-- Options
-- No help banner
vim.api.nvim_set_var('netrw_banner', 0)
-- Change the copy command. Mostly to enable recursive copy of directories.
vim.api.nvim_set_var('netrw_localcopydircmd', 'cp -r')
-- Set the size in % of the Netrw window when it creates a split.
vim.api.nvim_set_var('netrw_winsize', 25) -- %
-- Preview in vertical split
vim.api.nvim_set_var('netrw_preview', 1)

-- Kyemaps in netrw
function netrw_buffer_keymaps()
	-- Move up one directory level
	vim.api.nvim_buf_set_keymap(0, 'n', 'h', '-^', {})
	-- Open file or directory
	vim.api.nvim_buf_set_keymap(0, 'n', 'l', '<cr>', {})
end

-- Auto commands
require 'utils'.create_augroup({
	-- Set keymaps for netrw buffer
	{'FileType', 'netrw', [[lua netrw_buffer_keymaps()]]},
}, 'netrw')
