-- Leader
-- space
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n',' ','',{noremap = true})
vim.api.nvim_set_keymap('x',' ','',{noremap = true})

-- jump to definition (default stinks on various keyboard layouts)
vim.api.nvim_set_keymap('n', '<leader>l', '<c-]>', {noremap = true})

-- Buffers
-- list buffers, open with buffer number
vim.api.nvim_set_keymap('n', '<leader>bl', ':ls<cr>:b', {noremap = true})
-- previous buffer
vim.api.nvim_set_keymap('n', '<leader>bb', '<c-^>', {noremap = true})
vim.api.nvim_set_keymap('t', '<leader>bb', '<c-\\><c-n><c-^>', {noremap = true})
-- prev/next buffer
vim.api.nvim_set_keymap('n', '<tab>', ':bnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader><tab>', ':bprevious<cr>', {noremap = true})

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
-- commit current buffer
vim.api.nvim_set_keymap('n', '<leader>gcc', ':!git add "%" && git commit "%" -m "', {noremap = true})
-- commit all
vim.api.nvim_set_keymap('n', '<leader>gca', ':!git commit -am "', {noremap = true})
-- commit only
vim.api.nvim_set_keymap('n', '<leader>gco', ':!git commit ', {noremap = true})

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

-- Window
vim.api.nvim_set_keymap('n', '<c-w><c-w>', ':vsplit<cr>', {noremap = true})
