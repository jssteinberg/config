local M = {}

function M.config()
	local ok, cybu = pcall(require, "cybu")
	if not ok then
		return
	end
	cybu.setup({
		position = {
			anchor = "centerright",
		},
		style = {
			devicons = {
				enabled = false
			},
		},
		behavior = { -- set behavior for different modes
			mode = {
				last_used = {
					switch = "immediate", -- immediate, on_close
					view = "paging", -- paging, rolling
				},
			},
		},
	})
	vim.keymap.set({ "n", "v" }, "<c-n>", "<plug>(CybuLastusedNext)")
	vim.keymap.set({ "n", "v" }, "<c-N>", "<plug>(CybuLastusedPrev)")
	vim.keymap.set({ "n", "v" }, "<leader>n", "<plug>(CybuLastusedNext)")
	vim.keymap.set({ "n", "v" }, "<leader>N", "<plug>(CybuLastusedPrev)")
	vim.keymap.set({ "n", "v" }, "<leader>p", "<plug>(CybuLastusedPrev)")
end

return M
