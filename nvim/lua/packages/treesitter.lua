local M = {}

M.config = function ()
	require('nvim-treesitter.configs').setup({
		ignore_install = { 'vim', 'lua' },
		highlight = {
			enable = true,
			disable = { 'vim', 'lua' },
		},
		autotag = { enable = true },
	})

	-- Auto close tags plugin (using treesittter)

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
