-- Options
-- No help banner
vim.api.nvim_set_var('netrw_banner', 0)
-- Change the copy command. Mostly to enable recursive copy of directories.
vim.api.nvim_set_var('netrw_localcopydircmd', 'cp -r')
-- Change the size of the Netrw window when it creates a split. I think 30% is fine.
vim.api.nvim_set_var('netrw_winsize', 30)

-- Keymaps
-- Open current buffer's folder (make this to command :e% ?)
vim.api.nvim_set_keymap('n', '<leader>f%', ':e %:p:h<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f5', ':e %:p:h<cr>', {noremap = true})
-- Open as file tree
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>vsplit .<cr><cmd>wincmd H<cr><cmd>vertical resize 30<cr>', {noremap = true})

-- Kyemaps in netrw
function keymaps_within_netrw()
	vim.api.nvim_buf_set_keymap(0, 'n', 'h', '-^', {})
end

-- Auto commands
local autocmds = {
	{'filetype', 'netrw', [[lua keymaps_within_netrw()]]},
}
require('utils').create_augroup(autocmds, 'netrw')
