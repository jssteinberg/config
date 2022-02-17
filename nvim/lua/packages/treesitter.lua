local M = {}

M.config = function ()
	require('nvim-treesitter.configs').setup{
		-- Treesitter
		highlight = {
			enable = true,
			disable = {'vim'}
		},
		autotag = { enable = true },
		-- Context aware comment toggling (needs a toggler plugin)
		context_commentstring = { enable = true },
		-- Location and syntax aware text objects:
		textsubjects = {
			enable = true,
			prev_selection = '<bs>', -- (Optional) keymap to select the previous selection
			keymaps = {
				['<cr>'] = 'textsubjects-smart',
				[','] = 'textsubjects-container-outer',
				['.'] = 'textsubjects-container-inner',
			},
		},
	}

	-- auto close tags (using treesittter)
	require('nvim-ts-autotag').setup()
	vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = {
				spacing = 5,
				severity_limit = 'Warning',
			},
			update_in_insert = true,
		}
	)
end

return M
