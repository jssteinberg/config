local M = {}

M.config = function()
	local cmp = require "cmp"
	local luasnip = require "luasnip"
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local has_words_before = function()
		unpack = unpack or table.unpack
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	-- Add additional capabilities supported by nvim-cmp
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = "menuone,noselect"

	-- nvim-cmp setup
	cmp.setup {
		sources = {
			-- {
			-- 	name = 'nvim_lsp_signature_help', max_item_count = 1
			-- },
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "omni" },
			{ name = "buffer" },
		},
		experimental = {
			-- ghost_text = { hl_group = "LineNr" },
			ghost_text = false -- this feature conflict with copilot's preview
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs( -4), { "i", "c" }),
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-c>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.get_active_entry() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end, { "i", "s" }),
			["<c-n>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<c-p>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i" }),
			["<c-f>"] = cmp.mapping(function(fallback)
				if luasnip.expandable() then
					luasnip.expand()
				elseif cmp.get_active_entry() then
					cmp.confirm({ select = true })
				elseif cmp.visible() then
					cmp.select_next_item()
					cmp.confirm({ select = true })
				end
			end, { "i", "s" }),
			["<c-s>"] = cmp.mapping(function(fallback)
				-- if luasnip.expand_or_jumpable() then
				-- 	luasnip.expand_or_jump()
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
				if luasnip.jumpable( -1) then
					luasnip.jump( -1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
	}
end

return M
