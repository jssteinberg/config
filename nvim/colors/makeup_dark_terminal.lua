vim.cmd [[hi clear]]
vim.g.colors_name = "makeup_dark_terminal"

-- UTIL

-- {string} color - color name or color util name
-- {string} [variant] - "bg", other truthy for emphasized, nil for base
local color = function(color, variant)
	-- if &bg == "light"/"dark"...

	-- Colors { base, emphasized, background }
	-- base colors
	local colors = {
		-- terminal color keys
		bg      = { "#121118" },
		fg      = { "#e6e5ed" },
		black   = { "#1a1636", "#342c6d" },
		red     = { "#bc675c", "#d6a19a" },
		green   = { "#80bc5c", "#a8d69a" },
		yellow  = { "#bc985c", "#ced69a" },
		blue    = { "#9ab0d6", "#9d9ad6" },
		magenta = { "#685cbc", "#a19ad6" },
		cyan    = { "#5cb1bc", "#9aced6" },
		white   = { "#e5f2e0", "#ffffff" },
		-- additional color keys
		gray    = { "#7d78a1" },
		violet  = { "#985cbc", "#bf9ad6" },
	}
	-- Colors' backgrounds
	colors.black[#colors.black + 1] = "#05040b"
	colors.yellow[#colors.yellow + 1] = "#646d2c"
	colors.blue[#colors.blue + 1] = "#2c446d"
	colors.violet[#colors.violet + 1] = "#552c6d"
	-- Colors by utility
	colors.error = { colors.red[1] }
	colors.warning = { colors.yellow[1] }

	if variant and variant == "bg" and colors[color][3] then
		-- return background variant (fall back to base)
		return colors[color][3]
	elseif not variant or variant == "bg" or #colors[color] == 1 then
		-- return base color variant if no variant or missing index
		return colors[color][1]
	else
		-- return emphasized variant if string is not "bg" and has index 2
		return colors[color][2]
	end
end

local hi = function(group, highlights)
	return vim.api.nvim_set_hl(0, group, highlights)
end

-- SYNTAX
-- Group names (:h group-name)

-- Comment, *Todo
hi("Comment", { fg = color("violet") })
hi("Todo", { fg = color("violet", 2), bold = true })
-- *Constant String Character Number Boolean Float
hi("Constant", { fg = color("yellow") })
hi("String", { fg = color("yellow", 2) })
-- *Identifier Function
hi("Identifier", { fg = color("blue", 2) })
hi("Function", { fg = color("cyan", 2) })
-- *Statement Conditional Repeat Label Operator Keyword Exception
hi("Statement", { fg = color("green") })
hi("Keyword", { fg = color("magenta", 2) })
-- *PreProc Include Define Macro PreCondit
hi("PreProc", { fg = color("blue", 2) })
-- *Type StorageClass Structure Typedef
hi("Type", { fg = color("green", 2) })
hi("Structure", { fg = color("magenta") })
-- *Special SpecialChar Tag Delimiter SpecialComment Debug
hi("Special", { fg = color("cyan", 2) })
hi("SpecialKey", { fg = color("blue", 2) })
hi("Delimiter", { fg = color("blue") })
-- *Underlined
hi("Underlined", { fg = color("blue") })
-- Other
hi("Title", { fg = color("yellow", 2) })
hi("TSTagAttribute", { fg = color("cyan", 2) })
hi("markdownUrl", { fg = color("magenta") })

-- UI

hi("CursorLine", { bg = color("black") })
