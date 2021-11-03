local M = {}

M.config = function()
	-- vim.cmd[[packadd cmp-buffer]]
	-- vim.cmd[[packadd cmp-path]]
	-- vim.cmd[[packadd cmp-nvim-lsp]]
	-- vim.cmd[[packadd cmp-nvim-lua]]
	-- vim.cmd[[packadd LuaSnip]]
	-- vim.cmd[[packadd cmp_luasnip]]

	local luasnip = require'luasnip'
	local cmp = require'cmp'
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- Add additional capabilities supported by nvim-cmp
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = 'menuone,noselect'

	-- nvim-cmp setup
	cmp.setup {
		experimental = {
			ghost_text = true,
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<CR>'] = cmp.mapping.confirm {
				-- behavior = cmp.ConfirmBehavior.Replace,
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			['<Tab>'] = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end,
			['<S-Tab>'] = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end,
		},
		sources = {
			{ name = 'nvim_lua' },
			{ name = 'nvim_lsp' },
			{ name = 'omni' },
			{ name = 'luasnip' },
			{ name = 'buffer', keyword_length = 3 },
			{ name = 'path' },
		},
	}

	-- Expeptions
	-- vim.cmd[[ autocmd FileType css lua require'packages.cmp'.css_config() ]]
end

M.disable = function() require'cmp'.setup.buffer {
	enabled = false
} end

M.css_config = function()
	require'cmp'.setup.buffer {
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'omni' },
			{ name = 'path' },
			{ name = 'luasnip' },
		},
	}
end

return M
