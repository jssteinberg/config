-- in tools.lua
local api = vim.api
local buf, win

function buffersWindow()
	if win and vim.api.nvim_win_is_valid(win) then
		vim.api.nvim_set_current_win(win)
	else
		floatingWindow()
	end

	--   redraw()
end

function floatingWindow()
	buf = api.nvim_create_buf(false, true) -- create new emtpy buffer

	api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

	-- get dimensions
	local width = api.nvim_get_option("columns")
	local height = api.nvim_get_option("lines")

	-- calculate our floating window size
	local win_height = 2
	local win_width = width

	-- and its starting position
	local row = math.ceil((height - win_height))
	local col = 0

	-- set some options
	local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col
	}

	-- and finally create it with buffer attached
	-- second argument is false to not focus window
	win = api.nvim_open_win(buf, false, opts)
end

function create_win()
	-- We save handle to window from which we open the navigation
	start_win = vim.api.nvim_get_current_win()

	vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
	win = vim.api.nvim_get_current_win() -- We save our navigation window handle...
	buf = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

	-- We should name our buffer. All buffers in vim must have unique names.
	-- The easiest solution will be adding buffer handle to it
	-- because it is already unique and it's just a number.
	vim.api.nvim_buf_set_name(buf, 'Oldfiles #' .. buf)

	-- Now we set some options for our buffer.
	-- nofile prevent mark buffer as modified so we never get warnings about not saved changes.
	-- Also some plugins treat nofile buffers different.
	-- For example coc.nvim don't triggers aoutcompletation for these.
	vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
	-- We do not need swapfile for this buffer.
	vim.api.nvim_buf_set_option(buf, 'swapfile', false)
	-- And we would rather prefer that this buffer will be destroyed when hide.
	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
	-- It's not necessary but it is good practice to set custom filetype.
	-- This allows users to create their own autocommand or colorschemes on filetype.
	-- and prevent collisions with other plugins.
	vim.api.nvim_buf_set_option(buf, 'filetype', 'nvim-oldfile')

	-- For better UX we will turn off line wrap and turn on current line highlight.
	vim.api.nvim_win_set_option(win, 'wrap', false)
	vim.api.nvim_win_set_option(win, 'cursorline', true)

	set_mappings() -- At end we will set mappings for our navigation.
end

function redraw()
	-- First we allow introduce new changes to buffer. We will block that at end.
	vim.api.nvim_buf_set_option(buf, 'modifiable', true)

	local items_count =  vim.api.nvim_win_get_height(win) - 1 -- get the window height
	local list = {}

	-- If you using nightly build you can get oldfiles like this
	local oldfiles = vim.v.oldfiles
	-- In stable version works only that
	local oldfiles = vim.api.nvim_get_vvar('oldfiles')

	-- Now we populate our list with X last items form oldfiles
	for i = #oldfiles, #oldfiles - items_count, -1 do

		-- We use build-in vim function fnamemodify to make path relative
		-- In nightly we can call vim function like that
		local path = vim.fn.fnamemodify(oldfiles[i], ':.')
		-- and this is stable version:
		local path = vim.api.nvim_call_function('fnamemodify', {oldfiles[i], ':.'})

		-- We iterate form end to start, so we should insert items
		-- at the end of results list to preserve order
		table.insert(list, #list + 1, path)
	end

	-- We apply results to buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, list)
	-- And turn off editing
	vim.api.nvim_buf_set_option(buf, 'modifiable', false)
end

function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup '..group_name)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end

local autocmds = {
	startup = {
		{"BufEnter", "*", [[lua buffersWindow()]]};
	}
}

nvim_create_augroups(autocmds)
