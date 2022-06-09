local M = {}

M.config = function()
	local lsp_installer = require('nvim-lsp-installer')

	-- LSP config for buffer
	local on_attach = function(client, bufnr)
		-- require 'lsp_signature'.on_attach()
		M.register_keymaps(client, bufnr)
	end

	-- General LSP config for buffer
	local on_attach_general = function (client, bufnr)
		on_attach(client, bufnr)
		M.register_keymaps(client, bufnr)
		-- Set omnifunc completion to use LSP
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	end

	-- CSS LSP config for buffer
	local on_attach_css = function (client, bufnr)
		on_attach(client, bufnr)
	end

	-- Handler that's called for all installed servers
	lsp_installer.on_server_ready(function(server)
		local capabilities = require('cmp_nvim_lsp').update_capabilities( vim.lsp.protocol.make_client_capabilities() )
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		-- if server.name == 'cssls' then
		-- 	server:setup({ on_attach = on_attach_css })
		-- else
		if server.name == 'stylelint_lsp' then
			server:setup({ 
				on_attach = on_attach_general,
				capabilities = capabilities,
			})
		else
			server:setup({ 
				on_attach = on_attach_general,
				capabilities = capabilities,
			})
		end

		vim.cmd [[ do User LspAttachBuffers ]]
	end)
end

-- Register keymaps per buffer
M.register_keymaps = function (client, bufnr)
	local wk = require'which-key'

	-- Register LSP keymaps for buffer number
	wk.register(require'keymaps'.normal_lsp_buffer_keymaps(bufnr))

	-- Set some keybinds conditional on server capabilities
	-- if client.resolved_capabilities.document_formatting then
	-- 	wk.register({
	-- 		['<leader>lf'] = { '<cmd>lua vim.lsp.buf.formatting()<cr>',
	-- 		'Formatting', buffer = bufnr },
	-- 		['gq'] = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Formatting',
	-- 		buffer = bufnr },
	-- 	})
	-- elseif client.resolved_capabilities.document_range_formatting then
	-- 	wk.register({
	-- 		['<leader>lf'] = { '<cmd>lua vim.lsp.buf.ranger_formatting()<cr>',
	-- 		'Formatting', buffer = bufnr },
	-- 		['gq'] = { '<cmd>lua vim.lsp.buf.ranger_formatting()<cr>',
	-- 		'Formatting', buffer = bufnr },
	-- 	})
	-- end

	-- Unmapped
	-- buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

return M
