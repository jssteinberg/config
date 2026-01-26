return {
	"lambdalisue/fern.vim",
	cmd = "Fern",
	config = function()
		vim.g["fern#default_hidden"] = 1
		-- TODO: autocmd to reveal file when entering buffer
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("fern_extension", {}),
			callback = function(args)
				-- Skip special buffers (help, terminal, quickfix, etc.)
				if vim.bo[args.buf].buftype ~= "" then
					return
				end
				-- reveal file in fern if open
			end,
		})
	end
}
