return function()
	require("sfm").setup({
		mappings = {
			custom_only = false,
			list = {
				-- user mappings go here
				{
					key = "l",
					action = "edit",
				},
				{
					key = "o",
					action = "split",
				},
				{
					key = "v",
					action = "vsplit",
				},
				{
					key = "t",
					action = "tabnew",
				},
				{
					key = "h",
					action = "close_entry",
				},
				{
					key = "<c-l>",
					action = "reload",
				},
			}
		},
		renderer = {
			icons = {
				file = {
					default = " ",
					symlink = "~",
				},
				folder = {
					default = "·",
					open = "·",
					symlink = "≈",
					symlink_open = "≈",
				},
				indicator = {
					folder_closed = "",
					folder_open = "",
					file = "",
				}
			}
		}
	})
end
