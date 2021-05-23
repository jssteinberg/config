-- Function setMapleaderSpace sets mapleader to <space>
function setMapleaderSpace()
	vim.g.mapleader = ' '
	vim.api.nvim_set_keymap('n',' ','',{noremap = true})
	vim.api.nvim_set_keymap('x',' ','',{noremap = true})
end

setMapleaderSpace()
