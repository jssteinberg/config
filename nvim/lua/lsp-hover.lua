local api = vim.api
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local severity = diagnostic.severity
local ns = api.nvim_create_namespace("lsp-hover")

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

local function highlight_diagnostics(buf, diag_entries)
	for i, entry in ipairs(diag_entries) do
		api.nvim_buf_set_extmark(buf, ns, i - 1, entry.hl_start, {
			end_col = entry.hl_end,
			hl_group = entry.hl,
		})
	end
end

local M = {}

local hover_win = nil

function M.hover()
	if hover_win and api.nvim_win_is_valid(hover_win) then
		api.nvim_set_current_win(hover_win)
		return
	end

	local lnum = api.nvim_win_get_cursor(0)[1] - 1
	local diag_entries = build_diag_entries(lnum)
	local params = lsp.util.make_position_params()
	local hover_done, sig_done = false, false
	local hover_lines, sig_lines = {}, {}

	local function try_show()
		if not hover_done or not sig_done then return end
		local lines = {}
		for _, entry in ipairs(diag_entries) do
			table.insert(lines, entry.text)
		end
		local has_diags = #lines > 0
		local has_hover = #hover_lines > 0 or #sig_lines > 0
		if has_diags and has_hover then
			table.insert(lines, "")
		end
		vim.list_extend(lines, hover_lines)
		if #sig_lines > 0 and #hover_lines > 0 then
			table.insert(lines, "---")
		end
		vim.list_extend(lines, sig_lines)
		if #lines == 0 then return end
		vim.schedule(function()
			local buf, win = lsp.util.open_floating_preview(lines, "markdown", { focus = false })
			hover_win = win
			api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(win),
				once = true,
				callback = function() hover_win = nil end,
			})
			vim.keymap.set("n", "<cr>", function() api.nvim_win_close(win, true) end, { buffer = buf })
			vim.wo[win].foldcolumn = "1"
			if has_diags then
				highlight_diagnostics(buf, diag_entries)
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
