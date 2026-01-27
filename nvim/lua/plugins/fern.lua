return {
	"lambdalisue/fern.vim",
	cmd = "Fern",
	config = function()
		vim.g["fern#default_hidden"] = 1

		-- Reveal file in fern if when focusing new file
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("fern_extension", {}),
			callback = function(args)
				-- Guard against re-entry during reveal
				-- Skip special buffers and Fern itself
				if vim.g.fern_revealing or vim.bo[args.buf].buftype ~= "" or vim.bo[args.buf].filetype == "fern" then
					return
				end

				local file_path = vim.api.nvim_buf_get_name(args.buf)
				if file_path == "" then
					return
				end

				-- Defer to let window state settle (avoids reopening Fern when closing it)
				vim.schedule(function()
					-- Find visible Fern window and reveal file
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						local buf = vim.api.nvim_win_get_buf(win)

						if vim.bo[buf].filetype == "fern" then
							vim.g.fern_revealing = true
							local current_win = vim.api.nvim_get_current_win()
							local reveal_path = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
							if reveal_path ~= "" then
								vim.cmd("Fern . -drawer -reveal=" .. vim.fn.fnameescape(reveal_path))
								vim.api.nvim_set_current_win(current_win)
							end
							vim.g.fern_revealing = false
							return
						end
					end
				end)
			end,
		})
	end
}
