return {
	-- {
	-- 	"Fildo7525/pretty_hover",
	-- 	keys = { "<cr>" },
	-- 	config = function()
	-- 		require("pretty_hover").setup({
	-- 			border = "none",
	-- 		})
	-- 		vim.keymap.set("n", "<cr>", function()
	-- 			require("pretty_hover").hover()
	-- 		end, { silent = true })
	-- 	end
	-- },
	-- LSP client auto stop/start
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
	-- ESLint
	-- {
	-- 	"esmuellert/nvim-eslint",
	-- 	ft = {
	-- 		"javascript",
	-- 		"typescript",
	-- 		"javascriptreact",
	-- 		"typescriptreact",
	-- 		"svelte",
	-- 		"astro",
	-- 	},
	-- },
	-- Base LSP config
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			local map = vim.keymap.set

			require("mason").setup({
				ensure_installed = { "prettierd" },
				automatic_enable = true,
			})
			require("mason-lspconfig").setup({
				automatic_enable = true,
			})

			-- On attach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					-- Unset 'formatexpr'
					vim.bo[args.buf].formatexpr = nil
					-- Unmap some default mappings
					pcall(function()
						vim.keymap.del("n", "K", { buffer = args.buf })
						vim.keymap.del("n", "<c-s>", { buffer = args.buf })
					end)
				end,
			})

			-- Global mappings
			local severity_hl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticError",
				[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
				[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
				[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			}
			map("n", "<cr>", function()
				local diag_entries = {}
				local diags = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
				local severity_label = {
					[vim.diagnostic.severity.ERROR] = "Error",
					[vim.diagnostic.severity.WARN] = "Warn",
					[vim.diagnostic.severity.INFO] = "Info",
					[vim.diagnostic.severity.HINT] = "Hint",
				}
				for i, d in ipairs(diags) do
					local label = severity_label[d.severity]
					local num = i .. ". "
					local label_and_msg = label .. ": " .. d.message
					local extra = ""
					if d.code then extra = extra .. " [" .. d.code .. "]" end
					if d.source then extra = extra .. " " .. d.source end
					table.insert(diag_entries, {
						text = num .. label_and_msg .. extra,
						hl = severity_hl[d.severity],
						hl_start = #num,
						hl_end = #num + #label_and_msg,
					})
				end
				local params = vim.lsp.util.make_position_params()
				vim.lsp.buf_request_all(0, "textDocument/hover", params, function(results)
					local lines = {}
					for _, res in pairs(results) do
						if res.result and res.result.contents then
							local markup = vim.lsp.util.convert_input_to_markdown_lines(res.result.contents)
							vim.list_extend(lines, markup)
						end
					end
					if #lines == 0 and #diag_entries == 0 then return end
					vim.schedule(function()
						local buf, win = vim.lsp.util.open_floating_preview(lines, "markdown", { focus = false })
						vim.wo[win].foldcolumn = "1"
						if #diag_entries > 0 then
							vim.bo[buf].modifiable = true
							local width = vim.api.nvim_win_get_width(win)
							local sep_line = #vim.api.nvim_buf_get_lines(buf, 0, -1, false)
							-- Widen window if diagnostic text is longer
							local max_diag_width = 0
							local diag_texts = {}
							for _, entry in ipairs(diag_entries) do
								table.insert(diag_texts, entry.text)
								max_diag_width = math.max(max_diag_width, #entry.text)
							end
							if max_diag_width > width then
								width = max_diag_width
								vim.api.nvim_win_set_width(win, width)
							end
							if #lines > 0 then
								vim.api.nvim_buf_set_lines(buf, -1, -1, false, { string.rep("─", width - 2) })
								sep_line = sep_line + 1
							end
							vim.api.nvim_buf_set_lines(buf, -1, -1, false, diag_texts)
							for i, entry in ipairs(diag_entries) do
								vim.api.nvim_buf_add_highlight(buf, -1, entry.hl, sep_line + i - 1, entry.hl_start, entry.hl_end)
							end
							vim.bo[buf].modifiable = false
							-- Remove trailing empty line if present
							local buf_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
							if buf_lines[#buf_lines] == "" then
								vim.api.nvim_buf_set_lines(buf, #buf_lines - 1, -1, false, {})
							end
							local total = #vim.api.nvim_buf_get_lines(buf, 0, -1, false)
							vim.api.nvim_win_set_height(win, math.max(1, total - 1))
						end
					end)
				end)
			end)
			map("n", "gd", vim.lsp.buf.definition)
			map("n", "gD", vim.lsp.buf.declaration)
			map("n", "gq", function() vim.lsp.buf.format({ async = false }) end)
			map("x", "gq", function() vim.lsp.buf.format({ async = true }) end)
			local diag_float_id
			local function diag_jump(count)
				if diag_float_id and vim.api.nvim_win_is_valid(diag_float_id) then
					vim.api.nvim_win_close(diag_float_id, true)
				end
				vim.diagnostic.jump({ count = count })
				vim.schedule(function()
					local _, win = vim.diagnostic.open_float({ focus = false })
					diag_float_id = win
				end)
			end
			map("n", "<c-j>", function() diag_jump(1) end)
			map("n", "<c-k>", function() diag_jump(-1) end)
			map("n", "<leader>a", vim.lsp.buf.code_action)

			-- Notifications
			vim.diagnostic.handlers["lsp/diagnostics/notification"] = {
				show = function(namespace, bufnr, diagnostics, opts)
					local level = opts["lsp/diagnostics/notification"].log_level
					local name = vim.diagnostic.get_namespace(namespace).name
					local msg = string.format(
						"%d diagnostics in buffer %d from %s",
						#diagnostics,
						bufnr,
						name
					)

					vim.notify(msg, level)
				end,
			}
		end,
	},
}
