local global = require('core.global')
require'lspconfig'.graphql.setup {
    cmd = {
        global.lsp_path .. 'lspinstall/graphql/node_modules/.bin/graphql-lsp',
        "server", "-m", "stream"
    },
    root_dir = require('lspconfig/util').root_pattern('.'),
    on_attach = require'lsp.global'.common_on_attach,
    handlers = {
        ['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false,
                signs = true,
                underline = false,
                update_in_insert = true
            })
    }
}
