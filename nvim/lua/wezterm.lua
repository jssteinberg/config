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

	vim.api.nvim_create_autocmd("BufEnter", {
		group = vim.api.nvim_create_augroup("wezterm_user_var", { clear = true }),
		callback = function()
			local file = vim.fn.expand("%:p") -- Get full path of current buffer
			local encoded = ""
			if file ~= "" then
				encoded = vim.base64.encode(file)
			end
			-- OSC 1337 SetUserVar escape sequence (iTerm2/WezTerm protocol)
			-- Sets nvim_file user var which WezTerm can read via wezterm.user_var
			io.stdout:write("\x1b]1337;SetUserVar=nvim_file=" .. encoded .. "\x07")
			io.stdout:flush()
		end,
	})
end

return M
