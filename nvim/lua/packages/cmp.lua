local M = {}

M.config = function()
	local cmp = require "cmp"
	local luasnip = require "luasnip"
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end
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
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "nvim_lsp", trigger_characters = { "-" } },
			{ name = "omni" },
			{ name = "buffer" },
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
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-c>"] = cmp.mapping.abort(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- they way you will only jump inside the snippet region
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
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
