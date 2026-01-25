-- WezTerm integration for nvim
-- Exposes current file path to WezTerm via user variable (nvim_file)
-- Enables WezTerm keybindings to act on the file being edited
--
-- Example: open current file in a new WezTerm window
--
-- WezTerm keybinding in ~/.config/wezterm/wezterm.lua:
--
--   {
--     key = "e",
--     mods = "SUPER",
--     action = wezterm.action_callback(function(_, pane)
--       local user_vars = pane:get_user_vars()
--       local nvim_file = user_vars and user_vars.nvim_file or ""
--       -- Spawn new window with: nvim <file>
--     end),
--   }
local M = {}

M.setup = function()
	-- Only run when inside WezTerm
	if vim.env.TERM_PROGRAM ~= "WezTerm" then
		return
	end

	local group = vim.api.nvim_create_augroup("wezterm_user_var", {})

	-- Helper to send user var to WezTerm via OSC 1337 SetUserVar escape sequence
	local function set_user_var(value)
		local encoded = value ~= "" and vim.base64.encode(value) or ""
		pcall(function()
			io.stdout:write("\x1b]1337;SetUserVar=nvim_file=" .. encoded .. "\x07")
			io.stdout:flush()
		end)
	end

	vim.api.nvim_create_autocmd("BufEnter", {
		group = group,
		callback = function(args)
			-- Skip special buffers (help, terminal, quickfix, etc.)
			if vim.bo[args.buf].buftype ~= "" then
				return
			end
			set_user_var(vim.api.nvim_buf_get_name(args.buf))
		end,
	})

	vim.api.nvim_create_autocmd("VimLeave", {
		group = group,
		callback = function()
			set_user_var("")
		end,
	})

	-- Initialize current buffer (handles deferred/lazy loading)
	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].buftype == "" then
		set_user_var(vim.api.nvim_buf_get_name(buf))
	end
end

return M
