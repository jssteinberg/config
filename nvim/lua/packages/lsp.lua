local M = {}

-- Register keymaps per buffer
M.register_keymaps = function(client, bufnr)
	-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local bufopts = { noremap = true, silent = true }

	-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.formatting_sync, bufopts)
	-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, bufopts)

	-- if client.supports_method("textDocument/formatting") then
	-- 	vim.keymap.set("n", "gq", vim.lsp.buf.formatting_sync, bufopts)
	-- end

	vim.keymap.set("n", "<cr>", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>lwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

	-- vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, bufopts)
	-- vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, bufopts)
end

M.config = function()
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	local lsp_format = require("lsp-format")
	local on_attach_general = function(client, bufnr)
	end
	local max_client = function(client, bufnr)
		M.register_keymaps(client, bufnr)
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		lsp_format.on_attach(client, bufnr)
	end

	require("mason").setup({})

	mason_lspconfig.setup({})

	lsp_format.setup({})

	mason_lspconfig.setup_handlers {
		function(server_name) -- default handler (optional)
			lspconfig[server_name].setup {
				on_attach = on_attach_general
			}
		end,
		["unocss"] = function()
			lspconfig.unocss.setup {
				on_attach = function(client, bufnr)
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				end,
				filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte",
					"vue", "astro" },
			}
		end,
		["astro"] = function()
			lspconfig.astro.setup {
				on_attach = function(client, bufnr)
					M.register_keymaps(client, bufnr)
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				end
			}
		end,
		["svelte"] = function()
			lspconfig.svelte.setup {
				on_attach = max_client,
			}
		end,
		["tsserver"] = function()
			lspconfig.tsserver.setup {
				on_attach = max_client,
				settings = {
					javascript = {
						format = {
							semicolons = "insert"
						},
						preferences = {
							quoteStyle = "double"
						}
					},
					typescript = {
						format = {
							semicolons = "insert"
						},
						preferences = {
							quoteStyle = "double"
						}
					}
				}
			}
		end,
		["lua_ls"] = function()
			lspconfig.lua_ls.setup {
				on_attach = max_client,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						},
						format = {
							defaultConfig = {
								quote_style = "double"
							}
						}
					}
				}
			}
		end,
	}
end

return M
