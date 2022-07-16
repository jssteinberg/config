local M = {}

M.tabnine_nr = 2

M.tabnine = function()
	require('cmp_tabnine.config'):setup({
		max_lines = 1000;
		max_num_results = M.tabnine_nr;
		sort = true;
		run_on_every_keystroke = true;
		snippet_placeholder = '…';
		show_prediction_strength = false;
	})
end

M.config = function()
	local cmp = require 'cmp'
	local luasnip = require 'luasnip'
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- Add additional capabilities supported by nvim-cmp
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = 'menuone,noselect'

	-- nvim-cmp setup
	cmp.setup {
		sources = {
			{
				name = 'nvim_lsp_signature_help', max_item_count = 1
			},
			{
				name = 'luasnip', max_item_count = 2
			},
			{
				name = 'nvim_lsp', max_item_count = 3
			},
			{
				name = 'cmp_tabnine', max_item_count = M.tabnine_nr
			},
			{
				name = 'buffer', max_item_count = 3
			},
		},
		experimental = {
			ghost_text = true,
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-c>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			['<c-f>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end, { "i" }),
			['<CR>'] = cmp.mapping(function(fallback)
				if cmp.get_active_entry() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end, { 'i' }),
			['<tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i" }),
			['<s-tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i" }),
			['<c-n>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { 'i' }),
			['<c-p>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { 'i' }),
			['<c-s>'] = cmp.mapping(function()
				if luasnip.jumpable() then
					luasnip.jump(1)
				end
			end, { 'i' }),
			['<c-b>'] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { 'i' }),
		},
	}
end

return M
