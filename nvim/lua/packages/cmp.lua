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
		-- experimental = {
		-- 	ghost_text = true,
		-- },
		mapping = {
			['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-y>'] = cmp.mapping(function () luasnip.jump(1) end, {'i'}),
			['<C-s>'] = cmp.mapping(function () luasnip.jump(1) end, {'i'}),
			['<C-c>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			['<CR>'] = cmp.mapping(function (fallback)
				-- if cmp.get_selected_entry() then
				if cmp.get_active_entry() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end, {'i'}),
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.jumpable() then
					luasnip.jump(1)
				else
					fallback()
				end
			end, {'i'}),
			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {'i'}),
			-- ['<c-f>'] = function (fallback)
			-- 	if cmp.visible() then
			-- 		cmp.confirm({ select = true })
			-- 	elseif luasnip.expand_or_jumpable() then
			-- 		luasnip.expand_or_jump()
			-- 	else
			-- 		fallback()
			-- 	end
			-- end,
		},
		sources = {
			-- { name = 'nvim_lua' },
			{ name = 'nvim_lsp_signature_help' },
			{ name = 'nvim_lsp' },
			{ name = 'buffer', keyword_length = 3 },
			{ name = 'luasnip' },
			-- { name = 'path' },
			-- { name = 'omni' },
		},
	}
end

-- M.disable = function() require'cmp'.setup.buffer {
-- 	enabled = false
-- } end

return M
