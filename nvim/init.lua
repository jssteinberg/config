-- config vanilla nvim
require 'options'
require 'keymaps'
require 'statusline'
require 'netrw'

-- check if file is changed on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
-- vim.api.nvim_exec([[ autocmd! FocusGained,BufEnter * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | edit | endif ]], false)

-- load plugins and plugins' config
require 'paq' -- plugins via paq
-- require 'packer'
