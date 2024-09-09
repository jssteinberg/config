vim.api.nvim_set_hl(0, "@variable", { ctermfg = 13, fg = "#9fd1d8" })
vim.api.nvim_set_hl(0, "@variable.object", { link = "Constant" })
vim.api.nvim_set_hl(0, "@constructor", { link = "@tag" }) -- keep like tag since often custom HTML element from ES import
vim.api.nvim_set_hl(0, "@function", { link = "@variable" })
vim.api.nvim_set_hl(0, "@lsp.type.function", { link = "@variable" })
-- vim.api.nvim_set_hl(0, "@keyword", { ctermfg = 12, fg = "#9fb4d8" })
-- vim.api.nvim_set_hl(0, "@keyword.javascript", {})
vim.api.nvim_set_hl(0, "@keyword", {})
vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#9fb4d8" })
vim.api.nvim_set_hl(0, "@keyword.return", { ctermfg = 3, fg = "#bc985c", bold = true })
vim.api.nvim_set_hl(0, "@keyword.import", { ctermfg = 3, fg = "#5cb1bc" })
vim.api.nvim_set_hl(0, "@label", { fg = "#9fb4d8" })
vim.api.nvim_set_hl(0, "@none.svelte", { link = "@label" })
vim.api.nvim_set_hl(0, "@property", { link = "String" }) -- CSS classes are `@property`. Keep same as String since classes in HTML are strings
vim.api.nvim_set_hl(0, "@property.vim", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#685cbc" })
vim.api.nvim_set_hl(0, "@punctuation", { fg = "#5c80bc" })
vim.api.nvim_set_hl(0, "@tag", { link = "htmlTagName" }) -- keep like Type since CSS els are @type
vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "htmlTag" })
