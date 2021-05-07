local global = require('core.global')
require'lspconfig'.bashls.setup {
    cmd = {
        global.lsp_path ..
            'lspinstall/bash/node_modules/.bin/bash-language-server', 'start'
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
