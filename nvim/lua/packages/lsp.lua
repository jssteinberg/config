local M = {}

M.config = function()
	local lsp_installer = require('nvim-lsp-installer')
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- LSP config for buffer
	local on_attach = function(client, bufnr)
		require 'lsp_signature'.on_attach()
		M.register_keymaps(client, bufnr)
	end

	-- General LSP config for buffer
	local on_attach_general = function (client, bufnr)
		on_attach(client, bufnr)
		-- Set omnifunc completion to use LSP
		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	end

	-- CSS LSP config for buffer
	local on_attach_css = function (client, bufnr)
		on_attach(client, bufnr)
	end

	-- Register a handler that will be called for all installed servers.
	lsp_installer.on_server_ready(function(server)
		if server.name == 'cssls' then
			server:setup({ on_attach = on_attach_css })
		else
			-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
			server:setup({ on_attach = on_attach_general })
		end

		vim.cmd [[ do User LspAttachBuffers ]]
	end)
end

-- register keymaps per buffer
M.register_keymaps = function (client, bufnr)
	local wk = require'which-key'

	-- Register LSP keymaps for buffer number
	wk.register({
		['<cr>'] = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
		'Show flag diagnostics', buffer = bufnr },

		K = { '<cmd>lua vim.lsp.buf.hover()<cr>',
		'Hover info', buffer = bufnr },

		['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<cr>',
		'Declaration (LSP)', buffer = bufnr },

		['gd'] = { '<cmd>lua vim.lsp.buf.definition()<cr>',
		'Definition (LSP)', buffer = bufnr },

		['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<cr>',
		'Implementation (LSP)', buffer = bufnr },

		['gr'] = { '<cmd>lua vim.lsp.buf.references()<cr>',
		'References of under cursor (LSP)', buffer = bufnr },

		['<leader>l'] = { name =
			'lsp',

			a = { '<cmd>lua vim.lsp.buf.code_action()<cr>',
			'Action', buffer = bufnr },

			D = { '<cmd>lua vim.lsp.buf.declaration()<cr>',
			'Declaration', buffer = bufnr },

			d = { '<cmd>lua vim.lsp.buf.definition()<cr>',
			'Definition', buffer = bufnr },

			h = { '<cmd>lua vim.lsp.buf.hover()<cr>',
			'Hover info', buffer = bufnr },

			i = { '<cmd>lua vim.lsp.buf.implementation()<cr>',
			'Implementation', buffer = bufnr },

			l = { '<cmd>lua vim.lsp.buf.show_line_diagnostics()<cr>',
			'Line diagnostics info (for flag)', buffer = bufnr },

			n = { '<cmd>lua vim.lsp.diagnostics.goto_next()<cr>',
			'Next flag', buffer = bufnr },

			p = { '<cmd>lua vim.lsp.diagnostics.goto_prev()<cr>',
			'Previous flag', buffer = bufnr },

			r = { '<cmd>lua vim.lsp.buf.references()<cr>',
			'References of under cursor', buffer = bufnr },

			s = { '<cmd>lua vim.lsp.signature_help()<cr>',
			'Signature help', buffer = bufnr },
		},
	})

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		wk.register({
			['<leader>lf'] = { '<cmd>lua vim.lsp.buf.formatting()<cr>',
			'Formatting', buffer = bufnr },
		})
	elseif client.resolved_capabilities.document_range_formatting then
		wk.register({
			['<leader>lf'] = { '<cmd>lua vim.lsp.buf.ranger_formatting()<cr>',
			'Formatting', buffer = bufnr },
		})
	end

	-- Unmapped
	-- buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

return M
