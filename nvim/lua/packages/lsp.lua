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

	-- keymaps
	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

		require "lsp_signature".on_attach()

		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		local opts = { noremap=true, silent=true }
		buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
		buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
		-- 	  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		-- 	  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		-- 	  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
		-- 	  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
		-- 	  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
		-- buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		-- 	  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		-- 	  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		buf_set_keymap('n', '<cr>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
		buf_set_keymap('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
		buf_set_keymap('n', '<leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
		-- 	  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

-- 	  -- Set some keybinds conditional on server capabilities
-- 	  if client.resolved_capabilities.document_formatting then
-- 		 buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- 	  elseif client.resolved_capabilities.document_range_formatting then
-- 		 buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
-- 	  end
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
