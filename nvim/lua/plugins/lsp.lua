return {
	{
		"Fildo7525/pretty_hover",
		keys = { "<cr>" },
		config = function()
			require("pretty_hover").setup({
				border = "none",
			})
			vim.keymap.set("n", "<cr>", function()
				require("pretty_hover").hover()
			end, { silent = true })
		end
	},
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

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "prettierd" },
				automatic_enable = true,
			})

			-- On attach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					-- Unset 'formatexpr'
					vim.bo[args.buf].formatexpr = nil
					-- Unmap
					pcall(function()
						-- K
						vim.keymap.del("n", "K", { buffer = args.buf })
						-- <c-s>
						vim.keymap.del("n", "<c-s>", { buffer = args.buf })
					end)
				end,
			})

			-- Global mappings
			map("n", "gd", vim.lsp.buf.definition)
			map("n", "gD", vim.lsp.buf.declaration)
			map("n", "gq", function() vim.lsp.buf.format({ async = false }) end)
			map("x", "gq", function() vim.lsp.buf.format({ async = true }) end)
			map("n", "<c-j>", function() vim.diagnostic.jump({ count = 1, float = true }) end)
			map("n", "<c-k>", function() vim.diagnostic.jump({ count = -1, float = true }) end)
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
	-- Formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					svelte = { "prettierd", "prettier", stop_after_first = true },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end
	}
}
