local M = {}

M.config = function()
	local cmp = require "cmp"
	local luasnip = require "luasnip"
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- local has_words_before = function()
	-- 	unpack = unpack or table.unpack
	-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	-- end

	-- Add additional capabilities supported by nvim-cmp
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = "menuone,noselect"

	-- nvim-cmp setup
	cmp.setup {
		sources = {
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "nvim_lsp",               trigger_characters = { "-" } },
			{ name = "omni" },
			{ name = "buffer" },
			{ name = "nvim_lsp_signature_help" },
		},
		experimental = {
			ghost_text = false -- this feature conflict with copilot's preview
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<c-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<c-u>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<c-c>"] = cmp.mapping.abort(),
			-- ctrl-a autocompletes
			["<c-a>"] = cmp.mapping(function()
				-- if cmp.visible() then
				if cmp.get_active_entry() then
					cmp.confirm({ select = true })
				else
					cmp.complete()
				end
			end, { "i", "s" }),
			-- ctrl-l opens/completes lsp (is it contextual? should be)
			["<c-l>"] = cmp.mapping.complete({
				config = {
					sources = {
						{ name = "nvim_lsp" },
					}
				}
			}),
			-- enter intuitively confirms
			["<cr>"] = function(fallback)
				if cmp.get_active_entry() then
					cmp.confirm({ select = false }) -- `false` to not automatically select the first item
				else
					fallback()
				end
			end,
			-- ctrl-s completes/navigates snippets
			["<c-s>"] = cmp.mapping(function()
				if luasnip.jumpable() then
					luasnip.jump(1)
				elseif cmp.get_active_entry() then
					cmp.confirm({ select = true })
				elseif cmp.visible() then
					cmp.select_next_item()
					cmp.confirm({ select = true })
				end
			end, { "i", "s" }),
			["<c-b>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			-- tab/shift-tab selects next/prev item
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
	}
end

return M
