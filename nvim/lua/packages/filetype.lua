local M = {}

M.config = function ()
	require("filetype").setup({ overrides = { extensions = {
		astro = "html",
		style = "scss",
		postcss = "scss",
		mdx = "markdown",
		gmi = "markdown",
		fish = "sh",
		MD = "markdown",
	}}})
end

return M
