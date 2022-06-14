local M = {}

M.config = function()
	require("filetype").setup({ overrides = { extensions = {
		postcss = "css",
		mdx = "markdown",
		gmi = "markdown",
		fish = "sh",
		MD = "markdown",
		twig = "php",
	} } })
end

return M
