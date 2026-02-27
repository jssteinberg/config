-- Notify svelte LSP about external file changes on focus
vim.api.nvim_create_autocmd("FocusGained", {
	callback = function()
		local clients = vim.lsp.get_clients({ name = "svelte" })
		if #clients == 0 then return end

		local changes = {}
		for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_loaded(bufnr) then
				local name = vim.api.nvim_buf_get_name(bufnr)
				if name ~= "" then
					table.insert(changes, {
						uri = vim.uri_from_fname(name),
						type = 2, -- Changed
					})
				end
			end
		end

		if #changes == 0 then return end

		for _, client in ipairs(clients) do
			client:notify("workspace/didChangeWatchedFiles", { changes = changes })
		end
	end,
})

-- Also notify on individual buffer reloads from external changes
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	pattern = { "*.svelte", "*.ts", "*.js", "*.mts", "*.cts" },
	callback = function(args)
		local clients = vim.lsp.get_clients({ name = "svelte" })
		for _, client in ipairs(clients) do
			client:notify("workspace/didChangeWatchedFiles", {
				changes = {
					{ uri = vim.uri_from_fname(args.file), type = 2 },
				},
			})
		end
	end,
})
