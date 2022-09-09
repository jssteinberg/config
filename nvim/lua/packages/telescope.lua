local M = {}

local previewers = require("telescope.previewers")
local putils = require("telescope.previewers.utils")
local pfiletype = require("plenary.filetype")

local _bad = { ".*%.csv", ".*%.lua" } -- Put all filetypes that slow you down in this array
local bad_files = function(filepath)
	for _, v in ipairs(_bad) do
		if filepath:match(v) then
			return false
		end
	end

	return true
end

local new_maker = function(filepath, bufnr, opts)
	opts = opts or {}

	if opts.use_ft_detect == nil then
		local ft = pfiletype.detect(filepath)
		opts.use_ft_detect = true
		-- fallback to regex_highlighter for certain filetypes
		putils.regex_highlighter(bufnr, ft)
	end

	opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
	previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

M.config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			buffer_previewer_maker = new_maker,
			file_ignore_patterns = { "node_modules", ".*[-|.]lock" },
			layout_strategy = "vertical",
			layout_config = { height = 0.95 },
		},
	})
end

return M
