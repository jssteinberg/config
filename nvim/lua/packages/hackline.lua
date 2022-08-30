local M = {}

M.config = function()
	vim.g.hackline_bufnr = true
	vim.g.hackline_sign = "Neo"
	vim.g.hackline_highlight_secondary = 'StatusLine'
	vim.g.hackline_highlight_items = 'StatusLine'
	vim.g.hackline_highlight_modified = 'StatusLine'
	vim.g.hackline_hightlight_branch = 'StatusLine'
	-- modes
	vim.g.hackline_highlight_insert = 'IncSearch'
	vim.g.hackline_highlight_visual = 'IncSearch'
	vim.g.hackline_highlight_replace = 'IncSearch'
	vim.g.hackline_highlight_select = 'IncSearch'
	vim.g.hackline_highlight_command = 'IncSearch'
	vim.g.hackline_highlight_terminal = 'IncSearch'

	vim.g.hackline_modified       = "2"
	vim.g.hackline_label_modified = "[+]"
	vim.g.hackline_label_command  = "—C—"
	vim.g.hackline_label_insert   = "—I—"
	vim.g.hackline_label_terminal = "—T—"
	vim.g.hackline_label_visual   = "—V—"
	vim.g.hackline_label_select   = "—S—"
	vim.g.hackline_label_replace  = "—R—"
	vim.g.hackline_separators     = { l = "/", r = "/" }
end

return M
