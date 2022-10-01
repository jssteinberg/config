local M = {}

M.config = function()
	-- Unless you are still migrating, remove the deprecated commands from v1.x
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

	require("neo-tree").setup({
		default_component_configs = {
			indent = {
				-- indent guides
				with_markers = true,
				-- indent_marker = "·",
				-- last_indent_marker = "·",
				expander_collapsed = "·",
				expander_expanded = " ",
			},
			icon = {
				folder_closed = "·",
				folder_open = " ",
				folder_empty = " ",
				default = " ",
			},
			git_status = {
				symbols = {
					-- Change type
					added     = "A",
					deleted   = "D",
					modified  = "M",
					renamed   = "R",
					-- Status type
					untracked = "?",
					ignored   = "-",
					unstaged  = "U",
					staged    = "S",
					conflict  = "C",
				}
			},
		},
		window = {
			mappings = {
				["s"] = "none",
				["S"] = "none",
				["<bs>"] = "none",
				["m"] = "none",
				["<space>"] = "none",

				["<2-LeftMouse>"] = "open",
				["<cr>"] = "open",
				["l"] = "open",
				["o"] = "open_split",
				["v"] = "open_vsplit",
				["p"] = "open_vsplit",
				["P"] = "vsplit_with_window_picker",
				["h"] = "close_node",
				["-"] = "navigate_up",
				["cd"] = "set_root",
				["gh"] = "toggle_hidden",
				["<c-l>"] = "refresh",
				["f"] = "fuzzy_finder",
				-- ["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["%"] = "add",
				["d"] = "add",
				["D"] = "delete",
				["R"] = "rename",
				["mc"] = "copy_to_clipboard",
				["mm"] = "cut_to_clipboard",
				["mt"] = "paste_from_clipboard",
				["q"] = "close_window",

				["Y"] = "copy",
			}
		},
		filesystem = {
			bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
			follow_current_file = true,
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			hijack_netrw_behavior = "disabled",
		},
		buffers = {
			window = {
				mappings = {
					["bd"] = "buffer_delete",
				}
			},
		},
		git_status = {
			window = {
				position = "float",
				mappings = {
					["A"]  = "git_add_all",
					["gu"] = "git_unstage_file",
					["ga"] = "git_add_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
				}
			}
		}
	})
end

return M
