local colorscheme = require("makeupdarkness1.white")
local lushwright = require("shipwright.transform.lush")

run(colorscheme,
	lushwright.to_vimscript,
	{ overwrite, "colors/makeupdarkness1whitevim.vim" })

-- shipwright_build.lua

run(colorscheme,
	-- generate lua code
	lushwright.to_lua,
	-- write the lua code into our destination.
	-- you must specify open and close markers yourself to account
	-- for differing comment styles, patchwrite isn't limited to lua files.
	{ patchwrite, "colors/colorscheme.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })
