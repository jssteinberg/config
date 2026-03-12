vim.lsp.config("denols", {
	root_dir = function(bufnr)
		return require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")(bufnr)
	end,
	single_file_support = false,
})
