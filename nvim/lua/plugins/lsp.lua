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
			map("n", "<cr>", vim.lsp.buf.hover)
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
}
