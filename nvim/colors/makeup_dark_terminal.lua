local hi = vim.api.nvim_set_hl

vim.cmd([[hi clear]])

vim.g.colors_name = "makeup_dark_terminal"

hi(0, "Comment", { fg = "#985cbc" })
