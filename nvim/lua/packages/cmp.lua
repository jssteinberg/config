local M = {}

M.config = function()
	local cmp = require'cmp'
	local luasnip = require'luasnip'
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- Add additional capabilities supported by nvim-cmp
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = 'menuone,noselect'

	-- nvim-cmp setup
	cmp.setup {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<CR>'] = cmp.mapping(function (fallback)
				if cmp.get_active_entry() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end, {'i'}),
			['<c-n>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, {'i'}),
			['<c-p>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, {'i'}),
			['<c-s>'] = cmp.mapping(function()
				if luasnip.jumpable() then
					luasnip.jump(1)
				end
			end, {'i'}),
			['<c-b>'] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {'i'}),
		},
		sources = {
			{ name = 'nvim_lsp_signature_help' },
			{ name = 'nvim_lsp' },
			{ name = 'buffer', keyword_length = 2 },
			{ name = 'luasnip' },
			-- { name = 'nvim_lua' },
		},
	}
end

return M
