local M = {}

M.config = function ()
	-- If using a Neovim version earlier than 0.6.0, do not source the default filetype.vim
	vim.g.did_load_filetypes = 1

	require('filetype').setup({ overrides = { extensions = {
			astro = 'html',
			style = 'scss',
			postcss = 'scss',
			mdx = 'markdown',
			gmi = 'markdown',
			fish = 'sh',
		},
	}})
end

return M
