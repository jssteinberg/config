return {
	root_markers = { "package.json", "tsconfig.json", ".git" },
	single_file_support = false,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
}
