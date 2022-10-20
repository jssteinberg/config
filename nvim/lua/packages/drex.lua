return function()
	require("drex.config").configure {
		icons = {
			file_default = "·",
			dir_open = "·",
			dir_closed = "–",
			link = "·",
			others = "·",
		},
		hide_cursor = false,
		sorting = function(a, b)
			local aname, atype = a[1], a[2]
			local bname, btype = b[1], b[2]

			local aisdir = atype == "directory"
			local bisdir = btype == "directory"

			if aisdir ~= bisdir then
				return aisdir
			end

			return aname < bname
		end,
		drawer = {
			default_width = 30,
			window_picker = {
				enabled = true,
				labels = "abcdefghijklmnopqrstuvwxyz",
			},
		},
		disable_default_keybindings = false,
		keybindings = {
			["n"] = {
				["v"]             = "V",
				["l"]             = { '<cmd>lua require("drex.elements").expand_element()<CR>', { desc = "expand element" } },
				["h"]             = { '<cmd>lua require("drex.elements").collapse_directory()<CR>', { desc = "collapse directory" } },
				["<right>"]       = { '<cmd>lua require("drex.elements").expand_element()<CR>', { desc = "expand element" } },
				["<left>"]        = { '<cmd>lua require("drex.elements").collapse_directory()<CR>', { desc = "collapse directory" } },
				["<2-LeftMouse>"] = { '<LeftMouse><cmd>lua require("drex.elements").expand_element()<CR>',
					{ desc = "expand element" } },
				["<RightMouse>"]  = { '<LeftMouse><cmd>lua require("drex.elements").collapse_directory()<CR>',
					{ desc = "collapse directory" } },
				["<C-v>"]         = { '<cmd>lua require("drex.elements").open_file("vs")<CR>', { desc = "open file in vsplit" } },
				["<C-x>"]         = { '<cmd>lua require("drex.elements").open_file("sp")<CR>', { desc = "open file in split" } },
				["<C-t>"]         = { '<cmd>lua require("drex.elements").open_file("tabnew", true)<CR>',
					{ desc = "open file in new tab" } },
				["<C-l>"]         = { '<cmd>lua require("drex.elements").open_directory()<CR>',
					{ desc = "open directory in new buffer" } },
				["<C-h>"]         = { '<cmd>lua require("drex.elements").open_parent_directory()<CR>',
					{ desc = "open parent directory in new buffer" } },
				["<F5>"]          = { '<cmd>lua require("drex").reload_directory()<CR>', { desc = "reload" } },
				["gj"]            = { '<cmd>lua require("drex.actions.jump").jump_to_next_sibling()<CR>',
					{ desc = "jump to next sibling" } },
				["gk"]            = { '<cmd>lua require("drex.actions.jump").jump_to_prev_sibling()<CR>',
					{ desc = "jump to prev sibling" } },
				["gh"]            = { '<cmd>lua require("drex.actions.jump").jump_to_parent()<CR>',
					{ desc = "jump to parent element" } },
				["s"]             = { '<cmd>lua require("drex.actions.stats").stats()<CR>', { desc = "show element stats" } },
				["d"]             = { '<cmd>lua require("drex.actions.files").create()<CR>', { desc = "create element" } },
				["D"]             = { '<cmd>lua require("drex.actions.files").delete("line")<CR>', { desc = "delete element" } },
				["Y"]             = { '<cmd>lua require("drex.actions.files").copy_and_paste()<CR>',
					{ desc = "copy & paste (clipboard)" } },
				["X"]             = { '<cmd>lua require("drex.actions.files").cut_and_move()<CR>',
					{ desc = "cut & move (clipboard)" } },
				["r"]             = { '<cmd>lua require("drex.actions.files").rename()<CR>', { desc = "rename element" } },
				["R"]             = { '<cmd>lua require("drex.actions.files").multi_rename("clipboard")<CR>',
					{ desc = "rename (clipboard)" } },
				["/"]             = { '<cmd>keepalt lua require("drex.actions.search").search()<CR>', { desc = "search" } },
				["M"]             = { "<cmd>DrexMark<CR>", { desc = "mark element" } },
				["u"]             = { "<cmd>DrexUnmark<CR>", { desc = "unmark element" } },
				["m"]             = { "<cmd>DrexToggle<CR>", { desc = "toggle element" } },
				["cc"]            = { '<cmd>lua require("drex.clipboard").clear_clipboard()<CR>', { desc = "clear clipboard" } },
				["cs"]            = { '<cmd>lua require("drex.clipboard").open_clipboard_window()<CR>', { desc = "edit clipboard" } },
				["y"]             = { '<cmd>lua require("drex.actions.text").copy_name()<CR>', { desc = "copy element name" } },
			},
			["v"] = {
				["d"] = { ':lua require("drex.actions.files").delete("visual")<CR>', { desc = "delete elements" } },
				["r"] = { ':lua require("drex.actions.files").multi_rename("visual")<CR>', { desc = "rename elements" } },
				["M"] = { ":DrexMark<CR>", { desc = "mark elements" } },
				["u"] = { ":DrexUnmark<CR>", { desc = "unmark elements" } },
				["m"] = { ":DrexToggle<CR>", { desc = "toggle elements" } },
				["y"] = { ':lua require("drex.actions.text").copy_name(true)<CR>', { desc = "copy element names" } },
				["Y"] = { ':lua require("drex.actions.text").copy_relative_path(true)<CR>', { desc = "copy element relative paths" } },
				["<C-y>"] = { ':lua require("drex.actions.text").copy_absolute_path(true)<CR>',
					{ desc = "copy element absolute paths" } },
			}
		},
		on_enter = nil,
		on_leave = nil,
	}
end
