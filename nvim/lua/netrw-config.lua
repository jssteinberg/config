-- Options
-- No help banner
vim.api.nvim_set_var('netrw_banner', 0)
-- Change the copy command. Mostly to enable recursive copy of directories.
vim.api.nvim_set_var('netrw_localcopydircmd', 'cp -r')
-- Set the size in % of the Netrw window when it creates a split.
vim.api.nvim_set_var('netrw_winsize', 25) -- %
-- Preview in vertical split
vim.api.nvim_set_var('netrw_preview', 1)

-- Auto commands
require'utils'.create_augroup({
	{'FileType', 'netrw', 'setlocal bufhidden=delete'},
}, 'netrw')
