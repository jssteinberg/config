local colorscheme = require("nightcool.white")
local lushwright = require("shipwright.transform.lush")

run(colorscheme,
	lushwright.to_lua,
	{ patchwrite, "colors/whitecool.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })

run(colorscheme,
	lushwright.to_vimscript,
	{ append, { "set background=light", "let g:colors_name=\"vimwhitecool\"" } },
	{ overwrite, "colors/vimwhitecool.vim" })
