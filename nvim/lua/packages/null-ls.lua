local M = {}

M.config = function()
	local null_ls = require("null-ls")

	-- register any number of sources simultaneously
	local sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.code_actions.xo,
	}

	null_ls.setup({ sources = sources })
end

return M
