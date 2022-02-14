local M = {}

M.config = function()
	local actions = require'lir.actions'
	local mark_actions = require 'lir.mark.actions'
	local clipboard_actions = require'lir.clipboard.actions'

	require'lir'.setup {
		show_hidden_files = true,
		devicons_enable = false,
		mappings = {
			['l'] = actions.edit,
			['<cr>'] = actions.edit,
			['o'] = actions.split,
			['v'] = actions.vsplit,
			['t'] = actions.tabedit,

			['h'] = actions.up,
			['-'] = actions.up,

			['q'] = actions.quit,

			['d'] = actions.mkdir,
			['%'] = actions.newfile,
			['R'] = actions.rename,
			['cd'] = actions.cd,
			['yy'] = actions.yank_path,
			['gh'] = actions.toggle_show_hidden,
			['D'] = actions.delete,

			['mf'] = function()
				mark_actions.toggle_mark()
				vim.cmd('normal! j')
			end,
			['mF'] = function()
				mark_actions.toggle_mark()
				vim.cmd('normal! j')
			end,

			['mc'] = clipboard_actions.copy,
			['mm'] = clipboard_actions.cut,
			['mt'] = clipboard_actions.paste,
		},
		float = {
			winblend = 0,
			curdir_window = {
				enable = false,
				highlight_dirname = false
			},

			-- -- You can define a function that returns a table to be passed as the third
			-- -- argument of nvim_open_win().
			-- win_opts = function()
			--   local width = math.floor(vim.o.columns * 0.8)
			--   local height = math.floor(vim.o.lines * 0.8)
			--   return {
			--     border = require("lir.float.helper").make_border_opts({
			--       "+", "─", "+", "│", "+", "─", "+", "│",
			--     }, "Normal"),
			--     width = width,
			--     height = height,
			--     row = 1,
			--     col = math.floor((vim.o.columns - width) / 2),
			--   }
			-- end,
		},
		hide_cursor = true,
		on_init = function()
			-- use visual mode
			vim.api.nvim_buf_set_keymap(
				0,
				"x",
				"mf",
				':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"x",
				"mF",
				':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
				{ noremap = true, silent = true }
			)

			-- echo cwd
			vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
		end,
	}
end

return M
