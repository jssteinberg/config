local M = {}

M.config = function()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("NullLsFormatting", {})
	local sources = {
		-- null_ls.builtins.code_actions.gitsigns,
		-- null_ls.builtins.formatting.prettier.with({
		-- 	extra_args = { "--single-quote", "false" },
		-- 	filetypes = { "javascript", "json", "yaml" },
		-- }),
		null_ls.builtins.formatting.prettierd.with({
			filetypes = { "javascript", "json", "yaml" },
			env = {
				PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/.prettierrc.json"),
			},
			command = "prettierd"
		}),
	}
	local async_formatting = function(bufnr)
		bufnr = bufnr or vim.api.nvim_get_current_buf()

		vim.lsp.buf_request(
			bufnr,
			"textDocument/formatting",
			{ textDocument = { uri = vim.uri_from_bufnr(bufnr) } },
			function(err, res, ctx)
				if err then
					-- local err_msg = type(err) == "string" and err or err.message
					-- vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
					return
				end

				-- don't apply results if buffer is unloaded or has been modified
				if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
					return
				end

				if res then
					local client = vim.lsp.get_client_by_id(ctx.client_id)
					vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
					vim.api.nvim_buf_call(bufnr, function()
						vim.cmd("silent noautocmd update")
					end)
				end
			end
		)
	end

	null_ls.setup({
		sources = sources,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						async_formatting(bufnr)
					end,
				})
			end
		end,
	})
end

return M
