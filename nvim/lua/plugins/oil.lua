return {
	"stevearc/oil.nvim",
	config = function()
		vim.keymap.set("n", "<leader>e.", function() require("oil").open(".") end, { desc = "Root dir." })
		vim.keymap.set("n", "-", require("oil").open, { desc = "Parent dir." })
		vim.keymap.set("n", "<leader>ed", function()
			vim.cmd [[
				wincmd v
				wincmd H
			]]
			require("oil").open()
			vim.cmd("call search('" .. vim.fn.expand("#:t") .. "')")
		end, { desc = "Parent dir. left vert." })

		require "oil".setup({
			default_file_explorer = false,
			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["-"] = "actions.parent",
				["<CR>"] = "actions.select",
				["<C-j>"] = "actions.select",
				["<C-k>"] = "actions.select_vsplit",
				["S"] = "actions.select_split",
				["<C-s>"] = "actions.select_split",
				["<leader>tf"] = "actions.select_tab",
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["<C-l>"] = "actions.refresh",
				["cd"] = "actions.tcd",
				["g."] = "actions.open_cwd",
				["gh"] = "actions.toggle_hidden",
				["."] = "actions.open_cmdline",
				["gc"] = "actions.open_terminal",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return vim.startswith(name, ".DS_Store") or (name == "..")
				end,
			},
			columns = {
				-- "permissions",
				"size",
				-- "mtime",
			},
			float = { border = "none", },
			confirmation = { border = "none", },
			progress = { border = "none", },
			ssh = { border = "none", },
			keymaps_help = { border = "none" },
		})
	end
}
