return {
	{
		"stevearc/conform.nvim",
		-- event = "BufReadPre", -- or "VeryLazy" for lazy loading
		config = function()
			local conform = require("conform")
			local notify_ok, notify = pcall(require, "notify")

			conform.setup({
				formatters_by_ft = {
					lua = { lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					svelte = { "prettierd", "prettier", stop_after_first = true },
					astro = { "prettierd", "prettier", stop_after_first = true },
				},
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_fallback = true }
				end,
			})

			local function show_notification(message, level)
				if notify_ok then
					notify(message, level, { title = "conform.nvim" })
				else
					print(message)
				end
			end

			vim.api.nvim_create_user_command("FormatToggle", function(args)
				local is_global = not args.bang
				if is_global then
					vim.g.disable_autoformat = not vim.g.disable_autoformat
					if vim.g.disable_autoformat then
						show_notification("Autoformat-on-save disabled globally", "info")
					else
						show_notification("Autoformat-on-save enabled globally", "info")
					end
				else
					vim.b.disable_autoformat = not vim.b.disable_autoformat
					if vim.b.disable_autoformat then
						show_notification("Autoformat-on-save disabled for this buffer", "info")
					else
						show_notification("Autoformat-on-save enabled for this buffer", "info")
					end
				end
			end, {
				desc = "Toggle autoformat-on-save",
				bang = true,
			})
		end,
	},
}
