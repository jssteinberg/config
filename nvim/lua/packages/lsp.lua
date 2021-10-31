local M = {}

M.lspinstall_config = function()
	-- Add additional capabilities supported by nvim-cmp
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = 'menuone,noselect'

	-- luasnip setup
	local luasnip = require 'luasnip'

	-- nvim-cmp setup
	local cmp = require 'cmp'
	cmp.setup {
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
		mapping = {
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<CR>'] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
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
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		},
	}

	-- LSP config for buffer
	local on_attach = function(client, bufnr)
		require "lsp_signature".on_attach()

		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
		local wk = require'which-key'
		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Register LSP keymaps for buffer number
		wk.register({
			['<cr>'] = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
			'Show flag diagnostics', buffer = bufnr },

			['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<cr>',
			'Declaration (LSP)', buffer = bufnr },

			['gd'] = { '<cmd>lua vim.lsp.buf.definition()<cr>',
			'Definition (LSP)', buffer = bufnr },

			['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<cr>',
			'Implementation (LSP)', buffer = bufnr },

			['gr'] = { '<cmd>lua vim.lsp.buf.references()<cr>',
			'References of under cursor (LSP)', buffer = bufnr },

			['<leader>l'] = { name =
				'lsp',

				D = { '<cmd>lua vim.lsp.buf.declaration()<cr>',
				'Declaration', buffer = bufnr },

				d = { '<cmd>lua vim.lsp.buf.definition()<cr>',
				'Definition', buffer = bufnr },

				h = { '<cmd>lua vim.lsp.buf.hover()<cr>',
				'Hover info', buffer = bufnr },

				i = { '<cmd>lua vim.lsp.buf.implementation()<cr>',
				'Implementation', buffer = bufnr },

				l = { '<cmd>lua vim.lsp.buf.show_line_diagnostics()<cr>',
				'Line diagnostics info (for flag)', buffer = bufnr },

				n = { '<cmd>lua vim.lsp.diagnostics.goto_next()<cr>',
				'Next flag', buffer = bufnr },

				p = { '<cmd>lua vim.lsp.diagnostics.goto_prev()<cr>',
				'Previous flag', buffer = bufnr },

				r = { '<cmd>lua vim.lsp.buf.references()<cr>',
				'References of under cursor', buffer = bufnr },

				s = { '<cmd>lua vim.lsp.signature_help()<cr>',
				'Signature help', buffer = bufnr },
			},
		})

		-- Set some keybinds conditional on server capabilities
		if client.resolved_capabilities.document_formatting then
			wk.register({
				['<leader>lf'] = { '<cmd>lua vim.lsp.buf.formatting()<cr>',
				'Formatting (LSP)', buffer = bufnr },
			})
		elseif client.resolved_capabilities.document_range_formatting then
			wk.register({
				['<leader>lf'] = { '<cmd>lua vim.lsp.buf.ranger_formatting()<cr>',
				'Formatting (LSP)', buffer = bufnr },
			})
		end

		-- Unmapped
		-- buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		-- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	end

	-- Configure lua language server for neovim development
	local lua_settings = {
		Lua = {
			runtime = {
				-- LuaJIT in the case of Neovim
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		}
	}

	local function make_config()
		return {
			-- map buffer local keybindings when the language server attaches
			on_attach = on_attach,
		}
	end

	local lsp_installer = require("nvim-lsp-installer")

	lsp_installer.on_server_ready(function(server)
		local config = make_config()

		if server.name == "lua" then
			config.settings = lua_settings
		end

		-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
		server:setup(config)
		vim.cmd [[ do User LspAttachBuffers ]]
	end)
end

return M
