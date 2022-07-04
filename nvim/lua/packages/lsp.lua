local M = {}

M.format_on_save = "null-ls"

-- Register keymaps per buffer
M.register_keymaps = function(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting_sync, bufopts)
	vim.keymap.set('n', 'gq', vim.lsp.buf.formatting_sync, bufopts)

	vim.keymap.set('n', '<cr>', vim.diagnostic.open_float, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>lwl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

	vim.keymap.set('n', '<leader>lq', vim.diagnostic.setqflist, bufopts)
	vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist, bufopts)
end

M.config = function()
	-- require("lsp-format").setup {}

	local lsp_installer = require('nvim-lsp-installer')

	-- General LSP config for buffer
	local on_attach_general = function(client, bufnr)
		M.register_keymaps(bufnr)
		-- Use LSP completion
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	end

	-- Handler that's called for all installed servers
	lsp_installer.on_server_ready(function(server)
		-- if string.find(M.format_on_save, server.name) then
		-- 	server:setup({ on_attach = function(client, bufnr)
		-- 		on_attach_general(client, bufnr)
		-- 		require "lsp-format".on_attach(client)
		-- 	end })
		-- else
		server:setup({ on_attach = on_attach_general, })
		-- end

		vim.cmd [[ do User LspAttachBuffers ]]
	end)
end

return M
