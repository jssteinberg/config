local M = {}

M.config = function()
	-- See ":help neo-tree-highlights" for a list of available highlight groups
	vim.cmd([[
		hi link NeoTreeDirectoryName Directory
		hi link NeoTreeDirectoryIcon NeoTreeDirectoryName
	]])

	require("neo-tree").setup({
		default_component_configs = {
			indent = { padding = 0 },
		},
		filesystem = {
			filters = { --These filters are applied to both browsing and searching
			show_hidden = true,
			respect_gitignore = false,
		},
		follow_current_file = true, -- This will find and focus the file in the active buffer every
		-- time the current file is changed while the tree is open.
		hijack_netrw_behavior = "disabled",
		window = {
			width = 35,
			mappings = {
				["<cr>"] = "open",
				["v"] = "open_vsplit",
				["-"] = "navigate_up",
				["."] = "set_root",
				["gh"] = "toggle_hidden",
				["gi"] = "toggle_gitignore",
				["<c-l>"] = "refresh",
				["s"] = "fuzzy_finder",
				["a"] = "add",
				["D"] = "delete",
				["R"] = "rename",
				["mc"] = "copy_to_clipboard",
				["mm"] = "cut_to_clipboard",
				["mt"] = "paste_from_clipboard",
			}
		}
	},
	buffers = {
		window = {
			mappings = {
				["<cr>"] = "open",
				["v"] = "open_vsplit",
				["-"] = "navigate_up",
				["<c-l>"] = "refresh",
				["D"] = "delete",
				["R"] = "rename",
				["mc"] = "copy_to_clipboard",
				["mm"] = "cut_to_clipboard",
				["mt"] = "paste_from_clipboard",
			}
		},
	},
	git_status = {
		window = {
			mappings = {
				["<cr>"] = "open",
				["v"] = "open_vsplit",
				["<c-l>"] = "refresh",
				["D"] = "delete",
				["R"] = "rename",
				["mc"] = "copy_to_clipboard",
				["mm"] = "cut_to_clipboard",
				["mt"] = "paste_from_clipboard",
			}
		}
	}
})
vim.cmd([[nnoremap \ :NeoTreeReveal<cr>]])
end

return M
