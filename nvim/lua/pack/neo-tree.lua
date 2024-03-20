return function()
	-- Unless you are still migrating, remove the deprecated commands from v1.x
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

	require("neo-tree").setup({
		default_component_configs = {
			indent = {
				expander_collapsed = "·",
				expander_expanded = " ",
				-- Indent guides
				with_markers = true,
				-- indent_marker = "·",
				-- last_indent_marker = "·",
			},
			icon = {
				folder_closed = "·",
				folder_open = "-",
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
				["c"] = "none",
				["m"] = "none",
				["<bs>"] = "none",
				["<space>"] = "none",
				["<2-LeftMouse>"] = "open",
				["l"] = "open",
				["<c-j>"] = "open",
				["S"] = "open_split",
				["<c-s>"] = "open_split",
				["<c-k>"] = "open_vsplit",
				["<c-v>"] = "open_vsplit",
				["V"] = "open_vsplit",
				["<c-p>"] = { "toggle_preview", config = { use_float = false } },
				["h"] = "close_node",
				["-"] = "navigate_up",
				["<cr>"] = "set_root",
				["gh"] = "toggle_hidden",
				["<c-l>"] = "refresh",
				["<leader>s"] = "fuzzy_sorter",
				["<c-c>"] = "clear_filter",
				["o"] = "add",
				["O"] = "add",
				["D"] = "delete",
				["cc"] = "rename",
				["R"] = "rename",
				["my"] = "copy_to_clipboard",
				["md"] = "cut_to_clipboard",
				["yy"] = "copy",
				["dd"] = "move",
				["p"] = "paste_from_clipboard",
				["q"] = "close_window",
				["e"] = function() vim.api.nvim_exec("Neotree focus filesystem left", true) end,
				["b"] = function() vim.api.nvim_exec("Neotree focus buffers left", true) end,
				["s"] = function() vim.api.nvim_exec("Neotree focus git_status left", true) end,
			},
			fuzzy_finder_mappings = {
				["<C-j>"] = "move_cursor_down",
				["<C-k>"] = "move_cursor_up",
			}
		},
		filesystem = {
			bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
			follow_current_file = {
				enabled = true,
			},
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
