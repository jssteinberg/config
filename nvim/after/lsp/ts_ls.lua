vim.lsp.config("ts_ls", {
	root_dir = function(bufnr)
		return require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git")(bufnr)
	end,
	single_file_support = false,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})
