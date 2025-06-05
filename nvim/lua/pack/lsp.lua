local M = {}

-- Register keymaps per buffer
M.register_keymaps = function(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local go = function(count)
		return function()
			vim.diagnostic.jump({ count = count, float = true })
			-- cmd EagleWin if exists
			-- vim.cmd("EagleWin")
			-- vim.fn.feedkeys("<cr>")
		end
	end

	vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
	vim.keymap.set("n", "grk", vim.lsp.buf.hover)
	-- vim.keymap.set("n", "<c-k>", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<c-k>", go(-1))
	vim.keymap.set("n", "<c-j>", go(1))
	vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)


	-- vim.keymap.set("n", "<space>lf", function()
	-- 	vim.lsp.buf.format { async = true }
	-- end, { buffer = bufopts })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>lwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, bufopts)
end

M.config = function()
	local mason_lspconfig = require("mason-lspconfig")
	local lsp_format = require("lsp-format")
	local on_attach_general = function(args)
		local bufnr = args.buf
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		M.register_keymaps(args.buf)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		lsp_format.on_attach(client, args.buf)
	end

	require("mason").setup({})
	mason_lspconfig.setup({})
	lsp_format.setup({})

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = on_attach_general
	})
	vim.lsp.config("unocss", {
		filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte",
			"vue", "astro" },
	})
	vim.lsp.config("ts_ls", {
		settings = {
			javascript = {
				format = { semicolons = "insert" },
				preferences = { quoteStyle = "double" }
			},
			typescript = {
				format = { semicolons = "insert" },
				preferences = { quoteStyle = "double" }
			}
		}
	})
	vim.lsp.config("lua_ls", {
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
	})
end

return M
