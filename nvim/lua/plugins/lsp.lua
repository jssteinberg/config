return {
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
					-- Auto signature help when typing ( or ,
					vim.api.nvim_create_autocmd("InsertCharPre", {
						buffer = args.buf,
						callback = function()
							local char = vim.v.char
							if char == "(" or char == "," then
								vim.defer_fn(function()
									if vim.fn.mode() == "i" then
										vim.lsp.buf.signature_help()
									end
								end, 0)
							end
						end,
					})
				end,
			})

			-- Global mappings
			map("n", "<cr>", function() require("lsp-hover").hover() end)
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
