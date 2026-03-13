local api = vim.api
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local severity = diagnostic.severity

local severity_hl = {
	[severity.ERROR] = "DiagnosticError",
	[severity.WARN] = "DiagnosticWarn",
	[severity.INFO] = "DiagnosticInfo",
	[severity.HINT] = "DiagnosticHint",
}

local severity_label = {
	[severity.ERROR] = "Error",
	[severity.WARN] = "Warn",
	[severity.INFO] = "Info",
	[severity.HINT] = "Hint",
}

local function build_diag_entries(lnum)
	local diags = diagnostic.get(0, { lnum = lnum })
	if #diags == 0 then return {} end
	local entries = {}
	for i, d in ipairs(diags) do
		local num = i .. ". "
		local label_and_msg = severity_label[d.severity] .. ": " .. d.message
		local extra = ""
		if d.code then extra = extra .. " [" .. d.code .. "]" end
		if d.source then extra = extra .. " " .. d.source end
		entries[i] = {
			text = num .. label_and_msg .. extra,
			hl = severity_hl[d.severity],
			hl_start = #num,
			hl_end = #num + #label_and_msg,
		}
	end
	return entries
end

local function append_diagnostics(buf, win, lines, diag_entries)
	vim.bo[buf].modifiable = true
	local width = api.nvim_win_get_width(win)
	local max_width = width
	local diag_texts = {}
	for i, entry in ipairs(diag_entries) do
		diag_texts[i] = entry.text
		if #entry.text > max_width then max_width = #entry.text end
	end
	if max_width > width then
		api.nvim_win_set_width(win, max_width)
		width = max_width
	end
	local sep_line = api.nvim_buf_line_count(buf)
	if #lines > 0 then
		api.nvim_buf_set_lines(buf, -1, -1, false, { string.rep("─", width - 2) })
		sep_line = sep_line + 1
	end
	api.nvim_buf_set_lines(buf, -1, -1, false, diag_texts)
	for i, entry in ipairs(diag_entries) do
		api.nvim_buf_add_highlight(buf, -1, entry.hl, sep_line + i - 1, entry.hl_start, entry.hl_end)
	end
	vim.bo[buf].modifiable = false
	local total = api.nvim_buf_line_count(buf)
	local last = api.nvim_buf_get_lines(buf, total - 1, total, false)
	if last[1] == "" then total = total - 1 end
	api.nvim_win_set_height(win, math.max(1, total - 1))
end

local M = {}

function M.hover()
	local lnum = api.nvim_win_get_cursor(0)[1] - 1
	local diag_entries = build_diag_entries(lnum)
	local params = lsp.util.make_position_params()
	local hover_done, sig_done = false, false
	local hover_lines, sig_lines = {}, {}

	local function try_show()
		if not hover_done or not sig_done then return end
		local lines = {}
		vim.list_extend(lines, hover_lines)
		if #sig_lines > 0 and #hover_lines > 0 then
			table.insert(lines, "---")
		end
		vim.list_extend(lines, sig_lines)
		if #lines == 0 and #diag_entries == 0 then return end
		vim.schedule(function()
			if #lines == 0 then lines = { "" } end
			local buf, win = lsp.util.open_floating_preview(lines, "markdown", { focus = false })
			vim.wo[win].foldcolumn = "1"
			if #diag_entries > 0 then
				append_diagnostics(buf, win, lines, diag_entries)
			end
		end)
	end

	lsp.buf_request_all(0, "textDocument/hover", params, function(results)
		for _, res in pairs(results) do
			if res.result and res.result.contents then
				vim.list_extend(hover_lines, lsp.util.convert_input_to_markdown_lines(res.result.contents))
			end
		end
		hover_done = true
		try_show()
	end)

	lsp.buf_request_all(0, "textDocument/signatureHelp", params, function(results)
		for _, res in pairs(results) do
			local r = res.result
			if r and r.signatures and #r.signatures > 0 then
				local active = (r.activeSignature or 0) + 1
				local sig = r.signatures[active] or r.signatures[1]
				table.insert(sig_lines, "```")
				table.insert(sig_lines, sig.label)
				table.insert(sig_lines, "```")
				if sig.parameters and #sig.parameters > 0 then
					table.insert(sig_lines, "**Parameters:**")
					for _, p in ipairs(sig.parameters) do
						local doc = p.documentation
						if type(doc) == "table" then doc = doc.value end
						local line = "- `" .. p.label .. "`"
						if doc and doc ~= "" then line = line .. " — " .. doc end
						table.insert(sig_lines, line)
					end
				end
			end
		end
		sig_done = true
		try_show()
	end)
end

return M
