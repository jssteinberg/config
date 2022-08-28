vim.cmd [[hi clear]]
vim.g.colors_name = "makeup_dark_terminal"

-- variant = "b(ase)"/"s(trong)"/"bg"
local function get(color, variant)
	-- if &bg == "light"/"dark"...

	-- Colors { base, lighter, darker }
	local colors = {
		black = { "#1a1636", "#342c6d", "#05040b" },
		gray = { "#7d78a1", "#aeabc4" },
		violet = { "#985cbc", "#bf9ad6" },
	}
	-- red#1      #bc685c red#9      #d6a19a red_bg #6d342c
	-- green#2    #5cbca4 green#10   #9ad6c9
	-- yellow#3   #b1bc5c yellow#11  #ced69a yellow_bg #656d2c
	-- blue#4     #9ab3d6 blue#12    #9d9ad6 blue_bg #2c486d
	-- magenta#5  #685cbc magenta#13 #a19ad6
	-- cyan#6     #5cb1bc cyan#14    #9aced6
	-- white#7    #e5f2e0 white#15   #ffffff

	-- Extra colors
	local bg = {
		base = "#121118",
	}

	return colors[color][1]
end

-- Util
local hi = vim.api.nvim_set_hl

-- Comment
hi(0, "Comment", { fg = get("violet") })

-- UI
hi(0, "CursorLine", { bg = get("black") })
