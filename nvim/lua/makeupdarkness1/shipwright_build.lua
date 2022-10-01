local colorscheme = require("makeupdarkness1.white")
local lushwright = require("shipwright.transform.lush")

run(colorscheme,
	lushwright.to_lua,
	{ patchwrite, "colors/makeupdarkness1white.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })

run(colorscheme,
	lushwright.to_vimscript,
	{ append, { "set background=light", "let g:colors_name=\"makeupdarkness1whitevim\"" } },
	{ overwrite, "colors/makeupdarkness1whitevim.vim" })
