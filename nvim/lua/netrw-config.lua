-- No help banner
vim.api.nvim_set_var('netrw_banner', 0)
-- Open current buffer's folder
vim.api.nvim_set_keymap('n', '<leader>fb', ':e %:p:h<cr>', {noremap = true})
