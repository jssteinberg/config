local M = {}

M.config = function()
	-- Utilities for creating configurations
	local util = require "formatter.util"

	-- Provides the Format and FormatWrite commands
	require("formatter").setup {
		-- Enable or disable logging
		logging = true,
		-- Set the log level
		log_level = vim.log.levels.WARN,
		-- All formatter configurations are opt-in
		filetype = {
			-- Formatter configurations for filetype "lua" go here
			-- and will be executed in order
			lua = {
				-- "formatter.filetypes.lua" defines default configurations for the
				-- "lua" filetype
				require("formatter.filetypes.lua").stylua,
			},
			javascript = {
				require("formatter.filetypes.lua").prettierd,
			}
		}
	}
end

return M
