vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
local global = require 'core.global'
local funcs = require 'core.funcs'
local cwd = vim.fn.getcwd()

local settins = {
    lsp_config = 'lsp.global.languages.js-ts',
    lsp_command = ':LspStart tsserver'
}

if funcs.file_exists(cwd .. global.path_sep .. '.lvim' .. global.path_sep ..
                         'js-ts.lua') then
    config_file = dofile(cwd .. global.path_sep .. "js-ts.lua")

    if config_file.lsp_config ~= nil then
        settins.lsp_config = config_file.lsp_config
    end

    if config_file.lsp_command ~= nil then
        settins.lsp_command = config_file.lsp_command
    end
end

require(settins.lsp_config)
vim.api.nvim_command(settins.lsp_command)
