local M = {}

-- Register keymaps per buffer
M.register_keymaps = function(bufnr, client)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting_sync, bufopts)
	-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, bufopts)

	if client.supports_method("textDocument/formatting") then
		vim.keymap.set('n', 'gq', vim.lsp.buf.formatting_sync, bufopts)
	end

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
	vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

	vim.keymap.set('n', '<leader>lq', vim.diagnostic.setqflist, bufopts)
	vim.keymap.set('n', '<leader>ll', vim.diagnostic.setloclist, bufopts)
end

M.config = function()
	local lspconfig = require("lspconfig")
	local on_attach = function(client, bufnr)
		M.register_keymaps(bufnr, client)
		-- Use LSP completion
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	end

	require("mason").setup {}
	require("mason-lspconfig").setup()
	require("lsp-format").setup {
		javascript = {
			semicolons = true,
		}
	}
	require("mason-lspconfig").setup_handlers {
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function(server_name) -- default handler (optional)
			lspconfig[server_name].setup {
				on_attach = on_attach
			}
		end,
		["svelte"] = function()
			lspconfig.svelte.setup {
				on_attach = require "lsp-format".on_attach,
			}
		end,
		["sumneko_lua"] = function()
			lspconfig.sumneko_lua.setup {
				on_attach = require "lsp-format".on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			}
		end,
		["tsserver"] = function()
			lspconfig.tsserver.setup {
				on_attach = require "lsp-format".on_attach,
				-- javascript.format.semicolons: true,
			}
		end,
	}
end

return M
